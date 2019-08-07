Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0D8684C58
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 15:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388007AbfHGNFG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 09:05:06 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43580 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfHGNFG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 09:05:06 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77D534m018259;
        Wed, 7 Aug 2019 08:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565183103;
        bh=5ZJWE2YShcEteM2b5hAEhwzpnJw3NLmASsHKII8cvV4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FiyP2UbME094Iy1/m9tNXIjVlMpuyshYCaRsc/pSo9HKnT+CQTHZPSscwnyn/UDtW
         ZMdlRUTGBuIlXcQ7xEgODGrWw30UieaQYpqe9JFeO0qOMgoRBWqXXayLHlRBkwE493
         mNFpK+E9EkEobMTQlF3W7NiJVpiStFV/wtoQ6qm8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77D53AF039631
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 08:05:03 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 08:05:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 08:05:02 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77D4i1d081508;
        Wed, 7 Aug 2019 08:05:00 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCH 1/3] clk: ti: clkctrl: add support for polling clock status for enable only
Date:   Wed, 7 Aug 2019 16:04:37 +0300
Message-ID: <1565183079-27798-2-git-send-email-t-kristo@ti.com>
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

The activity status for certain clocks is possible to be polled only
during enable phase; the disable phase depends on additional reset
logic. If the disable phase is polled with these clocks, it will
result in a timeout. To fix this, add logic for polling the clock
activity only during enable, and add a new flag for this purpose.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c | 5 ++++-
 drivers/clk/ti/clock.h   | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 975995e..f5517a8 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -25,6 +25,7 @@
 #include "clock.h"
 
 #define NO_IDLEST			0x1
+#define NO_IDLE_POLL			0x2
 
 #define OMAP4_MODULEMODE_MASK		0x3
 
@@ -187,7 +188,7 @@ static void _omap4_clkctrl_clk_disable(struct clk_hw *hw)
 
 	ti_clk_ll_ops->clk_writel(val, &clk->enable_reg);
 
-	if (clk->flags & NO_IDLEST)
+	if (clk->flags & (NO_IDLEST | NO_IDLE_POLL))
 		goto exit;
 
 	/* Wait until module is disabled */
@@ -597,6 +598,8 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 			hw->enable_bit = MODULEMODE_HWCTRL;
 		if (reg_data->flags & CLKF_NO_IDLEST)
 			hw->flags |= NO_IDLEST;
+		if (reg_data->flags & CLKF_NO_IDLE_POLL)
+			hw->flags |= NO_IDLE_POLL;
 
 		if (reg_data->clkdm_name)
 			hw->clkdm_name = reg_data->clkdm_name;
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index e4b8392..6410ff6 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -82,6 +82,7 @@ enum {
 #define CLKF_SW_SUP			BIT(5)
 #define CLKF_HW_SUP			BIT(6)
 #define CLKF_NO_IDLEST			BIT(7)
+#define CLKF_NO_IDLE_POLL		BIT(8)
 
 #define CLKF_SOC_MASK			GENMASK(11, 8)
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
