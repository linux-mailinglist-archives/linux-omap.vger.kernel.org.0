Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36897298B7F
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773155AbgJZLLU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:11:20 -0400
Received: from muru.com ([72.249.23.125]:46568 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773149AbgJZLLQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:11:16 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3C51D8196;
        Mon, 26 Oct 2020 11:11:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 5/9] bus: ti-sysc: Implement GPMC debug quirk to drop platform data
Date:   Mon, 26 Oct 2020 13:10:45 +0200
Message-Id: <20201026111049.54835-6-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026111049.54835-1-tony@atomide.com>
References: <20201026111049.54835-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to enable no-reset-on-init quirk for GPMC if the config
option for CONFIG_OMAP_GPMC_DEBUG is set. Otherwise the GPMC
driver code is unable to show the bootloader configured timings.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 10 ++++++++++
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1382,6 +1382,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_QUIRK_CLKDM_NOAUTO),
 	SYSC_QUIRK("dwc3", 0x488c0000, 0, 0x10, -ENODEV, 0x500a0200, 0xffffffff,
 		   SYSC_QUIRK_CLKDM_NOAUTO),
+	SYSC_QUIRK("gpmc", 0, 0, 0x10, 0x14, 0x00000060, 0xffffffff,
+		   SYSC_QUIRK_GPMC_DEBUG),
 	SYSC_QUIRK("hdmi", 0, 0, 0x10, -ENODEV, 0x50030200, 0xffffffff,
 		   SYSC_QUIRK_OPT_CLKS_NEEDED),
 	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x00000006, 0xffffffff,
@@ -1815,6 +1817,14 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 		return;
 	}
 
+#ifdef CONFIG_OMAP_GPMC_DEBUG
+	if (ddata->cfg.quirks & SYSC_QUIRK_GPMC_DEBUG) {
+		ddata->cfg.quirks |= SYSC_QUIRK_NO_RESET_ON_INIT;
+
+		return;
+	}
+#endif
+
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_I2C) {
 		ddata->pre_reset_quirk = sysc_pre_reset_quirk_i2c;
 		ddata->post_reset_quirk = sysc_post_reset_quirk_i2c;
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -50,6 +50,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_QUIRK_GPMC_DEBUG		BIT(26)
 #define SYSC_MODULE_QUIRK_ENA_RESETDONE	BIT(25)
 #define SYSC_MODULE_QUIRK_PRUSS		BIT(24)
 #define SYSC_MODULE_QUIRK_DSS_RESET	BIT(23)
-- 
2.29.1
