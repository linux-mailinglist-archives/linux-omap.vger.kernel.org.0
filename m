Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3F39FB05
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 08:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfH1G7t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 02:59:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49218 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfH1G7t (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 02:59:49 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xh44106188;
        Wed, 28 Aug 2019 01:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566975583;
        bh=qDyLnl7yPSergL60Z2V5myEyuBh2Q6HeNjKi9knaQGM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=l2SiluSjGWCeE14lKpeZkuEZ00I7d2jP6a7wuAzALzf+nrn9F+/7u0ibcI7fq+R+d
         dX2kNHYwD60fUP7kXtm94Ow4+4/rI150z33+41gt11LSoxSwk5NtN+k55RAR/LA1wD
         u3a9n9QFQk6SDWQH1DpMfey6ZOKgTG6X1Ce+VY7E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S6xh5G057525
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 01:59:43 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 01:59:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 01:59:42 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xXVE074399;
        Wed, 28 Aug 2019 01:59:41 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv2 4/6] clk: ti: clkctrl: add API to notify reset status
Date:   Wed, 28 Aug 2019 09:59:27 +0300
Message-ID: <20190828065929.32150-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828065929.32150-1-t-kristo@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When an IP has both a clkctrl clock being fed into it and has hardware
reset lines, the control for these must be synced against each other.
While disabling a clock, all the hardware reset lines must be asserted
at the same time, and while enabling, resets must be deasserted.
Otherwise, the IP module fails to transition from to idle/active. To
handle this situation properly, a callback is added for clkctrl clocks
which is used by the PRM reset driver to tell the status of the reset
lines. This info is then used to sync state.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c | 44 ++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/ti.h   |  1 +
 2 files changed, 45 insertions(+)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index e3e0a66a6ce2..47a0d1398c6f 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -25,6 +25,8 @@
 #include "clock.h"
 
 #define NO_IDLEST			0
+#define HAS_RESET			1
+#define RESET_ASSERTED			2
 
 #define OMAP4_MODULEMODE_MASK		0x3
 
@@ -164,6 +166,9 @@ static int _omap4_clkctrl_clk_enable(struct clk_hw *hw)
 	if (test_bit(NO_IDLEST, &clk->flags))
 		return 0;
 
+	if (test_bit(RESET_ASSERTED, &clk->flags))
+		return 0;
+
 	/* Wait until module is enabled */
 	while (!_omap4_is_ready(ti_clk_ll_ops->clk_readl(&clk->enable_reg))) {
 		if (_omap4_is_timeout(&timeout, OMAP4_MAX_MODULE_READY_TIME)) {
@@ -193,6 +198,10 @@ static void _omap4_clkctrl_clk_disable(struct clk_hw *hw)
 	if (test_bit(NO_IDLEST, &clk->flags))
 		goto exit;
 
+	if (test_bit(HAS_RESET, &clk->flags) &&
+	    !test_bit(RESET_ASSERTED, &clk->flags))
+		goto exit;
+
 	/* Wait until module is disabled */
 	while (!_omap4_is_idle(ti_clk_ll_ops->clk_readl(&clk->enable_reg))) {
 		if (_omap4_is_timeout(&timeout,
@@ -680,3 +689,38 @@ u32 ti_clk_is_in_standby(struct clk *clk)
 	return false;
 }
 EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
+
+/**
+ * ti_clk_notify_resets - Notify the clock driver associated reset status
+ * @clk: clock to notify reset status for
+ * @asserted: true if all HW reset lines are asserted
+ *
+ * Some clkctrl clocks have associated resets for them which effectively
+ * prevent the clock to transition from/to idle if the reset state is not
+ * in sync. For the clock to transition to idle properly, all associated
+ * resets must be asserted, and to leave idle, vice versa. To provide the
+ * current reset status, the reset driver should issue this callback.
+ */
+void ti_clk_notify_resets(struct clk *clk, bool asserted)
+{
+	struct clk_hw *hw;
+	struct clk_hw_omap *hwclk;
+
+	if (!clk)
+		return;
+
+	hw = __clk_get_hw(clk);
+
+	if (!omap2_clk_is_hw_omap(hw))
+		return;
+
+	hwclk = to_clk_hw_omap(hw);
+
+	set_bit(HAS_RESET, &hwclk->flags);
+
+	if (asserted)
+		set_bit(RESET_ASSERTED, &hwclk->flags);
+	else
+		clear_bit(RESET_ASSERTED, &hwclk->flags);
+}
+EXPORT_SYMBOL_GPL(ti_clk_notify_resets);
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 3fb777f7103a..ae34e3f5cf7a 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -299,6 +299,7 @@ struct ti_clk_features {
 void ti_clk_setup_features(struct ti_clk_features *features);
 const struct ti_clk_features *ti_clk_get_features(void);
 u32 ti_clk_is_in_standby(struct clk *clk);
+void ti_clk_notify_resets(struct clk *clk, bool asserted);
 int omap3_noncore_dpll_save_context(struct clk_hw *hw);
 void omap3_noncore_dpll_restore_context(struct clk_hw *hw);
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
