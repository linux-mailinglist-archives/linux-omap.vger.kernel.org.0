Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D28C8D457
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbfHNNOX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:14:23 -0400
Received: from muru.com ([72.249.23.125]:57628 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfHNNOX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:14:23 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 71AAA81DD;
        Wed, 14 Aug 2019 13:14:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Filip=20Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/6] bus: ti-sysc: Add module enable quirk for SGX on omap36xx
Date:   Wed, 14 Aug 2019 06:14:04 -0700
Message-Id: <20190814131408.57162-3-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814131408.57162-1-tony@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add module enable quirk for SGX needed on omap36xx.

Cc: Adam Ford <aford173@gmail.com>
Cc: Filip Matijević <filip.matijevic.pz@gmail.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: moaz korena <moaz@korena.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Philipp Rossak <embed3d@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 21 +++++++++++++++++++++
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -73,6 +73,7 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @clk_enable_quirk: module specific clock enable quirk
  * @clk_disable_quirk: module specific clock disable quirk
  * @reset_done_quirk: module specific reset done quirk
+ * @module_enable_quirk: module specific enable quirk
  */
 struct sysc {
 	struct device *dev;
@@ -98,6 +99,7 @@ struct sysc {
 	void (*clk_enable_quirk)(struct sysc *sysc);
 	void (*clk_disable_quirk)(struct sysc *sysc);
 	void (*reset_done_quirk)(struct sysc *sysc);
+	void (*module_enable_quirk)(struct sysc *sysc);
 };
 
 static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
@@ -938,6 +940,9 @@ static int sysc_enable_module(struct device *dev)
 		sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
 	}
 
+	if (ddata->module_enable_quirk)
+		ddata->module_enable_quirk(ddata);
+
 	return 0;
 }
 
@@ -1251,6 +1256,9 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_MODULE_QUIRK_I2C),
 	SYSC_QUIRK("i2c", 0, 0, 0x10, 0x90, 0x5040000a, 0xfffff0f0,
 		   SYSC_MODULE_QUIRK_I2C),
+	SYSC_QUIRK("gpu", 0x50000000, 0x14, -1, -1, 0x00010201, 0xffffffff, 0),
+	SYSC_QUIRK("gpu", 0x50000000, 0xfe00, 0xfe10, -1, 0x40000000 , 0xffffffff,
+		   SYSC_MODULE_QUIRK_SGX),
 	SYSC_QUIRK("wdt", 0, 0, 0x10, 0x14, 0x502a0500, 0xfffff0f0,
 		   SYSC_MODULE_QUIRK_WDT),
 
@@ -1268,6 +1276,7 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("dwc3", 0, 0, 0x10, -1, 0x500a0200, 0xffffffff, 0),
 	SYSC_QUIRK("epwmss", 0, 0, 0x4, -1, 0x47400001, 0xffffffff, 0),
 	SYSC_QUIRK("gpu", 0, 0x1fc00, 0x1fc10, -1, 0, 0, 0),
+	SYSC_QUIRK("gpu", 0, 0xfe00, 0xfe10, -1, 0x40000000 , 0xffffffff, 0),
 	SYSC_QUIRK("hsi", 0, 0, 0x10, 0x14, 0x50043101, 0xffffffff, 0),
 	SYSC_QUIRK("iss", 0, 0, 0x10, -1, 0x40000101, 0xffffffff, 0),
 	SYSC_QUIRK("lcdc", 0, 0, 0x54, -1, 0x4f201000, 0xffffffff, 0),
@@ -1419,6 +1428,15 @@ static void sysc_clk_disable_quirk_i2c(struct sysc *ddata)
 	sysc_clk_quirk_i2c(ddata, false);
 }
 
+/* 36xx SGX needs a quirk for to bypass OCP IPG interrupt logic */
+static void sysc_module_enable_quirk_sgx(struct sysc *ddata)
+{
+	int offset = 0xff08;	/* OCP_DEBUG_CONFIG */
+	u32 val = BIT(31);	/* THALIA_INT_BYPASS */
+
+	sysc_write(ddata, offset, val);
+}
+
 /* Watchdog timer needs a disable sequence after reset */
 static void sysc_reset_done_quirk_wdt(struct sysc *ddata)
 {
@@ -1461,6 +1479,9 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 		return;
 	}
 
+	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_SGX)
+		ddata->module_enable_quirk = sysc_module_enable_quirk_sgx;
+
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_WDT)
 		ddata->reset_done_quirk = sysc_reset_done_quirk_wdt;
 }
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -49,6 +49,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_MODULE_QUIRK_SGX		BIT(18)
 #define SYSC_MODULE_QUIRK_HDQ1W		BIT(17)
 #define SYSC_MODULE_QUIRK_I2C		BIT(16)
 #define SYSC_MODULE_QUIRK_WDT		BIT(15)
-- 
2.21.0
