Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDA36DB604
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 20:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503202AbfJQSVt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 14:21:49 -0400
Received: from muru.com ([72.249.23.125]:37840 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503219AbfJQSVt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 14:21:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E581C804F;
        Thu, 17 Oct 2019 18:22:21 +0000 (UTC)
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
Subject: [PATCH] bus: ti-sysc: Fix watchdog quirk handling
Date:   Thu, 17 Oct 2019 11:21:44 -0700
Message-Id: <20191017182144.10175-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I noticed that when probed with ti-sysc, watchdog can trigger on am3, am4
and dra7 causing a device reset.

Turns out I made several mistakes implementing the watchdog quirk handling:

1. We must do both writes to spr register

2. We must also call the reset quirk on disable

3. On am3 and am4 we need to also set swsup quirk flag

I probably only tested this earlier with watchdog service running when the
watchdog never gets disabled.

Fixes: 4e23be473e30 ("bus: ti-sysc: Add support for module specific reset quirks")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -74,6 +74,7 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @clk_disable_quirk: module specific clock disable quirk
  * @reset_done_quirk: module specific reset done quirk
  * @module_enable_quirk: module specific enable quirk
+ * @module_disable_quirk: module specific disable quirk
  */
 struct sysc {
 	struct device *dev;
@@ -100,6 +101,7 @@ struct sysc {
 	void (*clk_disable_quirk)(struct sysc *sysc);
 	void (*reset_done_quirk)(struct sysc *sysc);
 	void (*module_enable_quirk)(struct sysc *sysc);
+	void (*module_disable_quirk)(struct sysc *sysc);
 };
 
 static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
@@ -959,6 +961,9 @@ static int sysc_disable_module(struct device *dev)
 	if (ddata->offsets[SYSC_SYSCONFIG] == -ENODEV)
 		return 0;
 
+	if (ddata->module_disable_quirk)
+		ddata->module_disable_quirk(ddata);
+
 	regbits = ddata->cap->regbits;
 	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
 
@@ -1248,6 +1253,9 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_MODULE_QUIRK_SGX),
 	SYSC_QUIRK("wdt", 0, 0, 0x10, 0x14, 0x502a0500, 0xfffff0f0,
 		   SYSC_MODULE_QUIRK_WDT),
+	/* Watchdog on am3 and am4 */
+	SYSC_QUIRK("wdt", 0x44e35000, 0, 0x10, 0x14, 0x502a0500, 0xfffff0f0,
+		   SYSC_MODULE_QUIRK_WDT | SYSC_QUIRK_SWSUP_SIDLE),
 
 #ifdef DEBUG
 	SYSC_QUIRK("adc", 0, 0, 0x10, -1, 0x47300001, 0xffffffff, 0),
@@ -1440,14 +1448,14 @@ static void sysc_reset_done_quirk_wdt(struct sysc *ddata)
 				   !(val & 0x10), 100,
 				   MAX_MODULE_SOFTRESET_WAIT);
 	if (error)
-		dev_warn(ddata->dev, "wdt disable spr failed\n");
+		dev_warn(ddata->dev, "wdt disable step1 failed\n");
 
-	sysc_write(ddata, wps, 0x5555);
+	sysc_write(ddata, spr, 0x5555);
 	error = readl_poll_timeout(ddata->module_va + wps, val,
 				   !(val & 0x10), 100,
 				   MAX_MODULE_SOFTRESET_WAIT);
 	if (error)
-		dev_warn(ddata->dev, "wdt disable wps failed\n");
+		dev_warn(ddata->dev, "wdt disable step2 failed\n");
 }
 
 static void sysc_init_module_quirks(struct sysc *ddata)
@@ -1471,8 +1479,10 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_SGX)
 		ddata->module_enable_quirk = sysc_module_enable_quirk_sgx;
 
-	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_WDT)
+	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_WDT) {
 		ddata->reset_done_quirk = sysc_reset_done_quirk_wdt;
+		ddata->module_disable_quirk = sysc_reset_done_quirk_wdt;
+	}
 }
 
 static int sysc_clockdomain_init(struct sysc *ddata)
-- 
2.23.0
