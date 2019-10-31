Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16D58EB1AD
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2019 14:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfJaNyx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Oct 2019 09:54:53 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42782 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbfJaNyx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Oct 2019 09:54:53 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VDsm2Z004792;
        Thu, 31 Oct 2019 08:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572530088;
        bh=vutO3ghbGJL6NW0V+zeZSMSygort4qZIJkBHjC/7tEw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hG7EZ7s2j3awcq61HqUqQu9/YFzyDKpy1Pwi9Bs6UAUXBUBU3Qz/pQBxrvRfwNjsp
         TH/b8whVyVFZnxLu9p1Tp0ORE5nAMAW7KrOF9tHgl2Osxac7KHuqsQfqRXHyyQ6UeG
         9AbP4OIGFZlor6SzILCjp6LOOrcbBp8YMcSp5Ev4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9VDsmu0012924
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Oct 2019 08:54:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 31
 Oct 2019 08:54:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 31 Oct 2019 08:54:34 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VDsk2e060968;
        Thu, 31 Oct 2019 08:54:46 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCHv4 03/12] clk: ti: clkctrl: add new exported API for checking standby info
Date:   Thu, 31 Oct 2019 15:54:45 +0200
Message-ID: <20191031135445.23490-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028144100.16AB321783@mail.kernel.org>
References: <20191028144100.16AB321783@mail.kernel.org>
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
v4: changed the return type to bool from u32.

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
+bool ti_clk_is_in_standby(struct clk *clk)
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
+bool ti_clk_is_in_standby(struct clk *clk);
 int omap3_noncore_dpll_save_context(struct clk_hw *hw);
 void omap3_noncore_dpll_restore_context(struct clk_hw *hw);
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
