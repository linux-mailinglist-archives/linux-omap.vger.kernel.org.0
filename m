Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B2D1687D8
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 20:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbgBUTxM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 14:53:12 -0500
Received: from muru.com ([72.249.23.125]:56862 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgBUTxM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 14:53:12 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F18108161;
        Fri, 21 Feb 2020 19:53:54 +0000 (UTC)
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
Subject: [PATCH 2/7] bus: ti-sysc: Rename clk related quirks to pre_reset and post_reset quirks
Date:   Fri, 21 Feb 2020 11:52:51 -0800
Message-Id: <20200221195256.54016-3-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221195256.54016-1-tony@atomide.com>
References: <20200221195256.54016-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The clk_disable_quirk and clk_enable_quirk should really be called
pre_reset_quirk and post_reset_quirk to avoid confusion like we had
with hdq1w reset.

Let's also rename the related functions so the code is easier to follow.
Note that we also have reset_done_quirk that is needed in some cases
after checking the separate register for reset done bit.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -70,8 +70,8 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @child_needs_resume: runtime resume needed for child on resume from suspend
  * @disable_on_idle: status flag used for disabling modules with resets
  * @idle_work: work structure used to perform delayed idle on a module
- * @clk_enable_quirk: module specific clock enable quirk
- * @clk_disable_quirk: module specific clock disable quirk
+ * @pre_reset_quirk: module specific pre-reset quirk
+ * @post_reset_quirk: module specific post-reset quirk
  * @reset_done_quirk: module specific reset done quirk
  * @module_enable_quirk: module specific enable quirk
  * @module_disable_quirk: module specific disable quirk
@@ -97,8 +97,8 @@ struct sysc {
 	unsigned int needs_resume:1;
 	unsigned int child_needs_resume:1;
 	struct delayed_work idle_work;
-	void (*clk_enable_quirk)(struct sysc *sysc);
-	void (*clk_disable_quirk)(struct sysc *sysc);
+	void (*pre_reset_quirk)(struct sysc *sysc);
+	void (*post_reset_quirk)(struct sysc *sysc);
 	void (*reset_done_quirk)(struct sysc *sysc);
 	void (*module_enable_quirk)(struct sysc *sysc);
 	void (*module_disable_quirk)(struct sysc *sysc);
@@ -1418,7 +1418,7 @@ static void sysc_module_enable_quirk_aess(struct sysc *ddata)
 	sysc_write(ddata, offset, 1);
 }
 
-/* I2C needs extra enable bit toggling for reset */
+/* I2C needs to be disabled for reset */
 static void sysc_clk_quirk_i2c(struct sysc *ddata, bool enable)
 {
 	int offset;
@@ -1439,14 +1439,14 @@ static void sysc_clk_quirk_i2c(struct sysc *ddata, bool enable)
 	sysc_write(ddata, offset, val);
 }
 
-static void sysc_clk_enable_quirk_i2c(struct sysc *ddata)
+static void sysc_pre_reset_quirk_i2c(struct sysc *ddata)
 {
-	sysc_clk_quirk_i2c(ddata, true);
+	sysc_clk_quirk_i2c(ddata, false);
 }
 
-static void sysc_clk_disable_quirk_i2c(struct sysc *ddata)
+static void sysc_post_reset_quirk_i2c(struct sysc *ddata)
 {
-	sysc_clk_quirk_i2c(ddata, false);
+	sysc_clk_quirk_i2c(ddata, true);
 }
 
 /* 36xx SGX needs a quirk for to bypass OCP IPG interrupt logic */
@@ -1488,14 +1488,14 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 		return;
 
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_HDQ1W) {
-		ddata->clk_disable_quirk = sysc_pre_reset_quirk_hdq1w;
+		ddata->pre_reset_quirk = sysc_pre_reset_quirk_hdq1w;
 
 		return;
 	}
 
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_I2C) {
-		ddata->clk_enable_quirk = sysc_clk_enable_quirk_i2c;
-		ddata->clk_disable_quirk = sysc_clk_disable_quirk_i2c;
+		ddata->pre_reset_quirk = sysc_pre_reset_quirk_i2c;
+		ddata->post_reset_quirk = sysc_post_reset_quirk_i2c;
 
 		return;
 	}
@@ -1583,8 +1583,8 @@ static int sysc_reset(struct sysc *ddata)
 	else
 		syss_done = ddata->cfg.syss_mask;
 
-	if (ddata->clk_disable_quirk)
-		ddata->clk_disable_quirk(ddata);
+	if (ddata->pre_reset_quirk)
+		ddata->pre_reset_quirk(ddata);
 
 	sysc_val = sysc_read_sysconfig(ddata);
 	sysc_val |= sysc_mask;
@@ -1594,8 +1594,8 @@ static int sysc_reset(struct sysc *ddata)
 		usleep_range(ddata->cfg.srst_udelay,
 			     ddata->cfg.srst_udelay * 2);
 
-	if (ddata->clk_enable_quirk)
-		ddata->clk_enable_quirk(ddata);
+	if (ddata->post_reset_quirk)
+		ddata->post_reset_quirk(ddata);
 
 	/* Poll on reset status */
 	if (syss_offset >= 0) {
-- 
2.25.1
