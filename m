Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAB4986CA2
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbfHHVo0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:44:26 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:43669 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390296AbfHHVo0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:44:26 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MkYHO-1iazFW2Apy-00m3mb; Thu, 08 Aug 2019 23:43:52 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Paul Walmsley <paul@pwsan.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 20/22] ARM: omap1: clk: use clk_init_data
Date:   Thu,  8 Aug 2019 23:43:38 +0200
Message-Id: <20190808214347.2865294-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7CygOTNWAv1Av7TOKR/RAGZa48JmJsWvplaC3q5QjRSaot6Tf3G
 xSdZFqrddrDFAUElqBsK+HbI9Zq3JadcMPECZH3AUDApmDnaQ5ROETqev+ECyLyb7Ssjsqv
 ch2dT6C9CKYmOAZWc24iiTzrXHOC04g54TAGVHztuQ1c2wZhIo5PHxS8cRazgy4zMtDM9Uy
 ffAeBDyJSJhR0yyZTaJ7g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hFAG7pdixrc=:J0ayFI++OrSdTM60JwL4ky
 Ducp45r6hG17ig/7aS5TRt2AeEPp858c405l9BwICopZ/ZKRxEfFd+KRUYLCh8aYDbtVFdj2/
 NYkAKvlKG/Bopj1v2PFj+HmUT3Wx6tUmFTlU6cX4vUbk02qPkIjvWqCEFwTr/UjLvO0cHCEiJ
 AWxH2NNPk5HuNRkv0ZlvWQ/9LOkNFSptgN3WZqgkXA2tDPje6BurI7sK2FD5RyFL+S0lQs3Ea
 T8aVHrdU7C6rtJ+gctWqX+Tuy7edQN2K6KqoSEZ9ZIOT2ja2EwjNA8fgwRCN+qttYtCyoSujR
 I/AeQa7s7DfQvtqxIIIz4aEynOdjkiheGSjGDrIAYUea9/MfFV3JwNye0lp5RMm3L85Ciwh98
 EC091m7EGIK9mMT2FnFzmwJvpwcFaSBc9Ohjnn8oNoTUfjcIwBsR0nDE2M+LQ1S75SG70wJL4
 A0rfe7k7MWCsVFYFskYDlYye19oQ3yi1VxmjGp7hZmoSh9LHmWLqYe2rcRDcDavCGu/VHzmLq
 DgLhoYWOgBLzQkxn7vnwHTBQnlyfFVYYzaKd3d45RejZK5G4/8DVt1kg4ByODWlD6PCd3CHEy
 +2zmiqPo6mFEyAp3/m3MyjrT94f2bEe0C+pnf3Vt6jlv35g7MpX2RW7DahxtiSDO9SHmVkO26
 CWXsDgsyW1ZAKYY78mJ5HS7NeM5Ahihwm+hTjSNFKvcBLu+6JCX7HE0QThx1nLH5sF16F7B2r
 Qeuu508cxl8bf5CEjeHzFxJwLPq1YpsIxXz+Gg==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The common_clk layer requires common data to be passed
as clk_init_data, so mimic this here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock.c | 266 ++++++++++++++----------------------
 1 file changed, 99 insertions(+), 167 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 8b4d5ee13ba0..a951c787adb4 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -128,15 +128,22 @@ struct clk {
 	struct clk_hw		*clk_hw;
 };
 
