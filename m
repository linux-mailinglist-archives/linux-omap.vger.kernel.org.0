Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E7F86C9F
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390151AbfHHVnz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:43:55 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44535 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390510AbfHHVnw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:43:52 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MXYAj-1hp3Kg2zJ1-00YytR; Thu, 08 Aug 2019 23:43:21 +0200
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
Subject: [PATCH 18/22] ARM: omap1: clk: rework 'struct clk'
Date:   Thu,  8 Aug 2019 23:41:28 +0200
Message-Id: <20190808214232.2798396-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808214232.2798396-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808214232.2798396-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F1b8+uHEy5radsEKMgXla6olW2Kqfyge+cZDihAIBDh3TRLHR5R
 gSorV8P6RQiQhUgQ1sMWIgTIGZsB2qiuAS+U6tovqQoNZLGbtuPd6WkSpHr3frzSKq0yH8S
 r5lu+RLy8zqPsu26Ieoc5gk6gpUQcyi4Q7pTh1MjSBwvO+mrHXhQV4eZHoE++kFjZlBuUW0
 9UOryq6i591QEDC8+rAZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OKEy0Y5Am+s=:m1VP6DQbuBve5wUr011IvC
 btOCW/hpzrEoTeTOGRmj/EBIIJJlNw0GCrWawllPJygdd3soRvSIelDM+Wh59x3lCl+viJ0DE
 3R9phVeaQ7utF375qAyoY2dQLI2oV5xpPGbpps8U71dqt797pgPjFdgdaEURQHcsi0yjOz2Ue
 ISmrbTTydW0a0UgwdHBtKI/2JsDOA63IICTiJ3fbZK2N2PbA2geRcV83HPHbsFrADHzsOpgQ8
 u/rqY2QQhX6myo7j8zg+71+qJz1bpliOmEFlTKhknTWPHzcI+QWpWuI5BmrECZlZrFLFw2IMd
 N9q38tNFfAlqgINREw4mEbNvCqQELE8pFQUsWLMnauVT/05lazj0JOlZ4rivtiOQKDM/n+eOE
 8WtP3WPB/4UuWsp/yVGhX20TRzPgwlZGbfsQ6O95JyEWned1x5Oo3ObNkPyy8tXoU5AacO14h
 fCBwR7pMn++EpSuBKkO8L6qfdx0MOe351fC4i0JEYa7G0yMKkpd5YaKrxb4ubaSw8sV1bQYwa
 GO5gbOLWBfon5pAClBhel1Ky9Cbn1xLKNUscIu0Y8fsHPxKD8nhaPYu2TNsbKUfGIxX81yzis
 eYdqt3fuaoAwM2Fhv0IsCKVKOjLKQN63AjlvodXKxbwjsD3GhXEvvhscvUVJcqoSvL1oWgJQv
 9Ra8wTyO8S12JF+C0GI2dVr60AdE7iT3zCCqSCdVnioP7nWsPUhitc9sPtSfFawTrj22PLBm5
 MsDwjN2cfEItC1OKRMqGTmDAvfKJBY5J6fdaBQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

To get closer to the way the common_clk code works, rename
the omap1 struct clk to 'omap1_clk', and add trivial 'clk_hw'
and 'clk' wrapper to work like the generic counterparts.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock.c | 364 ++++++++++++++++++++----------------
 1 file changed, 205 insertions(+), 159 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index b2b0355fae4c..577686f61b3b 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -28,20 +28,20 @@
 #include "sram.h"
 #include "usb.h"
 
-struct clk;
+struct omap1_clk;
 
