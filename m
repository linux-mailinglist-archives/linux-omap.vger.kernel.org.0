Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E525A298B36
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772606AbgJZLAW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:00:22 -0400
Received: from muru.com ([72.249.23.125]:46454 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1772586AbgJZK6f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 06:58:35 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 006C381B1;
        Mon, 26 Oct 2020 10:58:37 +0000 (UTC)
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
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] bus: ti-sysc: Fix reset status check for modules with quirks
Date:   Mon, 26 Oct 2020 12:58:11 +0200
Message-Id: <20201026105812.38418-4-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026105812.38418-1-tony@atomide.com>
References: <20201026105812.38418-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and
wait for softreset bit") started showing a "OCP softreset timed out"
warning on enable if the interconnect target module is not out of reset.
This caused the warning to be often triggered for i2c and hdq while the
devices are working properly.

Turns out that some interconnect target modules seem to have an unusable
reset status bits unless the module specific reset quirks are activated.

Let's just skip the reset status check for those modules as we only want
to activate the reset quirks when doing a reset, and not on enable. This
way we don't see the bogus "OCP softreset timed out" warnings during boot.

Fixes: d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 24 +++++++++++++++---------
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -970,9 +970,15 @@ static int sysc_enable_module(struct device *dev)
 			return error;
 		}
 	}
-	error = sysc_wait_softreset(ddata);
-	if (error)
-		dev_warn(ddata->dev, "OCP softreset timed out\n");
+	/*
+	 * Some modules like i2c and hdq1w have unusable reset status unless
+	 * the module reset quirk is enabled. Skip status check on enable.
+	 */
+	if (!(ddata->cfg.quirks & SYSC_MODULE_QUIRK_ENA_RESETDONE)) {
+		error = sysc_wait_softreset(ddata);
+		if (error)
+			dev_warn(ddata->dev, "OCP softreset timed out\n");
+	}
 	if (ddata->cfg.quirks & SYSC_QUIRK_OPT_CLKS_IN_RESET)
 		sysc_disable_opt_clocks(ddata);
 
@@ -1373,17 +1379,17 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("hdmi", 0, 0, 0x10, -ENODEV, 0x50030200, 0xffffffff,
 		   SYSC_QUIRK_OPT_CLKS_NEEDED),
 	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x00000006, 0xffffffff,
-		   SYSC_MODULE_QUIRK_HDQ1W),
+		   SYSC_MODULE_QUIRK_HDQ1W | SYSC_MODULE_QUIRK_ENA_RESETDONE),
 	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x0000000a, 0xffffffff,
-		   SYSC_MODULE_QUIRK_HDQ1W),
+		   SYSC_MODULE_QUIRK_HDQ1W | SYSC_MODULE_QUIRK_ENA_RESETDONE),
 	SYSC_QUIRK("i2c", 0, 0, 0x20, 0x10, 0x00000036, 0x000000ff,
-		   SYSC_MODULE_QUIRK_I2C),
+		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE),
 	SYSC_QUIRK("i2c", 0, 0, 0x20, 0x10, 0x0000003c, 0x000000ff,
-		   SYSC_MODULE_QUIRK_I2C),
+		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE),
 	SYSC_QUIRK("i2c", 0, 0, 0x20, 0x10, 0x00000040, 0x000000ff,
-		   SYSC_MODULE_QUIRK_I2C),
+		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE),
 	SYSC_QUIRK("i2c", 0, 0, 0x10, 0x90, 0x5040000a, 0xfffff0f0,
-		   SYSC_MODULE_QUIRK_I2C),
+		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE),
 	SYSC_QUIRK("gpu", 0x50000000, 0x14, -ENODEV, -ENODEV, 0x00010201, 0xffffffff, 0),
 	SYSC_QUIRK("gpu", 0x50000000, 0xfe00, 0xfe10, -ENODEV, 0x40000000 , 0xffffffff,
 		   SYSC_MODULE_QUIRK_SGX),
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -50,6 +50,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_MODULE_QUIRK_ENA_RESETDONE	BIT(25)
 #define SYSC_MODULE_QUIRK_PRUSS		BIT(24)
 #define SYSC_MODULE_QUIRK_DSS_RESET	BIT(23)
 #define SYSC_MODULE_QUIRK_RTC_UNLOCK	BIT(22)
-- 
2.29.1