+struct clk_init_data {
+	const char		*name;
+	const struct clk_ops	*ops;
+	const struct clk_hw	**parent_hws;
+	u8			num_parents;
+	unsigned long		flags;
+};
+
 struct clk_hw {
 	struct clk		clk;
+	const struct clk_init_data *init;
 };
 
 struct omap1_clk {
 	struct clk_hw		clk_hw;
 	struct list_head	node;
-	const struct clk_ops	*ops;
-	const char		*name;
 	struct omap1_clk	*parent;
 	struct list_head	children;
 	struct list_head	sibling;	/* node for children */
@@ -686,7 +693,7 @@ static void omap1_clk_disable(struct clk_hw *clk_hw)
 	struct clk_hw *parent = clk_hw_get_parent(clk_hw);
 
 	if (clk->usecount > 0 && !(--clk->usecount)) {
-		clk->ops->disable(clk_hw);
+		clk->clk_hw.init->ops->disable(&clk->clk_hw);
 		if (likely(parent)) {
 			omap1_clk_disable(parent);
 			if (clk->flags & CLOCK_NO_IDLE_PARENT)
@@ -711,7 +718,7 @@ static omap1_clk_enable(struct clk_hw *clk_hw)
 				omap1_clk_deny_idle(parent);
 		}
 
-		ret = clk->ops->enable(&clk->clk_hw);
+		ret = clk->clk_hw.init->ops->enable(&clk->clk_hw);
 		if (ret) {
 			if (parent)
 				omap1_clk_disable(parent);
@@ -733,7 +740,7 @@ static int omap1_clk_enable_generic(struct clk_hw *clk_hw)
 
 	if (unlikely(clk->enable_reg == NULL)) {
 		printk(KERN_ERR "clock.c: Enable for %s without enable code\n",
-		       clk->name);
+		       clk->clk_hw.init->name);
 		return -EINVAL;
 	}
 
@@ -865,8 +872,8 @@ static long omap1_clk_round_rate(struct clk_hw *clk_hw, unsigned long rate)
 		parent_rate = parent_clk->rate;
 	}
 
-	if (clk->ops->round_rate != NULL)
-		return clk->ops->round_rate(clk_hw, rate, &parent_rate);
+	if (clk_hw->init->ops->round_rate != NULL)
+		return clk_hw->init->ops->round_rate(clk_hw, rate, &parent_rate);
 
 	if (parent)
 		parent_clk->rate = parent_rate;
@@ -876,7 +883,6 @@ static long omap1_clk_round_rate(struct clk_hw *clk_hw, unsigned long rate)
 
 static int omap1_clk_set_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
-	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	struct clk_hw *parent = clk_hw_get_parent(clk_hw);
 	unsigned long parent_rate = 0;
 	int  ret = -EINVAL;
@@ -884,8 +890,9 @@ static int omap1_clk_set_rate(struct clk_hw *clk_hw, unsigned long rate)
 	if (parent)
 		parent_rate = to_omap1_clk(parent)->rate;
 
-	if (clk->ops->set_rate)
-		ret = clk->ops->set_rate(clk_hw, rate, parent_rate);
+	if (clk_hw->init->ops->set_rate)
+		ret = clk_hw->init->ops->set_rate(clk_hw, rate, parent_rate);
+
 	return ret;
 }
 
@@ -895,8 +902,8 @@ static void propagate_rate(struct omap1_clk *tclk)
 	struct omap1_clk *clkp;
 
 	list_for_each_entry(clkp, &tclk->children, sibling) {
-		if (clkp->ops->recalc_rate)
-			clkp->rate = clkp->ops->recalc_rate(&clkp->clk_hw, tclk->rate);
+		if (clkp->clk_hw.init->ops->recalc_rate)
+			clkp->rate = clkp->clk_hw.init->ops->recalc_rate(&clkp->clk_hw, tclk->rate);
 		propagate_rate(clkp);
 	}
 }
@@ -932,7 +939,7 @@ void clk_disable(struct clk *clk)
 	spin_lock_irqsave(&clockfw_lock, flags);
 	if (_clk->usecount == 0) {
 		pr_err("Trying disable clock %s with 0 usecount\n",
-		       _clk->name);
+		       _clk->clk_hw.init->name);
 		WARN_ON(1);
 		goto out;
 	}
@@ -1068,12 +1075,14 @@ static int clk_register(struct device *dev, struct clk_hw *clk_hw)
 	clk_hw->clk.clk_hw = clk_hw;
 
 	mutex_lock(&clocks_mutex);
