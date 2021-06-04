Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F55839B2B4
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 08:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFDGhE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 02:37:04 -0400
Received: from muru.com ([72.249.23.125]:36112 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229826AbhFDGhE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Jun 2021 02:37:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A8C8F8027;
        Fri,  4 Jun 2021 06:35:25 +0000 (UTC)
Date:   Fri, 4 Jun 2021 09:35:15 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: Regression with 6cfcd5563b4f on BeagleBoard Rev C2
Message-ID: <YLnJowBaoJPyZWOk@atomide.com>
References: <68f28473-a196-b106-b4ae-e9162b7002e6@bitmer.com>
 <YLcXicwDxue0a52/@atomide.com>
 <5037cd3e-9c4f-0028-ceef-8315d297f2bc@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5037cd3e-9c4f-0028-ceef-8315d297f2bc@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210602 18:21]:
> Hi
> 
> On 6/2/21 8:30 AM, Tony Lindgren wrote:
> > Sounds like the beagleboard timer errata handling is either picking
> > a wrong clockevent timer, or later on ti-sysc misdetects the active
> > timer for clockevent and idles it.
> > 
> > What does dmesg say in the beginning for clockevent and clocksource
> > timers?
> > 
> I attached logs from commit 6cfcd5563b4f and commit 30c66fc30ee7 before
> it. Perhaps this is relevant difference between them?
> 
> +ti-sysc: probe of 49032000.target-module failed with error -16
> +ti-sysc: probe of 48304000.target-module failed with error -16

Yeah so it seems. We now attempt to ignore the system timer instances
while it seems we need also block idling at least for timer12 that is
used for the beagle timer.

Can you test the following patch and see if it helps?

Regards,

Tony

8< ------------------------
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -100,6 +100,7 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @cookie: data used by legacy platform callbacks
  * @name: name if available
  * @revision: interconnect target module revision
+ * @reserved: target module is reserved and already in use
  * @enabled: sysc runtime enabled status
  * @needs_resume: runtime resume needed on resume from suspend
  * @child_needs_resume: runtime resume needed for child on resume from suspend
@@ -130,6 +131,7 @@ struct sysc {
 	struct ti_sysc_cookie cookie;
 	const char *name;
 	u32 revision;
+	unsigned int reserved:1;
 	unsigned int enabled:1;
 	unsigned int needs_resume:1;
 	unsigned int child_needs_resume:1;
@@ -3045,8 +3047,8 @@ static int sysc_probe(struct platform_device *pdev)
 		return error;
 
 	error = sysc_check_active_timer(ddata);
-	if (error)
-		return error;
+	if (error == -EBUSY)
+		ddata->reserved = true;
 
 	error = sysc_get_clocks(ddata);
 	if (error)
@@ -3082,11 +3084,15 @@ static int sysc_probe(struct platform_device *pdev)
 	sysc_show_registers(ddata);
 
 	ddata->dev->type = &sysc_device_type;
-	error = of_platform_populate(ddata->dev->of_node, sysc_match_table,
-				     pdata ? pdata->auxdata : NULL,
-				     ddata->dev);
-	if (error)
-		goto err;
+
+	if (!ddata->reserved) {
+		error = of_platform_populate(ddata->dev->of_node,
+					     sysc_match_table,
+					     pdata ? pdata->auxdata : NULL,
+					     ddata->dev);
+		if (error)
+			goto err;
+	}
 
 	INIT_DELAYED_WORK(&ddata->idle_work, ti_sysc_idle);
 
