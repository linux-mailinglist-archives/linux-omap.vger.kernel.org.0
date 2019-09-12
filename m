Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096F2B0FD2
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 15:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732105AbfILN0d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 09:26:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38374 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732101AbfILN0c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 09:26:32 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQTcN021198;
        Thu, 12 Sep 2019 08:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294789;
        bh=+wJjCWfQrTgNasnwgKOhFijISSbGmcAqlzAKHLVv0jA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ECsG4xE9qa8EpnYr69vNt/rPmogkYvgc/pY1gIz4ZraIoS+8WeYnKQOwWLW3A2O3J
         JjfWKpXLeILXPqhxojHMMtbuga/0aztd+qR5oa2CvMBwT1wPiSBSryYqBwoQqXJ103
         LyNakZdnNiHwyDPlNInImxKRKlmK0/J+4x4yW+4A=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQTgj071141;
        Thu, 12 Sep 2019 08:26:29 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:27 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvU130575;
        Thu, 12 Sep 2019 08:26:25 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 05/10] clk: ti: omap5: add IVA subsystem clkctrl data
Date:   Thu, 12 Sep 2019 16:26:08 +0300
Message-ID: <20190912132613.28093-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912132613.28093-1-t-kristo@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add clkctrl data for the IVA subsystem (Image and Video Accelerator.)

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-54xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
index dafef7e70ba8..f63871dac600 100644
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -286,6 +286,12 @@ static const struct omap_clkctrl_reg_data omap5_l4per_clkctrl_regs[] __initconst
 	{ 0 },
 };
 
+static const struct omap_clkctrl_reg_data omap5_iva_clkctrl_regs[] __initconst = {
+	{ OMAP5_IVA_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_h12x2_ck" },
+	{ OMAP5_SL2IF_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_h12x2_ck" },
+	{ 0 },
+};
+
 static const char * const omap5_dss_dss_clk_parents[] __initconst = {
 	"dpll_per_h12x2_ck",
 	NULL,
@@ -469,6 +475,7 @@ const struct omap_clkctrl_data omap5_clkctrl_data[] __initconst = {
 	{ 0x4a008d20, omap5_l4cfg_clkctrl_regs },
 	{ 0x4a008e20, omap5_l3instr_clkctrl_regs },
 	{ 0x4a009020, omap5_l4per_clkctrl_regs },
+	{ 0x4a009220, omap5_iva_clkctrl_regs },
 	{ 0x4a009420, omap5_dss_clkctrl_regs },
 	{ 0x4a009620, omap5_l3init_clkctrl_regs },
 	{ 0x4ae07920, omap5_wkupaon_clkctrl_regs },
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
