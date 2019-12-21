Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4F11288C7
	for <lists+linux-omap@lfdr.de>; Sat, 21 Dec 2019 12:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfLULAW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 21 Dec 2019 06:00:22 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50894 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfLULAV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 21 Dec 2019 06:00:21 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBLB0GN1042071;
        Sat, 21 Dec 2019 05:00:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576926016;
        bh=eG5gP0lC5PCuIkT0Da8qVDYrW7IKruTygnBgohWAqSw=;
        h=From:To:CC:Subject:Date;
        b=JaadfoHS2Hq28tUpb6QY1lVPj3xoUpnZ4+jrz2zWCVk2BDVMwYZtZ2wUDduol4JLK
         bGbHso00/AnyM6BiIU9bf2PTBrqL+ykji9qXnJoKWszEg9UUoV6OEK0Y+0jx5akbCr
         p57CYvrObAHqA8eZfzZC7lXQ/YvtzooIcYHCN6c0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBLB0GOc056712
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 21 Dec 2019 05:00:16 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 21
 Dec 2019 05:00:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 21 Dec 2019 05:00:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBLB0Dbq077975;
        Sat, 21 Dec 2019 05:00:13 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2] clk: ti: dra7: fix parent for gmac_clkctrl
Date:   Sat, 21 Dec 2019 13:00:04 +0200
Message-ID: <20191221110004.9951-1-grygorii.strashko@ti.com>
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

Fixes: dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
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

