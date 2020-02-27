Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A496172B3C
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 23:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730416AbgB0W3D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 17:29:03 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46710 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729935AbgB0W2x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 17:28:53 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSob7006384;
        Thu, 27 Feb 2020 16:28:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582842530;
        bh=pgRhKalkOllxbmNpMnFHKJTJfFq9jJAY9x22lK0bkEg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GLFZo7eG61HL4IO95ptagmIanA5ImGeL0z231m/it9nTaJFMhwcBA2Q1MJYYSr9Al
         jfKoXTmsY13TKjKzJix1LnDudJs9IVkLsRiekTEK2kJPT6JskwQM766ST4mZNeK41e
         tHHkVsMlRkEWawFaa8kdBUH9DPJs2ts/ByO4w7bE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RMSo8O077899
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Feb 2020 16:28:50 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 16:28:49 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 16:28:49 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSnGl121967;
        Thu, 27 Feb 2020 16:28:49 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01RMSnFI087070;
        Thu, 27 Feb 2020 16:28:49 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 2/5] bus: ti-sysc: Add support for PRUSS SYSC type
Date:   Thu, 27 Feb 2020 16:28:34 -0600
Message-ID: <20200227222837.7329-3-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200227222837.7329-1-s-anna@ti.com>
References: <20200227222837.7329-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRU-ICSS present on AM33xx/AM43xx/AM57xx has a very unique
SYSCFG register. The register follows the OMAP4-style SYSC_TYPE3
for Master Standby and Slave Idle, but also has two additional
unique fields - STANDBY_INIT and SUB_MWAIT. The STANDBY_INIT is
a control bit that is used to initiate a Standby sequence (when
set) and trigger a MStandby request to the SoC's PRCM module. This
same bit is also used to enable the OCP master ports (when cleared)
to allow the PRU cores to access any peripherals or memory beyond
the PRU subsystem. The SUB_MWAIT is a ready status field for the
external access.

Add support for this SYSC type. The STANDBY_INIT has to be set
during suspend, without which it results in a hang in the resume
sequence on AM33xx/AM43xx boards and requires a board reset to
come out of the hang. Any PRU applications requiring external
access are supposed to clear the STANDBY_INIT bit. Note that
the PRUSS context is lost during a suspend sequence because the
PRUSS module is reset and/or disabled.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
v2: No changes

 drivers/bus/ti-sysc.c                 | 27 +++++++++++++++++++++++++++
 include/linux/platform_data/ti-sysc.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index f702c85c81b6..855f851e99be 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1272,6 +1272,9 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("wdt", 0, 0, 0x10, 0x14, 0x502a0500, 0xfffff0f0,
 		   SYSC_MODULE_QUIRK_WDT),
+	/* PRUSS on am3, am4 and am5 */
+	SYSC_QUIRK("pruss", 0, 0x26000, 0x26004, -1, 0x47000000, 0xff000000,
+		   SYSC_MODULE_QUIRK_PRUSS),
 	/* Watchdog on am3 and am4 */
 	SYSC_QUIRK("wdt", 0x44e35000, 0, 0x10, 0x14, 0x502a0500, 0xfffff0f0,
 		   SYSC_MODULE_QUIRK_WDT | SYSC_QUIRK_SWSUP_SIDLE),
@@ -1482,6 +1485,16 @@ static void sysc_reset_done_quirk_wdt(struct sysc *ddata)
 		dev_warn(ddata->dev, "wdt disable step2 failed\n");
 }
 
+/* PRUSS needs to set MSTANDBY_INIT inorder to idle properly */
+static void sysc_module_disable_quirk_pruss(struct sysc *ddata)
+{
+	u32 reg;
+
+	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
+	reg |= SYSC_PRUSS_STANDBY_INIT;
+	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
+}
+
 static void sysc_init_module_quirks(struct sysc *ddata)
 {
 	if (ddata->legacy_mode || !ddata->name)
@@ -1510,6 +1523,9 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 		ddata->reset_done_quirk = sysc_reset_done_quirk_wdt;
 		ddata->module_disable_quirk = sysc_reset_done_quirk_wdt;
 	}
+
+	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_PRUSS)
+		ddata->module_disable_quirk = sysc_module_disable_quirk_pruss;
 }
 
 static int sysc_clockdomain_init(struct sysc *ddata)
@@ -2313,6 +2329,16 @@ static const struct sysc_capabilities sysc_dra7_mcan = {
 	.mod_quirks = SYSS_QUIRK_RESETDONE_INVERTED,
 };
 
+/*
+ * PRUSS found on some AM33xx, AM437x and AM57xx SoCs
+ */
+static const struct sysc_capabilities sysc_pruss = {
+	.type = TI_SYSC_PRUSS,
+	.sysc_mask = SYSC_PRUSS_STANDBY_INIT | SYSC_PRUSS_SUB_MWAIT,
+	.regbits = &sysc_regbits_omap4_simple,
+	.mod_quirks = SYSC_MODULE_QUIRK_PRUSS,
+};
+
 static int sysc_init_pdata(struct sysc *ddata)
 {
 	struct ti_sysc_platform_data *pdata = dev_get_platdata(ddata->dev);
@@ -2538,6 +2564,7 @@ static const struct of_device_id sysc_match[] = {
 	{ .compatible = "ti,sysc-usb-host-fs",
 	  .data = &sysc_omap4_usb_host_fs, },
 	{ .compatible = "ti,sysc-dra7-mcan", .data = &sysc_dra7_mcan, },
+	{ .compatible = "ti,sysc-pruss", .data = &sysc_pruss, },
 	{  },
 };
 MODULE_DEVICE_TABLE(of, sysc_match);
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
index 2cbde6542849..b04575fb9f73 100644
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -17,6 +17,7 @@ enum ti_sysc_module_type {
 	TI_SYSC_OMAP4_MCASP,
 	TI_SYSC_OMAP4_USB_HOST_FS,
 	TI_SYSC_DRA7_MCAN,
+	TI_SYSC_PRUSS,
 };
 
 struct ti_sysc_cookie {
@@ -49,6 +50,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_MODULE_QUIRK_PRUSS		BIT(22)
 #define SYSC_QUIRK_CLKDM_NOAUTO		BIT(21)
 #define SYSC_QUIRK_FORCE_MSTANDBY	BIT(20)
 #define SYSC_MODULE_QUIRK_AESS		BIT(19)
-- 
2.23.0

