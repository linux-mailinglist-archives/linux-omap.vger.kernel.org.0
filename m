Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2AF1BF304
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 10:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgD3Igx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 04:36:53 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48808 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgD3Igw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Apr 2020 04:36:52 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03U8anKh094449;
        Thu, 30 Apr 2020 03:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588235809;
        bh=VYueZm5CvboGryMIxPqzyx8mLmX3qjIlZueWkp9+pss=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=aXTJZnUcOWKiJHI+oQ3XlMBQOlJQe1QqtAa0zQgrppcUHYPzPQVZSBWeK7qP2GpHR
         svnD4zerDYjBbnoGsYkshxfV6bkaHzLaCwnqMXuob9k1G9pbL9m6COGlfq3Lr1ZM+j
         039jrH6F1hlQeFGKSimHKRTuLNb2lVAi3FFMApwU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U8anYr076754;
        Thu, 30 Apr 2020 03:36:49 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Apr 2020 03:36:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Apr 2020 03:36:49 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U8agEo073623;
        Thu, 30 Apr 2020 03:36:47 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <linux-omap@vger.kernel.org>
Subject: [PATCH 3/3] clk: ti: dra7xx: fix RNG clock parent
Date:   Thu, 30 Apr 2020 11:36:40 +0300
Message-ID: <20200430083640.8621-4-t-kristo@ti.com>
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

RNG is sourced from L4 clock. Add info for this for proper parenting of
the clock.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 146d1d67c732..bf8fced40e42 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -644,7 +644,7 @@ static const struct omap_clkctrl_reg_data dra7_l4sec_clkctrl_regs[] __initconst
 	{ DRA7_L4SEC_AES1_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ DRA7_L4SEC_AES2_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ DRA7_L4SEC_DES_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
-	{ DRA7_L4SEC_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
+	{ DRA7_L4SEC_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "l4_root_clk_div" },
 	{ DRA7_L4SEC_SHAM_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ 0 },
 };
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
