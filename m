Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADAA86C9D
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732708AbfHHVnv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:43:51 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:38005 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390518AbfHHVnu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:43:50 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1McYP5-1iRsYj0bOf-00cz43; Thu, 08 Aug 2019 23:43:32 +0200
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
Subject: [PATCH 19/22] ARM: omap1: clk: use common_clk-like callbacks
Date:   Thu,  8 Aug 2019 23:41:29 +0200
Message-Id: <20190808214232.2798396-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808214232.2798396-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808214232.2798396-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b8HK2EMT9di2Sk43vdvnOawkYOp4+8v9GbqhcSS03u02KK+6+yD
 ZvARKg+Caebq0d2G3lGLXvAyIscd6p1c4vlg7nexbhuZLpBciDZtN+uGa1rV1S2m4X5dn81
 EooW7qRUoeert+lMdPaXv0iX+VCEXNy2jb57+FLXRCZlc1ft7BVejVsgWJygB4fJ8Fxr/XX
 mqj8o7MLHgTqW2zLGU58g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TRx5sjOPgLU=:3g39GEv2uh8hz/FAhj98fW
 s8T+TyzvT/C/FT3V3avoZojNMbcmbNLx+ywat+023VcLQYh0bQWKpPDcEcM0MxDPrhrgXBZsU
 XKct7HdunUKjgpxpc3uOT6nLRaAqxRR51xtlFEwtsNmBs9XVfXgQ9CwxvorTKRBQFvEjPeM2F
 OWaisCF60n/2KP8IgySO4rIiruAnihTu33qWeSS8TmRx1ix0i+eHZ551cf+yFZga4JF0Ugmyu
 GozsaDeIqZQyErbPV7TiaGErKv7/GX2WzOPORI/mAW00R62TjwdvQinQL8MersYKI//hl9GkJ
 ochxhRnPXtp/mRD756oAlztAH4PnEblW0qmc8HLkh8Px657Hh8cFWX9p6jw/v6P/ZwWkFNT/M
 OOCVsH+XHnyQRD2iR57JinMGvS2qZn0Q5rSvHLdgBpz7kEQ03oUmMnTfhzzagNVSCD++a1hhZ
 WW3yfXYPhhl/rK0zQwtU3RXrEQgyTjLCahi6ef03NxijQTLjtVXyKQVDtZFjbCt6y49ORJT0Z
 sVEVLZvfnHBGGJB3ZzpQTN+efYPQXI/zwTedq7u5DcBei1KzE26CD5AuNQ+6rRZQrxpH43YmA
 2kMrmKKPo0dfiG0mdVelvigg9FYzsZhQuL8lj4RQiqvEahUQix/agZQbkZXMJQClBq+ZawyRa
 azkdvMrtKnBZkzl/XHbdvWnHzuDakvepLQyOgkRFc8VDlO/3SHezxqjb1ohQUL2UcLjYmC31V
 tXNVeDvLeXdaUIXXpqk034184IQVJ1UYpcJklQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The callbacks for clocks are almost the same as those used
on common_clk, now reduce the number of remaining differences:

