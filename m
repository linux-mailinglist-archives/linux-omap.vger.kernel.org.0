Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2CD1687E2
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 20:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgBUTx0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 14:53:26 -0500
Received: from muru.com ([72.249.23.125]:56940 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728019AbgBUTxZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 14:53:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5DCD8807E;
        Fri, 21 Feb 2020 19:54:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 7/7] bus: ti-sysc: Handle module unlock quirk needed for some RTC
Date:   Fri, 21 Feb 2020 11:52:56 -0800
Message-Id: <20200221195256.54016-8-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221195256.54016-1-tony@atomide.com>
References: <20200221195256.54016-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The RTC modules on am3 and am4 need quirk handling to unlock and lock
them for reset so let's add the quirk handling based on what we already
have for legacy platform data. In later patches we will simply drop the
RTC related platform data and the old quirk handling.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 74 ++++++++++++++++++++++++---
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -110,6 +110,8 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @reset_done_quirk: module specific reset done quirk
  * @module_enable_quirk: module specific enable quirk
  * @module_disable_quirk: module specific disable quirk
+ * @module_unlock_quirk: module specific sysconfig unlock quirk
+ * @module_lock_quirk: module specific sysconfig lock quirk
  */
 struct sysc {
 	struct device *dev;
@@ -137,6 +139,8 @@ struct sysc {
 	void (*reset_done_quirk)(struct sysc *sysc);
 	void (*module_enable_quirk)(struct sysc *sysc);
 	void (*module_disable_quirk)(struct sysc *sysc);
+	void (*module_unlock_quirk)(struct sysc *sysc);
+	void (*module_lock_quirk)(struct sysc *sysc);
 };
 
 static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
@@ -896,6 +900,22 @@ static void sysc_show_registers(struct sysc *ddata)
 		buf);
 }
 
+/**
+ * sysc_write_sysconfig - handle sysconfig quirks for register write
+ * @ddata: device driver data
+ * @value: register value
+ */
+static void sysc_write_sysconfig(struct sysc *ddata, u32 value)
+{
+	if (ddata->module_unlock_quirk)
+		ddata->module_unlock_quirk(ddata);
+
+	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], value);
+
+	if (ddata->module_lock_quirk)
+		ddata->module_lock_quirk(ddata);
+}
+
 #define SYSC_IDLE_MASK	(SYSC_NR_IDLEMODES - 1)
 #define SYSC_CLOCACT_ICK	2
 
@@ -942,7 +962,7 @@ static int sysc_enable_module(struct device *dev)
 
 	reg &= ~(SYSC_IDLE_MASK << regbits->sidle_shift);
 	reg |= best_mode << regbits->sidle_shift;
-	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
+	sysc_write_sysconfig(ddata, reg);
 
 set_midle:
 	/* Set MIDLE mode */
@@ -961,14 +981,14 @@ static int sysc_enable_module(struct device *dev)
 
 	reg &= ~(SYSC_IDLE_MASK << regbits->midle_shift);
 	reg |= best_mode << regbits->midle_shift;
-	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
+	sysc_write_sysconfig(ddata, reg);
 
 set_autoidle:
 	/* Autoidle bit must enabled separately if available */
 	if (regbits->autoidle_shift >= 0 &&
 	    ddata->cfg.sysc_val & BIT(regbits->autoidle_shift)) {
 		reg |= 1 << regbits->autoidle_shift;
-		sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
+		sysc_write_sysconfig(ddata, reg);
 	}
 
 	if (ddata->module_enable_quirk)
@@ -1026,7 +1046,7 @@ static int sysc_disable_module(struct device *dev)
 
 	reg &= ~(SYSC_IDLE_MASK << regbits->midle_shift);
 	reg |= best_mode << regbits->midle_shift;
-	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
+	sysc_write_sysconfig(ddata, reg);
 
 set_sidle:
 	/* Set SIDLE mode */
@@ -1049,7 +1069,7 @@ static int sysc_disable_module(struct device *dev)
 	if (regbits->autoidle_shift >= 0 &&
 	    ddata->cfg.sysc_val & BIT(regbits->autoidle_shift))
 		reg |= 1 << regbits->autoidle_shift;
-	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
+	sysc_write_sysconfig(ddata, reg);
 
 	return 0;
 }
