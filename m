Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D940639B61E
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 11:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFDJlo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 05:41:44 -0400
Received: from muru.com ([72.249.23.125]:36232 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230052AbhFDJlo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Jun 2021 05:41:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A139C8167;
        Fri,  4 Jun 2021 09:40:04 +0000 (UTC)
Date:   Fri, 4 Jun 2021 12:39:54 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <YLn06uuntThMlaTQ@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
 <20210527211501.70d176b4@aktux>
 <YLCGZEan87yp9Eeq@atomide.com>
 <20210604103533.6392beeb@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604103533.6392beeb@aktux>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [210604 08:35]:
> I inserted some more dev-dbg
> [   60.241790] PM: suspend entry (deep)
> [   60.245513] Filesystems sync: 0.000 seconds
> [   60.251312] Freezing user space processes ... (elapsed 0.001 seconds) done.
> [   60.260040] OOM killer disabled.
> [   60.263275] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [   60.272338] printk: Suspending console(s) (use no_console_suspend to debug)
> [   60.281311] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume
> -> this is triggered by what?

I think that comes from the pm_runtime_get_sync() in musb_suspend().

> [   60.281341] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_runtime_resume
> -> and here something stays on...
> 
> [   60.346374] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_on
> [   60.796630] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
> [   60.796722] musb-hdrc musb-hdrc.0.auto: musb_suspend end
> [   60.796752] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
> [   60.796783] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
> [   60.796783] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_off
> [   60.796813] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
> [   60.806549] Disabling non-boot CPUs ...
> [   60.806579] Successfully put all powerdomains to target state

Well since commit 88d26136a256 ("PM: Prevent runtime suspend during system resume")
nothing gets runtime idled during suspend with the extra pm_runtime_get_noresume()
call in device_prepare() that does not get released until in device_complete().

> forcing omap2430 runtime on before suspend:
> [  160.467742] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume
> [  165.001495] PM: suspend entry (deep)
> [  165.005218] Filesystems sync: 0.000 seconds
> [  165.010284] Freezing user space processes ... (elapsed 0.001 seconds) done.
> [  165.018981] OOM killer disabled.
> [  165.022247] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  165.031311] printk: Suspending console(s) (use no_console_suspend to debug)
> [  165.040496] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
> [  165.040618] musb-hdrc musb-hdrc.0.auto: musb_suspend end
> [  165.040618] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
> [  165.040649] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
> [  165.040679] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
> [  165.050506] Disabling non-boot CPUs ...
> [  165.050537] Successfully put all powerdomains to target state

That's interesting. Hmm so we bail out early based on glue->is_runtime_suspended,
and omap3 is still probing devices with omap_device.c instead of ti-sysc.c, so
sounds like the duplicate calls you noticed might cause the issue.

Does the following patch fix things for you or does something else break again? :)

Regards,

Tony

8< --------------
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -332,6 +332,7 @@ static int omap2430_probe(struct platform_device *pdev)
 	glue->musb			= musb;
 	glue->status			= MUSB_UNKNOWN;
 	glue->control_otghs = ERR_PTR(-ENODEV);
+	glue->is_runtime_suspended	= 1;
 
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -453,6 +454,9 @@ static int omap2430_runtime_suspend(struct device *dev)
 	if (!musb)
 		return 0;
 
+	if (glue->is_runtime_suspended)
+		return 0;
+
 	musb->context.otg_interfsel = musb_readl(musb->mregs,
 						 OTG_INTERFSEL);
 
@@ -474,6 +478,9 @@ static int omap2430_runtime_resume(struct device *dev)
 	if (!musb)
 		return 0;
 
+	if (!glue->is_runtime_suspended)
+		return 0;
+
 	phy_init(musb->phy);
 	phy_power_on(musb->phy);
 
-- 
2.31.1
