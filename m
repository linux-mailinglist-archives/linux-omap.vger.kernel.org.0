Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCC9413114
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhIUKDP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:03:15 -0400
Received: from muru.com ([72.249.23.125]:35460 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231670AbhIUKDJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:03:09 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D4CF38336;
        Tue, 21 Sep 2021 10:02:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/9] bus: ti-sysc: Handle otg force idle quirk
Date:   Tue, 21 Sep 2021 13:01:13 +0300
Message-Id: <20210921100115.59865-8-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921100115.59865-1-tony@atomide.com>
References: <20210921100115.59865-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's add handling the otg force idle quirk for the old omap2430 glue layer
used up to omap4 as the musb driver quirk only works if the driver is
loaded. Unlike with the am335x glue layer, looks like we don't need the
quirk handling for SYSC_QUIRK_REINIT_ON_CTX_LOST.

Eventually when all the musb using SoCs are booting with device tree based
configuration, we can just remove the related quirk handling from the
musb driver.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 24 +++++++++++++++++++++++-
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1610,7 +1610,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, -ENODEV, 0x50700101, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000050,
-		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
+		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY |
+		   SYSC_MODULE_QUIRK_OTG),
 	SYSC_QUIRK("usb_otg_hs", 0, 0, 0x10, -ENODEV, 0x4ea2080d, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY |
 		   SYSC_QUIRK_REINIT_ON_CTX_LOST),
@@ -1969,6 +1970,22 @@ static void sysc_module_lock_quirk_rtc(struct sysc *ddata)
 	sysc_quirk_rtc(ddata, true);
 }
 
+/* OTG omap2430 glue layer up to omap4 needs OTG_FORCESTDBY configured */
+static void sysc_module_enable_quirk_otg(struct sysc *ddata)
+{
+	int offset = 0x414;	/* OTG_FORCESTDBY */
+
+	sysc_write(ddata, offset, 0);
+}
+
+static void sysc_module_disable_quirk_otg(struct sysc *ddata)
+{
+	int offset = 0x414;	/* OTG_FORCESTDBY */
+	u32 val = BIT(0);	/* ENABLEFORCE */
+
+	sysc_write(ddata, offset, val);
+}
+
 /* 36xx SGX needs a quirk for to bypass OCP IPG interrupt logic */
 static void sysc_module_enable_quirk_sgx(struct sysc *ddata)
 {
@@ -2051,6 +2068,11 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 		return;
 	}
 
+	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_OTG) {
+		ddata->module_enable_quirk = sysc_module_enable_quirk_otg;
+		ddata->module_disable_quirk = sysc_module_disable_quirk_otg;
+	}
+
 	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_SGX)
 		ddata->module_enable_quirk = sysc_module_enable_quirk_sgx;
 
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -50,6 +50,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_MODULE_QUIRK_OTG		BIT(30)
 #define SYSC_QUIRK_RESET_ON_CTX_LOST	BIT(29)
 #define SYSC_QUIRK_REINIT_ON_CTX_LOST	BIT(28)
 #define SYSC_QUIRK_REINIT_ON_RESUME	BIT(27)
-- 
2.33.0