-	if (clk->parent)
+	if (clk_hw->init->num_parents) {
+		clk->parent = to_omap1_clk(clk_hw->init->parent_hws[0]);
 		list_add(&clk->sibling, &clk->parent->children);
+	}
 
 	list_add(&clk->node, &clocks);
-	if (clk->ops->init)
-		clk->ops->init(&clk->clk_hw);
+	if (clk_hw->init->ops->init)
+		clk_hw->init->ops->init(clk_hw);
 	mutex_unlock(&clocks_mutex);
 
 	return 0;
@@ -1102,14 +1111,28 @@ static const struct clk_ops clkops_followparent = {
 	.recalc_rate	= followparent_recalc,
 };
 
+#define CLK_INIT(_name, _ops, _parent)			\
+	.clk_hw.init = &(struct clk_init_data) {	\
+		.name = (_name),			\
+		.ops = (_ops), 				\
+		.parent_hws = (const struct clk_hw *[1])\
+				{&(_parent)->clk_hw},	\
+		.num_parents = 1,			\
+	}
+
+#define CLK_INIT_ROOT(_name, _ops)			\
+	.clk_hw.init = &(struct clk_init_data) {	\
+		.name = (_name),			\
+		.ops = (_ops), 				\
+	}
+
 /*
  * Dummy clock
  *
  * Used for clock aliases that are needed on some OMAPs, but not others
  */
 static struct omap1_clk dummy_ck = {
-	.name	= "dummy",
-	.ops	= &clkops_null,
+	CLK_INIT_ROOT("dummy", &clkops_null),
 };
 
 /*
@@ -1128,7 +1151,7 @@ static void omap1_clk_disable_unused(struct omap1_clk *clk)
 	 * has not enabled any DSP clocks */
 	if (clk->enable_reg == DSP_IDLECT2) {
 		pr_info("Skipping reset check for DSP domain clock \"%s\"\n",
-			clk->name);
+			clk->clk_hw.init->name);
 		return;
 	}
 
@@ -1141,8 +1164,8 @@ static void omap1_clk_disable_unused(struct omap1_clk *clk)
 	if ((regval32 & (1 << clk->enable_bit)) == 0)
 		return;
 
-	printk(KERN_INFO "Disabling unused clock \"%s\"... ", clk->name);
-	clk->ops->disable(&clk->clk_hw);
+	printk(KERN_INFO "Disabling unused clock \"%s\"... ", clk->clk_hw.init->name);
+	clk->clk_hw.init->ops->disable(&clk->clk_hw);
 	printk(" done\n");
 }
 
