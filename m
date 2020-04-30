Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7981BF302
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 10:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgD3Igv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 04:36:51 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48798 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgD3Igu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Apr 2020 04:36:50 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03U8alhm094443;
        Thu, 30 Apr 2020 03:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588235807;
        bh=idc5gdhNc8qmOLkXqV/R5/KEalHYKuJ427pVS2ZvQzY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nBpBH7DSpmIcODZHRjqdjSSPZ9KCZUy6QrDM1EAuWqqS47OCn/dOazYXymYUfgeSn
         lV5QVUGmj4mBMs787+erbDdSBNu0yMphDTr6MOL2+2VRANcT2eF53h8PwPfLxd225+
         5cIrbanUgcwkqOzxyQ6H8WZSiBbIEh3eBGToPF3E=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03U8alXW063243
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 Apr 2020 03:36:47 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Apr 2020 03:36:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Apr 2020 03:36:47 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U8agEn073623;
        Thu, 30 Apr 2020 03:36:46 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <linux-omap@vger.kernel.org>
Subject: [PATCH 2/3] clk: ti: dra7xx: mark MCAN clock as DRA76x only
Date:   Thu, 30 Apr 2020 11:36:39 +0300
Message-ID: <20200430083640.8621-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430083640.8621-1-t-kristo@ti.com>
References: <20200430083640.8621-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This clock entry does not exist on any other devices except DRA76,
so mark it as specific to that SoC only.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 366cb75378cb..146d1d67c732 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -815,7 +815,7 @@ static const struct omap_clkctrl_reg_data dra7_wkupaon_clkctrl_regs[] __initcons
 	{ DRA7_WKUPAON_COUNTER_32K_CLKCTRL, NULL, 0, "wkupaon_iclk_mux" },
 	{ DRA7_WKUPAON_UART10_CLKCTRL, dra7_uart10_bit_data, CLKF_SW_SUP, "wkupaon-clkctrl:0060:24" },
 	{ DRA7_WKUPAON_DCAN1_CLKCTRL, dra7_dcan1_bit_data, CLKF_SW_SUP, "wkupaon-clkctrl:0068:24" },
-	{ DRA7_WKUPAON_ADC_CLKCTRL, NULL, CLKF_SW_SUP, "mcan_clk" },
+	{ DRA7_WKUPAON_ADC_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_SOC_DRA76, "mcan_clk" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
