Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 190EB119F7D
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfLJXfb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:35:31 -0500
Received: from muru.com ([72.249.23.125]:45142 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727573AbfLJXf3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:35:29 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 882668385;
        Tue, 10 Dec 2019 23:36:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 1/9] ARM: OMAP2+: Drop legacy platform data for omap4 aess
Date:   Tue, 10 Dec 2019 15:35:16 -0800
Message-Id: <20191210233524.46875-2-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210233524.46875-1-tony@atomide.com>
References: <20191210233524.46875-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi        |  1 -
 arch/arm/mach-omap2/omap_hwmod.c           | 18 ------
 arch/arm/mach-omap2/omap_hwmod.h           |  3 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 64 ----------------------
 arch/arm/mach-omap2/omap_hwmod_reset.c     | 24 --------
 include/sound/aess.h                       | 53 ------------------
 6 files changed, 163 deletions(-)
 delete mode 100644 include/sound/aess.h

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -466,7 +466,6 @@ target-module@c0000 {			/* 0x401c0000, ap 30 1e.0 */
 
 		target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "aess";
 			reg = <0xf1000 0x4>,
 			      <0xf1010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -1852,23 +1852,6 @@ static int _omap4_get_context_lost(struct omap_hwmod *oh)
 	return oh->prcm.omap4.context_lost_counter;
 }
 
-/**
- * _enable_preprogram - Pre-program an IP block during the _enable() process
- * @oh: struct omap_hwmod *
- *
- * Some IP blocks (such as AESS) require some additional programming
- * after enable before they can enter idle.  If a function pointer to
- * do so is present in the hwmod data, then call it and pass along the
- * return value; otherwise, return 0.
- */
-static int _enable_preprogram(struct omap_hwmod *oh)
-{
-	if (!oh->class->enable_preprogram)
-		return 0;
-
-	return oh->class->enable_preprogram(oh);
-}
-
 /**
  * _enable - enable an omap_hwmod
  * @oh: struct omap_hwmod *
@@ -1952,7 +1935,6 @@ static int _enable(struct omap_hwmod *oh)
 				_update_sysc_cache(oh);
 			_enable_sysc(oh);
 		}
-		r = _enable_preprogram(oh);
 	} else {
 		if (soc_ops.disable_module)
 			soc_ops.disable_module(oh);
diff --git a/arch/arm/mach-omap2/omap_hwmod.h b/arch/arm/mach-omap2/omap_hwmod.h
--- a/arch/arm/mach-omap2/omap_hwmod.h
+++ b/arch/arm/mach-omap2/omap_hwmod.h
@@ -501,7 +501,6 @@ struct omap_hwmod_omap4_prcm {
  * @sysc: device SYSCONFIG/SYSSTATUS register data
  * @pre_shutdown: ptr to fn to be executed immediately prior to device shutdown
  * @reset: ptr to fn to be executed in place of the standard hwmod reset fn
- * @enable_preprogram:  ptr to fn to be executed during device enable
  * @lock: ptr to fn to be executed to lock IP registers
  * @unlock: ptr to fn to be executed to unlock IP registers
  *
@@ -526,7 +525,6 @@ struct omap_hwmod_class {
 	struct omap_hwmod_class_sysconfig	*sysc;
 	int					(*pre_shutdown)(struct omap_hwmod *oh);
 	int					(*reset)(struct omap_hwmod *oh);
-	int					(*enable_preprogram)(struct omap_hwmod *oh);
 	void					(*lock)(struct omap_hwmod *oh);
 	void					(*unlock)(struct omap_hwmod *oh);
 };
@@ -662,7 +660,6 @@ const char *omap_hwmod_get_main_clk(struct omap_hwmod *oh);
  *
  */
 
