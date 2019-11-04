Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B87EEA41
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 21:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbfKDUtJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 15:49:09 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55846 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729646AbfKDUtJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Nov 2019 15:49:09 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kn3OT052935;
        Mon, 4 Nov 2019 14:49:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572900543;
        bh=OLANNa/zS4QeJmZdVJHCwy6f1uzgaNDwDH1+yts73FE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tHc4tiFoH2zvfBEC8wC70oxlbn1XrjLNdOYMnemooR6uypcVEDv5uJdnZ/zg2VrbK
         gEDNQhkjR0KZhqLgqjNv35d3yaM1Xo3QieZce0b8kUm8eEr0SbN6ZDEM7jwGEspv5r
         IpQ51nMRLg3CeZkyul5LHfe+OeybDqInR2FNS0OA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kn2cf004561;
        Mon, 4 Nov 2019 14:49:03 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 14:48:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 14:48:48 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kmvxv038360;
        Mon, 4 Nov 2019 14:49:01 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 01/10] clk: ti: dra7: add cam clkctrl data
Date:   Mon, 4 Nov 2019 14:48:44 -0600
Message-ID: <20191104204853.4355-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104204853.4355-1-bparrot@ti.com>
References: <20191104204853.4355-1-bparrot@ti.com>
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

