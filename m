Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4683115BC
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 23:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhBEWjx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 17:39:53 -0500
Received: from muru.com ([72.249.23.125]:57682 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230315AbhBENqb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 5 Feb 2021 08:46:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 46EE181BD;
        Fri,  5 Feb 2021 13:46:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Amit Kucheria <amitk@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 4/4] thermal: ti-soc-thermal: Use non-inverted define for omap4
Date:   Fri,  5 Feb 2021 15:45:34 +0200
Message-Id: <20210205134534.49200-5-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205134534.49200-1-tony@atomide.com>
References: <20210205134534.49200-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When we set bit 10 high we use continuous mode and not single
mode. Let's correct this to avoid confusion. No functional
changes here, the code does the right thing with bit 10.

Cc: Adam Ford <aford173@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/thermal/ti-soc-thermal/omap4-thermal-data.c | 4 ++--
 drivers/thermal/ti-soc-thermal/omap4xxx-bandgap.h   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/ti-soc-thermal/omap4-thermal-data.c b/drivers/thermal/ti-soc-thermal/omap4-thermal-data.c
--- a/drivers/thermal/ti-soc-thermal/omap4-thermal-data.c
+++ b/drivers/thermal/ti-soc-thermal/omap4-thermal-data.c
@@ -24,7 +24,7 @@ omap4430_mpu_temp_sensor_registers = {
 	.bgap_dtemp_mask = OMAP4430_BGAP_TEMP_SENSOR_DTEMP_MASK,
 
 	.bgap_mode_ctrl = OMAP4430_TEMP_SENSOR_CTRL_OFFSET,
-	.mode_ctrl_mask = OMAP4430_SINGLE_MODE_MASK,
+	.mode_ctrl_mask = OMAP4430_CONTINUOUS_MODE_MASK,
 
 	.bgap_efuse = OMAP4430_FUSE_OPP_BGAP,
 };
@@ -97,7 +97,7 @@ omap4460_mpu_temp_sensor_registers = {
 	.mask_cold_mask = OMAP4460_MASK_COLD_MASK,
 
 	.bgap_mode_ctrl = OMAP4460_BGAP_CTRL_OFFSET,
-	.mode_ctrl_mask = OMAP4460_SINGLE_MODE_MASK,
+	.mode_ctrl_mask = OMAP4460_CONTINUOUS_MODE_MASK,
 
 	.bgap_counter = OMAP4460_BGAP_COUNTER_OFFSET,
 	.counter_mask = OMAP4460_COUNTER_MASK,
diff --git a/drivers/thermal/ti-soc-thermal/omap4xxx-bandgap.h b/drivers/thermal/ti-soc-thermal/omap4xxx-bandgap.h
--- a/drivers/thermal/ti-soc-thermal/omap4xxx-bandgap.h
+++ b/drivers/thermal/ti-soc-thermal/omap4xxx-bandgap.h
@@ -40,7 +40,7 @@
 /* OMAP4430.TEMP_SENSOR bits */
 #define OMAP4430_BGAP_TEMPSOFF_MASK			BIT(12)
 #define OMAP4430_BGAP_TSHUT_MASK			BIT(11)
-#define OMAP4430_SINGLE_MODE_MASK			BIT(10)
+#define OMAP4430_CONTINUOUS_MODE_MASK			BIT(10)
 #define OMAP4430_BGAP_TEMP_SENSOR_SOC_MASK		BIT(9)
 #define OMAP4430_BGAP_TEMP_SENSOR_EOCZ_MASK		BIT(8)
 #define OMAP4430_BGAP_TEMP_SENSOR_DTEMP_MASK		(0xff << 0)
@@ -113,7 +113,7 @@
 #define OMAP4460_BGAP_TEMP_SENSOR_DTEMP_MASK		(0x3ff << 0)
 
 /* OMAP4460.BANDGAP_CTRL bits */
-#define OMAP4460_SINGLE_MODE_MASK			BIT(31)
+#define OMAP4460_CONTINUOUS_MODE_MASK			BIT(31)
 #define OMAP4460_MASK_HOT_MASK				BIT(1)
 #define OMAP4460_MASK_COLD_MASK				BIT(0)
 
-- 
2.30.0