-struct omap_clk {
+struct omap1_clk_lookup {
 	u16				cpu;
 	struct clk_lookup		lk;
 };
 
 #define CLK(dev, con, ck, cp)		\
 	{				\
-		 .cpu = cp,		\
+		.cpu = cp,		\
 		.lk = {			\
+			.clk_hw = (&(ck)->clk_hw),	\
 			.dev_id = dev,	\
 			.con_id = con,	\
-			.clk = ck,	\
 		},			\
 	}
 
@@ -53,7 +53,7 @@ struct omap_clk {
 #define CK_1710		(1 << 4)	/* 1710 extra for rate selection */
 
 /**
- * struct clkops - some clock function pointers
+ * struct clk_ops - some clock function pointers
  * @enable: fn ptr that enables the current clock in hardware
  * @disable: fn ptr that enables the current clock in hardware
  *
@@ -65,13 +65,13 @@ struct omap_clk {
  * runtime calls in place of clk_enable()/clk_disable(), @find_idlest and
  * @find_companion must, unfortunately, remain.
  */
-struct clkops {
-	int			(*enable)(struct clk *);
-	void			(*disable)(struct clk *);
+struct clk_ops {
+	int			(*enable)(struct clk_hw *);
+	void			(*disable)(struct clk_hw *);
 };
 
 /*
- * struct clk.flags possibilities
+ * struct omap1_clk.flags possibilities
  *
  * XXX document the rest of the clock flags here
  *
@@ -81,7 +81,7 @@ struct clkops {
 #define CLOCK_NO_IDLE_PARENT	(1 << 2)
 
 /**
- * struct clk - OMAP struct clk
+ * struct omap1_clk - OMAP struct clk
  * @node: list_head connecting this clock into the full clock list
  * @ops: struct clkops * for this clock
  * @name: the name of the clock in the hardware (used in hwmod data and debug)
@@ -121,18 +121,27 @@ struct clkops {
  * separated from the clock's target rate.
  */
 struct clk {
+	struct clk_hw		*clk_hw;
+};
+
+struct clk_hw {
+	struct clk		clk;
+};
+
+struct omap1_clk {
+	struct clk_hw		clk_hw;
 	struct list_head	node;
-	const struct clkops	*ops;
+	const struct clk_ops	*ops;
 	const char		*name;
-	struct clk		*parent;
+	struct omap1_clk	*parent;
 	struct list_head	children;
 	struct list_head	sibling;	/* node for children */
 	unsigned long		rate;
 	void __iomem		*enable_reg;
-	unsigned long		(*recalc)(struct clk *);
-	int			(*set_rate)(struct clk *, unsigned long);
-	long			(*round_rate)(struct clk *, unsigned long);
-	void			(*init)(struct clk *);
+	unsigned long		(*recalc)(struct clk_hw *);
+	int			(*set_rate)(struct clk_hw *, unsigned long);
+	long			(*round_rate)(struct clk_hw *, unsigned long);
+	void			(*init)(struct clk_hw *);
 	u8			enable_bit;
 	s8			usecount;
 	u8			fixed_div;
@@ -143,14 +152,16 @@ struct clk {
 #endif
 };
 
+#define to_omap1_clk(__hw) container_of((__hw), struct omap1_clk, clk_hw)
+
 struct uart_clk {
-	struct clk	clk;
+	struct omap1_clk clk;
 	unsigned long	sysc_addr;
 };
 
 /* Provide a method for preventing idling some ARM IDLECT clocks */
 struct arm_idlect1_clk {
-	struct clk	clk;
+	struct omap1_clk clk;
 	unsigned long	no_idle_count;
 	__u8		idlect_shift;
 };
@@ -217,20 +228,20 @@ static u32 cpu_mask;
 #define IDLXORP_ARM_SHIFT			1
 #define IDLWDT_ARM_SHIFT			0
 
-/* Some MOD_CONF_CTRL_0 bit shifts - used in struct clk.enable_bit */
+/* Some MOD_CONF_CTRL_0 bit shifts - used in struct omap1_clk.enable_bit */
 #define CONF_MOD_UART3_CLK_MODE_R		31
 #define CONF_MOD_UART2_CLK_MODE_R		30
 #define CONF_MOD_UART1_CLK_MODE_R		29
 #define CONF_MOD_MMC_SD_CLK_REQ_R		23
 #define CONF_MOD_MCBSP3_AUXON			20
 
-/* Some MOD_CONF_CTRL_1 bit shifts - used in struct clk.enable_bit */
+/* Some MOD_CONF_CTRL_1 bit shifts - used in struct omap1_clk.enable_bit */
 #define CONF_MOD_SOSSI_CLK_EN_R			16
 
 /* Some OTG_SYSCON_2-specific bit fields */
 #define OTG_SYSCON_2_UHOST_EN_SHIFT		8
 
-/* Some SOFT_REQ_REG bit fields - used in struct clk.enable_bit */
+/* Some SOFT_REQ_REG bit fields - used in struct omap1_clk.enable_bit */
 #define SOFT_MMC2_DPLL_REQ_SHIFT	13
 #define SOFT_MMC_DPLL_REQ_SHIFT		12
 #define SOFT_UART3_DPLL_REQ_SHIFT	11
@@ -247,7 +258,7 @@ static u32 cpu_mask;
 #define SOFT_DPLL_REQ_SHIFT		0
 
 __u32 arm_idlect1_mask;
-static struct clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
+static struct clk_hw *api_ck_p, *ck_dpll1_p, *ck_ref_p;
 
 static LIST_HEAD(clocks);
 static DEFINE_MUTEX(clocks_mutex);
@@ -257,14 +268,16 @@ static DEFINE_SPINLOCK(clockfw_lock);
  * Omap1 specific clock functions
  */
 
-static unsigned long omap1_uart_recalc(struct clk *clk)
+static unsigned long omap1_uart_recalc(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	unsigned int val = __raw_readl(clk->enable_reg);
 	return val & clk->enable_bit ? 48000000 : 12000000;
 }
 
-static unsigned long omap1_sossi_recalc(struct clk *clk)
+static unsigned long omap1_sossi_recalc(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	u32 div = omap_readl(MOD_CONF_CTRL_1);
 
 	div = (div >> 17) & 0x7;
@@ -273,9 +286,10 @@ static unsigned long omap1_sossi_recalc(struct clk *clk)
 	return clk->parent->rate / div;
 }
 
-static void omap1_clk_allow_idle(struct clk *clk)
+static void omap1_clk_allow_idle(struct clk_hw *clk_hw)
 {
-	struct arm_idlect1_clk * iclk = (struct arm_idlect1_clk *)clk;
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+	struct arm_idlect1_clk * iclk = container_of(clk, struct arm_idlect1_clk, clk);
 
 	if (!(clk->flags & CLOCK_IDLE_CONTROL))
 		return;
@@ -284,9 +298,10 @@ static void omap1_clk_allow_idle(struct clk *clk)
 		arm_idlect1_mask |= 1 << iclk->idlect_shift;
 }
 
-static void omap1_clk_deny_idle(struct clk *clk)
+static void omap1_clk_deny_idle(struct clk_hw *clk_hw)
 {
-	struct arm_idlect1_clk * iclk = (struct arm_idlect1_clk *)clk;
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+	struct arm_idlect1_clk * iclk = container_of(clk, struct arm_idlect1_clk, clk);
 
 	if (!(clk->flags & CLOCK_IDLE_CONTROL))
 		return;
@@ -348,7 +363,7 @@ static __u16 verify_ckctl_value(__u16 newval)
 	return newval;
 }
 
-static int calc_dsor_exp(struct clk *clk, unsigned long rate)
+static int calc_dsor_exp(struct omap1_clk *clk, unsigned long rate)
 {
 	/* Note: If target frequency is too low, this function will return 4,
 	 * which is invalid value. Caller must check for this value and act
@@ -362,7 +377,7 @@ static int calc_dsor_exp(struct clk *clk, unsigned long rate)
 	 * DSPMMU_CK >= TC_CK
 	 */
 	unsigned long realrate;
-	struct clk * parent;
+	struct omap1_clk * parent;
 	unsigned  dsor_exp;
 
 	parent = clk->parent;
@@ -380,8 +395,9 @@ static int calc_dsor_exp(struct clk *clk, unsigned long rate)
 	return dsor_exp;
 }
 
-static unsigned long omap1_ckctl_recalc(struct clk *clk)
+static unsigned long omap1_ckctl_recalc(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	/* Calculate divisor encoded as 2-bit exponent */
 	int dsor = 1 << (3 & (omap_readw(ARM_CKCTL) >> clk->rate_offset));
 
@@ -437,13 +453,13 @@ static struct mpu_rate omap1_rate_table[] = {
 };
 
 /* MPU virtual clock functions */
-static int omap1_select_table_rate(struct clk *clk, unsigned long rate)
+static int omap1_select_table_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
 	/* Find the highest supported frequency <= rate and switch to it */
 	struct mpu_rate * ptr;
 	unsigned long ref_rate;
 
-	ref_rate = ck_ref_p->rate;
+	ref_rate = to_omap1_clk(ck_ref_p)->rate;
 
 	for (ptr = omap1_rate_table; ptr->rate; ptr++) {
 		if (!(ptr->flags & cpu_mask))
@@ -467,13 +483,14 @@ static int omap1_select_table_rate(struct clk *clk, unsigned long rate)
 	omap_sram_reprogram_clock(ptr->dpllctl_val, ptr->ckctl_val);
 
 	/* XXX Do we need to recalculate the tree below DPLL1 at this point? */
-	ck_dpll1_p->rate = ptr->pll_rate;
+	to_omap1_clk(ck_dpll1_p)->rate = ptr->pll_rate;
 
 	return 0;
 }
 
-static int omap1_clk_set_rate_dsp_domain(struct clk *clk, unsigned long rate)
+static int omap1_clk_set_rate_dsp_domain(struct clk_hw *clk_hw, unsigned long rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int dsor_exp;
 	u16 regval;
 
@@ -492,8 +509,9 @@ static int omap1_clk_set_rate_dsp_domain(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
-static long omap1_clk_round_rate_ckctl_arm(struct clk *clk, unsigned long rate)
+static long omap1_clk_round_rate_ckctl_arm(struct clk_hw *clk_hw, unsigned long rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int dsor_exp = calc_dsor_exp(clk, rate);
 	if (dsor_exp < 0)
 		return dsor_exp;
@@ -502,8 +520,9 @@ static long omap1_clk_round_rate_ckctl_arm(struct clk *clk, unsigned long rate)
 	return clk->parent->rate / (1 << dsor_exp);
 }
 
-static int omap1_clk_set_rate_ckctl_arm(struct clk *clk, unsigned long rate)
+static int omap1_clk_set_rate_ckctl_arm(struct clk_hw *clk_hw, unsigned long rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int dsor_exp;
 	u16 regval;
 
@@ -522,14 +541,14 @@ static int omap1_clk_set_rate_ckctl_arm(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
-static long omap1_round_to_table_rate(struct clk *clk, unsigned long rate)
+static long omap1_round_to_table_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
 	/* Find the highest supported frequency <= rate */
 	struct mpu_rate * ptr;
 	long highest_rate;
 	unsigned long ref_rate;
 
-	ref_rate = ck_ref_p->rate;
+	ref_rate = to_omap1_clk(ck_ref_p)->rate;
 
 	highest_rate = -EINVAL;
 
@@ -573,8 +592,9 @@ static unsigned calc_ext_dsor(unsigned long rate)
 }
 
 /* XXX Only needed on 1510 */
-static int omap1_set_uart_rate(struct clk *clk, unsigned long rate)
+static int omap1_set_uart_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	unsigned int val;
 
 	val = __raw_readl(clk->enable_reg);
@@ -591,8 +611,9 @@ static int omap1_set_uart_rate(struct clk *clk, unsigned long rate)
 }
 
 /* External clock (MCLK & BCLK) functions */
-static int omap1_set_ext_clk_rate(struct clk *clk, unsigned long rate)
+static int omap1_set_ext_clk_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	unsigned dsor;
 	__u16 ratio_bits;
 
@@ -609,8 +630,9 @@ static int omap1_set_ext_clk_rate(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
-static int omap1_set_sossi_rate(struct clk *clk, unsigned long rate)
+static int omap1_set_sossi_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	u32 l;
 	int div;
 	unsigned long p_rate;
@@ -632,13 +654,14 @@ static int omap1_set_sossi_rate(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
-static long omap1_round_ext_clk_rate(struct clk *clk, unsigned long rate)
+static long omap1_round_ext_clk_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
 	return 96000000 / calc_ext_dsor(rate);
 }
 
-static void omap1_init_ext_clk(struct clk *clk)
+static void omap1_init_ext_clk(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	unsigned dsor;
 	__u16 ratio_bits;
 
@@ -655,36 +678,39 @@ static void omap1_init_ext_clk(struct clk *clk)
 	clk-> rate = 96000000 / dsor;
 }
 
-static void omap1_clk_disable(struct clk *clk)
+static void omap1_clk_disable(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+
 	if (clk->usecount > 0 && !(--clk->usecount)) {
-		clk->ops->disable(clk);
+		clk->ops->disable(&clk->clk_hw);
 		if (likely(clk->parent)) {
-			omap1_clk_disable(clk->parent);
+			omap1_clk_disable(&clk->parent->clk_hw);
 			if (clk->flags & CLOCK_NO_IDLE_PARENT)
-				omap1_clk_allow_idle(clk->parent);
+				omap1_clk_allow_idle(&clk->parent->clk_hw);
 		}
 	}
 }
 
-static omap1_clk_enable(struct clk *clk)
+static omap1_clk_enable(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int ret = 0;
 
 	if (clk->usecount++ == 0) {
 		if (clk->parent) {
-			ret = omap1_clk_enable(clk->parent);
+			ret = omap1_clk_enable(&clk->parent->clk_hw);
 			if (ret)
 				goto err;
 
 			if (clk->flags & CLOCK_NO_IDLE_PARENT)
-				omap1_clk_deny_idle(clk->parent);
+				omap1_clk_deny_idle(&clk->parent->clk_hw);
 		}
 
-		ret = clk->ops->enable(clk);
+		ret = clk->ops->enable(&clk->clk_hw);
 		if (ret) {
 			if (clk->parent)
-				omap1_clk_disable(clk->parent);
+				omap1_clk_disable(&clk->parent->clk_hw);
 			goto err;
 		}
 	}
@@ -695,8 +721,9 @@ static omap1_clk_enable(struct clk *clk)
 	return ret;
 }
 
-static int omap1_clk_enable_generic(struct clk *clk)
+static int omap1_clk_enable_generic(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	__u16 regval16;
 	__u32 regval32;
 
@@ -719,8 +746,9 @@ static int omap1_clk_enable_generic(struct clk *clk)
 	return 0;
 }
 
-static void omap1_clk_disable_generic(struct clk *clk)
+static void omap1_clk_disable_generic(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	__u16 regval16;
 	__u32 regval32;
 
@@ -738,13 +766,14 @@ static void omap1_clk_disable_generic(struct clk *clk)
 	}
 }
 
-static const struct clkops clkops_generic = {
+static const struct clk_ops clkops_generic = {
 	.enable		= omap1_clk_enable_generic,
 	.disable	= omap1_clk_disable_generic,
 };
 
-static unsigned long omap1_ckctl_recalc_dsp_domain(struct clk *clk)
+static unsigned long omap1_ckctl_recalc_dsp_domain(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int dsor;
 
 	/* Calculate divisor encoded as 2-bit exponent
@@ -761,42 +790,44 @@ static unsigned long omap1_ckctl_recalc_dsp_domain(struct clk *clk)
 	return clk->parent->rate / dsor;
 }
 
-static int omap1_clk_enable_dsp_domain(struct clk *clk)
+static int omap1_clk_enable_dsp_domain(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int retval;
 
 	retval = omap1_clk_enable(api_ck_p);
 	if (!retval) {
-		retval = omap1_clk_enable_generic(clk);
+		retval = omap1_clk_enable_generic(&clk->clk_hw);
 		omap1_clk_disable(api_ck_p);
 	}
 
 	return retval;
 }
 
-static void omap1_clk_disable_dsp_domain(struct clk *clk)
+static void omap1_clk_disable_dsp_domain(struct clk_hw *clk_hw)
 {
 	if (omap1_clk_enable(api_ck_p) == 0) {
-		omap1_clk_disable_generic(clk);
+		omap1_clk_disable_generic(clk_hw);
 		omap1_clk_disable(api_ck_p);
 	}
 }
 
-static const struct clkops clkops_dspck = {
+static const struct clk_ops clkops_dspck = {
 	.enable		= omap1_clk_enable_dsp_domain,
 	.disable	= omap1_clk_disable_dsp_domain,
 };
 
 /* XXX SYSC register handling does not belong in the clock framework */
-static int omap1_clk_enable_uart_functional_16xx(struct clk *clk)
+static int omap1_clk_enable_uart_functional_16xx(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int ret;
 	struct uart_clk *uclk;
 
-	ret = omap1_clk_enable_generic(clk);
+	ret = omap1_clk_enable_generic(&clk->clk_hw);
 	if (ret == 0) {
 		/* Set smart idle acknowledgement mode */
-		uclk = (struct uart_clk *)clk;
+		uclk = container_of(clk, struct uart_clk, clk);
 		omap_writeb((omap_readb(uclk->sysc_addr) & ~0x10) | 8,
 			    uclk->sysc_addr);
 	}
@@ -805,48 +836,52 @@ static int omap1_clk_enable_uart_functional_16xx(struct clk *clk)
 }
 
 /* XXX SYSC register handling does not belong in the clock framework */
-static void omap1_clk_disable_uart_functional_16xx(struct clk *clk)
+static void omap1_clk_disable_uart_functional_16xx(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	struct uart_clk *uclk;
 
 	/* Set force idle acknowledgement mode */
-	uclk = (struct uart_clk *)clk;
+	uclk = container_of(clk, struct uart_clk, clk);
 	omap_writeb((omap_readb(uclk->sysc_addr) & ~0x18), uclk->sysc_addr);
 
-	omap1_clk_disable_generic(clk);
+	omap1_clk_disable_generic(clk_hw);
 }
 
 /* XXX SYSC register handling does not belong in the clock framework */
-static const struct clkops clkops_uart_16xx = {
+static const struct clk_ops clkops_uart_16xx = {
 	.enable		= omap1_clk_enable_uart_functional_16xx,
 	.disable	= omap1_clk_disable_uart_functional_16xx,
 };
 
-static long omap1_clk_round_rate(struct clk *clk, unsigned long rate)
+static long omap1_clk_round_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+
 	if (clk->round_rate != NULL)
-		return clk->round_rate(clk, rate);
+		return clk->round_rate(clk_hw, rate);
 
 	return clk->rate;
 }
 
-static int omap1_clk_set_rate(struct clk *clk, unsigned long rate)
+static int omap1_clk_set_rate(struct clk_hw *clk_hw, unsigned long rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
 	int  ret = -EINVAL;
 
 	if (clk->set_rate)
-		ret = clk->set_rate(clk, rate);
+		ret = clk->set_rate(clk_hw, rate);
 	return ret;
 }
 
 /* Propagate rate to children */
-static void propagate_rate(struct clk *tclk)
+static void propagate_rate(struct omap1_clk *tclk)
 {
-	struct clk *clkp;
+	struct omap1_clk *clkp;
 
 	list_for_each_entry(clkp, &tclk->children, sibling) {
 		if (clkp->recalc)
-			clkp->rate = clkp->recalc(clkp);
+			clkp->rate = clkp->recalc(&clkp->clk_hw);
 		propagate_rate(clkp);
 	}
 }
@@ -864,7 +899,7 @@ int clk_enable(struct clk *clk)
 		return -EINVAL;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_enable(clk);
+	ret = omap1_clk_enable(clk->clk_hw);
 	spin_unlock_irqrestore(&clockfw_lock, flags);
 
 	return ret;
@@ -874,19 +909,20 @@ EXPORT_SYMBOL(clk_enable);
 void clk_disable(struct clk *clk)
 {
 	unsigned long flags;
+	struct omap1_clk *_clk = to_omap1_clk(clk->clk_hw);
 
 	if (clk == NULL || IS_ERR(clk))
 		return;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
-	if (clk->usecount == 0) {
+	if (_clk->usecount == 0) {
 		pr_err("Trying disable clock %s with 0 usecount\n",
-		       clk->name);
+		       _clk->name);
 		WARN_ON(1);
 		goto out;
 	}
 
-	omap1_clk_disable(clk);
+	omap1_clk_disable(clk->clk_hw);
 
 out:
 	spin_unlock_irqrestore(&clockfw_lock, flags);
@@ -902,7 +938,7 @@ unsigned long clk_get_rate(struct clk *clk)
 		return 0;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = clk->rate;
+	ret = to_omap1_clk(clk->clk_hw)->rate;
 	spin_unlock_irqrestore(&clockfw_lock, flags);
 
 	return ret;
@@ -922,7 +958,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 		return 0;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_round_rate(clk, rate);
+	ret = omap1_clk_round_rate(clk->clk_hw, rate);
 	spin_unlock_irqrestore(&clockfw_lock, flags);
 
 	return ret;
@@ -938,9 +974,9 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 		return ret;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_set_rate(clk, rate);
+	ret = omap1_clk_set_rate(clk->clk_hw, rate);
 	if (ret == 0)
-		propagate_rate(clk);
+		propagate_rate(to_omap1_clk(clk->clk_hw));
 	spin_unlock_irqrestore(&clockfw_lock, flags);
 
 	return ret;
@@ -957,7 +993,9 @@ EXPORT_SYMBOL(clk_set_parent);
 
 struct clk *clk_get_parent(struct clk *clk)
 {
-	return clk->parent;
+	struct omap1_clk *parent = to_omap1_clk(clk->clk_hw)->parent;
+
+	return &parent->clk_hw.clk;
 }
 EXPORT_SYMBOL(clk_get_parent);
 
@@ -966,8 +1004,10 @@ EXPORT_SYMBOL(clk_get_parent);
  */
 
 /* Used for clocks that always have same value as the parent clock */
-static unsigned long followparent_recalc(struct clk *clk)
+static unsigned long followparent_recalc(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+
 	return clk->parent->rate;
 }
 
@@ -975,27 +1015,31 @@ static unsigned long followparent_recalc(struct clk *clk)
  * Used for clocks that have the same value as the parent clock,
  * divided by some factor
  */
-static unsigned long omap_fixed_divisor_recalc(struct clk *clk)
+static unsigned long omap_fixed_divisor_recalc(struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+
 	WARN_ON(!clk->fixed_div);
 
 	return clk->parent->rate / clk->fixed_div;
 }
 
 /**
- * clk_preinit - initialize any fields in the struct clk before clk init
- * @clk: struct clk * to initialize
+ * clk_preinit - initialize any fields in the struct omap1_clk before clk init
+ * @clk: struct omap1_clk * to initialize
  *
- * Initialize any struct clk fields needed before normal clk initialization
+ * Initialize any struct omap1_clk fields needed before normal clk initialization
  * can run.  No return value.
  */
-static void clk_preinit(struct clk *clk)
+static void clk_preinit(struct omap1_clk *clk)
 {
 	INIT_LIST_HEAD(&clk->children);
 }
 
-static int clk_register(struct clk *clk)
+static int clk_register(struct device *dev, struct clk_hw *clk_hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(clk_hw);
+
 	if (clk == NULL || IS_ERR(clk))
 		return -EINVAL;
 
@@ -1005,13 +1049,15 @@ static int clk_register(struct clk *clk)
 	if (clk->node.next || clk->node.prev)
 		return 0;
 
+	clk_hw->clk.clk_hw = clk_hw;
+
 	mutex_lock(&clocks_mutex);
 	if (clk->parent)
 		list_add(&clk->sibling, &clk->parent->children);
 
 	list_add(&clk->node, &clocks);
 	if (clk->init)
-		clk->init(clk);
+		clk->init(&clk->clk_hw);
 	mutex_unlock(&clocks_mutex);
 
 	return 0;
@@ -1020,16 +1066,16 @@ static int clk_register(struct clk *clk)
 /*
  * Low level helpers
  */
-static int clkll_enable_null(struct clk *clk)
+static int clkll_enable_null(struct clk_hw *clk_hw)
 {
 	return 0;
 }
 
-static void clkll_disable_null(struct clk *clk)
+static void clkll_disable_null(struct clk_hw *clk_hw)
 {
 }
 
-static const struct clkops clkops_null = {
+static const struct clk_ops clkops_null = {
 	.enable		= clkll_enable_null,
 	.disable	= clkll_disable_null,
 };
@@ -1039,7 +1085,7 @@ static const struct clkops clkops_null = {
  *
  * Used for clock aliases that are needed on some OMAPs, but not others
  */
-static struct clk dummy_ck = {
+static struct omap1_clk dummy_ck = {
 	.name	= "dummy",
 	.ops	= &clkops_null,
 };
@@ -1052,7 +1098,7 @@ static struct clk dummy_ck = {
 /*
  * Disable any unused clocks left on by the bootloader
  */
-static void omap1_clk_disable_unused(struct clk *clk)
+static void omap1_clk_disable_unused(struct omap1_clk *clk)
 {
 	__u32 regval32;
 
@@ -1074,13 +1120,13 @@ static void omap1_clk_disable_unused(struct clk *clk)
 		return;
 
 	printk(KERN_INFO "Disabling unused clock \"%s\"... ", clk->name);
-	clk->ops->disable(clk);
+	clk->ops->disable(&clk->clk_hw);
 	printk(" done\n");
 }
 
 static int __init clk_disable_unused(void)
 {
-	struct clk *ck;
+	struct omap1_clk *ck;
 	unsigned long flags;
 
 	pr_info("clock: disabling unused clocks to save power\n");
@@ -1114,8 +1160,8 @@ static struct dentry *clk_debugfs_root;
 
 static int debug_clock_show(struct seq_file *s, void *unused)
 {
-	struct clk *c;
-	struct clk *pa;
+	struct omap1_clk *c;
+	struct omap1_clk *pa;
 
 	mutex_lock(&clocks_mutex);
 	seq_printf(s, "%-30s %-30s %-10s %s\n",
@@ -1134,10 +1180,10 @@ static int debug_clock_show(struct seq_file *s, void *unused)
 
 DEFINE_SHOW_ATTRIBUTE(debug_clock);
 
-static void clk_debugfs_register_one(struct clk *c)
+static void clk_debugfs_register_one(struct omap1_clk *c)
 {
 	struct dentry *d;
-	struct clk *pa = c->parent;
+	struct omap1_clk *pa = c->parent;
 
 	d = debugfs_create_dir(c->name, pa ? pa->dent : clk_debugfs_root);
 	c->dent = d;
@@ -1147,9 +1193,9 @@ static void clk_debugfs_register_one(struct clk *c)
 	debugfs_create_x8("flags", S_IRUGO, c->dent, &c->flags);
 }
 
-static void clk_debugfs_register(struct clk *c)
+static void clk_debugfs_register(struct omap1_clk *c)
 {
-	struct clk *pa = c->parent;
+	struct omap1_clk *pa = c->parent;
 
 	if (pa && !pa->dent)
 		clk_debugfs_register(pa);
@@ -1160,7 +1206,7 @@ static void clk_debugfs_register(struct clk *c)
 
 static int __init clk_debugfs_init(void)
 {
-	struct clk *c;
+	struct omap1_clk *c;
 	struct dentry *d;
 
 	d = debugfs_create_dir("clock", NULL);
@@ -1181,13 +1227,13 @@ late_initcall(clk_debugfs_init);
  * Omap1 clocks
  */
 
-static struct clk ck_ref = {
+static struct omap1_clk ck_ref = {
 	.name		= "ck_ref",
 	.ops		= &clkops_null,
 	.rate		= 12000000,
 };
 
-static struct clk ck_dpll1 = {
+static struct omap1_clk ck_dpll1 = {
 	.name		= "ck_dpll1",
 	.ops		= &clkops_null,
 	.parent		= &ck_ref,
@@ -1210,7 +1256,7 @@ static struct arm_idlect1_clk ck_dpll1out = {
 	.idlect_shift	= IDL_CLKOUT_ARM_SHIFT,
 };
 
-static struct clk sossi_ck = {
+static struct omap1_clk sossi_ck = {
 	.name		= "ck_sossi",
 	.ops		= &clkops_generic,
 	.parent		= &ck_dpll1out.clk,
@@ -1221,7 +1267,7 @@ static struct clk sossi_ck = {
 	.set_rate	= &omap1_set_sossi_rate,
 };
 
-static struct clk arm_ck = {
+static struct omap1_clk arm_ck = {
 	.name		= "arm_ck",
 	.ops		= &clkops_null,
 	.parent		= &ck_dpll1,
@@ -1251,7 +1297,7 @@ static struct arm_idlect1_clk armper_ck = {
  * FIXME: This clock seems to be necessary but no-one has asked for its
  * activation.  [ GPIO code for 1510 ]
  */
-static struct clk arm_gpio_ck = {
+static struct omap1_clk arm_gpio_ck = {
 	.name		= "ick",
 	.ops		= &clkops_generic,
 	.parent		= &ck_dpll1,
@@ -1300,7 +1346,7 @@ static struct arm_idlect1_clk armwdt_ck = {
 	.idlect_shift	= IDLWDT_ARM_SHIFT,
 };
 
-static struct clk arminth_ck16xx = {
+static struct omap1_clk arminth_ck16xx = {
 	.name		= "arminth_ck",
 	.ops		= &clkops_null,
 	.parent		= &arm_ck,
@@ -1312,7 +1358,7 @@ static struct clk arminth_ck16xx = {
 	 */
 };
 
-static struct clk dsp_ck = {
+static struct omap1_clk dsp_ck = {
 	.name		= "dsp_ck",
 	.ops		= &clkops_generic,
 	.parent		= &ck_dpll1,
@@ -1324,7 +1370,7 @@ static struct clk dsp_ck = {
 	.set_rate	= omap1_clk_set_rate_ckctl_arm,
 };
 
-static struct clk dspmmu_ck = {
+static struct omap1_clk dspmmu_ck = {
 	.name		= "dspmmu_ck",
 	.ops		= &clkops_null,
 	.parent		= &ck_dpll1,
@@ -1334,7 +1380,7 @@ static struct clk dspmmu_ck = {
 	.set_rate	= omap1_clk_set_rate_ckctl_arm,
 };
 
-static struct clk dspper_ck = {
+static struct omap1_clk dspper_ck = {
 	.name		= "dspper_ck",
 	.ops		= &clkops_dspck,
 	.parent		= &ck_dpll1,
@@ -1346,7 +1392,7 @@ static struct clk dspper_ck = {
 	.set_rate	= &omap1_clk_set_rate_dsp_domain,
 };
 
-static struct clk dspxor_ck = {
+static struct omap1_clk dspxor_ck = {
 	.name		= "dspxor_ck",
 	.ops		= &clkops_dspck,
 	.parent		= &ck_ref,
@@ -1355,7 +1401,7 @@ static struct clk dspxor_ck = {
 	.recalc		= &followparent_recalc,
 };
 
-static struct clk dsptim_ck = {
+static struct omap1_clk dsptim_ck = {
 	.name		= "dsptim_ck",
 	.ops		= &clkops_dspck,
 	.parent		= &ck_ref,
@@ -1378,7 +1424,7 @@ static struct arm_idlect1_clk tc_ck = {
 	.idlect_shift	= IDLIF_ARM_SHIFT,
 };
 
-static struct clk arminth_ck1510 = {
+static struct omap1_clk arminth_ck1510 = {
 	.name		= "arminth_ck",
 	.ops		= &clkops_null,
 	.parent		= &tc_ck.clk,
@@ -1389,7 +1435,7 @@ static struct clk arminth_ck1510 = {
 	 */
 };
 
-static struct clk tipb_ck = {
+static struct omap1_clk tipb_ck = {
 	/* No-idle controlled by "tc_ck" */
 	.name		= "tipb_ck",
 	.ops		= &clkops_null,
@@ -1397,7 +1443,7 @@ static struct clk tipb_ck = {
 	.recalc		= &followparent_recalc,
 };
 
-static struct clk l3_ocpi_ck = {
+static struct omap1_clk l3_ocpi_ck = {
 	/* No-idle controlled by "tc_ck" */
 	.name		= "l3_ocpi_ck",
 	.ops		= &clkops_generic,
@@ -1407,7 +1453,7 @@ static struct clk l3_ocpi_ck = {
 	.recalc		= &followparent_recalc,
 };
 
-static struct clk tc1_ck = {
+static struct omap1_clk tc1_ck = {
 	.name		= "tc1_ck",
 	.ops		= &clkops_generic,
 	.parent		= &tc_ck.clk,
@@ -1420,7 +1466,7 @@ static struct clk tc1_ck = {
  * FIXME: This clock seems to be necessary but no-one has asked for its
  * activation.  [ pm.c (SRAM), CCP, Camera ]
  */
-static struct clk tc2_ck = {
+static struct omap1_clk tc2_ck = {
 	.name		= "tc2_ck",
 	.ops		= &clkops_generic,
 	.parent		= &tc_ck.clk,
@@ -1429,7 +1475,7 @@ static struct clk tc2_ck = {
 	.recalc		= &followparent_recalc,
 };
 
-static struct clk dma_ck = {
+static struct omap1_clk dma_ck = {
 	/* No-idle controlled by "tc_ck" */
 	.name		= "dma_ck",
 	.ops		= &clkops_null,
@@ -1437,7 +1483,7 @@ static struct clk dma_ck = {
 	.recalc		= &followparent_recalc,
 };
 
-static struct clk dma_lcdfree_ck = {
+static struct omap1_clk dma_lcdfree_ck = {
 	.name		= "dma_lcdfree_ck",
 	.ops		= &clkops_null,
 	.parent		= &tc_ck.clk,
@@ -1470,21 +1516,21 @@ static struct arm_idlect1_clk lb_ck = {
 	.idlect_shift	= IDLLB_ARM_SHIFT,
 };
 
-static struct clk rhea1_ck = {
+static struct omap1_clk rhea1_ck = {
 	.name		= "rhea1_ck",
 	.ops		= &clkops_null,
 	.parent		= &tc_ck.clk,
 	.recalc		= &followparent_recalc,
 };
 
-static struct clk rhea2_ck = {
+static struct omap1_clk rhea2_ck = {
 	.name		= "rhea2_ck",
 	.ops		= &clkops_null,
 	.parent		= &tc_ck.clk,
 	.recalc		= &followparent_recalc,
 };
 
-static struct clk lcd_ck_16xx = {
+static struct omap1_clk lcd_ck_16xx = {
 	.name		= "lcd_ck",
 	.ops		= &clkops_generic,
 	.parent		= &ck_dpll1,
@@ -1518,7 +1564,7 @@ static struct arm_idlect1_clk lcd_ck_1510 = {
  *
  * XXX does this need SYSC register handling?
  */
-static struct clk uart1_1510 = {
+static struct omap1_clk uart1_1510 = {
 	.name		= "uart1_ck",
 	.ops		= &clkops_null,
 	/* Direct from ULPD, no real parent */
@@ -1557,7 +1603,7 @@ static struct uart_clk uart1_16xx = {
  *
  * XXX does this need SYSC register handling?
  */
-static struct clk uart2_ck = {
+static struct omap1_clk uart2_ck = {
 	.name		= "uart2_ck",
 	.ops		= &clkops_null,
 	/* Direct from ULPD, no real parent */
@@ -1576,7 +1622,7 @@ static struct clk uart2_ck = {
  *
  * XXX does this need SYSC register handling?
  */
-static struct clk uart3_1510 = {
+static struct omap1_clk uart3_1510 = {
 	.name		= "uart3_ck",
 	.ops		= &clkops_null,
 	/* Direct from ULPD, no real parent */
@@ -1609,7 +1655,7 @@ static struct uart_clk uart3_16xx = {
 	.sysc_addr	= 0xfffb9854,
 };
 
-static struct clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
+static struct omap1_clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
 	.name		= "usb_clko",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
@@ -1619,7 +1665,7 @@ static struct clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
 	.enable_bit	= USB_MCLK_EN_BIT,
 };
 
-static struct clk usb_hhc_ck1510 = {
+static struct omap1_clk usb_hhc_ck1510 = {
 	.name		= "usb_hhc_ck",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
@@ -1629,7 +1675,7 @@ static struct clk usb_hhc_ck1510 = {
 	.enable_bit	= USB_HOST_HHC_UHOST_EN,
 };
 
-static struct clk usb_hhc_ck16xx = {
+static struct omap1_clk usb_hhc_ck16xx = {
 	.name		= "usb_hhc_ck",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
@@ -1640,7 +1686,7 @@ static struct clk usb_hhc_ck16xx = {
 	.enable_bit	= OTG_SYSCON_2_UHOST_EN_SHIFT
 };
 
-static struct clk usb_dc_ck = {
+static struct omap1_clk usb_dc_ck = {
 	.name		= "usb_dc_ck",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
@@ -1649,7 +1695,7 @@ static struct clk usb_dc_ck = {
 	.enable_bit	= SOFT_USB_OTG_DPLL_REQ_SHIFT,
 };
 
-static struct clk uart1_7xx = {
+static struct omap1_clk uart1_7xx = {
 	.name		= "uart1_ck",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
@@ -1658,7 +1704,7 @@ static struct clk uart1_7xx = {
 	.enable_bit	= 9,
 };
 
-static struct clk uart2_7xx = {
+static struct omap1_clk uart2_7xx = {
 	.name		= "uart2_ck",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
@@ -1667,7 +1713,7 @@ static struct clk uart2_7xx = {
 	.enable_bit	= 11,
 };
 
-static struct clk mclk_1510 = {
+static struct omap1_clk mclk_1510 = {
 	.name		= "mclk",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
@@ -1676,7 +1722,7 @@ static struct clk mclk_1510 = {
 	.enable_bit	= SOFT_COM_MCKO_REQ_SHIFT,
 };
 
-static struct clk mclk_16xx = {
+static struct omap1_clk mclk_16xx = {
 	.name		= "mclk",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
@@ -1687,14 +1733,14 @@ static struct clk mclk_16xx = {
 	.init		= &omap1_init_ext_clk,
 };
 
-static struct clk bclk_1510 = {
+static struct omap1_clk bclk_1510 = {
 	.name		= "bclk",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
 	.rate		= 12000000,
 };
 
-static struct clk bclk_16xx = {
+static struct omap1_clk bclk_16xx = {
 	.name		= "bclk",
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
@@ -1705,7 +1751,7 @@ static struct clk bclk_16xx = {
 	.init		= &omap1_init_ext_clk,
 };
 
-static struct clk mmc1_ck = {
+static struct omap1_clk mmc1_ck = {
 	.name		= "mmc1_ck",
 	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
@@ -1720,7 +1766,7 @@ static struct clk mmc1_ck = {
  * XXX MOD_CONF_CTRL_0 bit 20 is defined in the 1510 TRM as
  * CONF_MOD_MCBSP3_AUXON ??
  */
-static struct clk mmc2_ck = {
+static struct omap1_clk mmc2_ck = {
 	.name		= "mmc2_ck",
 	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
@@ -1731,7 +1777,7 @@ static struct clk mmc2_ck = {
 	.enable_bit	= 20,
 };
 
-static struct clk mmc3_ck = {
+static struct omap1_clk mmc3_ck = {
 	.name		= "mmc3_ck",
 	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
@@ -1742,7 +1788,7 @@ static struct clk mmc3_ck = {
 	.enable_bit	= SOFT_MMC_DPLL_REQ_SHIFT,
 };
 
-static struct clk virtual_ck_mpu = {
+static struct omap1_clk virtual_ck_mpu = {
 	.name		= "mpu",
 	.ops		= &clkops_null,
 	.parent		= &arm_ck, /* Is smarter alias for */
@@ -1753,7 +1799,7 @@ static struct clk virtual_ck_mpu = {
 
 /* virtual functional clock domain for I2C. Just for making sure that ARMXOR_CK
 remains active during MPU idle whenever this is enabled */
-static struct clk i2c_fck = {
+static struct omap1_clk i2c_fck = {
 	.name		= "i2c_fck",
 	.ops		= &clkops_null,
 	.flags		= CLOCK_NO_IDLE_PARENT,
@@ -1761,7 +1807,7 @@ static struct clk i2c_fck = {
 	.recalc		= &followparent_recalc,
 };
 
-static struct clk i2c_ick = {
+static struct omap1_clk i2c_ick = {
 	.name		= "i2c_ick",
 	.ops		= &clkops_null,
 	.flags		= CLOCK_NO_IDLE_PARENT,
@@ -1773,7 +1819,7 @@ static struct clk i2c_ick = {
  * clkdev integration
  */
 
-static struct omap_clk omap_clks[] = {
+static struct omap1_clk_lookup omap_clks[] = {
 	/* non-ULPD clocks */
 	CLK(NULL,	"ck_ref",	&ck_ref,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
 	CLK(NULL,	"ck_dpll1",	&ck_dpll1,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
@@ -1866,7 +1912,7 @@ static void __init omap1_show_rates(void)
 
 int __init omap1_clk_init(void)
 {
-	struct omap_clk *c;
+	struct omap1_clk_lookup *c;
 	int crystal_type = 0; /* Default 12 MHz */
 	u32 reg;
 
@@ -1888,7 +1934,7 @@ int __init omap1_clk_init(void)
 	arm_idlect1_mask = ~0;
 
 	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
-		clk_preinit(c->lk.clk);
+		clk_preinit(to_omap1_clk(c->lk.clk_hw));
 
 	cpu_mask = 0;
 	if (cpu_is_omap1710())
@@ -1905,13 +1951,13 @@ int __init omap1_clk_init(void)
 	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
 		if (c->cpu & cpu_mask) {
 			clkdev_add(&c->lk);
-			clk_register(c->lk.clk);
+			clk_register(NULL, c->lk.clk_hw);
 		}
 
 	/* Pointers to these clocks are needed by code in clock.c */
-	api_ck_p = clk_get(NULL, "api_ck");
-	ck_dpll1_p = clk_get(NULL, "ck_dpll1");
-	ck_ref_p = clk_get(NULL, "ck_ref");
+	api_ck_p = &api_ck.clk.clk_hw;
+	ck_dpll1_p = &ck_dpll1.clk_hw;
+	ck_ref_p = &ck_ref.clk_hw;
 
 	if (cpu_is_omap7xx())
 		ck_ref.rate = 13000000;
@@ -1994,12 +2040,12 @@ int __init omap1_clk_init(void)
 	 * Only enable those clocks we will need, let the drivers
 	 * enable other clocks as necessary
 	 */
-	clk_enable(&armper_ck.clk);
-	clk_enable(&armxor_ck.clk);
-	clk_enable(&armtim_ck.clk); /* This should be done by timer code */
+	omap1_clk_enable(&armper_ck.clk.clk_hw);
+	omap1_clk_enable(&armxor_ck.clk.clk_hw);
+	omap1_clk_enable(&armtim_ck.clk.clk_hw); /* This should be done by timer code */
 
 	if (cpu_is_omap15xx())
-		clk_enable(&arm_gpio_ck);
+		omap1_clk_enable(&arm_gpio_ck.clk_hw);
 
 	return 0;
 }
@@ -2011,7 +2057,7 @@ void __init omap1_clk_late_init(void)
 	unsigned long rate = ck_dpll1.rate;
 
 	/* Find the highest supported frequency and enable it */
-	if (omap1_select_table_rate(&virtual_ck_mpu, ~0)) {
+	if (omap1_select_table_rate(&virtual_ck_mpu.clk_hw, ~0)) {
 		pr_err("System frequencies not set, using default. Check your config.\n");
 		/*
 		 * Reprogramming the DPLL is tricky, it must be done from SRAM.
-- 
2.20.0

