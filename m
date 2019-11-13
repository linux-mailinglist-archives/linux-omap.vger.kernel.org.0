Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999D0FB67D
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 18:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfKMRhH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 12:37:07 -0500
Received: from muru.com ([72.249.23.125]:42042 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbfKMRhH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 Nov 2019 12:37:07 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3C02580E2;
        Wed, 13 Nov 2019 17:37:42 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] bus: ti-sysc: Add module enable quirk for audio AESS
Date:   Wed, 13 Nov 2019 09:37:02 -0800
Message-Id: <20191113173702.57107-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We must set the autogating bit on enable for AESS (Audio Engine SubSystem)
when probed with ti-sysc interconnect target module driver. Otherwise it
won't idle properly.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 14 +++++++++++++-
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1248,6 +1248,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_QUIRK_SWSUP_SIDLE),
 
 	/* Quirks that need to be set based on detected module */
+	SYSC_QUIRK("aess", 0, 0, 0x10, -1, 0x40000000, 0xffffffff,
+		   SYSC_MODULE_QUIRK_AESS),
 	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x00000006, 0xffffffff,
 		   SYSC_MODULE_QUIRK_HDQ1W),
 	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x0000000a, 0xffffffff,
@@ -1276,7 +1278,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 #ifdef DEBUG
 	SYSC_QUIRK("adc", 0, 0, 0x10, -1, 0x47300001, 0xffffffff, 0),
 	SYSC_QUIRK("atl", 0, 0, -1, -1, 0x0a070100, 0xffffffff, 0),
-	SYSC_QUIRK("aess", 0, 0, 0x10, -1, 0x40000000, 0xffffffff, 0),
 	SYSC_QUIRK("cm", 0, 0, -1, -1, 0x40000301, 0xffffffff, 0),
 	SYSC_QUIRK("control", 0, 0, 0x10, -1, 0x40000900, 0xffffffff, 0),
 	SYSC_QUIRK("cpgmac", 0, 0x1200, 0x1208, 0x1204, 0x4edb1902,
@@ -1408,6 +1409,14 @@ static void sysc_clk_enable_quirk_hdq1w(struct sysc *ddata)
 	sysc_write(ddata, offset, val);
 }
 
+/* AESS (Audio Engine SubSystem) needs autogating set after enable */
+static void sysc_module_enable_quirk_aess(struct sysc *ddata)
+{
+	int offset = 0x7c;	/* AESS_AUTO_GATING_ENABLE */
+
+	sysc_write(ddata, offset, 1);
+}
+
 /* I2C needs extra enable bit toggling for reset */
 static void sysc_clk_quirk_i2c(struct sysc *ddata, bool enable)
 {
@@ -1490,6 +1499,9 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 		return;
 	}
 
+	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_AESS)
+		ddata->module_enable_quirk = sysc_module_enable_quirk_aess;
+
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_SGX)
 		ddata->module_enable_quirk = sysc_module_enable_quirk_sgx;
 
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -49,6 +49,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_MODULE_QUIRK_AESS		BIT(19)
 #define SYSC_MODULE_QUIRK_SGX		BIT(18)
 #define SYSC_MODULE_QUIRK_HDQ1W		BIT(17)
 #define SYSC_MODULE_QUIRK_I2C		BIT(16)
-- 
2.23.0
