Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B1F375FDB
	for <lists+linux-omap@lfdr.de>; Fri,  7 May 2021 07:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbhEGFsL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 May 2021 01:48:11 -0400
Received: from muru.com ([72.249.23.125]:52552 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233977AbhEGFsL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 7 May 2021 01:48:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DE2CA80F9;
        Fri,  7 May 2021 05:47:13 +0000 (UTC)
Date:   Fri, 7 May 2021 08:47:05 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Florian Boor <florian.boor@kernelconcepts.de>
Cc:     linux-omap@vger.kernel.org
Subject: Re: OMAP4460 cpufreq crashes
Message-ID: <YJTUWaPWSmvwaZMb@atomide.com>
References: <38229f0a-85e8-680f-f561-5fc59ac84c6b@kernelconcepts.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38229f0a-85e8-680f-f561-5fc59ac84c6b@kernelconcepts.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Florian Boor <florian.boor@kernelconcepts.de> [210506 16:11]:
> Hi all,
> 
> I recently spent some time with an OMAP4460 based Variscite VAR-STK-OM44 and
> latest Linux releases and latest linux-omap Git. The evaluation kit runs pretty
> well unless I try to enable cpufeq. This causes a crash with quite random
> backtraces right on boot within a few seconds after entering userspace.
> 
> It turned out that this happens when the board switches to 920MHz. Commenting
> out this operating point in the devicetree fixes this issue... but limits
> performance quite a lot.

Hmm OK, sounds like the voltages might be wrong.

I don't have one of these boards, but would be glad to add one to my rack
though if it can boot with NFSroot. If somebody happens to have a spare
evaluation kit around in the corner to send me, please let me know :)

> I did some research and I'd say its related to problems with voltage regulation.
> I can watch the scaling driver changing the clock but for some reason the
> voltage does not seem to get adjusted.
> Might this behaviour be related to the OMAP infrastructure changes?
> 
> There are some messages at boot which might be related:
> 
> twl: not initialized
> [    2.148742] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs
> max 1316660
> [    2.156799] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs
> max 1316660
> ...

I'm seeing these too on duovero 4430, not sure how long that these have been
happening but probably several years. We should just fix these and all the other
annoying errors that show up with dmesg -l err,warn.

The experimental patch below makes the warnings go away, but I'm not sure if
it's the right fix. Maybe give it a try and see if at least the warnings go away?

> There is a little patch around that changes the initialisation order which makes
> this messages go away but does not fix the odd behaviour. So maybe this is just
> a cosmetic issue and the actual problem is somewhere else.

Sorry I recall some discussion on the twl init problems, but don't remember the
details. Do you have some link for the patch and discussion?

Regards,

Tony

8< ------------------------
diff --git a/arch/arm/mach-omap2/vc44xx_data.c b/arch/arm/mach-omap2/vc44xx_data.c
--- a/arch/arm/mach-omap2/vc44xx_data.c
+++ b/arch/arm/mach-omap2/vc44xx_data.c
@@ -88,8 +88,8 @@ struct omap_vc_channel omap4_vc_core = {
 /*
  * Voltage levels for different operating modes: on, sleep, retention and off
  */
-#define OMAP4_ON_VOLTAGE_UV			1375000
-#define OMAP4_ONLP_VOLTAGE_UV			1375000
+#define OMAP4_ON_VOLTAGE_UV			1316660
+#define OMAP4_ONLP_VOLTAGE_UV			1316660
 #define OMAP4_RET_VOLTAGE_UV			837500
 #define OMAP4_OFF_VOLTAGE_UV			0
 
diff --git a/arch/arm/mach-omap2/voltage.h b/arch/arm/mach-omap2/voltage.h
--- a/arch/arm/mach-omap2/voltage.h
+++ b/arch/arm/mach-omap2/voltage.h
@@ -99,7 +99,7 @@ struct voltagedomain {
 #define OMAP3630_VP2_VLIMITTO_VDDMAX	1200000
 
 #define OMAP4_VP_MPU_VLIMITTO_VDDMIN	830000
-#define OMAP4_VP_MPU_VLIMITTO_VDDMAX	1410000
+#define OMAP4_VP_MPU_VLIMITTO_VDDMAX	1316660
 #define OMAP4_VP_IVA_VLIMITTO_VDDMIN	830000
 #define OMAP4_VP_IVA_VLIMITTO_VDDMAX	1260000
 #define OMAP4_VP_CORE_VLIMITTO_VDDMIN	830000
-- 
2.31.1