-extern int omap_hwmod_aess_preprogram(struct omap_hwmod *oh);
 void omap_hwmod_rtc_unlock(struct omap_hwmod *oh);
 void omap_hwmod_rtc_lock(struct omap_hwmod *oh);
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -237,43 +237,6 @@ static struct omap_hwmod omap44xx_ocp_wp_noc_hwmod = {
  * usim
  */
 
-/*
- * 'aess' class
- * audio engine sub system
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_aess_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_MIDLEMODE | SYSC_HAS_SIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART |
-			   MSTANDBY_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_aess_hwmod_class = {
-	.name	= "aess",
-	.sysc	= &omap44xx_aess_sysc,
-	.enable_preprogram = omap_hwmod_aess_preprogram,
-};
-
-/* aess */
-static struct omap_hwmod omap44xx_aess_hwmod = {
-	.name		= "aess",
-	.class		= &omap44xx_aess_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "aess_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_AESS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_AESS_CONTEXT_OFFSET,
-			.lostcontext_mask = OMAP4430_LOSTCONTEXT_DFF_MASK,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'counter' class
  * 32-bit ordinary counter, clocked by the falling edge of the 32 khz clock
@@ -2194,14 +2157,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l3_main_3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* aess -> l4_abe */
-static struct omap_hwmod_ocp_if __maybe_unused omap44xx_aess__l4_abe = {
-	.master		= &omap44xx_aess_hwmod,
-	.slave		= &omap44xx_l4_abe_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* dsp -> l4_abe */
 static struct omap_hwmod_ocp_if omap44xx_dsp__l4_abe = {
 	.master		= &omap44xx_dsp_hwmod,
@@ -2266,22 +2221,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ocp_wp_noc = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_abe -> aess */
-static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l4_abe__aess = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_aess_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4_abe -> aess (dma) */
-static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l4_abe__aess_dma = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_aess_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_SDMA,
-};
-
 /* l4_wkup -> counter_32k */
 static struct omap_hwmod_ocp_if omap44xx_l4_wkup__counter_32k = {
 	.master		= &omap44xx_l4_wkup_hwmod,
@@ -2835,7 +2774,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_1__l3_main_3,
 	&omap44xx_l3_main_2__l3_main_3,
 	&omap44xx_l4_cfg__l3_main_3,
-	&omap44xx_aess__l4_abe,
 	&omap44xx_dsp__l4_abe,
 	&omap44xx_l3_main_1__l4_abe,
 	&omap44xx_mpu__l4_abe,
@@ -2844,8 +2782,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__l4_wkup,
 	&omap44xx_mpu__mpu_private,
 	&omap44xx_l4_cfg__ocp_wp_noc,
-	&omap44xx_l4_abe__aess,
-	&omap44xx_l4_abe__aess_dma,
 	&omap44xx_l4_wkup__counter_32k,
 	&omap44xx_l4_cfg__ctrl_module_core,
 	&omap44xx_l4_cfg__ctrl_module_pad_core,
diff --git a/arch/arm/mach-omap2/omap_hwmod_reset.c b/arch/arm/mach-omap2/omap_hwmod_reset.c
--- a/arch/arm/mach-omap2/omap_hwmod_reset.c
+++ b/arch/arm/mach-omap2/omap_hwmod_reset.c
@@ -26,8 +26,6 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 
-#include <sound/aess.h>
-
 #include "omap_hwmod.h"
 #include "common.h"
 
@@ -40,28 +38,6 @@
 #define OMAP_RTC_STATUS_BUSY	BIT(0)
 #define OMAP_RTC_MAX_READY_TIME	50
 
-/**
- * omap_hwmod_aess_preprogram - enable AESS internal autogating
- * @oh: struct omap_hwmod *
- *
- * The AESS will not IdleAck to the PRCM until its internal autogating
- * is enabled.  Since internal autogating is disabled by default after
- * AESS reset, we must enable autogating after the hwmod code resets
- * the AESS.  Returns 0.
- */
-int omap_hwmod_aess_preprogram(struct omap_hwmod *oh)
-{
-	void __iomem *va;
-
-	va = omap_hwmod_get_mpu_rt_va(oh);
-	if (!va)
-		return -EINVAL;
-
-	aess_enable_autogating(va);
-
-	return 0;
-}
-
 /**
  * omap_rtc_wait_not_busy - Wait for the RTC BUSY flag
  * @oh: struct omap_hwmod *
diff --git a/include/sound/aess.h b/include/sound/aess.h
deleted file mode 100644
--- a/include/sound/aess.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * AESS IP block reset
- *
- * Copyright (C) 2012 Texas Instruments, Inc.
- * Paul Walmsley
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
- * 02110-1301 USA
- */
-#ifndef __SOUND_AESS_H__
-#define __SOUND_AESS_H__
-
-#include <linux/kernel.h>
-#include <linux/io.h>
-
-/*
- * AESS_AUTO_GATING_ENABLE_OFFSET: offset in bytes of the AESS IP
- *     block's AESS_AUTO_GATING_ENABLE__1 register from the IP block's
- *     base address
- */
-#define AESS_AUTO_GATING_ENABLE_OFFSET			0x07c
-
-/* Register bitfields in the AESS_AUTO_GATING_ENABLE__1 register */
-#define AESS_AUTO_GATING_ENABLE_SHIFT			0
-
-/**
- * aess_enable_autogating - enable AESS internal autogating
- * @oh: struct omap_hwmod *
- *
- * Enable internal autogating on the AESS.  This allows the AESS to
- * indicate that it is idle to the OMAP PRCM.  Returns 0.
- */
-static inline void aess_enable_autogating(void __iomem *base)
-{
-	u32 v;
-
-	/* Set AESS_AUTO_GATING_ENABLE__1.ENABLE to allow idle entry */
-	v = 1 << AESS_AUTO_GATING_ENABLE_SHIFT;
-	writel(v, base + AESS_AUTO_GATING_ENABLE_OFFSET);
-}
-
-#endif /* __SOUND_AESS_H__ */
-- 
2.24.0
