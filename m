Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7421298B6B
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773137AbgJZLLK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:11:10 -0400
Received: from muru.com ([72.249.23.125]:46530 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773135AbgJZLLI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:11:08 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 39A0481A0;
        Mon, 26 Oct 2020 11:11:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 3/9] clk: ti: am33xx: Keep am3 l3 main clock always on for genpd
Date:   Mon, 26 Oct 2020 13:10:43 +0200
Message-Id: <20201026111049.54835-4-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026111049.54835-1-tony@atomide.com>
References: <20201026111049.54835-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order for suspend and resume to work with genpd on am3, we must keep
l3 main clock always on. Otherwise prm_omap driver will shut down the l3
main clock on suspend when simple-pm-bus and GENPD_FLAG_PM_CLK are used.
Note that we already keep the l3 main clock always on with the legacy
platform code.

Later on we may want to start managing the l3 main clock with a dedicated
interconnect driver instead of using simple-pm-bus and GENPD_FLAG_PM_CLK.

Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk-33xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -266,6 +266,8 @@ static const char *enable_init_clks[] = {
 	"dpll_ddr_m2_ck",
 	"dpll_mpu_m2_ck",
 	"l3_gclk",
+	/* AM3_L3_L3_MAIN_CLKCTRL, needed during suspend */
+	"l3-clkctrl:00bc:0",
 	"l4hs_gclk",
 	"l4fw_gclk",
 	"l4ls_gclk",
-- 
2.29.1
