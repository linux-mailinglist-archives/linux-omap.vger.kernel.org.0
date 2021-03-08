Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37765330D5B
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 13:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbhCHMV4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 07:21:56 -0500
Received: from muru.com ([72.249.23.125]:40804 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231749AbhCHMVg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 07:21:36 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E171B8199;
        Mon,  8 Mar 2021 12:22:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: [PATCH 3/4] clk: ti: omap5: Add missing gpmc and ocmc clkctrl
Date:   Mon,  8 Mar 2021 14:21:17 +0200
Message-Id: <20210308122118.62460-4-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122118.62460-1-tony@atomide.com>
References: <20210308122118.62460-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The gpmc clock is needed to update omap5 to boot with genpd with the
related devicetree patches. The ocmc clock is currently not used but
let's add it so we have all the clocks for the l3main2 defined.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk-54xx.c         | 2 ++
 include/dt-bindings/clock/omap5.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -156,6 +156,8 @@ static const struct omap_clkctrl_reg_data omap5_l3main1_clkctrl_regs[] __initcon
 
 static const struct omap_clkctrl_reg_data omap5_l3main2_clkctrl_regs[] __initconst = {
 	{ OMAP5_L3_MAIN_2_CLKCTRL, NULL, 0, "l3_iclk_div" },
+	{ OMAP5_L3_MAIN_2_GPMC_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
+	{ OMAP5_L3_MAIN_2_OCMC_RAM_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ 0 },
 };
 
diff --git a/include/dt-bindings/clock/omap5.h b/include/dt-bindings/clock/omap5.h
--- a/include/dt-bindings/clock/omap5.h
+++ b/include/dt-bindings/clock/omap5.h
@@ -32,6 +32,8 @@
 
 /* l3main2 clocks */
 #define OMAP5_L3_MAIN_2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
+#define OMAP5_L3_MAIN_2_GPMC_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
+#define OMAP5_L3_MAIN_2_OCMC_RAM_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
 
 /* ipu clocks */
 #define OMAP5_MMU_IPU_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
-- 
2.30.1
