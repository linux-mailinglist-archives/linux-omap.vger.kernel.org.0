Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F414F9200
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfKLOYW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:24:22 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40316 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfKLOYG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:24:06 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEO0ac044161;
        Tue, 12 Nov 2019 08:24:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568640;
        bh=1Bhj4EOWi0ydAwvul89PG3T7dhu8tO1R32BihtUQ0BY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Asp6hfSOZNzLZbt/akt03FPex2juJ2m70mm87A79qiv6iPXjKnKXIbVxGaTGOKjoU
         cEtThwh/fwwOjvEylALrSQXa4qgQGuP0IrfVYTcfdBt/oO+lqVY/f0xBR1bjYEKY9C
         HuaZyoX3Ix7AO8z4klgUIbbAOT1+bkL2eGiELoT4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEO02o114664
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:24:00 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:23:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:23:42 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACENwTi099408;
        Tue, 12 Nov 2019 08:23:59 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 1/3] clk: ti: dra7: add vpe clkctrl data
Date:   Tue, 12 Nov 2019 08:26:55 -0600
Message-ID: <20191112142657.22898-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112142657.22898-1-bparrot@ti.com>
References: <20191112142657.22898-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add clkctrl data for VPE.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/clk/ti/clk-7xx.c         |  6 ++++++
 include/dt-bindings/clock/dra7.h | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index b57fe09b428b..5dd9cad07542 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -146,6 +146,11 @@ static const struct omap_clkctrl_reg_data dra7_rtc_clkctrl_regs[] __initconst =
 	{ 0 },
 };
 
+static const struct omap_clkctrl_reg_data dra7_vpe_clkctrl_regs[] __initconst = {
+	{ DRA7_VPE_VPE_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h23x2_ck" },
+	{ 0 },
+};
+
 static const struct omap_clkctrl_reg_data dra7_coreaon_clkctrl_regs[] __initconst = {
 	{ DRA7_COREAON_SMARTREFLEX_MPU_CLKCTRL, NULL, CLKF_SW_SUP, "wkupaon_iclk_mux" },
 	{ DRA7_COREAON_SMARTREFLEX_CORE_CLKCTRL, NULL, CLKF_SW_SUP, "wkupaon_iclk_mux" },
@@ -769,6 +774,7 @@ const struct omap_clkctrl_data dra7_clkctrl_data[] __initconst = {
 	{ 0x4a005550, dra7_ipu_clkctrl_regs },
 	{ 0x4a005620, dra7_dsp2_clkctrl_regs },
 	{ 0x4a005720, dra7_rtc_clkctrl_regs },
+	{ 0x4a005760, dra7_vpe_clkctrl_regs },
 	{ 0x4a008620, dra7_coreaon_clkctrl_regs },
 	{ 0x4a008720, dra7_l3main1_clkctrl_regs },
 	{ 0x4a008920, dra7_ipu2_clkctrl_regs },
diff --git a/include/dt-bindings/clock/dra7.h b/include/dt-bindings/clock/dra7.h
index 72f2e8411523..2b765e579b2a 100644
--- a/include/dt-bindings/clock/dra7.h
+++ b/include/dt-bindings/clock/dra7.h
@@ -29,6 +29,11 @@
 #define DRA7_RTC_CLKCTRL_INDEX(offset)	((offset) - DRA7_RTC_CLKCTRL_OFFSET)
 #define DRA7_RTCSS_CLKCTRL	DRA7_RTC_CLKCTRL_INDEX(0x44)
 
+/* vpe clocks */
+#define DRA7_VPE_CLKCTRL_OFFSET	0x60
+#define DRA7_VPE_CLKCTRL_INDEX(offset)	((offset) - DRA7_VPE_CLKCTRL_OFFSET)
+#define DRA7_VPE_CLKCTRL	DRA7_VPE_CLKCTRL_INDEX(0x64)
+
 /* coreaon clocks */
 #define DRA7_SMARTREFLEX_MPU_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 #define DRA7_SMARTREFLEX_CORE_CLKCTRL	DRA7_CLKCTRL_INDEX(0x38)
@@ -192,6 +197,11 @@
 /* rtc clocks */
 #define DRA7_RTC_RTCSS_CLKCTRL	DRA7_CLKCTRL_INDEX(0x44)
 
+/* vpe clocks */
+#define DRA7_VPE_CLKCTRL_OFFSET	0x60
+#define DRA7_VPE_CLKCTRL_INDEX(offset)	((offset) - DRA7_VPE_CLKCTRL_OFFSET)
+#define DRA7_VPE_VPE_CLKCTRL	DRA7_VPE_CLKCTRL_INDEX(0x64)
+
 /* coreaon clocks */
 #define DRA7_COREAON_SMARTREFLEX_MPU_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 #define DRA7_COREAON_SMARTREFLEX_CORE_CLKCTRL	DRA7_CLKCTRL_INDEX(0x38)
-- 
2.17.1

