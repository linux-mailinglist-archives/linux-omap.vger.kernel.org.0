Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54B9338896
	for <lists+linux-omap@lfdr.de>; Fri, 12 Mar 2021 10:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbhCLJZp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Mar 2021 04:25:45 -0500
Received: from muru.com ([72.249.23.125]:42306 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232874AbhCLJZa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 12 Mar 2021 04:25:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DE20C810E;
        Fri, 12 Mar 2021 09:26:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: OMAP2+: Stop building legacy code for dra7 and omap4/5
Date:   Fri, 12 Mar 2021 11:25:15 +0200
Message-Id: <20210312092516.42884-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210312092516.42884-1-tony@atomide.com>
References: <20210312092516.42884-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With the recent changes we are now booting am3/4, dra7, and omap4/5
without legacy data using devicetree, simple-pm-bus and genpd. Let's not
initialize and build the legacy data unless CONFIG_OMAP_HWMOD is selected
based on the SoCs enabled in .config.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Makefile       |  8 ++++----
 arch/arm/mach-omap2/io.c           |  7 ++++++-
 arch/arm/mach-omap2/omap_hwmod.h   | 13 +++++++++++++
 arch/arm/mach-omap2/pdata-quirks.c |  2 +-
 arch/arm/mach-omap2/sr_device.c    |  7 +++++++
 5 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -20,14 +20,14 @@ secure-common				= omap-smc.o omap-secure.o
 
 obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common)
 obj-$(CONFIG_ARCH_OMAP3) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
-obj-$(CONFIG_ARCH_OMAP4) += $(hwmod-common) $(secure-common)
+obj-$(CONFIG_ARCH_OMAP4) += $(secure-common)
 obj-$(CONFIG_SOC_AM33XX) += $(secure-common)
-obj-$(CONFIG_SOC_OMAP5)  += $(hwmod-common) $(secure-common)
+obj-$(CONFIG_SOC_OMAP5)  += $(secure-common)
 obj-$(CONFIG_SOC_AM43XX) += $(secure-common)
-obj-$(CONFIG_SOC_DRA7XX) += $(hwmod-common) $(secure-common)
+obj-$(CONFIG_SOC_DRA7XX) += $(secure-common)
 
 ifneq ($(CONFIG_SND_SOC_OMAP_MCBSP),)
-obj-y += mcbsp.o
+obj-$(CONFIG_OMAP_HWMOD) += mcbsp.o
 endif
 
 obj-$(CONFIG_TWL4030_CORE) += omap_twl.o
diff --git a/arch/arm/mach-omap2/io.c b/arch/arm/mach-omap2/io.c
--- a/arch/arm/mach-omap2/io.c
+++ b/arch/arm/mach-omap2/io.c
@@ -402,6 +402,7 @@ static int __init _omap2_init_reprogram_sdrc(void)
 	return v;
 }
 
+#ifdef CONFIG_OMAP_HWMOD
 static int _set_hwmod_postsetup_state(struct omap_hwmod *oh, void *data)
 {
 	return omap_hwmod_set_postsetup_state(oh, *(u8 *)data);
@@ -414,6 +415,11 @@ static void __init __maybe_unused omap_hwmod_init_postsetup(void)
 	/* Set the default postsetup state for all hwmods */
 	omap_hwmod_for_each(_set_hwmod_postsetup_state, &postsetup_state);
 }
+#else
+static inline void omap_hwmod_init_postsetup(void)
+{
+}
+#endif
 
 #ifdef CONFIG_SOC_OMAP2420
 void __init omap2420_init_early(void)
@@ -615,7 +621,6 @@ void __init omap4430_init_early(void)
 	omap44xx_voltagedomains_init();
 	omap44xx_powerdomains_init();
 	omap44xx_clockdomains_init();
-	omap_hwmod_init_postsetup();
 	omap_l2_cache_init();
 	omap_clk_soc_init = omap4xxx_dt_clk_init;
 	omap_secure_init();
diff --git a/arch/arm/mach-omap2/omap_hwmod.h b/arch/arm/mach-omap2/omap_hwmod.h
--- a/arch/arm/mach-omap2/omap_hwmod.h
+++ b/arch/arm/mach-omap2/omap_hwmod.h
@@ -607,6 +607,8 @@ struct omap_hwmod {
 	struct omap_hwmod		*parent_hwmod;
 };
 
+#ifdef CONFIG_OMAP_HWMOD
+
 struct device_node;
 
 struct omap_hwmod *omap_hwmod_lookup(const char *name);
@@ -656,6 +658,17 @@ extern void __init omap_hwmod_init(void);
 
 const char *omap_hwmod_get_main_clk(struct omap_hwmod *oh);
 
+#else	/* CONFIG_OMAP_HWMOD */
+
+static inline int
+omap_hwmod_for_each_by_class(const char *classname,
+			     int (*fn)(struct omap_hwmod *oh, void *user),
+			     void *user)
+{
+	return 0;
+}
+#endif	/* CONFIG_OMAP_HWMOD */
+
 /*
  *
  */
diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -443,7 +443,7 @@ void omap_auxdata_legacy_init(struct device *dev)
 	dev->platform_data = &twl_gpio_auxdata;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_OMAP_MCBSP)
+#if defined(CONFIG_ARCH_OMAP3) && IS_ENABLED(CONFIG_SND_SOC_OMAP_MCBSP)
 static struct omap_mcbsp_platform_data mcbsp_pdata;
 static void __init omap3_mcbsp_init(void)
 {
diff --git a/arch/arm/mach-omap2/sr_device.c b/arch/arm/mach-omap2/sr_device.c
--- a/arch/arm/mach-omap2/sr_device.c
+++ b/arch/arm/mach-omap2/sr_device.c
@@ -152,6 +152,7 @@ static int __init sr_init_by_name(const char *name, const char *voltdm)
 	return 0;
 }
 
+#ifdef CONFIG_OMAP_HWMOD
 static int __init sr_dev_init(struct omap_hwmod *oh, void *user)
 {
 	struct omap_smartreflex_dev_attr *sr_dev_attr;
@@ -165,6 +166,12 @@ static int __init sr_dev_init(struct omap_hwmod *oh, void *user)
 
 	return sr_init_by_name(oh->name, sr_dev_attr->sensor_voltdm_name);
 }
+#else
+static int __init sr_dev_init(struct omap_hwmod *oh, void *user)
+{
+	return -EINVAL;
+}
+#endif
 
 /*
  * API to be called from board files to enable smartreflex
-- 
2.30.2