@@ -1155,7 +1178,7 @@ static int __init clk_disable_unused(void)
 
 	spin_lock_irqsave(&clockfw_lock, flags);
 	list_for_each_entry(ck, &clocks, node) {
-		if (ck->ops == &clkops_null)
+		if (ck->clk_hw.init->ops == &clkops_null)
 			continue;
 
 		if (ck->usecount > 0 || !ck->enable_reg)
@@ -1248,17 +1271,13 @@ late_initcall(clk_debugfs_init);
 /*
  * Omap1 clocks
  */
-
 static struct omap1_clk ck_ref = {
-	.name		= "ck_ref",
-	.ops		= &clkops_null,
+	CLK_INIT_ROOT("ck_ref", &clkops_null),
 	.rate		= 12000000,
 };
 
 static struct omap1_clk ck_dpll1 = {
-	.name		= "ck_dpll1",
-	.ops		= &clkops_null,
-	.parent		= &ck_ref,
+	CLK_INIT("ck_dpll1", &clkops_null, &ck_ref),
 };
 
 static const struct clk_ops clkops_generic_followparent = {
@@ -1273,9 +1292,7 @@ static const struct clk_ops clkops_generic_followparent = {
  */
 static struct arm_idlect1_clk ck_dpll1out = {
 	.clk = {
-		.name		= "ck_dpll1out",
-		.ops		= &clkops_generic_followparent,
-		.parent		= &ck_dpll1,
+		CLK_INIT("ck_dpll1out", &clkops_generic_followparent, &ck_dpll1),
 		.flags		= CLOCK_IDLE_CONTROL | ENABLE_REG_32BIT,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_CKOUT_ARM,
@@ -1291,15 +1308,13 @@ static const struct clk_ops clkops_sossi = {
 };
 
 static struct omap1_clk sossi_ck = {
-	.name		= "ck_sossi",
-	.ops		= &clkops_sossi,
-	.parent		= &ck_dpll1out.clk,
+	CLK_INIT("ck_sossi", &clkops_sossi, &ck_dpll1out.clk),
 	.flags		= CLOCK_NO_IDLE_PARENT | ENABLE_REG_32BIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1),
 	.enable_bit	= CONF_MOD_SOSSI_CLK_EN_R,
 };
 
-struct clk_ops clkops_null_ckctl = {
+static const struct clk_ops clkops_null_ckctl = {
 	.enable		= clkll_enable_null,
 	.disable	= clkll_disable_null,
 	.recalc_rate	= omap1_ckctl_recalc,
@@ -1308,13 +1323,11 @@ struct clk_ops clkops_null_ckctl = {
 };
 
 static struct omap1_clk arm_ck = {
-	.name		= "arm_ck",
-	.ops		= &clkops_null_ckctl,
-	.parent		= &ck_dpll1,
+	CLK_INIT("arm_ck", &clkops_null_ckctl, &ck_dpll1),
 	.rate_offset	= CKCTL_ARMDIV_OFFSET,
 };
 
-struct clk_ops clkops_generic_ckctl = {
+static const struct clk_ops clkops_generic_ckctl = {
 	.enable		= omap1_clk_enable_generic,
 	.disable	= omap1_clk_disable_generic,
 	.recalc_rate	= omap1_ckctl_recalc,
@@ -1324,9 +1337,7 @@ struct clk_ops clkops_generic_ckctl = {
 
 static struct arm_idlect1_clk armper_ck = {
 	.clk = {
-		.name		= "armper_ck",
-		.ops		= &clkops_generic_ckctl,
-		.parent		= &ck_dpll1,
+		CLK_INIT("armper_ck", &clkops_generic_ckctl, &ck_dpll1),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_PERCK,
@@ -1340,18 +1351,14 @@ static struct arm_idlect1_clk armper_ck = {
  * activation.  [ GPIO code for 1510 ]
  */
 static struct omap1_clk arm_gpio_ck = {
-	.name		= "ick",
-	.ops		= &clkops_generic_followparent,
-	.parent		= &ck_dpll1,
+	CLK_INIT("ick", &clkops_generic_followparent, &ck_dpll1),
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 	.enable_bit	= EN_GPIOCK,
 };
 
 static struct arm_idlect1_clk armxor_ck = {
 	.clk = {
-		.name		= "armxor_ck",
-		.ops		= &clkops_generic_followparent,
-		.parent		= &ck_ref,
+		CLK_INIT("armxor_ck", &clkops_generic_followparent, &ck_ref),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_XORPCK,
@@ -1361,9 +1368,7 @@ static struct arm_idlect1_clk armxor_ck = {
 
 static struct arm_idlect1_clk armtim_ck = {
 	.clk = {
-		.name		= "armtim_ck",
-		.ops		= &clkops_generic_followparent,
-		.parent		= &ck_ref,
+		CLK_INIT("armtim_ck", &clkops_generic_followparent, &ck_ref),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_TIMCK,
@@ -1379,9 +1384,7 @@ static const struct clk_ops clkops_fixed_divisor = {
 
 static struct arm_idlect1_clk armwdt_ck = {
 	.clk = {
-		.name		= "armwdt_ck",
-		.ops		= &clkops_generic,
-		.parent		= &ck_ref,
+		CLK_INIT("armwdt_ck", &clkops_generic, &ck_ref),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_WDTCK,
@@ -1391,9 +1394,7 @@ static struct arm_idlect1_clk armwdt_ck = {
 };
 
 static struct omap1_clk arminth_ck16xx = {
-	.name		= "arminth_ck",
-	.ops		= &clkops_followparent,
-	.parent		= &arm_ck,
+	CLK_INIT("arminth_ck", &clkops_followparent, &arm_ck),
 	/* Note: On 16xx the frequency can be divided by 2 by programming
 	 * ARM_CKCTL:ARM_INTHCK_SEL(14) to 1
 	 *
@@ -1402,18 +1403,14 @@ static struct omap1_clk arminth_ck16xx = {
 };
 
 static struct omap1_clk dsp_ck = {
-	.name		= "dsp_ck",
-	.ops		= &clkops_generic_ckctl,
-	.parent		= &ck_dpll1,
+	CLK_INIT("dsp_ck", &clkops_generic_ckctl, &ck_dpll1),
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_CKCTL),
 	.enable_bit	= EN_DSPCK,
 	.rate_offset	= CKCTL_DSPDIV_OFFSET,
 };
 
 static struct omap1_clk dspmmu_ck = {
-	.name		= "dspmmu_ck",
-	.ops		= &clkops_null_ckctl,
-	.parent		= &ck_dpll1,
+	CLK_INIT("dspmmu_ck", &clkops_null_ckctl, &ck_dpll1),
 	.rate_offset	= CKCTL_DSPMMUDIV_OFFSET,
 };
 
@@ -1426,9 +1423,7 @@ static const struct clk_ops clkops_dspck = {
 };
 
 static struct omap1_clk dspper_ck = {
-	.name		= "dspper_ck",
-	.ops		= &clkops_dspck,
-	.parent		= &ck_dpll1,
+	CLK_INIT("dspper_ck", &clkops_dspck, &ck_dpll1),
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_PERCK,
 	.rate_offset	= CKCTL_PERDIV_OFFSET,
@@ -1441,26 +1436,20 @@ static const struct clk_ops clkops_dspck_followparent = {
 };
 
 static struct omap1_clk dspxor_ck = {
-	.name		= "dspxor_ck",
-	.ops		= &clkops_dspck_followparent,
-	.parent		= &ck_ref,
+	CLK_INIT("dspxor_ck", &clkops_dspck_followparent, &ck_ref),
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_XORPCK,
 };
 
 static struct omap1_clk dsptim_ck = {
-	.name		= "dsptim_ck",
-	.ops		= &clkops_dspck_followparent,
-	.parent		= &ck_ref,
+	CLK_INIT("dsptim_ck", &clkops_dspck_followparent, &ck_ref),
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_DSPTIMCK,
 };
 
 static struct arm_idlect1_clk tc_ck = {
 	.clk = {
-		.name		= "tc_ck",
-		.ops		= &clkops_null_ckctl,
-		.parent		= &ck_dpll1,
+		CLK_INIT("tc_ck", &clkops_null_ckctl, &ck_dpll1),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.rate_offset	= CKCTL_TCDIV_OFFSET,
 	},
@@ -1468,9 +1457,7 @@ static struct arm_idlect1_clk tc_ck = {
 };
 
 static struct omap1_clk arminth_ck1510 = {
-	.name		= "arminth_ck",
-	.ops		= &clkops_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("arminth_ck", &clkops_followparent, &tc_ck.clk),
 	/* Note: On 1510 the frequency follows TC_CK
 	 *
 	 * 16xx version is in MPU clocks.
@@ -1479,24 +1466,18 @@ static struct omap1_clk arminth_ck1510 = {
 
 static struct omap1_clk tipb_ck = {
 	/* No-idle controlled by "tc_ck" */
-	.name		= "tipb_ck",
-	.ops		= &clkops_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("tipb_ck", &clkops_followparent, &tc_ck.clk),
 };
 
 static struct omap1_clk l3_ocpi_ck = {
 	/* No-idle controlled by "tc_ck" */
-	.name		= "l3_ocpi_ck",
-	.ops		= &clkops_generic_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("l3_ocpi_ck", &clkops_generic_followparent, &tc_ck.clk),
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_OCPI_CK,
 };
 
 static struct omap1_clk tc1_ck = {
-	.name		= "tc1_ck",
-	.ops		= &clkops_generic_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("tc1_ck", &clkops_generic_followparent, &tc_ck.clk),
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_TC1_CK,
 };
@@ -1506,31 +1487,23 @@ static struct omap1_clk tc1_ck = {
  * activation.  [ pm.c (SRAM), CCP, Camera ]
  */
 static struct omap1_clk tc2_ck = {
-	.name		= "tc2_ck",
-	.ops		= &clkops_generic_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("tc2_ck", &clkops_generic_followparent, &tc_ck.clk),
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_TC2_CK,
 };
 
 static struct omap1_clk dma_ck = {
 	/* No-idle controlled by "tc_ck" */
-	.name		= "dma_ck",
-	.ops		= &clkops_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("dma_ck", &clkops_followparent, &tc_ck.clk),
 };
 
 static struct omap1_clk dma_lcdfree_ck = {
-	.name		= "dma_lcdfree_ck",
-	.ops		= &clkops_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("dma_lcdfree_ck", &clkops_followparent, &tc_ck.clk),
 };
 
 static struct arm_idlect1_clk api_ck = {
 	.clk = {
-		.name		= "api_ck",
-		.ops		= &clkops_generic_followparent,
-		.parent		= &tc_ck.clk,
+		CLK_INIT("api_ck", &clkops_generic_followparent, &tc_ck.clk),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_APICK,
@@ -1540,9 +1513,7 @@ static struct arm_idlect1_clk api_ck = {
 
 static struct arm_idlect1_clk lb_ck = {
 	.clk = {
-		.name		= "lb_ck",
-		.ops		= &clkops_generic_followparent,
-		.parent		= &tc_ck.clk,
+		CLK_INIT("lb_ck", &clkops_generic_followparent, &tc_ck.clk),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_LBCK,
@@ -1551,21 +1522,15 @@ static struct arm_idlect1_clk lb_ck = {
 };
 
 static struct omap1_clk rhea1_ck = {
-	.name		= "rhea1_ck",
-	.ops		= &clkops_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("rhea1_ck", &clkops_followparent, &tc_ck.clk),
 };
 
 static struct omap1_clk rhea2_ck = {
-	.name		= "rhea2_ck",
-	.ops		= &clkops_followparent,
-	.parent		= &tc_ck.clk,
+	CLK_INIT("rhea2_ck", &clkops_followparent, &tc_ck.clk),
 };
 
 static struct omap1_clk lcd_ck_16xx = {
-	.name		= "lcd_ck",
-	.ops		= &clkops_generic_ckctl,
-	.parent		= &ck_dpll1,
+	CLK_INIT("lcd_ck", &clkops_generic_ckctl, &ck_dpll1),
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 	.enable_bit	= EN_LCDCK,
 	.rate_offset	= CKCTL_LCDDIV_OFFSET,
@@ -1573,9 +1538,7 @@ static struct omap1_clk lcd_ck_16xx = {
 
 static struct arm_idlect1_clk lcd_ck_1510 = {
 	.clk = {
-		.name		= "lcd_ck",
-		.ops		= &clkops_generic_ckctl,
-		.parent		= &ck_dpll1,
+		CLK_INIT("lcd_ck", &clkops_generic_ckctl, &ck_dpll1),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_LCDCK,
@@ -1598,10 +1561,8 @@ static const struct clk_ops clkops_uart = {
  * XXX does this need SYSC register handling?
  */
 static struct omap1_clk uart1_1510 = {
-	.name		= "uart1_ck",
-	.ops		= &clkops_uart,
 	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
+	CLK_INIT("uart1_ck", &clkops_uart, &armper_ck.clk),
 	.rate		= 12000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -1616,10 +1577,8 @@ static struct omap1_clk uart1_1510 = {
  */
 static struct uart_clk uart1_16xx = {
 	.clk	= {
-		.name		= "uart1_ck",
-		.ops		= &clkops_uart_16xx,
 		/* Direct from ULPD, no real parent */
-		.parent		= &armper_ck.clk,
+		CLK_INIT("uart1_ck", &clkops_uart_16xx, &armper_ck.clk),
 		.rate		= 48000000,
 		.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 		.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -1635,10 +1594,8 @@ static struct uart_clk uart1_16xx = {
  * XXX does this need SYSC register handling?
  */
 static struct omap1_clk uart2_ck = {
-	.name		= "uart2_ck",
-	.ops		= &clkops_uart,
 	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
+	CLK_INIT("uart2_ck", &clkops_uart, &armper_ck.clk),
 	.rate		= 12000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -1652,10 +1609,8 @@ static struct omap1_clk uart2_ck = {
  * XXX does this need SYSC register handling?
  */
 static struct omap1_clk uart3_1510 = {
-	.name		= "uart3_ck",
-	.ops		= &clkops_uart,
 	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
+	CLK_INIT("uart3_ck", &clkops_uart, &armper_ck.clk),
 	.rate		= 12000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -1670,10 +1625,8 @@ static struct omap1_clk uart3_1510 = {
  */
 static struct uart_clk uart3_16xx = {
 	.clk	= {
-		.name		= "uart3_ck",
-		.ops		= &clkops_uart_16xx,
 		/* Direct from ULPD, no real parent */
-		.parent		= &armper_ck.clk,
+		CLK_INIT("uart3_ck", &clkops_uart_16xx, &armper_ck.clk),
 		.rate		= 48000000,
 		.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 		.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -1683,9 +1636,8 @@ static struct uart_clk uart3_16xx = {
 };
 
 static struct omap1_clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
-	.name		= "usb_clko",
-	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	CLK_INIT_ROOT("usb_clko", &clkops_generic),
 	.rate		= 6000000,
 	.flags		= ENABLE_REG_32BIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(ULPD_CLOCK_CTRL),
@@ -1693,9 +1645,8 @@ static struct omap1_clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
 };
 
 static struct omap1_clk usb_hhc_ck1510 = {
-	.name		= "usb_hhc_ck",
-	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	CLK_INIT_ROOT("usb_hhc_ck", &clkops_generic),
 	.rate		= 48000000, /* Actually 2 clocks, 12MHz and 48MHz */
 	.flags		= ENABLE_REG_32BIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -1703,9 +1654,8 @@ static struct omap1_clk usb_hhc_ck1510 = {
 };
 
 static struct omap1_clk usb_hhc_ck16xx = {
-	.name		= "usb_hhc_ck",
-	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	CLK_INIT_ROOT("usb_hhc_ck", &clkops_generic),
 	.rate		= 48000000,
 	/* OTG_SYSCON_2.OTG_PADEN == 0 (not 1510-compatible) */
 	.flags		= ENABLE_REG_32BIT,
@@ -1714,36 +1664,32 @@ static struct omap1_clk usb_hhc_ck16xx = {
 };
 
 static struct omap1_clk usb_dc_ck = {
-	.name		= "usb_dc_ck",
-	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	CLK_INIT_ROOT("usb_dc_ck", &clkops_generic),
 	.rate		= 48000000,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= SOFT_USB_OTG_DPLL_REQ_SHIFT,
 };
 
 static struct omap1_clk uart1_7xx = {
-	.name		= "uart1_ck",
-	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	CLK_INIT_ROOT("uart1_ck", &clkops_generic),
 	.rate		= 12000000,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= 9,
 };
 
 static struct omap1_clk uart2_7xx = {
-	.name		= "uart2_ck",
-	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	CLK_INIT_ROOT("uart2_ck", &clkops_generic),
 	.rate		= 12000000,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= 11,
 };
 
 static struct omap1_clk mclk_1510 = {
-	.name		= "mclk",
-	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	CLK_INIT_ROOT("mclk", &clkops_generic),
 	.rate		= 12000000,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= SOFT_COM_MCKO_REQ_SHIFT,
@@ -1758,33 +1704,28 @@ static const struct clk_ops clkops_ext_clk = {
 };
 
 static struct omap1_clk mclk_16xx = {
-	.name		= "mclk",
-	.ops		= &clkops_ext_clk,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	CLK_INIT_ROOT("mclk", &clkops_ext_clk),
 	.enable_reg	= OMAP1_IO_ADDRESS(COM_CLK_DIV_CTRL_SEL),
 	.enable_bit	= COM_ULPD_PLL_CLK_REQ,
 };
 
 static struct omap1_clk bclk_1510 = {
-	.name		= "bclk",
-	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	CLK_INIT_ROOT("bclk", &clkops_generic),
 	.rate		= 12000000,
 };
 
 static struct omap1_clk bclk_16xx = {
-	.name		= "bclk",
-	.ops		= &clkops_ext_clk,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	CLK_INIT_ROOT("bclk", &clkops_ext_clk),
 	.enable_reg	= OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL),
 	.enable_bit	= SWD_ULPD_PLL_CLK_REQ,
 };
 
 static struct omap1_clk mmc1_ck = {
-	.name		= "mmc1_ck",
-	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
+	CLK_INIT("mmc1_ck", &clkops_generic, &armper_ck.clk),
 	.rate		= 48000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -1796,10 +1737,8 @@ static struct omap1_clk mmc1_ck = {
  * CONF_MOD_MCBSP3_AUXON ??
  */
 static struct omap1_clk mmc2_ck = {
-	.name		= "mmc2_ck",
-	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
+	CLK_INIT("mmc2_ck", &clkops_generic, &armper_ck.clk),
 	.rate		= 48000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -1807,10 +1746,8 @@ static struct omap1_clk mmc2_ck = {
 };
 
 static struct omap1_clk mmc3_ck = {
-	.name		= "mmc3_ck",
-	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
+	CLK_INIT("mmc3_ck", &clkops_generic, &armper_ck.clk),
 	.rate		= 48000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
@@ -1826,25 +1763,20 @@ static const struct clk_ops clkops_mpu = {
 };
 
 static struct omap1_clk virtual_ck_mpu = {
-	.name		= "mpu",
-	.ops		= &clkops_mpu,
-	.parent		= &arm_ck, /* Is smarter alias for */
+	/* Is smarter alias for */
+	CLK_INIT("mpu", &clkops_mpu, &arm_ck),
 };
 
 /* virtual functional clock domain for I2C. Just for making sure that ARMXOR_CK
 remains active during MPU idle whenever this is enabled */
 static struct omap1_clk i2c_fck = {
-	.name		= "i2c_fck",
-	.ops		= &clkops_followparent,
+	CLK_INIT("i2c_fck", &clkops_followparent, &armxor_ck.clk),
 	.flags		= CLOCK_NO_IDLE_PARENT,
-	.parent		= &armxor_ck.clk,
 };
 
 static struct omap1_clk i2c_ick = {
-	.name		= "i2c_ick",
-	.ops		= &clkops_followparent,
+	CLK_INIT("i2c_ick", &clkops_followparent, &armper_ck.clk),
 	.flags		= CLOCK_NO_IDLE_PARENT,
-	.parent		= &armper_ck.clk,
 };
 
 /*
-- 
2.20.0

