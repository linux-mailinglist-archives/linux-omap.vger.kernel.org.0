Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5620AA6CD8
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 17:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbfICPYc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 11:24:32 -0400
Received: from muru.com ([72.249.23.125]:59616 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728679AbfICPYc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Sep 2019 11:24:32 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0AE1880CF;
        Tue,  3 Sep 2019 15:24:59 +0000 (UTC)
Date:   Tue, 3 Sep 2019 08:24:27 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
Message-ID: <20190903152427.GO52127@atomide.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
 <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
 <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
 <20190903140553.GN52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903140553.GN52127@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190903 14:06]:
> * Grygorii Strashko <grygorii.strashko@ti.com> [190903 12:46]:
> > > The clock definition itself looks fine, however the question is why does someone try to disable it while it
> >  is apparently still used (by NFS that is)? If it fails to disable, clock core is trying to disable it, but the IDLEST bit does not switch for some reason.
> > 
> > I've tried to disable "ti,no-idle" in DT for dra7 cpsw and got below failure
> > 
> > [    0.634530] gmac-clkctrl:0000:0: failed to enable 08070002
> > [    0.634557] ti-sysc: probe of 48485200.target-module failed with error -16
> > 
> > so samthing is not right with GMAC clocks as it should probe without "ti,no-idle".
> > 
> > 
> > original place of the issue is:
> > 
> > cpsw_probe()
> >  -> pm_runtime_get_sync()
> >     -> sysc_runtime_resume()
> >        -> sysc_enable_main_clocks()
> > 
> > Note. the sysc_init_module() for "ti,no-idle" case looks a little bit strange as there is
> > no guarantee that target-module or clock were enabled before.
> 
> Good point on the "ti,no-idle" handling. That is easy to fix by always enabling
> the clocks. The "ti,no-idle-on-init" handling needs probably a flag set for
> PM runtime.

The following should fix the clock handling for "ti,no-idle" and
"ti,no-idle-on-init". Sounds like we still might have other issues
left though based on removing "ti,no-idle"?

Regards,

Tony

8< -------------------------
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -66,6 +66,7 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @name: name if available
  * @revision: interconnect target module revision
  * @enabled: sysc runtime enabled status
+ * @clocks_enabled_from_init: clocks left on from init with ti,no-idle-on-init
  * @needs_resume: runtime resume needed on resume from suspend
  * @child_needs_resume: runtime resume needed for child on resume from suspend
  * @disable_on_idle: status flag used for disabling modules with resets
@@ -93,6 +94,7 @@ struct sysc {
 	const char *name;
 	u32 revision;
 	unsigned int enabled:1;
+	unsigned int clocks_enabled_from_init:1;
 	unsigned int needs_resume:1;
 	unsigned int child_needs_resume:1;
 	struct delayed_work idle_work;
@@ -1128,6 +1130,18 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 
 	sysc_clkdm_allow_idle(ddata);
 
+	/*
+	 * One time decrement of clock usage counts if left on from init.
+	 * Note that we disable opt clocks unconditionally in this case
+	 * as they are enabled unconditionally during init without
+	 * considering sysc_opt_clks_needed() at that point.
+	 */
+	if (unlikely(ddata->clocks_enabled_from_init)) {
+		sysc_disable_main_clocks(ddata);
+		sysc_disable_opt_clocks(ddata);
+		ddata->clocks_enabled_from_init = false;
+	}
+
 	return 0;
 
 err_main_clocks:
@@ -1628,21 +1642,26 @@ static int sysc_init_module(struct sysc *ddata)
 	    (SYSC_QUIRK_NO_IDLE | SYSC_QUIRK_NO_IDLE_ON_INIT))
 		manage_clocks = false;
 
+	if (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE_ON_INIT)
+		ddata->clocks_enabled_from_init = true;
+
 	error = sysc_clockdomain_init(ddata);
 	if (error)
 		return error;
 
-	if (manage_clocks) {
-		sysc_clkdm_deny_idle(ddata);
+	sysc_clkdm_deny_idle(ddata);
 
-		error = sysc_enable_opt_clocks(ddata);
-		if (error)
-			return error;
+	/*
+	 * Always enable clocks. The bootloader may or may not have enabled
+	 * the related clocks.
+	 */
+	error = sysc_enable_opt_clocks(ddata);
+	if (error)
+		return error;
 
-		error = sysc_enable_main_clocks(ddata);
-		if (error)
-			goto err_opt_clocks;
-	}
+	error = sysc_enable_main_clocks(ddata);
+	if (error)
+		goto err_opt_clocks;
 
 	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
 		error = sysc_rstctrl_reset_deassert(ddata, true);
@@ -1677,10 +1696,10 @@ static int sysc_init_module(struct sysc *ddata)
 	if (manage_clocks)
 		sysc_disable_main_clocks(ddata);
 err_opt_clocks:
-	if (manage_clocks) {
+	if (manage_clocks)
 		sysc_disable_opt_clocks(ddata);
-		sysc_clkdm_allow_idle(ddata);
-	}
+
+	sysc_clkdm_allow_idle(ddata);
 
 	return error;
 }
-- 
2.23.0
