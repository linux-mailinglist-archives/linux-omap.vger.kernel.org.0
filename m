Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE091F920E
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbfKLOZD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:25:03 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36938 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbfKLOZC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:25:02 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEOtNh013024;
        Tue, 12 Nov 2019 08:24:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568695;
        bh=OLANNa/zS4QeJmZdVJHCwy6f1uzgaNDwDH1+yts73FE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zHIqMtDlwdhEHDIUM1XoWS30YkeATGsHnwEPz8nKAFdpUFgaBH6gw53aYT2JMmBX/
         oxFd0dYuB9TC5E0vuqcslmy1O4OEA4JVvZpXj2YGb5ANataEkdoh3bwXfdhly3y8fs
         QEqeFtxpaIZA3hxWNfgailK9vZhHkEf9X+ysq6iE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEOtII115945
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:24:55 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:24:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:24:37 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEOrBg036029;
        Tue, 12 Nov 2019 08:24:54 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 01/10] clk: ti: dra7: add cam clkctrl data
Date:   Tue, 12 Nov 2019 08:27:44 -0600
Message-ID: <20191112142753.22976-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112142753.22976-1-bparrot@ti.com>
References: <20191112142753.22976-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add clkctrl data for CAM domain.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/clk/ti/clk-7xx.c         | 19 +++++++++++++++++++
 include/dt-bindings/clock/dra7.h | 10 ++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 5dd9cad07542..8f2204a36b51 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -151,6 +151,24 @@ static const struct omap_clkctrl_reg_data dra7_vpe_clkctrl_regs[] __initconst =
 	{ 0 },
 };
 
+static const char * const dra7_cam_gfclk_mux_parents[] __initconst = {
+	"l3_iclk_div",
+	"core_iss_main_clk",
+	NULL,
+};
+
+static const struct omap_clkctrl_bit_data dra7_cam_bit_data[] __initconst = {
+	{ 24, TI_CLK_MUX, dra7_cam_gfclk_mux_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data dra7_cam_clkctrl_regs[] __initconst = {
+	{ DRA7_CAM_VIP1_CLKCTRL, dra7_cam_bit_data, CLKF_HW_SUP, "l3_iclk_div" },
+	{ DRA7_CAM_VIP2_CLKCTRL, dra7_cam_bit_data, CLKF_HW_SUP, "l3_iclk_div" },
+	{ DRA7_CAM_VIP3_CLKCTRL, dra7_cam_bit_data, CLKF_HW_SUP, "l3_iclk_div" },
+	{ 0 },
+};
+
 static const struct omap_clkctrl_reg_data dra7_coreaon_clkctrl_regs[] __initconst = {
 	{ DRA7_COREAON_SMARTREFLEX_MPU_CLKCTRL, NULL, CLKF_SW_SUP, "wkupaon_iclk_mux" },
 	{ DRA7_COREAON_SMARTREFLEX_CORE_CLKCTRL, NULL, CLKF_SW_SUP, "wkupaon_iclk_mux" },
@@ -783,6 +801,7 @@ const struct omap_clkctrl_data dra7_clkctrl_data[] __initconst = {
 	{ 0x4a008c00, dra7_atl_clkctrl_regs },
 	{ 0x4a008d20, dra7_l4cfg_clkctrl_regs },
 	{ 0x4a008e20, dra7_l3instr_clkctrl_regs },
+	{ 0x4a009020, dra7_cam_clkctrl_regs },
 	{ 0x4a009120, dra7_dss_clkctrl_regs },
 	{ 0x4a009320, dra7_l3init_clkctrl_regs },
 	{ 0x4a0093b0, dra7_pcie_clkctrl_regs },
diff --git a/include/dt-bindings/clock/dra7.h b/include/dt-bindings/clock/dra7.h
index 2b765e579b2a..2c058a534bab 100644
--- a/include/dt-bindings/clock/dra7.h
+++ b/include/dt-bindings/clock/dra7.h
@@ -34,6 +34,11 @@
 #define DRA7_VPE_CLKCTRL_INDEX(offset)	((offset) - DRA7_VPE_CLKCTRL_OFFSET)
 #define DRA7_VPE_CLKCTRL	DRA7_VPE_CLKCTRL_INDEX(0x64)
 
+/* vip clocks */
+#define DRA7_VIP1_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
+#define DRA7_VIP2_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
+#define DRA7_VIP3_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
+
 /* coreaon clocks */
 #define DRA7_SMARTREFLEX_MPU_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 #define DRA7_SMARTREFLEX_CORE_CLKCTRL	DRA7_CLKCTRL_INDEX(0x38)
@@ -202,6 +207,11 @@
 #define DRA7_VPE_CLKCTRL_INDEX(offset)	((offset) - DRA7_VPE_CLKCTRL_OFFSET)
 #define DRA7_VPE_VPE_CLKCTRL	DRA7_VPE_CLKCTRL_INDEX(0x64)
 
+/* vip clocks */
+#define DRA7_CAM_VIP1_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
+#define DRA7_CAM_VIP2_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
+#define DRA7_CAM_VIP3_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
+
 /* coreaon clocks */
 #define DRA7_COREAON_SMARTREFLEX_MPU_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 #define DRA7_COREAON_SMARTREFLEX_CORE_CLKCTRL	DRA7_CLKCTRL_INDEX(0x38)
-- 
2.17.1

