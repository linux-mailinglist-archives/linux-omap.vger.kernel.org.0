Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B324386CA5
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389974AbfHHVoq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:44:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45475 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfHHVoq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:44:46 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mi2eP-1iZYbR2men-00e8dS; Thu, 08 Aug 2019 23:44:16 +0200
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
Subject: [PATCH 21/22] ARM: omap1: use common clk framework
Date:   Thu,  8 Aug 2019 23:43:39 +0200
Message-Id: <20190808214347.2865294-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808214347.2865294-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808214347.2865294-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GQIn1tnKFajJAEk26jAMrrfsIrasnMIc5IJrTtbH4vX4wMZ/nlo
 Pe7NOrxJYdEhtvdWKFmane20TcDdxDqP+/10nbePXuUa+KV+ImVxej3Hs9tkt85D+GWQhnr
 jyCpgxiP7zDfXdR9AkYHftd88kgy7pi9pn/keCEGZ4xpyMsT/nW/cSPztjhFWbTeBrQRgft
 CQTb5GXOkhXzGIY7hZE5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VLFzM9nHg98=:6iqdv3DdnolRFOat8mfQv/
 g25M4pkILEGBgQk3DWOznzVih8/JwkvivS5p3hE5r4xjnMIZftk/y67s8t26h8Y0ZCBeSCUD6
 KV3/Zbf3HQrzIQcwr8czjVw8qnFUeQrNlTIkrjPefzJGczIZdj4xtJA3QthB1HBvbfVqlJBPc
 6WyfpT/07OaeB1nwpStohbQr21CL7Tgi0vG9Vk2pZz3wtYuXmRlsOUXufQORzS+yCZgyZmpvJ
 SRYx8ebfCL25sQ5FvSuKB2dmuR49+FGhcfelH9zllwMZHKd3EXM80jbaQa6Jb146gMHIgfSe1
 4I9q/aBBk8DJel/iPeEZd78447X1P6eOUj7cE3z69OPpXjd1a0I4MUgI8SQFvT64Y7auAMSrK
 7wdPQtUq7OVdbjpoR3Or2G1VgvAPxDK57YeSWtQ3VXEmWqXQaQFQMqyLSE/UeTcAOoGCRvkZI
 IvfSANofRM/nhFEUUv3cvZMeCW/j7PEibXp+hM+0AVvm2feYMHO6j/jxKG8LxFFJnhbi/et0v
 ChUfLvFK7sn7N2rqeywVlIikb1MCtnYkFHhRV9EebK9obeBGJdiUG/sK/JmuQXyQ3p6TZIwff
 HHCtF/3E69hNJQK97bX1r2QppgJl8ZnbJI5HAd795/e5lBz+3wDlLJi/a/wMdYsUxDbkJWI9h
 KcrIWFzjXHXhUXUAN6Yz5Fffq5+e3nNBBd4Dpk+dEstmR3FtI5WhJ0s0HwwzDx3S6f8RGsqLF
 XPB1ksoL5yWQcMBIQIaO7HnGIY4nJGsH2dlY3Q==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The omap1 clock driver now uses types and calling conventions
that are compatible with the common clk core.

Turn on CONFIG_COMMON_CLK and remove all the code that is
now duplicated.

Note: if this previous steps didn't already break it, this one
most likely will, because the interfaces are very likely to
have different semantics.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig            |   1 +
 arch/arm/mach-omap1/clock.c | 413 +-----------------------------------
 2 files changed, 4 insertions(+), 410 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0febd7a1d65f..17a21f75f386 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -496,6 +496,7 @@ config ARCH_OMAP1
 	select ARCH_OMAP
 	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
+	select COMMON_CLK
 	select FORCE_PCI if PCCARD
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_IRQ_CHIP
diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index a951c787adb4..1f105c659e7e 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -10,6 +10,7 @@
  */
 #include <linux/kernel.h>
 #include <linux/export.h>
