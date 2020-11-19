Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB20A2B9317
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgKSNHc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:07:32 -0500
Received: from muru.com ([72.249.23.125]:48798 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbgKSNHb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:07:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C1A9880F5;
        Thu, 19 Nov 2020 13:07:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: [PATCH 1/7] clk: ti: omap4: Drop idlest polling from IVA clkctrl clocks
Date:   Thu, 19 Nov 2020 15:07:14 +0200
Message-Id: <20201119130720.63140-2-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119130720.63140-1-tony@atomide.com>
References: <20201119130720.63140-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Similar to what we've done for IPU and DSP let's ignore the status bit
for the IVA clkctrl register.

The clkctrl status won't change unless the related rstctrl is deasserted,
and the rstctrl status won't change unless the clkctrl is enabled.

Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Suman Anna <s-anna@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk-44xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-44xx.c b/drivers/clk/ti/clk-44xx.c
--- a/drivers/clk/ti/clk-44xx.c
+++ b/drivers/clk/ti/clk-44xx.c
@@ -255,7 +255,7 @@ static const struct omap_clkctrl_reg_data omap4_l3_instr_clkctrl_regs[] __initco
 };
 
 static const struct omap_clkctrl_reg_data omap4_ivahd_clkctrl_regs[] __initconst = {
-	{ OMAP4_IVA_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_m5x2_ck" },
+	{ OMAP4_IVA_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLEST, "dpll_iva_m5x2_ck" },
 	{ OMAP4_SL2IF_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_m5x2_ck" },
 	{ 0 },
 };
-- 
2.29.2
