Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3995DF5F7E
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2019 15:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfKIOUb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Nov 2019 09:20:31 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37742 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfKIOUa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Nov 2019 09:20:30 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA9EKR3l086964;
        Sat, 9 Nov 2019 08:20:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573309227;
        bh=LqZKtdGMP4JpJzaF9qF6txbpTIEf3dbIjnft7GLbzQ8=;
        h=From:To:CC:Subject:Date;
        b=kJxTcsESiLveJ7ESE5yUiFWpl6gN2djfWA4tKfNJ5x5rd2aAsW9xKHig+o8TeRvPA
         xpoZl4Vc+V3yGrj5W/Mf1iKMGw2goVf4oEQaTOAhZKP/5G0cu9WponUP9vMJuqHyQK
         eGBDfSAS+4XPlMYiy8afcQB3Vlb0iQG5GYdqdMTY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA9EKRSw049175
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 9 Nov 2019 08:20:27 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 9 Nov
 2019 08:20:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 9 Nov 2019 08:20:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA9EKPpo095419;
        Sat, 9 Nov 2019 08:20:26 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] clk: ti: dra7: fix parent for gmac_clkctrl
Date:   Sat, 9 Nov 2019 16:20:17 +0200
Message-ID: <20191109142017.10851-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) instead
of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
Hence, fix it.

Fixes: commit dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/clk/ti/clk-7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 9dd6185a4b4e..66e4b2b9ec60 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -405,7 +405,7 @@ static const struct omap_clkctrl_bit_data dra7_gmac_bit_data[] __initconst = {
 };
 
 static const struct omap_clkctrl_reg_data dra7_gmac_clkctrl_regs[] __initconst = {
-	{ DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "dpll_gmac_ck" },
+	{ DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "gmac_main_clk" },
 	{ 0 },
 };
 
-- 
2.17.1

