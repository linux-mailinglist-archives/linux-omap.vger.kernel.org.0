Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F582D3484
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 21:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729241AbgLHUt0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 15:49:26 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21102 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgLHUtV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 15:49:21 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607460498; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=kZQGFf7/7zBQI+Tu5rkWkea4aw58y3OL2B/ASMccEBehDGuv1/bCGOi0DZ3d4HLQgGtuKwrz8OInF2uEBZlDWO774JPFISEg7lLv4QpeIxYkEFj98mQXfhpBL6eVSQQYjMmAp+oKU9mTbqfVRxk7iD5vCj7jS4Q0NI3cghsk4Bk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1607460498; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=H448thm3zMe2xdtoi7eAhSGNHj9gA9Hxr5FioklSPlc=; 
        b=NlqhkS++rbDTTwlyMH9XVpHU3wCbY5Dx8nmDwVnmEYzZQKkOcZtDQxj67EXNiDWlBUw/kI0FCC8c/acW3CbzoPrW5eTXuqiZtw34jI0yRsVCCmRo9L9WMhuWgeVnRgbV/poNLMpcH6SePuP5RExEVqEQ3OPXLWsmc1UnOHtL6cs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-212-137.hsi15.unitymediagroup.de [95.222.212.137]) by mx.zoho.eu
        with SMTPS id 1607460495762809.2078998376851; Tue, 8 Dec 2020 21:48:15 +0100 (CET)
Date:   Tue, 8 Dec 2020 21:48:14 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] soc: ti: omap-prm: Fix boot time errors for rst_map_012
 bits 0 and 1
Message-Id: <20201208214814.a0027492ca1971579fb0090d@uvos.xyz>
In-Reply-To: <20201208140802.38757-1-tony@atomide.com>
References: <20201208140802.38757-1-tony@atomide.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue,  8 Dec 2020 16:08:02 +0200
Tony Lindgren <tony@atomide.com> wrote:

> We have rst_map_012 used for various accelerators like dsp, ipu and iva.
> For these use cases, we have rstctrl bit 2 control the subsystem module
> reset, and have and bits 0 and 1 control the accelerator specific
> features.
> 
> If the bootloader, or kexec boot, has left any accelerator specific
> reset bits deasserted, deasserting bit 2 reset will potentially enable
> an accelerator with unconfigured MMU and no firmware. And we may get
> spammed with a lot by warnings on boot with "Data Access in User mode
> during Functional access", or depending on the accelerator, the system
> can also just hang.
> 
> This issue can be quite easily reproduced by setting a rst_map_012 type
> rstctrl register to 0 or 4 in the bootloader, and booting the system.
> 
> Let's just assert all reset bits for rst_map_012 type resets. So far
> it looks like the other rstctrl types don't need this. If it turns out
> that the other type rstctrl bits also need reset on init, we need to
> add an instance specific reset mask for the bits to avoid resetting
> unwanted bits.
> 
> Reported-by: Carl Philipp Klemm <philipp@uvos.xyz>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/soc/ti/omap_prm.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -860,6 +860,7 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>  	const struct omap_rst_map *map;
>  	struct ti_prm_platform_data *pdata = dev_get_platdata(&pdev->dev);
>  	char buf[32];
> +	u32 v;
>  
>  	/*
>  	 * Check if we have controllable resets. If either rstctrl is non-zero
> @@ -907,6 +908,16 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>  		map++;
>  	}
>  
> +	/* Quirk handling to assert rst_map_012 bits on reset and avoid errors */
> +	if (prm->data->rstmap == rst_map_012) {
> +		v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
> +		if ((v & reset->mask) != reset->mask) {
> +			dev_dbg(&pdev->dev, "Asserting all resets: %08x\n", v);
> +			writel_relaxed(reset->mask, reset->prm->base +
> +				       reset->prm->data->rstctrl);
> +		}
> +	}
> +
>  	return devm_reset_controller_register(&pdev->dev, &reset->rcdev);
>  }
>  
> -- 
> 2.29.2

Works for me on xt875, idle now also works without userspace hack.

Tested-by: Carl Philipp Klemm <philipp@uvos.xyz>