- make .recalc_rate and .round_rate take a parent_rate argument
- move .recalc_rate/.set_rate/.round_rate/.init from
  'struct clk_hw' into 'struct clk_ops'.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock.c | 368 ++++++++++++++++++++----------------
 1 file changed, 200 insertions(+), 168 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 577686f61b3b..8b4d5ee13ba0 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -56,6 +56,10 @@ struct omap1_clk_lookup {
  * struct clk_ops - some clock function pointers
  * @enable: fn ptr that enables the current clock in hardware
  * @disable: fn ptr that enables the current clock in hardware
+ * @recalc_rate: fn ptr that returns the clock's current rate
+ * @set_rate: fn ptr that can change the clock's current rate
+ * @round_rate: fn ptr that can round the clock's current rate
+ * @init: fn ptr to do clock-specific initialization
  *
  * A "companion" clk is an accompanying clock to the one being queried
  * that must be enabled for the IP module connected to the clock to
@@ -66,8 +70,12 @@ struct omap1_clk_lookup {
  * @find_companion must, unfortunately, remain.
  */
 struct clk_ops {
-	int			(*enable)(struct clk_hw *);
-	void			(*disable)(struct clk_hw *);
+	int		(*enable)(struct clk_hw *);
+	void		(*disable)(struct clk_hw *);
+	unsigned long	(*recalc_rate)(struct clk_hw *, unsigned long);
+	int		(*set_rate)(struct clk_hw *, unsigned long, unsigned long);
+	long		(*round_rate)(struct clk_hw *, unsigned long, unsigned long *);
+	void		(*init)(struct clk_hw *);
 };
 
 /*
@@ -90,10 +98,6 @@ struct clk_ops {
  * @sibling: list_head connecting this clk to its parent clk's @children
  * @rate: current clock rate
  * @enable_reg: register to write to enable the clock (see @enable_bit)
- * @recalc: fn ptr that returns the clock's current rate
- * @set_rate: fn ptr that can change the clock's current rate
- * @round_rate: fn ptr that can round the clock's current rate
- * @init: fn ptr to do clock-specific initialization
  * @enable_bit: bitshift to write to enable/disable the clock (see @enable_reg)
  * @usecount: number of users that have requested this clock to be enabled
  * @fixed_div: when > 0, this clock's rate is its parent's rate / @fixed_div
@@ -138,10 +142,6 @@ struct omap1_clk {
 	struct list_head	sibling;	/* node for children */
 	unsigned long		rate;
 	void __iomem		*enable_reg;
-	unsigned long		(*recalc)(struct clk_hw *);
-	int			(*set_rate)(struct clk_hw *, unsigned long);
-	long			(*round_rate)(struct clk_hw *, unsigned long);
-	void			(*init)(struct clk_hw *);
 	u8			enable_bit;
 	s8			usecount;
 	u8			fixed_div;
@@ -268,22 +268,21 @@ static DEFINE_SPINLOCK(clockfw_lock);
  * Omap1 specific clock functions
  */
 
-static unsigned long omap1_uart_recalc(struct clk_hw *clk_hw)
+static unsigned long omap1_uart_recalc(struct clk_hw *clk_hw, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	unsigned int val = __raw_readl(clk->enable_reg);
 	return val & clk->enable_bit ? 48000000 : 12000000;
 }
 
-static unsigned long omap1_sossi_recalc(struct clk_hw *clk_hw)
+static unsigned long omap1_sossi_recalc(struct clk_hw *clk_hw, unsigned long parent_rate)
 {
-	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	u32 div = omap_readl(MOD_CONF_CTRL_1);
 
 	div = (div >> 17) & 0x7;
 	div++;
 
-	return clk->parent->rate / div;
+	return parent_rate / div;
 }
 
 static void omap1_clk_allow_idle(struct clk_hw *clk_hw)
@@ -363,7 +362,7 @@ static __u16 verify_ckctl_value(__u16 newval)
 	return newval;
 }
 
-static int calc_dsor_exp(struct omap1_clk *clk, unsigned long rate)
+static int calc_dsor_exp(struct omap1_clk *clk, unsigned long rate, unsigned long parent_rate)
 {
 	/* Note: If target frequency is too low, this function will return 4,
 	 * which is invalid value. Caller must check for this value and act
@@ -377,14 +376,9 @@ static int calc_dsor_exp(struct omap1_clk *clk, unsigned long rate)
 	 * DSPMMU_CK >= TC_CK
 	 */
 	unsigned long realrate;
-	struct omap1_clk * parent;
 	unsigned  dsor_exp;
 
-	parent = clk->parent;
-	if (unlikely(parent == NULL))
-		return -EIO;
-
-	realrate = parent->rate;
+	realrate = parent_rate;
 	for (dsor_exp=0; dsor_exp<4; dsor_exp++) {
 		if (realrate <= rate)
 			break;
@@ -395,13 +389,13 @@ static int calc_dsor_exp(struct omap1_clk *clk, unsigned long rate)
 	return dsor_exp;
 }
 
-static unsigned long omap1_ckctl_recalc(struct clk_hw *clk_hw)
+static unsigned long omap1_ckctl_recalc(struct clk_hw *clk_hw, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	/* Calculate divisor encoded as 2-bit exponent */
 	int dsor = 1 << (3 & (omap_readw(ARM_CKCTL) >> clk->rate_offset));
 
-	return clk->parent->rate / dsor;
+	return parent_rate / dsor;
 }
 
 /*-------------------------------------------------------------------------
@@ -453,7 +447,7 @@ static struct mpu_rate omap1_rate_table[] = {
 };
 
 /* MPU virtual clock functions */
-static int omap1_select_table_rate(struct clk_hw *clk_hw, unsigned long rate)
+static int omap1_select_table_rate(struct clk_hw *clk_hw, unsigned long rate, unsigned long parent_rate)
 {
 	/* Find the highest supported frequency <= rate and switch to it */
 	struct mpu_rate * ptr;
@@ -488,13 +482,13 @@ static int omap1_select_table_rate(struct clk_hw *clk_hw, unsigned long rate)
 	return 0;
 }
 
-static int omap1_clk_set_rate_dsp_domain(struct clk_hw *clk_hw, unsigned long rate)
+static int omap1_clk_set_rate_dsp_domain(struct clk_hw *clk_hw, unsigned long rate, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int dsor_exp;
 	u16 regval;
 
-	dsor_exp = calc_dsor_exp(clk, rate);
+	dsor_exp = calc_dsor_exp(clk, rate, parent_rate);
 	if (dsor_exp > 3)
 		dsor_exp = -EINVAL;
 	if (dsor_exp < 0)
@@ -504,29 +498,29 @@ static int omap1_clk_set_rate_dsp_domain(struct clk_hw *clk_hw, unsigned long ra
 	regval &= ~(3 << clk->rate_offset);
 	regval |= dsor_exp << clk->rate_offset;
 	__raw_writew(regval, DSP_CKCTL);
-	clk->rate = clk->parent->rate / (1 << dsor_exp);
+	clk->rate = parent_rate / (1 << dsor_exp);
 
 	return 0;
 }
 
-static long omap1_clk_round_rate_ckctl_arm(struct clk_hw *clk_hw, unsigned long rate)
+static long omap1_clk_round_rate_ckctl_arm(struct clk_hw *clk_hw, unsigned long rate, unsigned long *parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
-	int dsor_exp = calc_dsor_exp(clk, rate);
+	int dsor_exp = calc_dsor_exp(clk, rate, *parent_rate);
 	if (dsor_exp < 0)
 		return dsor_exp;
 	if (dsor_exp > 3)
 		dsor_exp = 3;
-	return clk->parent->rate / (1 << dsor_exp);
+	return *parent_rate / (1 << dsor_exp);
 }
 
-static int omap1_clk_set_rate_ckctl_arm(struct clk_hw *clk_hw, unsigned long rate)
+static int omap1_clk_set_rate_ckctl_arm(struct clk_hw *clk_hw, unsigned long rate, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int dsor_exp;
 	u16 regval;
 
-	dsor_exp = calc_dsor_exp(clk, rate);
+	dsor_exp = calc_dsor_exp(clk, rate, parent_rate);
 	if (dsor_exp > 3)
 		dsor_exp = -EINVAL;
 	if (dsor_exp < 0)
@@ -537,11 +531,11 @@ static int omap1_clk_set_rate_ckctl_arm(struct clk_hw *clk_hw, unsigned long rat
 	regval |= dsor_exp << clk->rate_offset;
 	regval = verify_ckctl_value(regval);
 	omap_writew(regval, ARM_CKCTL);
-	clk->rate = clk->parent->rate / (1 << dsor_exp);
+	clk->rate = parent_rate / (1 << dsor_exp);
 	return 0;
 }
 
-static long omap1_round_to_table_rate(struct clk_hw *clk_hw, unsigned long rate)
+static long omap1_round_to_table_rate(struct clk_hw *clk_hw, unsigned long rate, unsigned long *parent_rate)
 {
 	/* Find the highest supported frequency <= rate */
 	struct mpu_rate * ptr;
@@ -592,7 +586,7 @@ static unsigned calc_ext_dsor(unsigned long rate)
 }
 
 /* XXX Only needed on 1510 */
-static int omap1_set_uart_rate(struct clk_hw *clk_hw, unsigned long rate)
+static int omap1_set_uart_rate(struct clk_hw *clk_hw, unsigned long rate, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	unsigned int val;
@@ -611,7 +605,7 @@ static int omap1_set_uart_rate(struct clk_hw *clk_hw, unsigned long rate)
 }
 
 /* External clock (MCLK & BCLK) functions */
-static int omap1_set_ext_clk_rate(struct clk_hw *clk_hw, unsigned long rate)
+static int omap1_set_ext_clk_rate(struct clk_hw *clk_hw, unsigned long rate, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	unsigned dsor;
@@ -630,16 +624,14 @@ static int omap1_set_ext_clk_rate(struct clk_hw *clk_hw, unsigned long rate)
 	return 0;
 }
 
-static int omap1_set_sossi_rate(struct clk_hw *clk_hw, unsigned long rate)
+static int omap1_set_sossi_rate(struct clk_hw *clk_hw, unsigned long rate, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	u32 l;
 	int div;
-	unsigned long p_rate;
 
-	p_rate = clk->parent->rate;
 	/* Round towards slower frequency */
-	div = (p_rate + rate - 1) / rate;
+	div = (parent_rate + rate - 1) / rate;
 	div--;
 	if (div < 0 || div > 7)
 		return -EINVAL;
@@ -649,12 +641,12 @@ static int omap1_set_sossi_rate(struct clk_hw *clk_hw, unsigned long rate)
 	l |= div << 17;
 	omap_writel(l, MOD_CONF_CTRL_1);
 
-	clk->rate = p_rate / (div + 1);
+	clk->rate = parent_rate / (div + 1);
 
 	return 0;
 }
 
-static long omap1_round_ext_clk_rate(struct clk_hw *clk_hw, unsigned long rate)
+static long omap1_round_ext_clk_rate(struct clk_hw *clk_hw, unsigned long rate, unsigned long *parent_rate)
 {
 	return 96000000 / calc_ext_dsor(rate);
 }
@@ -678,16 +670,27 @@ static void omap1_init_ext_clk(struct clk_hw *clk_hw)
 	clk-> rate = 96000000 / dsor;
 }
 
+struct clk_hw *clk_hw_get_parent(const struct clk_hw *clk_hw)
+{
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+
+	if (!clk->parent)
+		return NULL;
+
+	return &clk->parent->clk_hw;
+}
+
 static void omap1_clk_disable(struct clk_hw *clk_hw)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+	struct clk_hw *parent = clk_hw_get_parent(clk_hw);
 
 	if (clk->usecount > 0 && !(--clk->usecount)) {
-		clk->ops->disable(&clk->clk_hw);
-		if (likely(clk->parent)) {
-			omap1_clk_disable(&clk->parent->clk_hw);
+		clk->ops->disable(clk_hw);
+		if (likely(parent)) {
+			omap1_clk_disable(parent);
 			if (clk->flags & CLOCK_NO_IDLE_PARENT)
-				omap1_clk_allow_idle(&clk->parent->clk_hw);
+				omap1_clk_allow_idle(parent);
 		}
 	}
 }
@@ -695,22 +698,23 @@ static void omap1_clk_disable(struct clk_hw *clk_hw)
 static omap1_clk_enable(struct clk_hw *clk_hw)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+	struct clk_hw *parent = clk_hw_get_parent(clk_hw);
 	int ret = 0;
 
 	if (clk->usecount++ == 0) {
-		if (clk->parent) {
-			ret = omap1_clk_enable(&clk->parent->clk_hw);
+		if (parent) {
+			ret = omap1_clk_enable(parent);
 			if (ret)
 				goto err;
 
 			if (clk->flags & CLOCK_NO_IDLE_PARENT)
-				omap1_clk_deny_idle(&clk->parent->clk_hw);
+				omap1_clk_deny_idle(parent);
 		}
 
 		ret = clk->ops->enable(&clk->clk_hw);
 		if (ret) {
-			if (clk->parent)
-				omap1_clk_disable(&clk->parent->clk_hw);
+			if (parent)
+				omap1_clk_disable(parent);
 			goto err;
 		}
 	}
@@ -771,7 +775,7 @@ static const struct clk_ops clkops_generic = {
 	.disable	= omap1_clk_disable_generic,
 };
 
-static unsigned long omap1_ckctl_recalc_dsp_domain(struct clk_hw *clk_hw)
+static unsigned long omap1_ckctl_recalc_dsp_domain(struct clk_hw *clk_hw, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int dsor;
@@ -787,7 +791,7 @@ static unsigned long omap1_ckctl_recalc_dsp_domain(struct clk_hw *clk_hw)
 	dsor = 1 << (3 & (__raw_readw(DSP_CKCTL) >> clk->rate_offset));
 	omap1_clk_disable(api_ck_p);
 
-	return clk->parent->rate / dsor;
+	return parent_rate / dsor;
 }
 
 static int omap1_clk_enable_dsp_domain(struct clk_hw *clk_hw)
@@ -812,11 +816,6 @@ static void omap1_clk_disable_dsp_domain(struct clk_hw *clk_hw)
 	}
 }
 
-static const struct clk_ops clkops_dspck = {
-	.enable		= omap1_clk_enable_dsp_domain,
-	.disable	= omap1_clk_disable_dsp_domain,
-};
-
 /* XXX SYSC register handling does not belong in the clock framework */
 static int omap1_clk_enable_uart_functional_16xx(struct clk_hw *clk_hw)
 {
@@ -857,9 +856,20 @@ static const struct clk_ops clkops_uart_16xx = {
 static long omap1_clk_round_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+	struct clk_hw *parent = clk_hw_get_parent(clk_hw);
+	struct omap1_clk *parent_clk;
+	unsigned long parent_rate = 0;
+
+	if (parent) {
+		parent_clk = to_omap1_clk(parent);
+		parent_rate = parent_clk->rate;
+	}
+
+	if (clk->ops->round_rate != NULL)
+		return clk->ops->round_rate(clk_hw, rate, &parent_rate);
 
-	if (clk->round_rate != NULL)
-		return clk->round_rate(clk_hw, rate);
+	if (parent)
+		parent_clk->rate = parent_rate;
 
 	return clk->rate;
 }
@@ -867,10 +877,15 @@ static long omap1_clk_round_rate(struct clk_hw *clk_hw, unsigned long rate)
 static int omap1_clk_set_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+	struct clk_hw *parent = clk_hw_get_parent(clk_hw);
+	unsigned long parent_rate = 0;
 	int  ret = -EINVAL;
 
-	if (clk->set_rate)
-		ret = clk->set_rate(clk_hw, rate);
+	if (parent)
+		parent_rate = to_omap1_clk(parent)->rate;
+
+	if (clk->ops->set_rate)
+		ret = clk->ops->set_rate(clk_hw, rate, parent_rate);
 	return ret;
 }
 
@@ -880,8 +895,8 @@ static void propagate_rate(struct omap1_clk *tclk)
 	struct omap1_clk *clkp;
 
 	list_for_each_entry(clkp, &tclk->children, sibling) {
-		if (clkp->recalc)
-			clkp->rate = clkp->recalc(&clkp->clk_hw);
+		if (clkp->ops->recalc_rate)
+			clkp->rate = clkp->ops->recalc_rate(&clkp->clk_hw, tclk->rate);
 		propagate_rate(clkp);
 	}
 }
@@ -993,9 +1008,12 @@ EXPORT_SYMBOL(clk_set_parent);
 
 struct clk *clk_get_parent(struct clk *clk)
 {
-	struct omap1_clk *parent = to_omap1_clk(clk->clk_hw)->parent;
+	struct clk_hw *parent = clk_hw_get_parent(clk->clk_hw);
+
+	if (!parent)
+		return NULL;
 
-	return &parent->clk_hw.clk;
+	return &parent->clk;
 }
 EXPORT_SYMBOL(clk_get_parent);
 
@@ -1004,24 +1022,22 @@ EXPORT_SYMBOL(clk_get_parent);
  */
 
 /* Used for clocks that always have same value as the parent clock */
-static unsigned long followparent_recalc(struct clk_hw *clk_hw)
+static unsigned long followparent_recalc(struct clk_hw *clk_hw, unsigned long parent_rate)
 {
-	struct omap1_clk *clk = to_omap1_clk(clk_hw);
-
-	return clk->parent->rate;
+	return parent_rate;
 }
 
 /*
  * Used for clocks that have the same value as the parent clock,
  * divided by some factor
  */
-static unsigned long omap_fixed_divisor_recalc(struct clk_hw *clk_hw)
+static unsigned long omap_fixed_divisor_recalc(struct clk_hw *clk_hw, unsigned long parent_rate)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 
 	WARN_ON(!clk->fixed_div);
 
-	return clk->parent->rate / clk->fixed_div;
+	return parent_rate / clk->fixed_div;
 }
 
 /**
@@ -1056,8 +1072,8 @@ static int clk_register(struct device *dev, struct clk_hw *clk_hw)
 		list_add(&clk->sibling, &clk->parent->children);
 
 	list_add(&clk->node, &clocks);
-	if (clk->init)
-		clk->init(&clk->clk_hw);
+	if (clk->ops->init)
+		clk->ops->init(&clk->clk_hw);
 	mutex_unlock(&clocks_mutex);
 
 	return 0;
@@ -1080,6 +1096,12 @@ static const struct clk_ops clkops_null = {
 	.disable	= clkll_disable_null,
 };
 
+static const struct clk_ops clkops_followparent = {
+	.enable		= clkll_enable_null,
+	.disable	= clkll_disable_null,
+	.recalc_rate	= followparent_recalc,
+};
+
 /*
  * Dummy clock
  *
@@ -1239,6 +1261,12 @@ static struct omap1_clk ck_dpll1 = {
 	.parent		= &ck_ref,
 };
 
+static const struct clk_ops clkops_generic_followparent = {
+	.enable		= omap1_clk_enable_generic,
+	.disable	= omap1_clk_disable_generic,
+	.recalc_rate	= followparent_recalc,
+};
+
 /*
  * FIXME: This clock seems to be necessary but no-one has asked for its
  * activation.  [ FIX: SoSSI, SSR ]
@@ -1246,33 +1274,50 @@ static struct omap1_clk ck_dpll1 = {
 static struct arm_idlect1_clk ck_dpll1out = {
 	.clk = {
 		.name		= "ck_dpll1out",
-		.ops		= &clkops_generic,
+		.ops		= &clkops_generic_followparent,
 		.parent		= &ck_dpll1,
 		.flags		= CLOCK_IDLE_CONTROL | ENABLE_REG_32BIT,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_CKOUT_ARM,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDL_CLKOUT_ARM_SHIFT,
 };
 
+static const struct clk_ops clkops_sossi = {
+	.enable		= omap1_clk_enable_generic,
+	.disable	= omap1_clk_disable_generic,
+	.recalc_rate	= &omap1_sossi_recalc,
+	.set_rate	= &omap1_set_sossi_rate,
+};
+
 static struct omap1_clk sossi_ck = {
 	.name		= "ck_sossi",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_sossi,
 	.parent		= &ck_dpll1out.clk,
 	.flags		= CLOCK_NO_IDLE_PARENT | ENABLE_REG_32BIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1),
 	.enable_bit	= CONF_MOD_SOSSI_CLK_EN_R,
-	.recalc		= &omap1_sossi_recalc,
-	.set_rate	= &omap1_set_sossi_rate,
+};
+
+struct clk_ops clkops_null_ckctl = {
+	.enable		= clkll_enable_null,
+	.disable	= clkll_disable_null,
+	.recalc_rate	= omap1_ckctl_recalc,
+	.round_rate	= omap1_clk_round_rate_ckctl_arm,
+	.set_rate	= omap1_clk_set_rate_ckctl_arm,
 };
 
 static struct omap1_clk arm_ck = {
 	.name		= "arm_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_null_ckctl,
 	.parent		= &ck_dpll1,
 	.rate_offset	= CKCTL_ARMDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc,
+};
+
+struct clk_ops clkops_generic_ckctl = {
+	.enable		= omap1_clk_enable_generic,
+	.disable	= omap1_clk_disable_generic,
+	.recalc_rate	= omap1_ckctl_recalc,
 	.round_rate	= omap1_clk_round_rate_ckctl_arm,
 	.set_rate	= omap1_clk_set_rate_ckctl_arm,
 };
@@ -1280,15 +1325,12 @@ static struct omap1_clk arm_ck = {
 static struct arm_idlect1_clk armper_ck = {
 	.clk = {
 		.name		= "armper_ck",
-		.ops		= &clkops_generic,
+		.ops		= &clkops_generic_ckctl,
 		.parent		= &ck_dpll1,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_PERCK,
 		.rate_offset	= CKCTL_PERDIV_OFFSET,
-		.recalc		= &omap1_ckctl_recalc,
-		.round_rate	= omap1_clk_round_rate_ckctl_arm,
-		.set_rate	= omap1_clk_set_rate_ckctl_arm,
 	},
 	.idlect_shift	= IDLPER_ARM_SHIFT,
 };
@@ -1299,22 +1341,20 @@ static struct arm_idlect1_clk armper_ck = {
  */
 static struct omap1_clk arm_gpio_ck = {
 	.name		= "ick",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_generic_followparent,
 	.parent		= &ck_dpll1,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 	.enable_bit	= EN_GPIOCK,
-	.recalc		= &followparent_recalc,
 };
 
 static struct arm_idlect1_clk armxor_ck = {
 	.clk = {
 		.name		= "armxor_ck",
-		.ops		= &clkops_generic,
+		.ops		= &clkops_generic_followparent,
 		.parent		= &ck_ref,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_XORPCK,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDLXORP_ARM_SHIFT,
 };
@@ -1322,16 +1362,21 @@ static struct arm_idlect1_clk armxor_ck = {
 static struct arm_idlect1_clk armtim_ck = {
 	.clk = {
 		.name		= "armtim_ck",
-		.ops		= &clkops_generic,
+		.ops		= &clkops_generic_followparent,
 		.parent		= &ck_ref,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_TIMCK,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDLTIM_ARM_SHIFT,
 };
 
+static const struct clk_ops clkops_fixed_divisor = {
+	.enable		= omap1_clk_enable_generic,
+	.disable	= omap1_clk_disable_generic,
+	.recalc_rate	= omap_fixed_divisor_recalc,
+};
+
 static struct arm_idlect1_clk armwdt_ck = {
 	.clk = {
 		.name		= "armwdt_ck",
@@ -1341,16 +1386,14 @@ static struct arm_idlect1_clk armwdt_ck = {
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_WDTCK,
 		.fixed_div	= 14,
-		.recalc		= &omap_fixed_divisor_recalc,
 	},
 	.idlect_shift	= IDLWDT_ARM_SHIFT,
 };
 
 static struct omap1_clk arminth_ck16xx = {
 	.name		= "arminth_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.parent		= &arm_ck,
-	.recalc		= &followparent_recalc,
 	/* Note: On 16xx the frequency can be divided by 2 by programming
 	 * ARM_CKCTL:ARM_INTHCK_SEL(14) to 1
 	 *
@@ -1360,24 +1403,26 @@ static struct omap1_clk arminth_ck16xx = {
 
 static struct omap1_clk dsp_ck = {
 	.name		= "dsp_ck",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_generic_ckctl,
 	.parent		= &ck_dpll1,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_CKCTL),
 	.enable_bit	= EN_DSPCK,
 	.rate_offset	= CKCTL_DSPDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc,
-	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= omap1_clk_set_rate_ckctl_arm,
 };
 
 static struct omap1_clk dspmmu_ck = {
 	.name		= "dspmmu_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_null_ckctl,
 	.parent		= &ck_dpll1,
 	.rate_offset	= CKCTL_DSPMMUDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc,
+};
+
+static const struct clk_ops clkops_dspck = {
+	.enable		= omap1_clk_enable_dsp_domain,
+	.disable	= omap1_clk_disable_dsp_domain,
+	.recalc_rate	= omap1_ckctl_recalc_dsp_domain,
 	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= omap1_clk_set_rate_ckctl_arm,
+	.set_rate	= omap1_clk_set_rate_dsp_domain,
 };
 
 static struct omap1_clk dspper_ck = {
@@ -1387,48 +1432,45 @@ static struct omap1_clk dspper_ck = {
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_PERCK,
 	.rate_offset	= CKCTL_PERDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc_dsp_domain,
-	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= &omap1_clk_set_rate_dsp_domain,
+};
+
+static const struct clk_ops clkops_dspck_followparent = {
+	.enable		= omap1_clk_enable_dsp_domain,
+	.disable	= omap1_clk_disable_dsp_domain,
+	.recalc_rate	= followparent_recalc,
 };
 
 static struct omap1_clk dspxor_ck = {
 	.name		= "dspxor_ck",
-	.ops		= &clkops_dspck,
+	.ops		= &clkops_dspck_followparent,
 	.parent		= &ck_ref,
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_XORPCK,
-	.recalc		= &followparent_recalc,
 };
 
 static struct omap1_clk dsptim_ck = {
 	.name		= "dsptim_ck",
-	.ops		= &clkops_dspck,
+	.ops		= &clkops_dspck_followparent,
 	.parent		= &ck_ref,
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_DSPTIMCK,
-	.recalc		= &followparent_recalc,
 };
 
 static struct arm_idlect1_clk tc_ck = {
 	.clk = {
 		.name		= "tc_ck",
-		.ops		= &clkops_null,
+		.ops		= &clkops_null_ckctl,
 		.parent		= &ck_dpll1,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.rate_offset	= CKCTL_TCDIV_OFFSET,
-		.recalc		= &omap1_ckctl_recalc,
-		.round_rate	= omap1_clk_round_rate_ckctl_arm,
-		.set_rate	= omap1_clk_set_rate_ckctl_arm,
 	},
 	.idlect_shift	= IDLIF_ARM_SHIFT,
 };
 
 static struct omap1_clk arminth_ck1510 = {
 	.name		= "arminth_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
 	/* Note: On 1510 the frequency follows TC_CK
 	 *
 	 * 16xx version is in MPU clocks.
@@ -1438,28 +1480,25 @@ static struct omap1_clk arminth_ck1510 = {
 static struct omap1_clk tipb_ck = {
 	/* No-idle controlled by "tc_ck" */
 	.name		= "tipb_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
 static struct omap1_clk l3_ocpi_ck = {
 	/* No-idle controlled by "tc_ck" */
 	.name		= "l3_ocpi_ck",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_generic_followparent,
 	.parent		= &tc_ck.clk,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_OCPI_CK,
-	.recalc		= &followparent_recalc,
 };
 
 static struct omap1_clk tc1_ck = {
 	.name		= "tc1_ck",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_generic_followparent,
 	.parent		= &tc_ck.clk,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_TC1_CK,
-	.recalc		= &followparent_recalc,
 };
 
 /*
@@ -1468,37 +1507,33 @@ static struct omap1_clk tc1_ck = {
  */
 static struct omap1_clk tc2_ck = {
 	.name		= "tc2_ck",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_generic_followparent,
 	.parent		= &tc_ck.clk,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_TC2_CK,
-	.recalc		= &followparent_recalc,
 };
 
 static struct omap1_clk dma_ck = {
 	/* No-idle controlled by "tc_ck" */
 	.name		= "dma_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
 static struct omap1_clk dma_lcdfree_ck = {
 	.name		= "dma_lcdfree_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
 static struct arm_idlect1_clk api_ck = {
 	.clk = {
 		.name		= "api_ck",
-		.ops		= &clkops_generic,
+		.ops		= &clkops_generic_followparent,
 		.parent		= &tc_ck.clk,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_APICK,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDLAPI_ARM_SHIFT,
 };
@@ -1506,58 +1541,56 @@ static struct arm_idlect1_clk api_ck = {
 static struct arm_idlect1_clk lb_ck = {
 	.clk = {
 		.name		= "lb_ck",
-		.ops		= &clkops_generic,
+		.ops		= &clkops_generic_followparent,
 		.parent		= &tc_ck.clk,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_LBCK,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDLLB_ARM_SHIFT,
 };
 
 static struct omap1_clk rhea1_ck = {
 	.name		= "rhea1_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
 static struct omap1_clk rhea2_ck = {
 	.name		= "rhea2_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
 static struct omap1_clk lcd_ck_16xx = {
 	.name		= "lcd_ck",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_generic_ckctl,
 	.parent		= &ck_dpll1,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 	.enable_bit	= EN_LCDCK,
 	.rate_offset	= CKCTL_LCDDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc,
-	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= omap1_clk_set_rate_ckctl_arm,
 };
 
 static struct arm_idlect1_clk lcd_ck_1510 = {
 	.clk = {
 		.name		= "lcd_ck",
-		.ops		= &clkops_generic,
+		.ops		= &clkops_generic_ckctl,
 		.parent		= &ck_dpll1,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_LCDCK,
 		.rate_offset	= CKCTL_LCDDIV_OFFSET,
-		.recalc		= &omap1_ckctl_recalc,
-		.round_rate	= omap1_clk_round_rate_ckctl_arm,
-		.set_rate	= omap1_clk_set_rate_ckctl_arm,
 	},
 	.idlect_shift	= OMAP1510_IDLLCD_ARM_SHIFT,
 };
 
+static const struct clk_ops clkops_uart = {
+	.enable		= clkll_enable_null,
+	.disable	= clkll_disable_null,
+	.set_rate	= omap1_set_uart_rate,
+	.recalc_rate	= omap1_uart_recalc,
+};
+
 /*
  * XXX The enable_bit here is misused - it simply switches between 12MHz
  * and 48MHz.  Reimplement with clksel.
@@ -1566,15 +1599,13 @@ static struct arm_idlect1_clk lcd_ck_1510 = {
  */
 static struct omap1_clk uart1_1510 = {
 	.name		= "uart1_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_uart,
 	/* Direct from ULPD, no real parent */
 	.parent		= &armper_ck.clk,
 	.rate		= 12000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
 	.enable_bit	= CONF_MOD_UART1_CLK_MODE_R,
-	.set_rate	= &omap1_set_uart_rate,
-	.recalc		= &omap1_uart_recalc,
 };
 
 /*
@@ -1605,15 +1636,13 @@ static struct uart_clk uart1_16xx = {
  */
 static struct omap1_clk uart2_ck = {
 	.name		= "uart2_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_uart,
 	/* Direct from ULPD, no real parent */
 	.parent		= &armper_ck.clk,
 	.rate		= 12000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
 	.enable_bit	= CONF_MOD_UART2_CLK_MODE_R,
-	.set_rate	= &omap1_set_uart_rate,
-	.recalc		= &omap1_uart_recalc,
 };
 
 /*
@@ -1624,15 +1653,13 @@ static struct omap1_clk uart2_ck = {
  */
 static struct omap1_clk uart3_1510 = {
 	.name		= "uart3_ck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_uart,
 	/* Direct from ULPD, no real parent */
 	.parent		= &armper_ck.clk,
 	.rate		= 12000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
 	.enable_bit	= CONF_MOD_UART3_CLK_MODE_R,
-	.set_rate	= &omap1_set_uart_rate,
-	.recalc		= &omap1_uart_recalc,
 };
 
 /*
@@ -1722,15 +1749,20 @@ static struct omap1_clk mclk_1510 = {
 	.enable_bit	= SOFT_COM_MCKO_REQ_SHIFT,
 };
 
+static const struct clk_ops clkops_ext_clk = {
+	.enable		= omap1_clk_enable_generic,
+	.disable	= omap1_clk_disable_generic,
+	.set_rate	= omap1_set_ext_clk_rate,
+	.round_rate	= omap1_round_ext_clk_rate,
+	.init		= omap1_init_ext_clk,
+};
+
 static struct omap1_clk mclk_16xx = {
 	.name		= "mclk",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_ext_clk,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
 	.enable_reg	= OMAP1_IO_ADDRESS(COM_CLK_DIV_CTRL_SEL),
 	.enable_bit	= COM_ULPD_PLL_CLK_REQ,
-	.set_rate	= &omap1_set_ext_clk_rate,
-	.round_rate	= &omap1_round_ext_clk_rate,
-	.init		= &omap1_init_ext_clk,
 };
 
 static struct omap1_clk bclk_1510 = {
@@ -1742,13 +1774,10 @@ static struct omap1_clk bclk_1510 = {
 
 static struct omap1_clk bclk_16xx = {
 	.name		= "bclk",
-	.ops		= &clkops_generic,
+	.ops		= &clkops_ext_clk,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
 	.enable_reg	= OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL),
 	.enable_bit	= SWD_ULPD_PLL_CLK_REQ,
-	.set_rate	= &omap1_set_ext_clk_rate,
-	.round_rate	= &omap1_round_ext_clk_rate,
-	.init		= &omap1_init_ext_clk,
 };
 
 static struct omap1_clk mmc1_ck = {
@@ -1788,31 +1817,34 @@ static struct omap1_clk mmc3_ck = {
 	.enable_bit	= SOFT_MMC_DPLL_REQ_SHIFT,
 };
 
+static const struct clk_ops clkops_mpu = {
+	.enable		= clkll_enable_null,
+	.disable	= clkll_disable_null,
+	.recalc_rate	= followparent_recalc,
+	.set_rate	= omap1_select_table_rate,
+	.round_rate	= omap1_round_to_table_rate,
+};
+
 static struct omap1_clk virtual_ck_mpu = {
 	.name		= "mpu",
-	.ops		= &clkops_null,
+	.ops		= &clkops_mpu,
 	.parent		= &arm_ck, /* Is smarter alias for */
-	.recalc		= &followparent_recalc,
-	.set_rate	= &omap1_select_table_rate,
-	.round_rate	= &omap1_round_to_table_rate,
 };
 
 /* virtual functional clock domain for I2C. Just for making sure that ARMXOR_CK
 remains active during MPU idle whenever this is enabled */
 static struct omap1_clk i2c_fck = {
 	.name		= "i2c_fck",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.flags		= CLOCK_NO_IDLE_PARENT,
 	.parent		= &armxor_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
 static struct omap1_clk i2c_ick = {
 	.name		= "i2c_ick",
-	.ops		= &clkops_null,
+	.ops		= &clkops_followparent,
 	.flags		= CLOCK_NO_IDLE_PARENT,
 	.parent		= &armper_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
 /*
@@ -2057,7 +2089,7 @@ void __init omap1_clk_late_init(void)
 	unsigned long rate = ck_dpll1.rate;
 
 	/* Find the highest supported frequency and enable it */
-	if (omap1_select_table_rate(&virtual_ck_mpu.clk_hw, ~0)) {
+	if (omap1_select_table_rate(&virtual_ck_mpu.clk_hw, ~0, 0)) {
 		pr_err("System frequencies not set, using default. Check your config.\n");
 		/*
 		 * Reprogramming the DPLL is tricky, it must be done from SRAM.
-- 
2.20.0

