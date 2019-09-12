Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E79AB0FCC
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 15:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732099AbfILN02 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 09:26:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59656 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732093AbfILN02 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 09:26:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQOf6011927;
        Thu, 12 Sep 2019 08:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294784;
        bh=+qrcnaR3a/pZ4OviE1ZKc8IWLJlt6Yebqe6i5IEbb64=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=A8JSNdgohFwtatBw+XFGPRUpp2hpxdX9Lq/w1OAb8zjFsNSw2NFg5fa9oTYnUyffx
         1tc2kKk3P/zmQ8sg8AxTe2ZrKhzzWUymfUjvgYFUgLaDzllGjP1AdFR4RB0vu6ettW
         qzTflc3wR7sZDCpRiz2RJnIfKvtI/8xWJDLlnyZw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CDQOKw015237
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 08:26:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:23 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvS130575;
        Thu, 12 Sep 2019 08:26:21 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 03/10] clk: ti: clkctrl: add new exported API for checking standby info
Date:   Thu, 12 Sep 2019 16:26:06 +0300
Message-ID: <20190912132613.28093-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912132613.28093-1-t-kristo@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Standby status is provided for certain clkctrl clocks to see if the
given module has entered standby or not. This is mostly needed by
remoteproc code to see if the remoteproc has entered standby and the clock
can be turned off safely.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/clk/ti.h   |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index d904a9a7626a..e3e0a66a6ce2 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -34,6 +34,9 @@
 #define OMAP4_IDLEST_MASK		(0x3 << 16)
 #define OMAP4_IDLEST_SHIFT		16
 
+#define OMAP4_STBYST_MASK		BIT(18)
+#define OMAP4_STBYST_SHIFT		18
+
 #define CLKCTRL_IDLEST_FUNCTIONAL	0x0
 #define CLKCTRL_IDLEST_INTERFACE_IDLE	0x2
 #define CLKCTRL_IDLEST_DISABLED		0x3
@@ -647,3 +650,33 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 }
 CLK_OF_DECLARE(ti_omap4_clkctrl_clock, "ti,clkctrl",
 	       _ti_omap4_clkctrl_setup);
+
+/**
+ * ti_clk_is_in_standby - Check if clkctrl clock is in standby or not
+ * @clk: clock to check standby status for
+ *
+ * Finds whether the provided clock is in standby mode or not. Returns
+ * true if the provided clock is a clkctrl type clock and it is in standby,
+ * false otherwise.
+ */
+u32 ti_clk_is_in_standby(struct clk *clk)
+{
+	struct clk_hw *hw;
+	struct clk_hw_omap *hwclk;
+	u32 val;
+
+	hw = __clk_get_hw(clk);
+
+	if (!omap2_clk_is_hw_omap(hw))
+		return false;
+
+	hwclk = to_clk_hw_omap(hw);
+
+	val = ti_clk_ll_ops->clk_readl(&hwclk->enable_reg);
+
+	if (val & OMAP4_STBYST_MASK)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index bb2c5af9082a..3fb777f7103a 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -298,6 +298,7 @@ struct ti_clk_features {
 
 void ti_clk_setup_features(struct ti_clk_features *features);
 const struct ti_clk_features *ti_clk_get_features(void);
+u32 ti_clk_is_in_standby(struct clk *clk);
 int omap3_noncore_dpll_save_context(struct clk_hw *hw);
 void omap3_noncore_dpll_restore_context(struct clk_hw *hw);
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
