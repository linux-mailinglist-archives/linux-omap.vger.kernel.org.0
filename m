Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C775D1D32
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 02:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbfJJAMd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 20:12:33 -0400
Received: from muru.com ([72.249.23.125]:36752 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731916AbfJJAMd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 20:12:33 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1FAB88200;
        Thu, 10 Oct 2019 00:13:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 4/8] ARM: OMAP2+: Update 4430 voltage controller operating points
Date:   Wed,  9 Oct 2019 17:12:20 -0700
Message-Id: <20191010001224.41826-5-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010001224.41826-1-tony@atomide.com>
References: <20191010001224.41826-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The current operating points in the mainline kernel are out of date for
at least omap4430. Let's use the values from Motorola Mapphone Linux
Android kernel as presumably those have been verified.

Note that these are only used by voltage controller, they do not enable
any new operating points for cpufreq. Looking at the recent omap3 cpufreq
related patches posted, that's a totally separate series of patches.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/control.h      |  1 +
 arch/arm/mach-omap2/opp4xxx_data.c | 16 +++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-omap2/control.h b/arch/arm/mach-omap2/control.h
--- a/arch/arm/mach-omap2/control.h
+++ b/arch/arm/mach-omap2/control.h
@@ -195,6 +195,7 @@
 #define OMAP44XX_CONTROL_FUSE_MPU_OPP100	0x243
 #define OMAP44XX_CONTROL_FUSE_MPU_OPPTURBO	0x246
 #define OMAP44XX_CONTROL_FUSE_MPU_OPPNITRO	0x249
+#define OMAP44XX_CONTROL_FUSE_MPU_OPPNITROSB	0x24C
 #define OMAP44XX_CONTROL_FUSE_CORE_OPP50	0x254
 #define OMAP44XX_CONTROL_FUSE_CORE_OPP100	0x257
 #define OMAP44XX_CONTROL_FUSE_CORE_OPP100OV	0x25A
diff --git a/arch/arm/mach-omap2/opp4xxx_data.c b/arch/arm/mach-omap2/opp4xxx_data.c
--- a/arch/arm/mach-omap2/opp4xxx_data.c
+++ b/arch/arm/mach-omap2/opp4xxx_data.c
@@ -32,20 +32,22 @@
 
 #define OMAP4430_VDD_MPU_OPP50_UV		1025000
 #define OMAP4430_VDD_MPU_OPP100_UV		1200000
-#define OMAP4430_VDD_MPU_OPPTURBO_UV		1313000
-#define OMAP4430_VDD_MPU_OPPNITRO_UV		1375000
+#define OMAP4430_VDD_MPU_OPPTURBO_UV		1325000
+#define OMAP4430_VDD_MPU_OPPNITRO_UV		1388000
+#define OMAP4430_VDD_MPU_OPPNITROSB_UV		1398000
 
 struct omap_volt_data omap443x_vdd_mpu_volt_data[] = {
 	VOLT_DATA_DEFINE(OMAP4430_VDD_MPU_OPP50_UV, OMAP44XX_CONTROL_FUSE_MPU_OPP50, 0xf4, 0x0c),
 	VOLT_DATA_DEFINE(OMAP4430_VDD_MPU_OPP100_UV, OMAP44XX_CONTROL_FUSE_MPU_OPP100, 0xf9, 0x16),
 	VOLT_DATA_DEFINE(OMAP4430_VDD_MPU_OPPTURBO_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPTURBO, 0xfa, 0x23),
 	VOLT_DATA_DEFINE(OMAP4430_VDD_MPU_OPPNITRO_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPNITRO, 0xfa, 0x27),
+	VOLT_DATA_DEFINE(OMAP4430_VDD_MPU_OPPNITROSB_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPNITROSB, 0xfa, 0x27),
 	VOLT_DATA_DEFINE(0, 0, 0, 0),
 };
 
-#define OMAP4430_VDD_IVA_OPP50_UV		1013000
-#define OMAP4430_VDD_IVA_OPP100_UV		1188000
-#define OMAP4430_VDD_IVA_OPPTURBO_UV		1300000
+#define OMAP4430_VDD_IVA_OPP50_UV		 950000
+#define OMAP4430_VDD_IVA_OPP100_UV		1114000
+#define OMAP4430_VDD_IVA_OPPTURBO_UV		1291000
 
 struct omap_volt_data omap443x_vdd_iva_volt_data[] = {
 	VOLT_DATA_DEFINE(OMAP4430_VDD_IVA_OPP50_UV, OMAP44XX_CONTROL_FUSE_IVA_OPP50, 0xf4, 0x0c),
@@ -54,8 +56,8 @@ struct omap_volt_data omap443x_vdd_iva_volt_data[] = {
 	VOLT_DATA_DEFINE(0, 0, 0, 0),
 };
 
-#define OMAP4430_VDD_CORE_OPP50_UV		1025000
-#define OMAP4430_VDD_CORE_OPP100_UV		1200000
+#define OMAP4430_VDD_CORE_OPP50_UV		 962000
+#define OMAP4430_VDD_CORE_OPP100_UV		1127000
 
 struct omap_volt_data omap443x_vdd_core_volt_data[] = {
 	VOLT_DATA_DEFINE(OMAP4430_VDD_CORE_OPP50_UV, OMAP44XX_CONTROL_FUSE_CORE_OPP50, 0xf4, 0x0c),
-- 
2.23.0