+#include <linux/clk-provider.h>
 #include <linux/list.h>
 #include <linux/errno.h>
 #include <linux/err.h>
@@ -52,32 +53,6 @@ struct omap1_clk_lookup {
 #define CK_16XX		(1 << 3)	/* 16xx, 17xx, 5912 */
 #define CK_1710		(1 << 4)	/* 1710 extra for rate selection */
 
-/**
- * struct clk_ops - some clock function pointers
- * @enable: fn ptr that enables the current clock in hardware
- * @disable: fn ptr that enables the current clock in hardware
- * @recalc_rate: fn ptr that returns the clock's current rate
- * @set_rate: fn ptr that can change the clock's current rate
- * @round_rate: fn ptr that can round the clock's current rate
- * @init: fn ptr to do clock-specific initialization
- *
- * A "companion" clk is an accompanying clock to the one being queried
- * that must be enabled for the IP module connected to the clock to
- * become accessible by the hardware.  Neither @find_idlest nor
- * block-specific; the hwmod code has been created to handle this, but
- * until hwmod data is ready and drivers have been converted to use PM
- * runtime calls in place of clk_enable()/clk_disable(), @find_idlest and
- * @find_companion must, unfortunately, remain.
- */
-struct clk_ops {
-	int		(*enable)(struct clk_hw *);
-	void		(*disable)(struct clk_hw *);
-	unsigned long	(*recalc_rate)(struct clk_hw *, unsigned long);
-	int		(*set_rate)(struct clk_hw *, unsigned long, unsigned long);
-	long		(*round_rate)(struct clk_hw *, unsigned long, unsigned long *);
-	void		(*init)(struct clk_hw *);
-};
-
 /*
  * struct omap1_clk.flags possibilities
  *
@@ -90,12 +65,8 @@ struct clk_ops {
 
 /**
  * struct omap1_clk - OMAP struct clk
- * @node: list_head connecting this clock into the full clock list
  * @ops: struct clkops * for this clock
  * @name: the name of the clock in the hardware (used in hwmod data and debug)
- * @parent: pointer to this clock's parent struct clk
- * @children: list_head connecting to the child clks' @sibling list_heads
- * @sibling: list_head connecting this clk to its parent clk's @children
  * @rate: current clock rate
  * @enable_reg: register to write to enable the clock (see @enable_bit)
  * @enable_bit: bitshift to write to enable/disable the clock (see @enable_reg)
@@ -115,38 +86,13 @@ struct clk_ops {
  * clocks and decremented by the clock code when clk_disable() is
  * called on child clocks.
  *
- * XXX @clkdm, @usecount, @children, @sibling should be marked for
- * internal use only.
- *
- * @children and @sibling are used to optimize parent-to-child clock
- * tree traversals.  (child-to-parent traversals use @parent.)
+ * XXX @usecount should be marked for internal use only.
  *
  * XXX The notion of the clock's current rate probably needs to be
  * separated from the clock's target rate.
  */
-struct clk {
-	struct clk_hw		*clk_hw;
-};
-
-struct clk_init_data {
-	const char		*name;
-	const struct clk_ops	*ops;
-	const struct clk_hw	**parent_hws;
-	u8			num_parents;
-	unsigned long		flags;
-};
-
-struct clk_hw {
-	struct clk		clk;
-	const struct clk_init_data *init;
-};
-
 struct omap1_clk {
 	struct clk_hw		clk_hw;
-	struct list_head	node;
-	struct omap1_clk	*parent;
-	struct list_head	children;
-	struct list_head	sibling;	/* node for children */
 	unsigned long		rate;
 	void __iomem		*enable_reg;
 	u8			enable_bit;
@@ -267,10 +213,6 @@ static u32 cpu_mask;
 __u32 arm_idlect1_mask;
 static struct clk_hw *api_ck_p, *ck_dpll1_p, *ck_ref_p;
 
-static LIST_HEAD(clocks);
-static DEFINE_MUTEX(clocks_mutex);
-static DEFINE_SPINLOCK(clockfw_lock);
-
 /*
  * Omap1 specific clock functions
  */
@@ -677,16 +619,6 @@ static void omap1_init_ext_clk(struct clk_hw *clk_hw)
 	clk-> rate = 96000000 / dsor;
 }
 
-struct clk_hw *clk_hw_get_parent(const struct clk_hw *clk_hw)
-{
-	struct omap1_clk *clk = to_omap1_clk(clk_hw);
-
-	if (!clk->parent)
-		return NULL;
-
-	return &clk->parent->clk_hw;
-}
-
 static void omap1_clk_disable(struct clk_hw *clk_hw)
 {
 	struct omap1_clk *clk = to_omap1_clk(clk_hw);
@@ -860,173 +792,11 @@ static const struct clk_ops clkops_uart_16xx = {
 	.disable	= omap1_clk_disable_uart_functional_16xx,
 };
 
-static long omap1_clk_round_rate(struct clk_hw *clk_hw, unsigned long rate)
-{
-	struct omap1_clk *clk = to_omap1_clk(clk_hw);
-	struct clk_hw *parent = clk_hw_get_parent(clk_hw);
-	struct omap1_clk *parent_clk;
-	unsigned long parent_rate = 0;
-
-	if (parent) {
-		parent_clk = to_omap1_clk(parent);
-		parent_rate = parent_clk->rate;
-	}
-
-	if (clk_hw->init->ops->round_rate != NULL)
-		return clk_hw->init->ops->round_rate(clk_hw, rate, &parent_rate);
-
-	if (parent)
-		parent_clk->rate = parent_rate;
-
-	return clk->rate;
-}
-
-static int omap1_clk_set_rate(struct clk_hw *clk_hw, unsigned long rate)
-{
-	struct clk_hw *parent = clk_hw_get_parent(clk_hw);
-	unsigned long parent_rate = 0;
-	int  ret = -EINVAL;
-
-	if (parent)
-		parent_rate = to_omap1_clk(parent)->rate;
-
-	if (clk_hw->init->ops->set_rate)
-		ret = clk_hw->init->ops->set_rate(clk_hw, rate, parent_rate);
-
-	return ret;
-}
-
 /* Propagate rate to children */
 static void propagate_rate(struct omap1_clk *tclk)
 {
-	struct omap1_clk *clkp;
-
-	list_for_each_entry(clkp, &tclk->children, sibling) {
-		if (clkp->clk_hw.init->ops->recalc_rate)
-			clkp->rate = clkp->clk_hw.init->ops->recalc_rate(&clkp->clk_hw, tclk->rate);
-		propagate_rate(clkp);
-	}
-}
-
-/*
- * Omap1 clock reset and init functions
- */
-
-int clk_enable(struct clk *clk)
-{
-	unsigned long flags;
-	int ret;
-
-	if (clk == NULL || IS_ERR(clk))
-		return -EINVAL;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_enable(clk->clk_hw);
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL(clk_enable);
-
-void clk_disable(struct clk *clk)
-{
-	unsigned long flags;
-	struct omap1_clk *_clk = to_omap1_clk(clk->clk_hw);
-
-	if (clk == NULL || IS_ERR(clk))
-		return;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	if (_clk->usecount == 0) {
-		pr_err("Trying disable clock %s with 0 usecount\n",
-		       _clk->clk_hw.init->name);
-		WARN_ON(1);
-		goto out;
-	}
-
-	omap1_clk_disable(clk->clk_hw);
-
-out:
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-}
-EXPORT_SYMBOL(clk_disable);
-
-unsigned long clk_get_rate(struct clk *clk)
-{
-	unsigned long flags;
-	unsigned long ret;
-
-	if (clk == NULL || IS_ERR(clk))
-		return 0;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = to_omap1_clk(clk->clk_hw)->rate;
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL(clk_get_rate);
-
-/*
- * Optional clock functions defined in include/linux/clk.h
- */
-
-long clk_round_rate(struct clk *clk, unsigned long rate)
-{
-	unsigned long flags;
-	long ret;
-
-	if (clk == NULL || IS_ERR(clk))
-		return 0;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_round_rate(clk->clk_hw, rate);
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return ret;
+	clk_set_rate(tclk->clk_hw.clk, tclk->rate);
 }
-EXPORT_SYMBOL(clk_round_rate);
-
-int clk_set_rate(struct clk *clk, unsigned long rate)
-{
-	unsigned long flags;
-	int ret = -EINVAL;
-
-	if (clk == NULL || IS_ERR(clk))
-		return ret;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_set_rate(clk->clk_hw, rate);
-	if (ret == 0)
-		propagate_rate(to_omap1_clk(clk->clk_hw));
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL(clk_set_rate);
-
-int clk_set_parent(struct clk *clk, struct clk *parent)
-{
-	WARN_ONCE(1, "clk_set_parent() not implemented for OMAP1\n");
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL(clk_set_parent);
-
-struct clk *clk_get_parent(struct clk *clk)
-{
-	struct clk_hw *parent = clk_hw_get_parent(clk->clk_hw);
-
-	if (!parent)
-		return NULL;
-
-	return &parent->clk;
-}
-EXPORT_SYMBOL(clk_get_parent);
-
-/*
- * OMAP specific clock functions shared between omap1 and omap2
- */
 
 /* Used for clocks that always have same value as the parent clock */
 static unsigned long followparent_recalc(struct clk_hw *clk_hw, unsigned long parent_rate)
@@ -1047,47 +817,6 @@ static unsigned long omap_fixed_divisor_recalc(struct clk_hw *clk_hw, unsigned l
 	return parent_rate / clk->fixed_div;
 }
 
-/**
- * clk_preinit - initialize any fields in the struct omap1_clk before clk init
- * @clk: struct omap1_clk * to initialize
- *
- * Initialize any struct omap1_clk fields needed before normal clk initialization
- * can run.  No return value.
- */
-static void clk_preinit(struct omap1_clk *clk)
-{
-	INIT_LIST_HEAD(&clk->children);
-}
-
-static int clk_register(struct device *dev, struct clk_hw *clk_hw)
-{
-	struct omap1_clk *clk = to_omap1_clk(clk_hw);
-
-	if (clk == NULL || IS_ERR(clk))
-		return -EINVAL;
-
-	/*
-	 * trap out already registered clocks
-	 */
-	if (clk->node.next || clk->node.prev)
-		return 0;
-
-	clk_hw->clk.clk_hw = clk_hw;
-
-	mutex_lock(&clocks_mutex);
-	if (clk_hw->init->num_parents) {
-		clk->parent = to_omap1_clk(clk_hw->init->parent_hws[0]);
-		list_add(&clk->sibling, &clk->parent->children);
-	}
-
-	list_add(&clk->node, &clocks);
-	if (clk_hw->init->ops->init)
-		clk_hw->init->ops->init(clk_hw);
-	mutex_unlock(&clocks_mutex);
-
-	return 0;
-}
-
 /*
  * Low level helpers
  */
@@ -1135,139 +864,6 @@ static struct omap1_clk dummy_ck = {
 	CLK_INIT_ROOT("dummy", &clkops_null),
 };
 
-/*
- *
- */
-
-#ifdef CONFIG_OMAP_RESET_CLOCKS
-/*
- * Disable any unused clocks left on by the bootloader
- */
-static void omap1_clk_disable_unused(struct omap1_clk *clk)
-{
-	__u32 regval32;
-
-	/* Clocks in the DSP domain need api_ck. Just assume bootloader
-	 * has not enabled any DSP clocks */
-	if (clk->enable_reg == DSP_IDLECT2) {
-		pr_info("Skipping reset check for DSP domain clock \"%s\"\n",
-			clk->clk_hw.init->name);
-		return;
-	}
-
-	/* Is the clock already disabled? */
-	if (clk->flags & ENABLE_REG_32BIT)
-		regval32 = __raw_readl(clk->enable_reg);
-	else
-		regval32 = __raw_readw(clk->enable_reg);
-
-	if ((regval32 & (1 << clk->enable_bit)) == 0)
-		return;
-
-	printk(KERN_INFO "Disabling unused clock \"%s\"... ", clk->clk_hw.init->name);
-	clk->clk_hw.init->ops->disable(&clk->clk_hw);
-	printk(" done\n");
-}
-
-static int __init clk_disable_unused(void)
-{
-	struct omap1_clk *ck;
-	unsigned long flags;
-
-	pr_info("clock: disabling unused clocks to save power\n");
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	list_for_each_entry(ck, &clocks, node) {
-		if (ck->clk_hw.init->ops == &clkops_null)
-			continue;
-
-		if (ck->usecount > 0 || !ck->enable_reg)
-			continue;
-
-		omap1_clk_disable_unused(ck);
-	}
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return 0;
-}
-late_initcall(clk_disable_unused);
-#endif
-
-#if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
-/*
- *	debugfs support to trace clock tree hierarchy and attributes
- */
-
-#include <linux/debugfs.h>
-#include <linux/seq_file.h>
-
-static struct dentry *clk_debugfs_root;
-
-static int debug_clock_show(struct seq_file *s, void *unused)
-{
-	struct omap1_clk *c;
-	struct omap1_clk *pa;
-
-	mutex_lock(&clocks_mutex);
-	seq_printf(s, "%-30s %-30s %-10s %s\n",
-		   "clock-name", "parent-name", "rate", "use-count");
-
-	list_for_each_entry(c, &clocks, node) {
-		pa = c->parent;
-		seq_printf(s, "%-30s %-30s %-10lu %d\n",
-			   c->name, pa ? pa->name : "none", c->rate,
-			   c->usecount);
-	}
-	mutex_unlock(&clocks_mutex);
-
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(debug_clock);
-
-static void clk_debugfs_register_one(struct omap1_clk *c)
-{
-	struct dentry *d;
-	struct omap1_clk *pa = c->parent;
-
-	d = debugfs_create_dir(c->name, pa ? pa->dent : clk_debugfs_root);
-	c->dent = d;
-
-	debugfs_create_u8("usecount", S_IRUGO, c->dent, &c->usecount);
-	debugfs_create_ulong("rate", S_IRUGO, c->dent, &c->rate);
-	debugfs_create_x8("flags", S_IRUGO, c->dent, &c->flags);
-}
-
-static void clk_debugfs_register(struct omap1_clk *c)
-{
-	struct omap1_clk *pa = c->parent;
-
-	if (pa && !pa->dent)
-		clk_debugfs_register(pa);
-
-	if (!c->dent)
-		clk_debugfs_register_one(c);
-}
-
-static int __init clk_debugfs_init(void)
-{
-	struct omap1_clk *c;
-	struct dentry *d;
-
-	d = debugfs_create_dir("clock", NULL);
-	clk_debugfs_root = d;
-
-	list_for_each_entry(c, &clocks, node)
-		clk_debugfs_register(c);
-
-	debugfs_create_file("summary", S_IRUGO, d, NULL, &debug_clock_fops);
-
-	return 0;
-}
-late_initcall(clk_debugfs_init);
-
-#endif /* defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS) */
-
 /*
  * Omap1 clocks
  */
@@ -1897,9 +1493,6 @@ int __init omap1_clk_init(void)
 	/* By default all idlect1 clocks are allowed to idle */
 	arm_idlect1_mask = ~0;
 
-	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
-		clk_preinit(to_omap1_clk(c->lk.clk_hw));
-
 	cpu_mask = 0;
 	if (cpu_is_omap1710())
 		cpu_mask |= CK_1710;
-- 
2.20.0