@@ -1301,6 +1321,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("gpu", 0x50000000, 0x14, -ENODEV, -ENODEV, 0x00010201, 0xffffffff, 0),
 	SYSC_QUIRK("gpu", 0x50000000, 0xfe00, 0xfe10, -ENODEV, 0x40000000 , 0xffffffff,
 		   SYSC_MODULE_QUIRK_SGX),
+	SYSC_QUIRK("rtc", 0, 0x74, 0x78, -ENODEV, 0x4eb01908, 0xffff00f0,
+		   SYSC_MODULE_QUIRK_RTC_UNLOCK),
 	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000050,
 		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("usb_otg_hs", 0, 0, 0x10, -ENODEV, 0x4ea2080d, 0xffffffff,
@@ -1356,7 +1378,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("slimbus", 0, 0, 0x10, -ENODEV, 0x40002903, 0xffffffff, 0),
 	SYSC_QUIRK("spinlock", 0, 0, 0x10, -ENODEV, 0x50020000, 0xffffffff, 0),
 	SYSC_QUIRK("rng", 0, 0x1fe0, 0x1fe4, -ENODEV, 0x00000020, 0xffffffff, 0),
-	SYSC_QUIRK("rtc", 0, 0x74, 0x78, -ENODEV, 0x4eb01908, 0xffff00f0, 0),
 	SYSC_QUIRK("timer32k", 0, 0, 0x4, -ENODEV, 0x00000060, 0xffffffff, 0),
 	SYSC_QUIRK("usbhstll", 0, 0, 0x10, 0x14, 0x00000004, 0xffffffff, 0),
 	SYSC_QUIRK("usbhstll", 0, 0, 0x10, 0x14, 0x00000008, 0xffffffff, 0),
@@ -1478,6 +1499,40 @@ static void sysc_post_reset_quirk_i2c(struct sysc *ddata)
 	sysc_clk_quirk_i2c(ddata, true);
 }
 
+/* RTC on am3 and 4 needs to be unlocked and locked for sysconfig */
+static void sysc_quirk_rtc(struct sysc *ddata, bool lock)
+{
+	u32 val, kick0_val = 0, kick1_val = 0;
+	unsigned long flags;
+	int error;
+
+	if (!lock) {
+		kick0_val = 0x83e70b13;
+		kick1_val = 0x95a4f1e0;
+	}
+
+	local_irq_save(flags);
+	/* RTC_STATUS BUSY bit may stay active for 1/32768 seconds (~30 usec) */
+	error = readl_poll_timeout(ddata->module_va + 0x44, val,
+				   !(val & BIT(0)), 100, 50);
+	if (error)
+		dev_warn(ddata->dev, "rtc busy timeout\n");
+	/* Now we have ~15 microseconds to read/write various registers */
+	sysc_write(ddata, 0x6c, kick0_val);
+	sysc_write(ddata, 0x70, kick1_val);
+	local_irq_restore(flags);
+}
+
+static void sysc_module_unlock_quirk_rtc(struct sysc *ddata)
+{
+	sysc_quirk_rtc(ddata, false);
+}
+
+static void sysc_module_lock_quirk_rtc(struct sysc *ddata)
+{
+	sysc_quirk_rtc(ddata, true);
+}
+
 /* 36xx SGX needs a quirk for to bypass OCP IPG interrupt logic */
 static void sysc_module_enable_quirk_sgx(struct sysc *ddata)
 {
@@ -1532,6 +1587,13 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_AESS)
 		ddata->module_enable_quirk = sysc_module_enable_quirk_aess;
 
+	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_RTC_UNLOCK) {
+		ddata->module_unlock_quirk = sysc_module_unlock_quirk_rtc;
+		ddata->module_lock_quirk = sysc_module_lock_quirk_rtc;
+
+		return;
+	}
+
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_SGX)
 		ddata->module_enable_quirk = sysc_module_enable_quirk_sgx;
 
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -49,6 +49,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_MODULE_QUIRK_RTC_UNLOCK	BIT(22)
 #define SYSC_QUIRK_CLKDM_NOAUTO		BIT(21)
 #define SYSC_QUIRK_FORCE_MSTANDBY	BIT(20)
 #define SYSC_MODULE_QUIRK_AESS		BIT(19)
-- 
2.25.1
