Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8583A84C5E
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 15:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387796AbfHGNFN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 09:05:13 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37978 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfHGNFN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 09:05:13 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77D5AaY103207;
        Wed, 7 Aug 2019 08:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565183110;
        bh=eqyHu/LUmaKHuC1352mmmRAsKmYUeRahsTBIJwAVsyY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VQ1K8m3Yq723CUbyTs0cESyvcTeW1xHvokk964GMKvV2XNOwAv3OxE/uTse/8fZFk
         Lkc0ucw5/JcmYvyVtEdWXnc31c8bhlzHU9NE/yIoUs6WNPeItQYU2aUWDbs8+utcU/
         dOeBU+N9/8i9dMdVk7Y27z337Ti6fNqS9nmwK86Q=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77D5AXW040412
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 08:05:10 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 08:05:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 08:05:10 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77D4i1f081508;
        Wed, 7 Aug 2019 08:05:06 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCH 3/3] clk: ti: dra7xx: add timer_sys_ck clock alias
Date:   Wed, 7 Aug 2019 16:04:39 +0300
Message-ID: <1565183079-27798-4-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is needed by the TI DM timer driver.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 5208eb8..64507b8 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -792,6 +792,7 @@
 static struct ti_dt_clk dra7xx_clks[] = {
 	DT_CLK(NULL, "timer_32k_ck", "sys_32k_ck"),
 	DT_CLK(NULL, "sys_clkin_ck", "timer_sys_clk_div"),
+	DT_CLK(NULL, "timer_sys_ck", "timer_sys_clk_div"),
 	DT_CLK(NULL, "sys_clkin", "sys_clkin1"),
 	DT_CLK(NULL, "atl_dpll_clk_mux", "atl-clkctrl:0000:24"),
 	DT_CLK(NULL, "atl_gfclk_mux", "atl-clkctrl:0000:26"),
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
