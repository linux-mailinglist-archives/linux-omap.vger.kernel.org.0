Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8C525F518
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 10:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgIGI0L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 04:26:11 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41822 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgIGI0J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 04:26:09 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0878Q7kW092459;
        Mon, 7 Sep 2020 03:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599467167;
        bh=+9IVZ6g+HmgWB90pOJtgDqW8uGH1+adNPd3FFT+Rh0U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jmp9cug1TXFaExrVzoA8GibrmHxGhGO6PDRXzZmQWP/a10zzNq0nyIC1qkKJDYr8a
         LngztxCStsnrrrV0U5fs0EivX4VD7qR08+J73OCofECif2Zp2FgBsgICb1QluoMrRf
         q16vRUyYCIVTDTva08g6JZmUKrt2ORGtp9Ygxdhw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0878Q6L3075747
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Sep 2020 03:26:07 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 03:26:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 03:26:06 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0878Q1YJ087957;
        Mon, 7 Sep 2020 03:26:05 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH 3/3] clk: ti: dra7: add missing clkctrl register for SHA2 instance
Date:   Mon, 7 Sep 2020 11:26:00 +0300
Message-ID: <20200907082600.454-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907082600.454-1-t-kristo@ti.com>
References: <20200907082600.454-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DRA7 SoC has two SHA instances. Add the clkctrl entry for the second
one.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-7xx.c         | 1 +
 include/dt-bindings/clock/dra7.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index b4cf578a69e1..4e27f88062e7 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -637,6 +637,7 @@ static const struct omap_clkctrl_reg_data dra7_l4sec_clkctrl_regs[] __initconst
 	{ DRA7_L4SEC_DES_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ DRA7_L4SEC_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "l4_root_clk_div" },
 	{ DRA7_L4SEC_SHAM_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
+	{ DRA7_L4SEC_SHAM2_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ 0 },
 };
 
diff --git a/include/dt-bindings/clock/dra7.h b/include/dt-bindings/clock/dra7.h
index 8cec5a1e1806..5ec4137231e3 100644
--- a/include/dt-bindings/clock/dra7.h
+++ b/include/dt-bindings/clock/dra7.h
@@ -332,6 +332,7 @@
 #define DRA7_L4SEC_DES_CLKCTRL	DRA7_L4SEC_CLKCTRL_INDEX(0x1b0)
 #define DRA7_L4SEC_RNG_CLKCTRL	DRA7_L4SEC_CLKCTRL_INDEX(0x1c0)
 #define DRA7_L4SEC_SHAM_CLKCTRL	DRA7_L4SEC_CLKCTRL_INDEX(0x1c8)
+#define DRA7_L4SEC_SHAM2_CLKCTRL DRA7_L4SEC_CLKCTRL_INDEX(0x1f8)
 
 /* l4per2 clocks */
 #define DRA7_L4PER2_CLKCTRL_OFFSET	0xc
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
