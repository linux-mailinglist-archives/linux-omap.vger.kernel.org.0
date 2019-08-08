Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D740E86C99
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733140AbfHHVno (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:43:44 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56213 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733295AbfHHVno (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:43:44 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MGhi0-1i9bYi2gEs-00DsZM; Thu, 08 Aug 2019 23:43:02 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Paul Walmsley <paul@pwsan.com>,
        Kevin Hilman <khilman@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 16/22] ARM: omap1: move clk support into a single file
Date:   Thu,  8 Aug 2019 23:41:26 +0200
Message-Id: <20190808214232.2798396-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808214232.2798396-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808214232.2798396-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:esNHGviDobkgGOdcVSEFZe01urPRNHC2Mha6XfJrImPmyRZiCEw
 mK2n3I7x/p+OzgjiP0Af9UVZZ5DXvUshrOr6cYQLFPojbw+ag93wpDeaYJt7lRhusiha1xZ
 qbuk/oPK+c63S2jJviggkye41tC8EMRnHHGllWudUrGf1PWLlDGfv/LDDuRgkPd4U+3QngF
 1ugdtKkLzOSaVSB/N3+FA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QS6dRrmqwwA=:OoEPpbFvGeVrTJDY9LOFik
 EdEHX2VbeyFLWml4uqhbRMAHL7EjBFbTBwJ7OXOtCBKfMUN3YxmEly0sE4WK2lAVwJ73y1RV2
 nO9q/TJUISuw145gCsgN5v41K1eKQntWcXB3b9ohWbPM7/v34IC/vuVwE9DgtJl/EToqrfpSx
 m25djJBPva9EtkiGma4KOt5Pw33ptAu0bujUip4iMUQpbWylyKtezJBLUvCAg15q6kRKPNmlj
 fw0V9ni5lHppxSqcGs08nFkztlfIJWm6ktcNX4GjECYcKYX0naCQLzyq4xUvkMBdnzH5Yrk4P
 t/AG2SveaD1gfkauB+W+QwzhESLqkpksmJt7u/nlsEPNBrID2B0En6vpIubybqtyggVIHecRr
 3hyC7Rdy3nzhQkNeVHlu5eM+SXbZxMXi07dYYv08seDIowCRJy3fKemd8skB0Zgot4TfI+92b
 0IXplxrW/5+4L8lwm0PiedObNWTnrceGTF2V5HYgcDC8MCYqLLN6Kw3SAZ8KegPbiXQDwYDDJ
 /gYw8xDdgk8Y4dcaUeQsDnIM/QwfPRo0zE+9R5bb9an4jCqJs4thF1971GCncDFiw2KlC1Apa
 +J+rLUKJW2jsCmC16af8WL4ALqKzB2B4iKMl+pN58i7XMCKPRckVSSRsU+HfK43FqV8J3IDvq
 m7fgD3FGf1HaZa/lfqrIb9OLrpCbOiS831FsSDwwlrYMPEd3DTcXB316z1tHn3s+MAHO98/AI
 mMQrTXtBzfC0HI+Hgwyj7JEbowIMJAJISNsLdg==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The omap1 clock support is traditionally split into the clock.c,
clock_data.c and opp_data.c files. As a preparation for cleaning
this up, move everything into one file.

No functional change, each added line comes from an existing file.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/Makefile         |    2 +-
 arch/arm/mach-omap1/board-nokia770.c |    1 -
 arch/arm/mach-omap1/clock.c          | 1215 +++++++++++++++++++++++++-
 arch/arm/mach-omap1/clock.h          |  288 ------
 arch/arm/mach-omap1/clock_data.c     |  920 -------------------
 arch/arm/mach-omap1/common.h         |    2 +
 arch/arm/mach-omap1/devices.c        |    1 -
 arch/arm/mach-omap1/io.c             |    1 -
 arch/arm/mach-omap1/opp.h            |   26 -
 arch/arm/mach-omap1/opp_data.c       |   51 --
 arch/arm/mach-omap1/pm.c             |    1 -
 11 files changed, 1216 insertions(+), 1292 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/clock.h
 delete mode 100644 arch/arm/mach-omap1/clock_data.c
 delete mode 100644 arch/arm/mach-omap1/opp.h
 delete mode 100644 arch/arm/mach-omap1/opp_data.c

diff --git a/arch/arm/mach-omap1/Makefile b/arch/arm/mach-omap1/Makefile
index 450bbf552b57..1337d7a2754c 100644
--- a/arch/arm/mach-omap1/Makefile
+++ b/arch/arm/mach-omap1/Makefile
@@ -6,7 +6,7 @@
 # Common support
 obj-y := io.o id.o sram-init.o sram.o time.o irq.o mux.o flash.o \
 	 serial.o devices.o dma.o fb.o
-obj-y += clock.o clock_data.o opp_data.o reset.o pm_bus.o timer.o
+obj-y += clock.o reset.o pm_bus.o timer.o
 
 ifneq ($(CONFIG_SND_SOC_OMAP_MCBSP),)
 obj-y += mcbsp.o
diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 8e0e58495023..4f7e2fe58d63 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -32,7 +32,6 @@
 #include "hardware.h"
 #include "usb.h"
 #include "common.h"
-#include "clock.h"
 #include "mmc.h"
 
 #define ADS7846_PENDOWN_GPIO	15
diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 24db9b723a6f..bc51d5e24a9e 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -16,6 +16,8 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/cpufreq.h>
+#include <linux/delay.h>
 #include <linux/soc/ti/omap1-io.h>
 
 #include <asm/mach-types.h>
@@ -23,9 +25,318 @@
 #include "hardware.h"
 #include "soc.h"
 #include "iomap.h"
-#include "clock.h"
-#include "opp.h"
 #include "sram.h"
+#include "usb.h"
+
+struct module;
+struct clk;
+
+struct omap_clk {
+	u16				cpu;
+	struct clk_lookup		lk;
+};
+
+#define CLK(dev, con, ck, cp)		\
+	{				\
+		 .cpu = cp,		\
+		.lk = {			\
+			.dev_id = dev,	\
+			.con_id = con,	\
+			.clk = ck,	\
+		},			\
+	}
+
+/* Platform flags for the clkdev-OMAP integration code */
+#define CK_310		(1 << 0)
+#define CK_7XX		(1 << 1)	/* 7xx, 850 */
+#define CK_1510		(1 << 2)
+#define CK_16XX		(1 << 3)	/* 16xx, 17xx, 5912 */
+#define CK_1710		(1 << 4)	/* 1710 extra for rate selection */
+
+
+/* Temporary, needed during the common clock framework conversion */
+#define __clk_get_name(clk)	(clk->name)
+#define __clk_get_parent(clk)	(clk->parent)
+#define __clk_get_rate(clk)	(clk->rate)
+
+/**
+ * struct clkops - some clock function pointers
+ * @enable: fn ptr that enables the current clock in hardware
+ * @disable: fn ptr that enables the current clock in hardware
+ * @find_idlest: function returning the IDLEST register for the clock's IP blk
+ * @find_companion: function returning the "companion" clk reg for the clock
+ * @allow_idle: fn ptr that enables autoidle for the current clock in hardware
+ * @deny_idle: fn ptr that disables autoidle for the current clock in hardware
+ *
+ * A "companion" clk is an accompanying clock to the one being queried
+ * that must be enabled for the IP module connected to the clock to
+ * become accessible by the hardware.  Neither @find_idlest nor
+ * @find_companion should be needed; that information is IP
+ * block-specific; the hwmod code has been created to handle this, but
+ * until hwmod data is ready and drivers have been converted to use PM
+ * runtime calls in place of clk_enable()/clk_disable(), @find_idlest and
+ * @find_companion must, unfortunately, remain.
+ */
+struct clkops {
+	int			(*enable)(struct clk *);
+	void			(*disable)(struct clk *);
+	void			(*find_idlest)(struct clk *, void __iomem **,
+					       u8 *, u8 *);
+	void			(*find_companion)(struct clk *, void __iomem **,
+						  u8 *);
+	void			(*allow_idle)(struct clk *);
+	void			(*deny_idle)(struct clk *);
+};
+
+/*
+ * struct clk.flags possibilities
+ *
+ * XXX document the rest of the clock flags here
+ *
+ * CLOCK_CLKOUTX2: (OMAP4 only) DPLL CLKOUT and CLKOUTX2 GATE_CTRL
+ *     bits share the same register.  This flag allows the
+ *     omap4_dpllmx*() code to determine which GATE_CTRL bit field
+ *     should be used.  This is a temporary solution - a better approach
+ *     would be to associate clock type-specific data with the clock,
+ *     similar to the struct dpll_data approach.
+ */
+#define ENABLE_REG_32BIT	(1 << 0)	/* Use 32-bit access */
+#define CLOCK_IDLE_CONTROL	(1 << 1)
+#define CLOCK_NO_IDLE_PARENT	(1 << 2)
+#define ENABLE_ON_INIT		(1 << 3)	/* Enable upon framework init */
+#define INVERT_ENABLE		(1 << 4)	/* 0 enables, 1 disables */
+#define CLOCK_CLKOUTX2		(1 << 5)
+
+/**
+ * struct clk - OMAP struct clk
+ * @node: list_head connecting this clock into the full clock list
+ * @ops: struct clkops * for this clock
+ * @name: the name of the clock in the hardware (used in hwmod data and debug)
+ * @parent: pointer to this clock's parent struct clk
+ * @children: list_head connecting to the child clks' @sibling list_heads
+ * @sibling: list_head connecting this clk to its parent clk's @children
+ * @rate: current clock rate
+ * @enable_reg: register to write to enable the clock (see @enable_bit)
+ * @recalc: fn ptr that returns the clock's current rate
+ * @set_rate: fn ptr that can change the clock's current rate
+ * @round_rate: fn ptr that can round the clock's current rate
+ * @init: fn ptr to do clock-specific initialization
+ * @enable_bit: bitshift to write to enable/disable the clock (see @enable_reg)
+ * @usecount: number of users that have requested this clock to be enabled
+ * @fixed_div: when > 0, this clock's rate is its parent's rate / @fixed_div
+ * @flags: see "struct clk.flags possibilities" above
+ * @rate_offset: bitshift for rate selection bitfield (OMAP1 only)
+ * @src_offset: bitshift for source selection bitfield (OMAP1 only)
+ *
+ * XXX @rate_offset, @src_offset should probably be removed and OMAP1
+ * clock code converted to use clksel.
+ *
+ * XXX @usecount is poorly named.  It should be "enable_count" or
+ * something similar.  "users" in the description refers to kernel
+ * code (core code or drivers) that have called clk_enable() and not
+ * yet called clk_disable(); the usecount of parent clocks is also
+ * incremented by the clock code when clk_enable() is called on child
+ * clocks and decremented by the clock code when clk_disable() is
+ * called on child clocks.
+ *
+ * XXX @clkdm, @usecount, @children, @sibling should be marked for
+ * internal use only.
+ *
+ * @children and @sibling are used to optimize parent-to-child clock
+ * tree traversals.  (child-to-parent traversals use @parent.)
+ *
+ * XXX The notion of the clock's current rate probably needs to be
+ * separated from the clock's target rate.
+ */
+struct clk {
+	struct list_head	node;
+	const struct clkops	*ops;
+	const char		*name;
+	struct clk		*parent;
+	struct list_head	children;
+	struct list_head	sibling;	/* node for children */
+	unsigned long		rate;
+	void __iomem		*enable_reg;
+	unsigned long		(*recalc)(struct clk *);
+	int			(*set_rate)(struct clk *, unsigned long);
+	long			(*round_rate)(struct clk *, unsigned long);
+	void			(*init)(struct clk *);
+	u8			enable_bit;
+	s8			usecount;
+	u8			fixed_div;
+	u8			flags;
+	u8			rate_offset;
+	u8			src_offset;
+#if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
+	struct dentry		*dent;	/* For visible tree hierarchy */
+#endif
+};
+
+struct clk_functions {
+	int		(*clk_enable)(struct clk *clk);
+	void		(*clk_disable)(struct clk *clk);
+	long		(*clk_round_rate)(struct clk *clk, unsigned long rate);
+	int		(*clk_set_rate)(struct clk *clk, unsigned long rate);
+	int		(*clk_set_parent)(struct clk *clk, struct clk *parent);
+	void		(*clk_allow_idle)(struct clk *clk);
+	void		(*clk_deny_idle)(struct clk *clk);
+	void		(*clk_disable_unused)(struct clk *clk);
+};
+
+extern int clk_init(struct clk_functions *custom_clocks);
+extern void clk_preinit(struct clk *clk);
+extern int clk_register(struct clk *clk);
+extern void clk_reparent(struct clk *child, struct clk *parent);
+extern void clk_unregister(struct clk *clk);
+extern void propagate_rate(struct clk *clk);
+extern void recalculate_root_clocks(void);
+extern unsigned long followparent_recalc(struct clk *clk);
+extern void clk_enable_init_clocks(void);
+unsigned long omap_fixed_divisor_recalc(struct clk *clk);
+extern struct clk *omap_clk_get_by_name(const char *name);
+extern int omap_clk_enable_autoidle_all(void);
+extern int omap_clk_disable_autoidle_all(void);
+
+extern const struct clkops clkops_null;
+
+extern struct clk dummy_ck;
+
+extern int omap1_clk_enable(struct clk *clk);
+extern void omap1_clk_disable(struct clk *clk);
+extern long omap1_clk_round_rate(struct clk *clk, unsigned long rate);
+extern int omap1_clk_set_rate(struct clk *clk, unsigned long rate);
+extern unsigned long omap1_ckctl_recalc(struct clk *clk);
+extern int omap1_set_sossi_rate(struct clk *clk, unsigned long rate);
+extern unsigned long omap1_sossi_recalc(struct clk *clk);
+extern unsigned long omap1_ckctl_recalc_dsp_domain(struct clk *clk);
+extern int omap1_clk_set_rate_dsp_domain(struct clk *clk, unsigned long rate);
+extern int omap1_set_uart_rate(struct clk *clk, unsigned long rate);
+extern unsigned long omap1_uart_recalc(struct clk *clk);
+extern int omap1_set_ext_clk_rate(struct clk *clk, unsigned long rate);
+extern long omap1_round_ext_clk_rate(struct clk *clk, unsigned long rate);
+extern void omap1_init_ext_clk(struct clk *clk);
+extern int omap1_select_table_rate(struct clk *clk, unsigned long rate);
+extern long omap1_round_to_table_rate(struct clk *clk, unsigned long rate);
+extern int omap1_clk_set_rate_ckctl_arm(struct clk *clk, unsigned long rate);
+extern long omap1_clk_round_rate_ckctl_arm(struct clk *clk, unsigned long rate);
+extern unsigned long omap1_watchdog_recalc(struct clk *clk);
+
+#ifdef CONFIG_OMAP_RESET_CLOCKS
+extern void omap1_clk_disable_unused(struct clk *clk);
+#else
+#define omap1_clk_disable_unused	NULL
+#endif
+
+struct uart_clk {
+	struct clk	clk;
+	unsigned long	sysc_addr;
+};
+
+/* Provide a method for preventing idling some ARM IDLECT clocks */
+struct arm_idlect1_clk {
+	struct clk	clk;
+	unsigned long	no_idle_count;
+	__u8		idlect_shift;
+};
+
+/* ARM_CKCTL bit shifts */
+#define CKCTL_PERDIV_OFFSET	0
+#define CKCTL_LCDDIV_OFFSET	2
+#define CKCTL_ARMDIV_OFFSET	4
+#define CKCTL_DSPDIV_OFFSET	6
+#define CKCTL_TCDIV_OFFSET	8
+#define CKCTL_DSPMMUDIV_OFFSET	10
+/*#define ARM_TIMXO		12*/
+#define EN_DSPCK		13
+/*#define ARM_INTHCK_SEL	14*/ /* Divide-by-2 for mpu inth_ck */
+/* DSP_CKCTL bit shifts */
+#define CKCTL_DSPPERDIV_OFFSET	0
+
+/* ARM_IDLECT2 bit shifts */
+#define EN_WDTCK	0
+#define EN_XORPCK	1
+#define EN_PERCK	2
+#define EN_LCDCK	3
+#define EN_LBCK		4 /* Not on 1610/1710 */
+/*#define EN_HSABCK	5*/
+#define EN_APICK	6
+#define EN_TIMCK	7
+#define DMACK_REQ	8
+#define EN_GPIOCK	9 /* Not on 1610/1710 */
+/*#define EN_LBFREECK	10*/
+#define EN_CKOUT_ARM	11
+
+/* ARM_IDLECT3 bit shifts */
+#define EN_OCPI_CK	0
+#define EN_TC1_CK	2
+#define EN_TC2_CK	4
+
+/* DSP_IDLECT2 bit shifts (0,1,2 are same as for ARM_IDLECT2) */
+#define EN_DSPTIMCK	5
+
+/* Various register defines for clock controls scattered around OMAP chip */
+#define SDW_MCLK_INV_BIT	2	/* In ULPD_CLKC_CTRL */
+#define USB_MCLK_EN_BIT		4	/* In ULPD_CLKC_CTRL */
+#define USB_HOST_HHC_UHOST_EN	9	/* In MOD_CONF_CTRL_0 */
+#define SWD_ULPD_PLL_CLK_REQ	1	/* In SWD_CLK_DIV_CTRL_SEL */
+#define COM_ULPD_PLL_CLK_REQ	1	/* In COM_CLK_DIV_CTRL_SEL */
+#define SWD_CLK_DIV_CTRL_SEL	0xfffe0874
+#define COM_CLK_DIV_CTRL_SEL	0xfffe0878
+#define SOFT_REQ_REG		0xfffe0834
+#define SOFT_REQ_REG2		0xfffe0880
+
+extern __u32 arm_idlect1_mask;
+extern struct clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
+
+extern const struct clkops clkops_dspck;
+extern const struct clkops clkops_dummy;
+extern const struct clkops clkops_uart_16xx;
+extern const struct clkops clkops_generic;
+
+/* used for passing SoC type to omap1_{select,round_to}_table_rate() */
+extern u32 cpu_mask;
+
+
+/* Some ARM_IDLECT1 bit shifts - used in struct arm_idlect1_clk */
+#define IDL_CLKOUT_ARM_SHIFT			12
+#define IDLTIM_ARM_SHIFT			9
+#define IDLAPI_ARM_SHIFT			8
+#define IDLIF_ARM_SHIFT				6
+#define IDLLB_ARM_SHIFT				4	/* undocumented? */
+#define OMAP1510_IDLLCD_ARM_SHIFT		3	/* undocumented? */
+#define IDLPER_ARM_SHIFT			2
+#define IDLXORP_ARM_SHIFT			1
+#define IDLWDT_ARM_SHIFT			0
+
+/* Some MOD_CONF_CTRL_0 bit shifts - used in struct clk.enable_bit */
+#define CONF_MOD_UART3_CLK_MODE_R		31
+#define CONF_MOD_UART2_CLK_MODE_R		30
+#define CONF_MOD_UART1_CLK_MODE_R		29
+#define CONF_MOD_MMC_SD_CLK_REQ_R		23
+#define CONF_MOD_MCBSP3_AUXON			20
+
+/* Some MOD_CONF_CTRL_1 bit shifts - used in struct clk.enable_bit */
+#define CONF_MOD_SOSSI_CLK_EN_R			16
+
+/* Some OTG_SYSCON_2-specific bit fields */
+#define OTG_SYSCON_2_UHOST_EN_SHIFT		8
+
+/* Some SOFT_REQ_REG bit fields - used in struct clk.enable_bit */
+#define SOFT_MMC2_DPLL_REQ_SHIFT	13
+#define SOFT_MMC_DPLL_REQ_SHIFT		12
+#define SOFT_UART3_DPLL_REQ_SHIFT	11
+#define SOFT_UART2_DPLL_REQ_SHIFT	10
+#define SOFT_UART1_DPLL_REQ_SHIFT	9
+#define SOFT_USB_OTG_DPLL_REQ_SHIFT	8
+#define SOFT_CAM_DPLL_REQ_SHIFT		7
+#define SOFT_COM_MCKO_REQ_SHIFT		6
+#define SOFT_PERIPH_REQ_SHIFT		5	/* sys_ck gate for UART2 ? */
+#define USB_REQ_EN_SHIFT		4
+#define SOFT_USB_REQ_SHIFT		3	/* sys_ck gate for USB host? */
+#define SOFT_SDW_REQ_SHIFT		2	/* sys_ck gate for Bluetooth? */
+#define SOFT_COM_REQ_SHIFT		1	/* sys_ck gate for com proc? */
+#define SOFT_DPLL_REQ_SHIFT		0
+
 
 __u32 arm_idlect1_mask;
 struct clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
@@ -187,6 +498,54 @@ unsigned long omap1_ckctl_recalc_dsp_domain(struct clk *clk)
 	return clk->parent->rate / dsor;
 }
 
+/*-------------------------------------------------------------------------
+ * Omap1 MPU rate table
+ *-------------------------------------------------------------------------*/
+struct mpu_rate {
+	unsigned long		rate;
+	unsigned long		xtal;
+	unsigned long		pll_rate;
+	__u16			ckctl_val;
+	__u16			dpllctl_val;
+	u32			flags;
+};
+
+struct mpu_rate omap1_rate_table[] = {
+	/* MPU MHz, xtal MHz, dpll1 MHz, CKCTL, DPLL_CTL
+	 * NOTE: Comment order here is different from bits in CKCTL value:
+	 * armdiv, dspdiv, dspmmu, tcdiv, perdiv, lcddiv
+	 */
+	{ 216000000, 12000000, 216000000, 0x050d, 0x2910, /* 1/1/2/2/2/8 */
+			CK_1710 },
+	{ 195000000, 13000000, 195000000, 0x050e, 0x2790, /* 1/1/2/2/4/8 */
+			CK_7XX },
+	{ 192000000, 19200000, 192000000, 0x050f, 0x2510, /* 1/1/2/2/8/8 */
+			CK_16XX },
+	{ 192000000, 12000000, 192000000, 0x050f, 0x2810, /* 1/1/2/2/8/8 */
+			CK_16XX },
+	{  96000000, 12000000, 192000000, 0x055f, 0x2810, /* 2/2/2/2/8/8 */
+			CK_16XX },
+	{  48000000, 12000000, 192000000, 0x0baf, 0x2810, /* 4/4/4/8/8/8 */
+			CK_16XX },
+	{  24000000, 12000000, 192000000, 0x0fff, 0x2810, /* 8/8/8/8/8/8 */
+			CK_16XX },
+	{ 182000000, 13000000, 182000000, 0x050e, 0x2710, /* 1/1/2/2/4/8 */
+			CK_7XX },
+	{ 168000000, 12000000, 168000000, 0x010f, 0x2710, /* 1/1/1/2/8/8 */
+			CK_16XX|CK_7XX },
+	{ 150000000, 12000000, 150000000, 0x010a, 0x2cb0, /* 1/1/1/2/4/4 */
+			CK_1510 },
+	{ 120000000, 12000000, 120000000, 0x010a, 0x2510, /* 1/1/1/2/4/4 */
+			CK_16XX|CK_1510|CK_310|CK_7XX },
+	{  96000000, 12000000,  96000000, 0x0005, 0x2410, /* 1/1/1/1/2/2 */
+			CK_16XX|CK_1510|CK_310|CK_7XX },
+	{  60000000, 12000000,  60000000, 0x0005, 0x2290, /* 1/1/1/1/2/2 */
+			CK_16XX|CK_1510|CK_310|CK_7XX },
+	{  30000000, 12000000,  60000000, 0x0555, 0x2290, /* 2/2/2/2/2/2 */
+			CK_16XX|CK_1510|CK_310|CK_7XX },
+	{ 0, 0, 0, 0, 0 },
+};
+
 /* MPU virtual clock functions */
 int omap1_select_table_rate(struct clk *clk, unsigned long rate)
 {
@@ -1029,3 +1388,855 @@ static int __init clk_debugfs_init(void)
 late_initcall(clk_debugfs_init);
 
 #endif /* defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS) */
+
+/*
+ * Omap1 clocks
+ */
+
+static struct clk ck_ref = {
+	.name		= "ck_ref",
+	.ops		= &clkops_null,
+	.rate		= 12000000,
+};
+
+static struct clk ck_dpll1 = {
+	.name		= "ck_dpll1",
+	.ops		= &clkops_null,
+	.parent		= &ck_ref,
+};
+
+/*
+ * FIXME: This clock seems to be necessary but no-one has asked for its
+ * activation.  [ FIX: SoSSI, SSR ]
+ */
+static struct arm_idlect1_clk ck_dpll1out = {
+	.clk = {
+		.name		= "ck_dpll1out",
+		.ops		= &clkops_generic,
+		.parent		= &ck_dpll1,
+		.flags		= CLOCK_IDLE_CONTROL | ENABLE_REG_32BIT |
+				  ENABLE_ON_INIT,
+		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+		.enable_bit	= EN_CKOUT_ARM,
+		.recalc		= &followparent_recalc,
+	},
+	.idlect_shift	= IDL_CLKOUT_ARM_SHIFT,
+};
+
+static struct clk sossi_ck = {
+	.name		= "ck_sossi",
+	.ops		= &clkops_generic,
+	.parent		= &ck_dpll1out.clk,
+	.flags		= CLOCK_NO_IDLE_PARENT | ENABLE_REG_32BIT,
+	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1),
+	.enable_bit	= CONF_MOD_SOSSI_CLK_EN_R,
+	.recalc		= &omap1_sossi_recalc,
+	.set_rate	= &omap1_set_sossi_rate,
+};
+
+static struct clk arm_ck = {
+	.name		= "arm_ck",
+	.ops		= &clkops_null,
+	.parent		= &ck_dpll1,
+	.rate_offset	= CKCTL_ARMDIV_OFFSET,
+	.recalc		= &omap1_ckctl_recalc,
+	.round_rate	= omap1_clk_round_rate_ckctl_arm,
+	.set_rate	= omap1_clk_set_rate_ckctl_arm,
+};
+
+static struct arm_idlect1_clk armper_ck = {
+	.clk = {
+		.name		= "armper_ck",
+		.ops		= &clkops_generic,
+		.parent		= &ck_dpll1,
+		.flags		= CLOCK_IDLE_CONTROL,
+		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+		.enable_bit	= EN_PERCK,
+		.rate_offset	= CKCTL_PERDIV_OFFSET,
+		.recalc		= &omap1_ckctl_recalc,
+		.round_rate	= omap1_clk_round_rate_ckctl_arm,
+		.set_rate	= omap1_clk_set_rate_ckctl_arm,
+	},
+	.idlect_shift	= IDLPER_ARM_SHIFT,
+};
+
+/*
+ * FIXME: This clock seems to be necessary but no-one has asked for its
+ * activation.  [ GPIO code for 1510 ]
+ */
+static struct clk arm_gpio_ck = {
+	.name		= "ick",
+	.ops		= &clkops_generic,
+	.parent		= &ck_dpll1,
+	.flags		= ENABLE_ON_INIT,
+	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+	.enable_bit	= EN_GPIOCK,
+	.recalc		= &followparent_recalc,
+};
+
+static struct arm_idlect1_clk armxor_ck = {
+	.clk = {
+		.name		= "armxor_ck",
+		.ops		= &clkops_generic,
+		.parent		= &ck_ref,
+		.flags		= CLOCK_IDLE_CONTROL,
+		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+		.enable_bit	= EN_XORPCK,
+		.recalc		= &followparent_recalc,
+	},
+	.idlect_shift	= IDLXORP_ARM_SHIFT,
+};
+
+static struct arm_idlect1_clk armtim_ck = {
+	.clk = {
+		.name		= "armtim_ck",
+		.ops		= &clkops_generic,
+		.parent		= &ck_ref,
+		.flags		= CLOCK_IDLE_CONTROL,
+		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+		.enable_bit	= EN_TIMCK,
+		.recalc		= &followparent_recalc,
+	},
+	.idlect_shift	= IDLTIM_ARM_SHIFT,
+};
+
+static struct arm_idlect1_clk armwdt_ck = {
+	.clk = {
+		.name		= "armwdt_ck",
+		.ops		= &clkops_generic,
+		.parent		= &ck_ref,
+		.flags		= CLOCK_IDLE_CONTROL,
+		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+		.enable_bit	= EN_WDTCK,
+		.fixed_div	= 14,
+		.recalc		= &omap_fixed_divisor_recalc,
+	},
+	.idlect_shift	= IDLWDT_ARM_SHIFT,
+};
+
+static struct clk arminth_ck16xx = {
+	.name		= "arminth_ck",
+	.ops		= &clkops_null,
+	.parent		= &arm_ck,
+	.recalc		= &followparent_recalc,
+	/* Note: On 16xx the frequency can be divided by 2 by programming
+	 * ARM_CKCTL:ARM_INTHCK_SEL(14) to 1
+	 *
+	 * 1510 version is in TC clocks.
+	 */
+};
+
+static struct clk dsp_ck = {
+	.name		= "dsp_ck",
+	.ops		= &clkops_generic,
+	.parent		= &ck_dpll1,
+	.enable_reg	= OMAP1_IO_ADDRESS(ARM_CKCTL),
+	.enable_bit	= EN_DSPCK,
+	.rate_offset	= CKCTL_DSPDIV_OFFSET,
+	.recalc		= &omap1_ckctl_recalc,
+	.round_rate	= omap1_clk_round_rate_ckctl_arm,
+	.set_rate	= omap1_clk_set_rate_ckctl_arm,
+};
+
+static struct clk dspmmu_ck = {
+	.name		= "dspmmu_ck",
+	.ops		= &clkops_null,
+	.parent		= &ck_dpll1,
+	.rate_offset	= CKCTL_DSPMMUDIV_OFFSET,
+	.recalc		= &omap1_ckctl_recalc,
+	.round_rate	= omap1_clk_round_rate_ckctl_arm,
+	.set_rate	= omap1_clk_set_rate_ckctl_arm,
+};
+
+static struct clk dspper_ck = {
+	.name		= "dspper_ck",
+	.ops		= &clkops_dspck,
+	.parent		= &ck_dpll1,
+	.enable_reg	= DSP_IDLECT2,
+	.enable_bit	= EN_PERCK,
+	.rate_offset	= CKCTL_PERDIV_OFFSET,
+	.recalc		= &omap1_ckctl_recalc_dsp_domain,
+	.round_rate	= omap1_clk_round_rate_ckctl_arm,
+	.set_rate	= &omap1_clk_set_rate_dsp_domain,
+};
+
+static struct clk dspxor_ck = {
+	.name		= "dspxor_ck",
+	.ops		= &clkops_dspck,
+	.parent		= &ck_ref,
+	.enable_reg	= DSP_IDLECT2,
+	.enable_bit	= EN_XORPCK,
+	.recalc		= &followparent_recalc,
+};
+
+static struct clk dsptim_ck = {
+	.name		= "dsptim_ck",
+	.ops		= &clkops_dspck,
+	.parent		= &ck_ref,
+	.enable_reg	= DSP_IDLECT2,
+	.enable_bit	= EN_DSPTIMCK,
+	.recalc		= &followparent_recalc,
+};
+
+static struct arm_idlect1_clk tc_ck = {
+	.clk = {
+		.name		= "tc_ck",
+		.ops		= &clkops_null,
+		.parent		= &ck_dpll1,
+		.flags		= CLOCK_IDLE_CONTROL,
+		.rate_offset	= CKCTL_TCDIV_OFFSET,
+		.recalc		= &omap1_ckctl_recalc,
+		.round_rate	= omap1_clk_round_rate_ckctl_arm,
+		.set_rate	= omap1_clk_set_rate_ckctl_arm,
+	},
+	.idlect_shift	= IDLIF_ARM_SHIFT,
+};
+
+static struct clk arminth_ck1510 = {
+	.name		= "arminth_ck",
+	.ops		= &clkops_null,
+	.parent		= &tc_ck.clk,
+	.recalc		= &followparent_recalc,
+	/* Note: On 1510 the frequency follows TC_CK
+	 *
+	 * 16xx version is in MPU clocks.
+	 */
+};
+
+static struct clk tipb_ck = {
+	/* No-idle controlled by "tc_ck" */
+	.name		= "tipb_ck",
+	.ops		= &clkops_null,
+	.parent		= &tc_ck.clk,
+	.recalc		= &followparent_recalc,
+};
+
+static struct clk l3_ocpi_ck = {
+	/* No-idle controlled by "tc_ck" */
+	.name		= "l3_ocpi_ck",
+	.ops		= &clkops_generic,
+	.parent		= &tc_ck.clk,
+	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
+	.enable_bit	= EN_OCPI_CK,
+	.recalc		= &followparent_recalc,
+};
+
+static struct clk tc1_ck = {
+	.name		= "tc1_ck",
+	.ops		= &clkops_generic,
+	.parent		= &tc_ck.clk,
+	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
+	.enable_bit	= EN_TC1_CK,
+	.recalc		= &followparent_recalc,
+};
+
+/*
+ * FIXME: This clock seems to be necessary but no-one has asked for its
+ * activation.  [ pm.c (SRAM), CCP, Camera ]
+ */
+static struct clk tc2_ck = {
+	.name		= "tc2_ck",
+	.ops		= &clkops_generic,
+	.parent		= &tc_ck.clk,
+	.flags		= ENABLE_ON_INIT,
+	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
+	.enable_bit	= EN_TC2_CK,
+	.recalc		= &followparent_recalc,
+};
+
+static struct clk dma_ck = {
+	/* No-idle controlled by "tc_ck" */
+	.name		= "dma_ck",
+	.ops		= &clkops_null,
+	.parent		= &tc_ck.clk,
+	.recalc		= &followparent_recalc,
+};
+
+static struct clk dma_lcdfree_ck = {
+	.name		= "dma_lcdfree_ck",
+	.ops		= &clkops_null,
+	.parent		= &tc_ck.clk,
+	.recalc		= &followparent_recalc,
+};
+
+static struct arm_idlect1_clk api_ck = {
+	.clk = {
+		.name		= "api_ck",
+		.ops		= &clkops_generic,
+		.parent		= &tc_ck.clk,
+		.flags		= CLOCK_IDLE_CONTROL,
+		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+		.enable_bit	= EN_APICK,
+		.recalc		= &followparent_recalc,
+	},
+	.idlect_shift	= IDLAPI_ARM_SHIFT,
+};
+
+static struct arm_idlect1_clk lb_ck = {
+	.clk = {
+		.name		= "lb_ck",
+		.ops		= &clkops_generic,
+		.parent		= &tc_ck.clk,
+		.flags		= CLOCK_IDLE_CONTROL,
+		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+		.enable_bit	= EN_LBCK,
+		.recalc		= &followparent_recalc,
+	},
+	.idlect_shift	= IDLLB_ARM_SHIFT,
+};
+
+static struct clk rhea1_ck = {
+	.name		= "rhea1_ck",
+	.ops		= &clkops_null,
+	.parent		= &tc_ck.clk,
+	.recalc		= &followparent_recalc,
+};
+
+static struct clk rhea2_ck = {
+	.name		= "rhea2_ck",
+	.ops		= &clkops_null,
+	.parent		= &tc_ck.clk,
+	.recalc		= &followparent_recalc,
+};
+
+static struct clk lcd_ck_16xx = {
+	.name		= "lcd_ck",
+	.ops		= &clkops_generic,
+	.parent		= &ck_dpll1,
+	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+	.enable_bit	= EN_LCDCK,
+	.rate_offset	= CKCTL_LCDDIV_OFFSET,
+	.recalc		= &omap1_ckctl_recalc,
+	.round_rate	= omap1_clk_round_rate_ckctl_arm,
+	.set_rate	= omap1_clk_set_rate_ckctl_arm,
+};
+
+static struct arm_idlect1_clk lcd_ck_1510 = {
+	.clk = {
+		.name		= "lcd_ck",
+		.ops		= &clkops_generic,
+		.parent		= &ck_dpll1,
+		.flags		= CLOCK_IDLE_CONTROL,
+		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
+		.enable_bit	= EN_LCDCK,
+		.rate_offset	= CKCTL_LCDDIV_OFFSET,
+		.recalc		= &omap1_ckctl_recalc,
+		.round_rate	= omap1_clk_round_rate_ckctl_arm,
+		.set_rate	= omap1_clk_set_rate_ckctl_arm,
+	},
+	.idlect_shift	= OMAP1510_IDLLCD_ARM_SHIFT,
+};
+
+/*
+ * XXX The enable_bit here is misused - it simply switches between 12MHz
+ * and 48MHz.  Reimplement with clksel.
+ *
+ * XXX does this need SYSC register handling?
+ */
+static struct clk uart1_1510 = {
+	.name		= "uart1_ck",
+	.ops		= &clkops_null,
+	/* Direct from ULPD, no real parent */
+	.parent		= &armper_ck.clk,
+	.rate		= 12000000,
+	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
+	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
+	.enable_bit	= CONF_MOD_UART1_CLK_MODE_R,
+	.set_rate	= &omap1_set_uart_rate,
+	.recalc		= &omap1_uart_recalc,
+};
+
+/*
+ * XXX The enable_bit here is misused - it simply switches between 12MHz
+ * and 48MHz.  Reimplement with clksel.
+ *
+ * XXX SYSC register handling does not belong in the clock framework
+ */
+static struct uart_clk uart1_16xx = {
+	.clk	= {
+		.name		= "uart1_ck",
+		.ops		= &clkops_uart_16xx,
+		/* Direct from ULPD, no real parent */
+		.parent		= &armper_ck.clk,
+		.rate		= 48000000,
+		.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
+		.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
+		.enable_bit	= CONF_MOD_UART1_CLK_MODE_R,
+	},
+	.sysc_addr	= 0xfffb0054,
+};
+
+/*
+ * XXX The enable_bit here is misused - it simply switches between 12MHz
+ * and 48MHz.  Reimplement with clksel.
+ *
+ * XXX does this need SYSC register handling?
+ */
+static struct clk uart2_ck = {
+	.name		= "uart2_ck",
+	.ops		= &clkops_null,
+	/* Direct from ULPD, no real parent */
+	.parent		= &armper_ck.clk,
+	.rate		= 12000000,
+	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
+	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
+	.enable_bit	= CONF_MOD_UART2_CLK_MODE_R,
+	.set_rate	= &omap1_set_uart_rate,
+	.recalc		= &omap1_uart_recalc,
+};
+
+/*
+ * XXX The enable_bit here is misused - it simply switches between 12MHz
+ * and 48MHz.  Reimplement with clksel.
+ *
+ * XXX does this need SYSC register handling?
+ */
+static struct clk uart3_1510 = {
+	.name		= "uart3_ck",
+	.ops		= &clkops_null,
+	/* Direct from ULPD, no real parent */
+	.parent		= &armper_ck.clk,
+	.rate		= 12000000,
+	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
+	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
+	.enable_bit	= CONF_MOD_UART3_CLK_MODE_R,
+	.set_rate	= &omap1_set_uart_rate,
+	.recalc		= &omap1_uart_recalc,
+};
+
+/*
+ * XXX The enable_bit here is misused - it simply switches between 12MHz
+ * and 48MHz.  Reimplement with clksel.
+ *
+ * XXX SYSC register handling does not belong in the clock framework
+ */
+static struct uart_clk uart3_16xx = {
+	.clk	= {
+		.name		= "uart3_ck",
+		.ops		= &clkops_uart_16xx,
+		/* Direct from ULPD, no real parent */
+		.parent		= &armper_ck.clk,
+		.rate		= 48000000,
+		.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
+		.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
+		.enable_bit	= CONF_MOD_UART3_CLK_MODE_R,
+	},
+	.sysc_addr	= 0xfffb9854,
+};
+
+static struct clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
+	.name		= "usb_clko",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent */
+	.rate		= 6000000,
+	.flags		= ENABLE_REG_32BIT,
+	.enable_reg	= OMAP1_IO_ADDRESS(ULPD_CLOCK_CTRL),
+	.enable_bit	= USB_MCLK_EN_BIT,
+};
+
+static struct clk usb_hhc_ck1510 = {
+	.name		= "usb_hhc_ck",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent */
+	.rate		= 48000000, /* Actually 2 clocks, 12MHz and 48MHz */
+	.flags		= ENABLE_REG_32BIT,
+	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
+	.enable_bit	= USB_HOST_HHC_UHOST_EN,
+};
+
+static struct clk usb_hhc_ck16xx = {
+	.name		= "usb_hhc_ck",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent */
+	.rate		= 48000000,
+	/* OTG_SYSCON_2.OTG_PADEN == 0 (not 1510-compatible) */
+	.flags		= ENABLE_REG_32BIT,
+	.enable_reg	= OMAP1_IO_ADDRESS(OTG_BASE + 0x08), /* OTG_SYSCON_2 */
+	.enable_bit	= OTG_SYSCON_2_UHOST_EN_SHIFT
+};
+
+static struct clk usb_dc_ck = {
+	.name		= "usb_dc_ck",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent */
+	.rate		= 48000000,
+	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
+	.enable_bit	= SOFT_USB_OTG_DPLL_REQ_SHIFT,
+};
+
+static struct clk uart1_7xx = {
+	.name		= "uart1_ck",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent */
+	.rate		= 12000000,
+	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
+	.enable_bit	= 9,
+};
+
+static struct clk uart2_7xx = {
+	.name		= "uart2_ck",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent */
+	.rate		= 12000000,
+	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
+	.enable_bit	= 11,
+};
+
+static struct clk mclk_1510 = {
+	.name		= "mclk",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	.rate		= 12000000,
+	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
+	.enable_bit	= SOFT_COM_MCKO_REQ_SHIFT,
+};
+
+static struct clk mclk_16xx = {
+	.name		= "mclk",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	.enable_reg	= OMAP1_IO_ADDRESS(COM_CLK_DIV_CTRL_SEL),
+	.enable_bit	= COM_ULPD_PLL_CLK_REQ,
+	.set_rate	= &omap1_set_ext_clk_rate,
+	.round_rate	= &omap1_round_ext_clk_rate,
+	.init		= &omap1_init_ext_clk,
+};
+
+static struct clk bclk_1510 = {
+	.name		= "bclk",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	.rate		= 12000000,
+};
+
+static struct clk bclk_16xx = {
+	.name		= "bclk",
+	.ops		= &clkops_generic,
+	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	.enable_reg	= OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL),
+	.enable_bit	= SWD_ULPD_PLL_CLK_REQ,
+	.set_rate	= &omap1_set_ext_clk_rate,
+	.round_rate	= &omap1_round_ext_clk_rate,
+	.init		= &omap1_init_ext_clk,
+};
+
+static struct clk mmc1_ck = {
+	.name		= "mmc1_ck",
+	.ops		= &clkops_generic,
+	/* Functional clock is direct from ULPD, interface clock is ARMPER */
+	.parent		= &armper_ck.clk,
+	.rate		= 48000000,
+	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
+	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
+	.enable_bit	= CONF_MOD_MMC_SD_CLK_REQ_R,
+};
+
+/*
+ * XXX MOD_CONF_CTRL_0 bit 20 is defined in the 1510 TRM as
+ * CONF_MOD_MCBSP3_AUXON ??
+ */
+static struct clk mmc2_ck = {
+	.name		= "mmc2_ck",
+	.ops		= &clkops_generic,
+	/* Functional clock is direct from ULPD, interface clock is ARMPER */
+	.parent		= &armper_ck.clk,
+	.rate		= 48000000,
+	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
+	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
+	.enable_bit	= 20,
+};
+
+static struct clk mmc3_ck = {
+	.name		= "mmc3_ck",
+	.ops		= &clkops_generic,
+	/* Functional clock is direct from ULPD, interface clock is ARMPER */
+	.parent		= &armper_ck.clk,
+	.rate		= 48000000,
+	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
+	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
+	.enable_bit	= SOFT_MMC_DPLL_REQ_SHIFT,
+};
+
+static struct clk virtual_ck_mpu = {
+	.name		= "mpu",
+	.ops		= &clkops_null,
+	.parent		= &arm_ck, /* Is smarter alias for */
+	.recalc		= &followparent_recalc,
+	.set_rate	= &omap1_select_table_rate,
+	.round_rate	= &omap1_round_to_table_rate,
+};
+
+/* virtual functional clock domain for I2C. Just for making sure that ARMXOR_CK
+remains active during MPU idle whenever this is enabled */
+static struct clk i2c_fck = {
+	.name		= "i2c_fck",
+	.ops		= &clkops_null,
+	.flags		= CLOCK_NO_IDLE_PARENT,
+	.parent		= &armxor_ck.clk,
+	.recalc		= &followparent_recalc,
+};
+
+static struct clk i2c_ick = {
+	.name		= "i2c_ick",
+	.ops		= &clkops_null,
+	.flags		= CLOCK_NO_IDLE_PARENT,
+	.parent		= &armper_ck.clk,
+	.recalc		= &followparent_recalc,
+};
+
+/*
+ * clkdev integration
+ */
+
+static struct omap_clk omap_clks[] = {
+	/* non-ULPD clocks */
+	CLK(NULL,	"ck_ref",	&ck_ref,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"ck_dpll1",	&ck_dpll1,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	/* CK_GEN1 clocks */
+	CLK(NULL,	"ck_dpll1out",	&ck_dpll1out.clk, CK_16XX),
+	CLK(NULL,	"ck_sossi",	&sossi_ck,	CK_16XX),
+	CLK(NULL,	"arm_ck",	&arm_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"armper_ck",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310),
+	CLK("omap_gpio.0", "ick",	&arm_gpio_ck,	CK_1510 | CK_310),
+	CLK(NULL,	"armxor_ck",	&armxor_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"armtim_ck",	&armtim_ck.clk,	CK_16XX | CK_1510 | CK_310),
+	CLK("omap_wdt",	"fck",		&armwdt_ck.clk,	CK_16XX | CK_1510 | CK_310),
+	CLK("omap_wdt",	"ick",		&armper_ck.clk,	CK_16XX),
+	CLK("omap_wdt", "ick",		&dummy_ck,	CK_1510 | CK_310),
+	CLK(NULL,	"arminth_ck",	&arminth_ck1510, CK_1510 | CK_310),
+	CLK(NULL,	"arminth_ck",	&arminth_ck16xx, CK_16XX),
+	/* CK_GEN2 clocks */
+	CLK(NULL,	"dsp_ck",	&dsp_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dspmmu_ck",	&dspmmu_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dspper_ck",	&dspper_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dspxor_ck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dsptim_ck",	&dsptim_ck,	CK_16XX | CK_1510 | CK_310),
+	/* CK_GEN3 clocks */
+	CLK(NULL,	"tc_ck",	&tc_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"tipb_ck",	&tipb_ck,	CK_1510 | CK_310),
+	CLK(NULL,	"l3_ocpi_ck",	&l3_ocpi_ck,	CK_16XX | CK_7XX),
+	CLK(NULL,	"tc1_ck",	&tc1_ck,	CK_16XX),
+	CLK(NULL,	"tc2_ck",	&tc2_ck,	CK_16XX),
+	CLK(NULL,	"dma_ck",	&dma_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dma_lcdfree_ck", &dma_lcdfree_ck, CK_16XX),
+	CLK(NULL,	"api_ck",	&api_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"lb_ck",	&lb_ck.clk,	CK_1510 | CK_310),
+	CLK(NULL,	"rhea1_ck",	&rhea1_ck,	CK_16XX),
+	CLK(NULL,	"rhea2_ck",	&rhea2_ck,	CK_16XX),
+	CLK(NULL,	"lcd_ck",	&lcd_ck_16xx,	CK_16XX | CK_7XX),
+	CLK(NULL,	"lcd_ck",	&lcd_ck_1510.clk, CK_1510 | CK_310),
+	/* ULPD clocks */
+	CLK(NULL,	"uart1_ck",	&uart1_1510,	CK_1510 | CK_310),
+	CLK(NULL,	"uart1_ck",	&uart1_16xx.clk, CK_16XX),
+	CLK(NULL,	"uart1_ck",	&uart1_7xx,	CK_7XX),
+	CLK(NULL,	"uart2_ck",	&uart2_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"uart2_ck",	&uart2_7xx,	CK_7XX),
+	CLK(NULL,	"uart3_ck",	&uart3_1510,	CK_1510 | CK_310),
+	CLK(NULL,	"uart3_ck",	&uart3_16xx.clk, CK_16XX),
+	CLK(NULL,	"usb_clko",	&usb_clko,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"usb_hhc_ck",	&usb_hhc_ck1510, CK_1510 | CK_310),
+	CLK(NULL,	"usb_hhc_ck",	&usb_hhc_ck16xx, CK_16XX),
+	CLK(NULL,	"usb_dc_ck",	&usb_dc_ck,	CK_16XX | CK_7XX),
+	CLK(NULL,	"mclk",		&mclk_1510,	CK_1510 | CK_310),
+	CLK(NULL,	"mclk",		&mclk_16xx,	CK_16XX),
+	CLK(NULL,	"bclk",		&bclk_1510,	CK_1510 | CK_310),
+	CLK(NULL,	"bclk",		&bclk_16xx,	CK_16XX),
+	CLK("mmci-omap.0", "fck",	&mmc1_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK("mmci-omap.0", "fck",	&mmc3_ck,	CK_7XX),
+	CLK("mmci-omap.0", "ick",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK("mmci-omap.1", "fck",	&mmc2_ck,	CK_16XX),
+	CLK("mmci-omap.1", "ick",	&armper_ck.clk,	CK_16XX),
+	/* Virtual clocks */
+	CLK(NULL,	"mpu",		&virtual_ck_mpu, CK_16XX | CK_1510 | CK_310),
+	CLK("omap_i2c.1", "fck",	&i2c_fck,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK("omap_i2c.1", "ick",	&i2c_ick,	CK_16XX),
+	CLK("omap_i2c.1", "ick",	&dummy_ck,	CK_1510 | CK_310 | CK_7XX),
+	CLK("omap1_spi100k.1", "fck",	&dummy_ck,	CK_7XX),
+	CLK("omap1_spi100k.1", "ick",	&dummy_ck,	CK_7XX),
+	CLK("omap1_spi100k.2", "fck",	&dummy_ck,	CK_7XX),
+	CLK("omap1_spi100k.2", "ick",	&dummy_ck,	CK_7XX),
+	CLK("omap_uwire", "fck",	&armxor_ck.clk,	CK_16XX | CK_1510 | CK_310),
+	CLK("omap-mcbsp.1", "ick",	&dspper_ck,	CK_16XX),
+	CLK("omap-mcbsp.1", "ick",	&dummy_ck,	CK_1510 | CK_310),
+	CLK("omap-mcbsp.2", "ick",	&armper_ck.clk,	CK_16XX),
+	CLK("omap-mcbsp.2", "ick",	&dummy_ck,	CK_1510 | CK_310),
+	CLK("omap-mcbsp.3", "ick",	&dspper_ck,	CK_16XX),
+	CLK("omap-mcbsp.3", "ick",	&dummy_ck,	CK_1510 | CK_310),
+	CLK("omap-mcbsp.1", "fck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK("omap-mcbsp.2", "fck",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310),
+	CLK("omap-mcbsp.3", "fck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
+};
+
+/*
+ * init
+ */
+
+static void __init omap1_show_rates(void)
+{
+	pr_notice("Clocking rate (xtal/DPLL1/MPU): %ld.%01ld/%ld.%01ld/%ld.%01ld MHz\n",
+		  ck_ref.rate / 1000000, (ck_ref.rate / 100000) % 10,
+		  ck_dpll1.rate / 1000000, (ck_dpll1.rate / 100000) % 10,
+		  arm_ck.rate / 1000000, (arm_ck.rate / 100000) % 10);
+}
+
+u32 cpu_mask;
+
+int __init omap1_clk_init(void)
+{
+	struct omap_clk *c;
+	int crystal_type = 0; /* Default 12 MHz */
+	u32 reg;
+
+#ifdef CONFIG_DEBUG_LL
+	/*
+	 * Resets some clocks that may be left on from bootloader,
+	 * but leaves serial clocks on.
+	 */
+	omap_writel(0x3 << 29, MOD_CONF_CTRL_0);
+#endif
+
+	/* USB_REQ_EN will be disabled later if necessary (usb_dc_ck) */
+	reg = omap_readw(SOFT_REQ_REG) & (1 << 4);
+	omap_writew(reg, SOFT_REQ_REG);
+	if (!cpu_is_omap15xx())
+		omap_writew(0, SOFT_REQ_REG2);
+
+	/* By default all idlect1 clocks are allowed to idle */
+	arm_idlect1_mask = ~0;
+
+	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
+		clk_preinit(c->lk.clk);
+
+	cpu_mask = 0;
+	if (cpu_is_omap1710())
+		cpu_mask |= CK_1710;
+	if (cpu_is_omap16xx())
+		cpu_mask |= CK_16XX;
+	if (cpu_is_omap1510())
+		cpu_mask |= CK_1510;
+	if (cpu_is_omap7xx())
+		cpu_mask |= CK_7XX;
+	if (cpu_is_omap310())
+		cpu_mask |= CK_310;
+
+	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
+		if (c->cpu & cpu_mask) {
+			clkdev_add(&c->lk);
+			clk_register(c->lk.clk);
+		}
+
+	/* Pointers to these clocks are needed by code in clock.c */
+	api_ck_p = clk_get(NULL, "api_ck");
+	ck_dpll1_p = clk_get(NULL, "ck_dpll1");
+	ck_ref_p = clk_get(NULL, "ck_ref");
+
+	if (cpu_is_omap7xx())
+		ck_ref.rate = 13000000;
+	if (cpu_is_omap16xx() && crystal_type == 2)
+		ck_ref.rate = 19200000;
+
+	pr_info("Clocks: ARM_SYSST: 0x%04x DPLL_CTL: 0x%04x ARM_CKCTL: 0x%04x\n",
+		omap_readw(ARM_SYSST), omap_readw(DPLL_CTL),
+		omap_readw(ARM_CKCTL));
+
+	/* We want to be in syncronous scalable mode */
+	omap_writew(0x1000, ARM_SYSST);
+
+
+	/*
+	 * Initially use the values set by bootloader. Determine PLL rate and
+	 * recalculate dependent clocks as if kernel had changed PLL or
+	 * divisors. See also omap1_clk_late_init() that can reprogram dpll1
+	 * after the SRAM is initialized.
+	 */
+	{
+		unsigned pll_ctl_val = omap_readw(DPLL_CTL);
+
+		ck_dpll1.rate = ck_ref.rate; /* Base xtal rate */
+		if (pll_ctl_val & 0x10) {
+			/* PLL enabled, apply multiplier and divisor */
+			if (pll_ctl_val & 0xf80)
+				ck_dpll1.rate *= (pll_ctl_val & 0xf80) >> 7;
+			ck_dpll1.rate /= ((pll_ctl_val & 0x60) >> 5) + 1;
+		} else {
+			/* PLL disabled, apply bypass divisor */
+			switch (pll_ctl_val & 0xc) {
+			case 0:
+				break;
+			case 0x4:
+				ck_dpll1.rate /= 2;
+				break;
+			default:
+				ck_dpll1.rate /= 4;
+				break;
+			}
+		}
+	}
+	propagate_rate(&ck_dpll1);
+	/* Cache rates for clocks connected to ck_ref (not dpll1) */
+	propagate_rate(&ck_ref);
+	omap1_show_rates();
+	if (machine_is_omap_perseus2() || machine_is_omap_fsample()) {
+		/* Select slicer output as OMAP input clock */
+		omap_writew(omap_readw(OMAP7XX_PCC_UPLD_CTRL) & ~0x1,
+				OMAP7XX_PCC_UPLD_CTRL);
+	}
+
+	/* Amstrad Delta wants BCLK high when inactive */
+	if (machine_is_ams_delta())
+		omap_writel(omap_readl(ULPD_CLOCK_CTRL) |
+				(1 << SDW_MCLK_INV_BIT),
+				ULPD_CLOCK_CTRL);
+
+	/* Turn off DSP and ARM_TIMXO. Make sure ARM_INTHCK is not divided */
+	/* (on 730, bit 13 must not be cleared) */
+	if (cpu_is_omap7xx())
+		omap_writew(omap_readw(ARM_CKCTL) & 0x2fff, ARM_CKCTL);
+	else
+		omap_writew(omap_readw(ARM_CKCTL) & 0x0fff, ARM_CKCTL);
+
+	/* Put DSP/MPUI into reset until needed */
+	omap_writew(0, ARM_RSTCT1);
+	omap_writew(1, ARM_RSTCT2);
+	omap_writew(0x400, ARM_IDLECT1);
+
+	/*
+	 * According to OMAP5910 Erratum SYS_DMA_1, bit DMACK_REQ (bit 8)
+	 * of the ARM_IDLECT2 register must be set to zero. The power-on
+	 * default value of this bit is one.
+	 */
+	omap_writew(0x0000, ARM_IDLECT2);	/* Turn LCD clock off also */
+
+	/*
+	 * Only enable those clocks we will need, let the drivers
+	 * enable other clocks as necessary
+	 */
+	clk_enable(&armper_ck.clk);
+	clk_enable(&armxor_ck.clk);
+	clk_enable(&armtim_ck.clk); /* This should be done by timer code */
+
+	if (cpu_is_omap15xx())
+		clk_enable(&arm_gpio_ck);
+
+	return 0;
+}
+
+#define OMAP1_DPLL1_SANE_VALUE	60000000
+
+void __init omap1_clk_late_init(void)
+{
+	unsigned long rate = ck_dpll1.rate;
+
+	/* Find the highest supported frequency and enable it */
+	if (omap1_select_table_rate(&virtual_ck_mpu, ~0)) {
+		pr_err("System frequencies not set, using default. Check your config.\n");
+		/*
+		 * Reprogramming the DPLL is tricky, it must be done from SRAM.
+		 */
+		omap_sram_reprogram_clock(0x2290, 0x0005);
+		ck_dpll1.rate = OMAP1_DPLL1_SANE_VALUE;
+	}
+	propagate_rate(&ck_dpll1);
+	omap1_show_rates();
+	loops_per_jiffy = cpufreq_scale(loops_per_jiffy, rate, ck_dpll1.rate);
+}
diff --git a/arch/arm/mach-omap1/clock.h b/arch/arm/mach-omap1/clock.h
deleted file mode 100644
index f3b8811f5ac0..000000000000
--- a/arch/arm/mach-omap1/clock.h
+++ /dev/null
@@ -1,288 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  linux/arch/arm/mach-omap1/clock.h
- *
- *  Copyright (C) 2004 - 2005, 2009 Nokia corporation
- *  Written by Tuukka Tikkanen <tuukka.tikkanen@elektrobit.com>
- *  Based on clocks.h by Tony Lindgren, Gordon McNutt and RidgeRun, Inc
- */
-
-#ifndef __ARCH_ARM_MACH_OMAP1_CLOCK_H
-#define __ARCH_ARM_MACH_OMAP1_CLOCK_H
-
-#include <linux/clk.h>
-#include <linux/list.h>
-
-#include <linux/clkdev.h>
-
-struct module;
-struct clk;
-
-struct omap_clk {
-	u16				cpu;
-	struct clk_lookup		lk;
-};
-
-#define CLK(dev, con, ck, cp)		\
-	{				\
-		 .cpu = cp,		\
-		.lk = {			\
-			.dev_id = dev,	\
-			.con_id = con,	\
-			.clk = ck,	\
-		},			\
-	}
-
-/* Platform flags for the clkdev-OMAP integration code */
-#define CK_310		(1 << 0)
-#define CK_7XX		(1 << 1)	/* 7xx, 850 */
-#define CK_1510		(1 << 2)
-#define CK_16XX		(1 << 3)	/* 16xx, 17xx, 5912 */
-#define CK_1710		(1 << 4)	/* 1710 extra for rate selection */
-
-
-/* Temporary, needed during the common clock framework conversion */
-#define __clk_get_name(clk)	(clk->name)
-#define __clk_get_parent(clk)	(clk->parent)
-#define __clk_get_rate(clk)	(clk->rate)
-
-/**
- * struct clkops - some clock function pointers
- * @enable: fn ptr that enables the current clock in hardware
- * @disable: fn ptr that enables the current clock in hardware
- * @find_idlest: function returning the IDLEST register for the clock's IP blk
- * @find_companion: function returning the "companion" clk reg for the clock
- * @allow_idle: fn ptr that enables autoidle for the current clock in hardware
- * @deny_idle: fn ptr that disables autoidle for the current clock in hardware
- *
- * A "companion" clk is an accompanying clock to the one being queried
- * that must be enabled for the IP module connected to the clock to
- * become accessible by the hardware.  Neither @find_idlest nor
- * @find_companion should be needed; that information is IP
- * block-specific; the hwmod code has been created to handle this, but
- * until hwmod data is ready and drivers have been converted to use PM
- * runtime calls in place of clk_enable()/clk_disable(), @find_idlest and
- * @find_companion must, unfortunately, remain.
- */
-struct clkops {
-	int			(*enable)(struct clk *);
-	void			(*disable)(struct clk *);
-	void			(*find_idlest)(struct clk *, void __iomem **,
-					       u8 *, u8 *);
-	void			(*find_companion)(struct clk *, void __iomem **,
-						  u8 *);
-	void			(*allow_idle)(struct clk *);
-	void			(*deny_idle)(struct clk *);
-};
-
-/*
- * struct clk.flags possibilities
- *
- * XXX document the rest of the clock flags here
- *
- * CLOCK_CLKOUTX2: (OMAP4 only) DPLL CLKOUT and CLKOUTX2 GATE_CTRL
- *     bits share the same register.  This flag allows the
- *     omap4_dpllmx*() code to determine which GATE_CTRL bit field
- *     should be used.  This is a temporary solution - a better approach
- *     would be to associate clock type-specific data with the clock,
- *     similar to the struct dpll_data approach.
- */
-#define ENABLE_REG_32BIT	(1 << 0)	/* Use 32-bit access */
-#define CLOCK_IDLE_CONTROL	(1 << 1)
-#define CLOCK_NO_IDLE_PARENT	(1 << 2)
-#define ENABLE_ON_INIT		(1 << 3)	/* Enable upon framework init */
-#define INVERT_ENABLE		(1 << 4)	/* 0 enables, 1 disables */
-#define CLOCK_CLKOUTX2		(1 << 5)
-
-/**
- * struct clk - OMAP struct clk
- * @node: list_head connecting this clock into the full clock list
- * @ops: struct clkops * for this clock
- * @name: the name of the clock in the hardware (used in hwmod data and debug)
- * @parent: pointer to this clock's parent struct clk
- * @children: list_head connecting to the child clks' @sibling list_heads
- * @sibling: list_head connecting this clk to its parent clk's @children
- * @rate: current clock rate
- * @enable_reg: register to write to enable the clock (see @enable_bit)
- * @recalc: fn ptr that returns the clock's current rate
- * @set_rate: fn ptr that can change the clock's current rate
- * @round_rate: fn ptr that can round the clock's current rate
- * @init: fn ptr to do clock-specific initialization
- * @enable_bit: bitshift to write to enable/disable the clock (see @enable_reg)
- * @usecount: number of users that have requested this clock to be enabled
- * @fixed_div: when > 0, this clock's rate is its parent's rate / @fixed_div
- * @flags: see "struct clk.flags possibilities" above
- * @rate_offset: bitshift for rate selection bitfield (OMAP1 only)
- * @src_offset: bitshift for source selection bitfield (OMAP1 only)
- *
- * XXX @rate_offset, @src_offset should probably be removed and OMAP1
- * clock code converted to use clksel.
- *
- * XXX @usecount is poorly named.  It should be "enable_count" or
- * something similar.  "users" in the description refers to kernel
- * code (core code or drivers) that have called clk_enable() and not
- * yet called clk_disable(); the usecount of parent clocks is also
- * incremented by the clock code when clk_enable() is called on child
- * clocks and decremented by the clock code when clk_disable() is
- * called on child clocks.
- *
- * XXX @clkdm, @usecount, @children, @sibling should be marked for
- * internal use only.
- *
- * @children and @sibling are used to optimize parent-to-child clock
- * tree traversals.  (child-to-parent traversals use @parent.)
- *
- * XXX The notion of the clock's current rate probably needs to be
- * separated from the clock's target rate.
- */
-struct clk {
-	struct list_head	node;
-	const struct clkops	*ops;
-	const char		*name;
-	struct clk		*parent;
-	struct list_head	children;
-	struct list_head	sibling;	/* node for children */
-	unsigned long		rate;
-	void __iomem		*enable_reg;
-	unsigned long		(*recalc)(struct clk *);
-	int			(*set_rate)(struct clk *, unsigned long);
-	long			(*round_rate)(struct clk *, unsigned long);
-	void			(*init)(struct clk *);
-	u8			enable_bit;
-	s8			usecount;
-	u8			fixed_div;
-	u8			flags;
-	u8			rate_offset;
-	u8			src_offset;
-#if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
-	struct dentry		*dent;	/* For visible tree hierarchy */
-#endif
-};
-
-struct clk_functions {
-	int		(*clk_enable)(struct clk *clk);
-	void		(*clk_disable)(struct clk *clk);
-	long		(*clk_round_rate)(struct clk *clk, unsigned long rate);
-	int		(*clk_set_rate)(struct clk *clk, unsigned long rate);
-	int		(*clk_set_parent)(struct clk *clk, struct clk *parent);
-	void		(*clk_allow_idle)(struct clk *clk);
-	void		(*clk_deny_idle)(struct clk *clk);
-	void		(*clk_disable_unused)(struct clk *clk);
-};
-
-extern int clk_init(struct clk_functions *custom_clocks);
-extern void clk_preinit(struct clk *clk);
-extern int clk_register(struct clk *clk);
-extern void clk_reparent(struct clk *child, struct clk *parent);
-extern void clk_unregister(struct clk *clk);
-extern void propagate_rate(struct clk *clk);
-extern void recalculate_root_clocks(void);
-extern unsigned long followparent_recalc(struct clk *clk);
-extern void clk_enable_init_clocks(void);
-unsigned long omap_fixed_divisor_recalc(struct clk *clk);
-extern struct clk *omap_clk_get_by_name(const char *name);
-extern int omap_clk_enable_autoidle_all(void);
-extern int omap_clk_disable_autoidle_all(void);
-
-extern const struct clkops clkops_null;
-
-extern struct clk dummy_ck;
-
-int omap1_clk_init(void);
-void omap1_clk_late_init(void);
-extern int omap1_clk_enable(struct clk *clk);
-extern void omap1_clk_disable(struct clk *clk);
-extern long omap1_clk_round_rate(struct clk *clk, unsigned long rate);
-extern int omap1_clk_set_rate(struct clk *clk, unsigned long rate);
-extern unsigned long omap1_ckctl_recalc(struct clk *clk);
-extern int omap1_set_sossi_rate(struct clk *clk, unsigned long rate);
-extern unsigned long omap1_sossi_recalc(struct clk *clk);
-extern unsigned long omap1_ckctl_recalc_dsp_domain(struct clk *clk);
-extern int omap1_clk_set_rate_dsp_domain(struct clk *clk, unsigned long rate);
-extern int omap1_set_uart_rate(struct clk *clk, unsigned long rate);
-extern unsigned long omap1_uart_recalc(struct clk *clk);
-extern int omap1_set_ext_clk_rate(struct clk *clk, unsigned long rate);
-extern long omap1_round_ext_clk_rate(struct clk *clk, unsigned long rate);
-extern void omap1_init_ext_clk(struct clk *clk);
-extern int omap1_select_table_rate(struct clk *clk, unsigned long rate);
-extern long omap1_round_to_table_rate(struct clk *clk, unsigned long rate);
-extern int omap1_clk_set_rate_ckctl_arm(struct clk *clk, unsigned long rate);
-extern long omap1_clk_round_rate_ckctl_arm(struct clk *clk, unsigned long rate);
-extern unsigned long omap1_watchdog_recalc(struct clk *clk);
-
-#ifdef CONFIG_OMAP_RESET_CLOCKS
-extern void omap1_clk_disable_unused(struct clk *clk);
-#else
-#define omap1_clk_disable_unused	NULL
-#endif
-
-struct uart_clk {
-	struct clk	clk;
-	unsigned long	sysc_addr;
-};
-
-/* Provide a method for preventing idling some ARM IDLECT clocks */
-struct arm_idlect1_clk {
-	struct clk	clk;
-	unsigned long	no_idle_count;
-	__u8		idlect_shift;
-};
-
-/* ARM_CKCTL bit shifts */
-#define CKCTL_PERDIV_OFFSET	0
-#define CKCTL_LCDDIV_OFFSET	2
-#define CKCTL_ARMDIV_OFFSET	4
-#define CKCTL_DSPDIV_OFFSET	6
-#define CKCTL_TCDIV_OFFSET	8
-#define CKCTL_DSPMMUDIV_OFFSET	10
-/*#define ARM_TIMXO		12*/
-#define EN_DSPCK		13
-/*#define ARM_INTHCK_SEL	14*/ /* Divide-by-2 for mpu inth_ck */
-/* DSP_CKCTL bit shifts */
-#define CKCTL_DSPPERDIV_OFFSET	0
-
-/* ARM_IDLECT2 bit shifts */
-#define EN_WDTCK	0
-#define EN_XORPCK	1
-#define EN_PERCK	2
-#define EN_LCDCK	3
-#define EN_LBCK		4 /* Not on 1610/1710 */
-/*#define EN_HSABCK	5*/
-#define EN_APICK	6
-#define EN_TIMCK	7
-#define DMACK_REQ	8
-#define EN_GPIOCK	9 /* Not on 1610/1710 */
-/*#define EN_LBFREECK	10*/
-#define EN_CKOUT_ARM	11
-
-/* ARM_IDLECT3 bit shifts */
-#define EN_OCPI_CK	0
-#define EN_TC1_CK	2
-#define EN_TC2_CK	4
-
-/* DSP_IDLECT2 bit shifts (0,1,2 are same as for ARM_IDLECT2) */
-#define EN_DSPTIMCK	5
-
-/* Various register defines for clock controls scattered around OMAP chip */
-#define SDW_MCLK_INV_BIT	2	/* In ULPD_CLKC_CTRL */
-#define USB_MCLK_EN_BIT		4	/* In ULPD_CLKC_CTRL */
-#define USB_HOST_HHC_UHOST_EN	9	/* In MOD_CONF_CTRL_0 */
-#define SWD_ULPD_PLL_CLK_REQ	1	/* In SWD_CLK_DIV_CTRL_SEL */
-#define COM_ULPD_PLL_CLK_REQ	1	/* In COM_CLK_DIV_CTRL_SEL */
-#define SWD_CLK_DIV_CTRL_SEL	0xfffe0874
-#define COM_CLK_DIV_CTRL_SEL	0xfffe0878
-#define SOFT_REQ_REG		0xfffe0834
-#define SOFT_REQ_REG2		0xfffe0880
-
-extern __u32 arm_idlect1_mask;
-extern struct clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
-
-extern const struct clkops clkops_dspck;
-extern const struct clkops clkops_dummy;
-extern const struct clkops clkops_uart_16xx;
-extern const struct clkops clkops_generic;
-
-/* used for passing SoC type to omap1_{select,round_to}_table_rate() */
-extern u32 cpu_mask;
-
-#endif
diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
deleted file mode 100644
index 36f04da4b939..000000000000
--- a/arch/arm/mach-omap1/clock_data.c
+++ /dev/null
@@ -1,920 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  linux/arch/arm/mach-omap1/clock_data.c
- *
- *  Copyright (C) 2004 - 2005, 2009-2010 Nokia Corporation
- *  Written by Tuukka Tikkanen <tuukka.tikkanen@elektrobit.com>
- *  Based on clocks.h by Tony Lindgren, Gordon McNutt and RidgeRun, Inc
- *
- * To do:
- * - Clocks that are only available on some chips should be marked with the
- *   chips that they are present on.
- */
-
-#include <linux/kernel.h>
-#include <linux/io.h>
-#include <linux/clk.h>
-#include <linux/cpufreq.h>
-#include <linux/delay.h>
-#include <linux/soc/ti/omap1-io.h>
-
-#include <asm/mach-types.h>  /* for machine_is_* */
-
-#include "soc.h"
-#include "hardware.h"
-#include "usb.h"   /* for OTG_BASE */
-#include "iomap.h"
-#include "clock.h"
-#include "sram.h"
-
-/* Some ARM_IDLECT1 bit shifts - used in struct arm_idlect1_clk */
-#define IDL_CLKOUT_ARM_SHIFT			12
-#define IDLTIM_ARM_SHIFT			9
-#define IDLAPI_ARM_SHIFT			8
-#define IDLIF_ARM_SHIFT				6
-#define IDLLB_ARM_SHIFT				4	/* undocumented? */
-#define OMAP1510_IDLLCD_ARM_SHIFT		3	/* undocumented? */
-#define IDLPER_ARM_SHIFT			2
-#define IDLXORP_ARM_SHIFT			1
-#define IDLWDT_ARM_SHIFT			0
-
-/* Some MOD_CONF_CTRL_0 bit shifts - used in struct clk.enable_bit */
-#define CONF_MOD_UART3_CLK_MODE_R		31
-#define CONF_MOD_UART2_CLK_MODE_R		30
-#define CONF_MOD_UART1_CLK_MODE_R		29
-#define CONF_MOD_MMC_SD_CLK_REQ_R		23
-#define CONF_MOD_MCBSP3_AUXON			20
-
-/* Some MOD_CONF_CTRL_1 bit shifts - used in struct clk.enable_bit */
-#define CONF_MOD_SOSSI_CLK_EN_R			16
-
-/* Some OTG_SYSCON_2-specific bit fields */
-#define OTG_SYSCON_2_UHOST_EN_SHIFT		8
-
-/* Some SOFT_REQ_REG bit fields - used in struct clk.enable_bit */
-#define SOFT_MMC2_DPLL_REQ_SHIFT	13
-#define SOFT_MMC_DPLL_REQ_SHIFT		12
-#define SOFT_UART3_DPLL_REQ_SHIFT	11
-#define SOFT_UART2_DPLL_REQ_SHIFT	10
-#define SOFT_UART1_DPLL_REQ_SHIFT	9
-#define SOFT_USB_OTG_DPLL_REQ_SHIFT	8
-#define SOFT_CAM_DPLL_REQ_SHIFT		7
-#define SOFT_COM_MCKO_REQ_SHIFT		6
-#define SOFT_PERIPH_REQ_SHIFT		5	/* sys_ck gate for UART2 ? */
-#define USB_REQ_EN_SHIFT		4
-#define SOFT_USB_REQ_SHIFT		3	/* sys_ck gate for USB host? */
-#define SOFT_SDW_REQ_SHIFT		2	/* sys_ck gate for Bluetooth? */
-#define SOFT_COM_REQ_SHIFT		1	/* sys_ck gate for com proc? */
-#define SOFT_DPLL_REQ_SHIFT		0
-
-/*
- * Omap1 clocks
- */
-
-static struct clk ck_ref = {
-	.name		= "ck_ref",
-	.ops		= &clkops_null,
-	.rate		= 12000000,
-};
-
-static struct clk ck_dpll1 = {
-	.name		= "ck_dpll1",
-	.ops		= &clkops_null,
-	.parent		= &ck_ref,
-};
-
-/*
- * FIXME: This clock seems to be necessary but no-one has asked for its
- * activation.  [ FIX: SoSSI, SSR ]
- */
-static struct arm_idlect1_clk ck_dpll1out = {
-	.clk = {
-		.name		= "ck_dpll1out",
-		.ops		= &clkops_generic,
-		.parent		= &ck_dpll1,
-		.flags		= CLOCK_IDLE_CONTROL | ENABLE_REG_32BIT |
-				  ENABLE_ON_INIT,
-		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-		.enable_bit	= EN_CKOUT_ARM,
-		.recalc		= &followparent_recalc,
-	},
-	.idlect_shift	= IDL_CLKOUT_ARM_SHIFT,
-};
-
-static struct clk sossi_ck = {
-	.name		= "ck_sossi",
-	.ops		= &clkops_generic,
-	.parent		= &ck_dpll1out.clk,
-	.flags		= CLOCK_NO_IDLE_PARENT | ENABLE_REG_32BIT,
-	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1),
-	.enable_bit	= CONF_MOD_SOSSI_CLK_EN_R,
-	.recalc		= &omap1_sossi_recalc,
-	.set_rate	= &omap1_set_sossi_rate,
-};
-
-static struct clk arm_ck = {
-	.name		= "arm_ck",
-	.ops		= &clkops_null,
-	.parent		= &ck_dpll1,
-	.rate_offset	= CKCTL_ARMDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc,
-	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= omap1_clk_set_rate_ckctl_arm,
-};
-
-static struct arm_idlect1_clk armper_ck = {
-	.clk = {
-		.name		= "armper_ck",
-		.ops		= &clkops_generic,
-		.parent		= &ck_dpll1,
-		.flags		= CLOCK_IDLE_CONTROL,
-		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-		.enable_bit	= EN_PERCK,
-		.rate_offset	= CKCTL_PERDIV_OFFSET,
-		.recalc		= &omap1_ckctl_recalc,
-		.round_rate	= omap1_clk_round_rate_ckctl_arm,
-		.set_rate	= omap1_clk_set_rate_ckctl_arm,
-	},
-	.idlect_shift	= IDLPER_ARM_SHIFT,
-};
-
-/*
- * FIXME: This clock seems to be necessary but no-one has asked for its
- * activation.  [ GPIO code for 1510 ]
- */
-static struct clk arm_gpio_ck = {
-	.name		= "ick",
-	.ops		= &clkops_generic,
-	.parent		= &ck_dpll1,
-	.flags		= ENABLE_ON_INIT,
-	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-	.enable_bit	= EN_GPIOCK,
-	.recalc		= &followparent_recalc,
-};
-
-static struct arm_idlect1_clk armxor_ck = {
-	.clk = {
-		.name		= "armxor_ck",
-		.ops		= &clkops_generic,
-		.parent		= &ck_ref,
-		.flags		= CLOCK_IDLE_CONTROL,
-		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-		.enable_bit	= EN_XORPCK,
-		.recalc		= &followparent_recalc,
-	},
-	.idlect_shift	= IDLXORP_ARM_SHIFT,
-};
-
-static struct arm_idlect1_clk armtim_ck = {
-	.clk = {
-		.name		= "armtim_ck",
-		.ops		= &clkops_generic,
-		.parent		= &ck_ref,
-		.flags		= CLOCK_IDLE_CONTROL,
-		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-		.enable_bit	= EN_TIMCK,
-		.recalc		= &followparent_recalc,
-	},
-	.idlect_shift	= IDLTIM_ARM_SHIFT,
-};
-
-static struct arm_idlect1_clk armwdt_ck = {
-	.clk = {
-		.name		= "armwdt_ck",
-		.ops		= &clkops_generic,
-		.parent		= &ck_ref,
-		.flags		= CLOCK_IDLE_CONTROL,
-		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-		.enable_bit	= EN_WDTCK,
-		.fixed_div	= 14,
-		.recalc		= &omap_fixed_divisor_recalc,
-	},
-	.idlect_shift	= IDLWDT_ARM_SHIFT,
-};
-
-static struct clk arminth_ck16xx = {
-	.name		= "arminth_ck",
-	.ops		= &clkops_null,
-	.parent		= &arm_ck,
-	.recalc		= &followparent_recalc,
-	/* Note: On 16xx the frequency can be divided by 2 by programming
-	 * ARM_CKCTL:ARM_INTHCK_SEL(14) to 1
-	 *
-	 * 1510 version is in TC clocks.
-	 */
-};
-
-static struct clk dsp_ck = {
-	.name		= "dsp_ck",
-	.ops		= &clkops_generic,
-	.parent		= &ck_dpll1,
-	.enable_reg	= OMAP1_IO_ADDRESS(ARM_CKCTL),
-	.enable_bit	= EN_DSPCK,
-	.rate_offset	= CKCTL_DSPDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc,
-	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= omap1_clk_set_rate_ckctl_arm,
-};
-
-static struct clk dspmmu_ck = {
-	.name		= "dspmmu_ck",
-	.ops		= &clkops_null,
-	.parent		= &ck_dpll1,
-	.rate_offset	= CKCTL_DSPMMUDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc,
-	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= omap1_clk_set_rate_ckctl_arm,
-};
-
-static struct clk dspper_ck = {
-	.name		= "dspper_ck",
-	.ops		= &clkops_dspck,
-	.parent		= &ck_dpll1,
-	.enable_reg	= DSP_IDLECT2,
-	.enable_bit	= EN_PERCK,
-	.rate_offset	= CKCTL_PERDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc_dsp_domain,
-	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= &omap1_clk_set_rate_dsp_domain,
-};
-
-static struct clk dspxor_ck = {
-	.name		= "dspxor_ck",
-	.ops		= &clkops_dspck,
-	.parent		= &ck_ref,
-	.enable_reg	= DSP_IDLECT2,
-	.enable_bit	= EN_XORPCK,
-	.recalc		= &followparent_recalc,
-};
-
-static struct clk dsptim_ck = {
-	.name		= "dsptim_ck",
-	.ops		= &clkops_dspck,
-	.parent		= &ck_ref,
-	.enable_reg	= DSP_IDLECT2,
-	.enable_bit	= EN_DSPTIMCK,
-	.recalc		= &followparent_recalc,
-};
-
-static struct arm_idlect1_clk tc_ck = {
-	.clk = {
-		.name		= "tc_ck",
-		.ops		= &clkops_null,
-		.parent		= &ck_dpll1,
-		.flags		= CLOCK_IDLE_CONTROL,
-		.rate_offset	= CKCTL_TCDIV_OFFSET,
-		.recalc		= &omap1_ckctl_recalc,
-		.round_rate	= omap1_clk_round_rate_ckctl_arm,
-		.set_rate	= omap1_clk_set_rate_ckctl_arm,
-	},
-	.idlect_shift	= IDLIF_ARM_SHIFT,
-};
-
-static struct clk arminth_ck1510 = {
-	.name		= "arminth_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
-	/* Note: On 1510 the frequency follows TC_CK
-	 *
-	 * 16xx version is in MPU clocks.
-	 */
-};
-
-static struct clk tipb_ck = {
-	/* No-idle controlled by "tc_ck" */
-	.name		= "tipb_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
-};
-
-static struct clk l3_ocpi_ck = {
-	/* No-idle controlled by "tc_ck" */
-	.name		= "l3_ocpi_ck",
-	.ops		= &clkops_generic,
-	.parent		= &tc_ck.clk,
-	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
-	.enable_bit	= EN_OCPI_CK,
-	.recalc		= &followparent_recalc,
-};
-
-static struct clk tc1_ck = {
-	.name		= "tc1_ck",
-	.ops		= &clkops_generic,
-	.parent		= &tc_ck.clk,
-	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
-	.enable_bit	= EN_TC1_CK,
-	.recalc		= &followparent_recalc,
-};
-
-/*
- * FIXME: This clock seems to be necessary but no-one has asked for its
- * activation.  [ pm.c (SRAM), CCP, Camera ]
- */
-static struct clk tc2_ck = {
-	.name		= "tc2_ck",
-	.ops		= &clkops_generic,
-	.parent		= &tc_ck.clk,
-	.flags		= ENABLE_ON_INIT,
-	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
-	.enable_bit	= EN_TC2_CK,
-	.recalc		= &followparent_recalc,
-};
-
-static struct clk dma_ck = {
-	/* No-idle controlled by "tc_ck" */
-	.name		= "dma_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
-};
-
-static struct clk dma_lcdfree_ck = {
-	.name		= "dma_lcdfree_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
-};
-
-static struct arm_idlect1_clk api_ck = {
-	.clk = {
-		.name		= "api_ck",
-		.ops		= &clkops_generic,
-		.parent		= &tc_ck.clk,
-		.flags		= CLOCK_IDLE_CONTROL,
-		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-		.enable_bit	= EN_APICK,
-		.recalc		= &followparent_recalc,
-	},
-	.idlect_shift	= IDLAPI_ARM_SHIFT,
-};
-
-static struct arm_idlect1_clk lb_ck = {
-	.clk = {
-		.name		= "lb_ck",
-		.ops		= &clkops_generic,
-		.parent		= &tc_ck.clk,
-		.flags		= CLOCK_IDLE_CONTROL,
-		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-		.enable_bit	= EN_LBCK,
-		.recalc		= &followparent_recalc,
-	},
-	.idlect_shift	= IDLLB_ARM_SHIFT,
-};
-
-static struct clk rhea1_ck = {
-	.name		= "rhea1_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
-};
-
-static struct clk rhea2_ck = {
-	.name		= "rhea2_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
-};
-
-static struct clk lcd_ck_16xx = {
-	.name		= "lcd_ck",
-	.ops		= &clkops_generic,
-	.parent		= &ck_dpll1,
-	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-	.enable_bit	= EN_LCDCK,
-	.rate_offset	= CKCTL_LCDDIV_OFFSET,
-	.recalc		= &omap1_ckctl_recalc,
-	.round_rate	= omap1_clk_round_rate_ckctl_arm,
-	.set_rate	= omap1_clk_set_rate_ckctl_arm,
-};
-
-static struct arm_idlect1_clk lcd_ck_1510 = {
-	.clk = {
-		.name		= "lcd_ck",
-		.ops		= &clkops_generic,
-		.parent		= &ck_dpll1,
-		.flags		= CLOCK_IDLE_CONTROL,
-		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
-		.enable_bit	= EN_LCDCK,
-		.rate_offset	= CKCTL_LCDDIV_OFFSET,
-		.recalc		= &omap1_ckctl_recalc,
-		.round_rate	= omap1_clk_round_rate_ckctl_arm,
-		.set_rate	= omap1_clk_set_rate_ckctl_arm,
-	},
-	.idlect_shift	= OMAP1510_IDLLCD_ARM_SHIFT,
-};
-
-/*
- * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
- *
- * XXX does this need SYSC register handling?
- */
-static struct clk uart1_1510 = {
-	.name		= "uart1_ck",
-	.ops		= &clkops_null,
-	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
-	.rate		= 12000000,
-	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
-	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
-	.enable_bit	= CONF_MOD_UART1_CLK_MODE_R,
-	.set_rate	= &omap1_set_uart_rate,
-	.recalc		= &omap1_uart_recalc,
-};
-
-/*
- * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
- *
- * XXX SYSC register handling does not belong in the clock framework
- */
-static struct uart_clk uart1_16xx = {
-	.clk	= {
-		.name		= "uart1_ck",
-		.ops		= &clkops_uart_16xx,
-		/* Direct from ULPD, no real parent */
-		.parent		= &armper_ck.clk,
-		.rate		= 48000000,
-		.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
-		.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
-		.enable_bit	= CONF_MOD_UART1_CLK_MODE_R,
-	},
-	.sysc_addr	= 0xfffb0054,
-};
-
-/*
- * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
- *
- * XXX does this need SYSC register handling?
- */
-static struct clk uart2_ck = {
-	.name		= "uart2_ck",
-	.ops		= &clkops_null,
-	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
-	.rate		= 12000000,
-	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
-	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
-	.enable_bit	= CONF_MOD_UART2_CLK_MODE_R,
-	.set_rate	= &omap1_set_uart_rate,
-	.recalc		= &omap1_uart_recalc,
-};
-
-/*
- * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
- *
- * XXX does this need SYSC register handling?
- */
-static struct clk uart3_1510 = {
-	.name		= "uart3_ck",
-	.ops		= &clkops_null,
-	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
-	.rate		= 12000000,
-	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
-	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
-	.enable_bit	= CONF_MOD_UART3_CLK_MODE_R,
-	.set_rate	= &omap1_set_uart_rate,
-	.recalc		= &omap1_uart_recalc,
-};
-
-/*
- * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
- *
- * XXX SYSC register handling does not belong in the clock framework
- */
-static struct uart_clk uart3_16xx = {
-	.clk	= {
-		.name		= "uart3_ck",
-		.ops		= &clkops_uart_16xx,
-		/* Direct from ULPD, no real parent */
-		.parent		= &armper_ck.clk,
-		.rate		= 48000000,
-		.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
-		.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
-		.enable_bit	= CONF_MOD_UART3_CLK_MODE_R,
-	},
-	.sysc_addr	= 0xfffb9854,
-};
-
-static struct clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
-	.name		= "usb_clko",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent */
-	.rate		= 6000000,
-	.flags		= ENABLE_REG_32BIT,
-	.enable_reg	= OMAP1_IO_ADDRESS(ULPD_CLOCK_CTRL),
-	.enable_bit	= USB_MCLK_EN_BIT,
-};
-
-static struct clk usb_hhc_ck1510 = {
-	.name		= "usb_hhc_ck",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent */
-	.rate		= 48000000, /* Actually 2 clocks, 12MHz and 48MHz */
-	.flags		= ENABLE_REG_32BIT,
-	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
-	.enable_bit	= USB_HOST_HHC_UHOST_EN,
-};
-
-static struct clk usb_hhc_ck16xx = {
-	.name		= "usb_hhc_ck",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent */
-	.rate		= 48000000,
-	/* OTG_SYSCON_2.OTG_PADEN == 0 (not 1510-compatible) */
-	.flags		= ENABLE_REG_32BIT,
-	.enable_reg	= OMAP1_IO_ADDRESS(OTG_BASE + 0x08), /* OTG_SYSCON_2 */
-	.enable_bit	= OTG_SYSCON_2_UHOST_EN_SHIFT
-};
-
-static struct clk usb_dc_ck = {
-	.name		= "usb_dc_ck",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent */
-	.rate		= 48000000,
-	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
-	.enable_bit	= SOFT_USB_OTG_DPLL_REQ_SHIFT,
-};
-
-static struct clk uart1_7xx = {
-	.name		= "uart1_ck",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent */
-	.rate		= 12000000,
-	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
-	.enable_bit	= 9,
-};
-
-static struct clk uart2_7xx = {
-	.name		= "uart2_ck",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent */
-	.rate		= 12000000,
-	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
-	.enable_bit	= 11,
-};
-
-static struct clk mclk_1510 = {
-	.name		= "mclk",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
-	.rate		= 12000000,
-	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
-	.enable_bit	= SOFT_COM_MCKO_REQ_SHIFT,
-};
-
-static struct clk mclk_16xx = {
-	.name		= "mclk",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
-	.enable_reg	= OMAP1_IO_ADDRESS(COM_CLK_DIV_CTRL_SEL),
-	.enable_bit	= COM_ULPD_PLL_CLK_REQ,
-	.set_rate	= &omap1_set_ext_clk_rate,
-	.round_rate	= &omap1_round_ext_clk_rate,
-	.init		= &omap1_init_ext_clk,
-};
-
-static struct clk bclk_1510 = {
-	.name		= "bclk",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
-	.rate		= 12000000,
-};
-
-static struct clk bclk_16xx = {
-	.name		= "bclk",
-	.ops		= &clkops_generic,
-	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
-	.enable_reg	= OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL),
-	.enable_bit	= SWD_ULPD_PLL_CLK_REQ,
-	.set_rate	= &omap1_set_ext_clk_rate,
-	.round_rate	= &omap1_round_ext_clk_rate,
-	.init		= &omap1_init_ext_clk,
-};
-
-static struct clk mmc1_ck = {
-	.name		= "mmc1_ck",
-	.ops		= &clkops_generic,
-	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
-	.rate		= 48000000,
-	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
-	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
-	.enable_bit	= CONF_MOD_MMC_SD_CLK_REQ_R,
-};
-
-/*
- * XXX MOD_CONF_CTRL_0 bit 20 is defined in the 1510 TRM as
- * CONF_MOD_MCBSP3_AUXON ??
- */
-static struct clk mmc2_ck = {
-	.name		= "mmc2_ck",
-	.ops		= &clkops_generic,
-	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
-	.rate		= 48000000,
-	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
-	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
-	.enable_bit	= 20,
-};
-
-static struct clk mmc3_ck = {
-	.name		= "mmc3_ck",
-	.ops		= &clkops_generic,
-	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
-	.rate		= 48000000,
-	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
-	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
-	.enable_bit	= SOFT_MMC_DPLL_REQ_SHIFT,
-};
-
-static struct clk virtual_ck_mpu = {
-	.name		= "mpu",
-	.ops		= &clkops_null,
-	.parent		= &arm_ck, /* Is smarter alias for */
-	.recalc		= &followparent_recalc,
-	.set_rate	= &omap1_select_table_rate,
-	.round_rate	= &omap1_round_to_table_rate,
-};
-
-/* virtual functional clock domain for I2C. Just for making sure that ARMXOR_CK
-remains active during MPU idle whenever this is enabled */
-static struct clk i2c_fck = {
-	.name		= "i2c_fck",
-	.ops		= &clkops_null,
-	.flags		= CLOCK_NO_IDLE_PARENT,
-	.parent		= &armxor_ck.clk,
-	.recalc		= &followparent_recalc,
-};
-
-static struct clk i2c_ick = {
-	.name		= "i2c_ick",
-	.ops		= &clkops_null,
-	.flags		= CLOCK_NO_IDLE_PARENT,
-	.parent		= &armper_ck.clk,
-	.recalc		= &followparent_recalc,
-};
-
-/*
- * clkdev integration
- */
-
-static struct omap_clk omap_clks[] = {
-	/* non-ULPD clocks */
-	CLK(NULL,	"ck_ref",	&ck_ref,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK(NULL,	"ck_dpll1",	&ck_dpll1,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	/* CK_GEN1 clocks */
-	CLK(NULL,	"ck_dpll1out",	&ck_dpll1out.clk, CK_16XX),
-	CLK(NULL,	"ck_sossi",	&sossi_ck,	CK_16XX),
-	CLK(NULL,	"arm_ck",	&arm_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"armper_ck",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap_gpio.0", "ick",	&arm_gpio_ck,	CK_1510 | CK_310),
-	CLK(NULL,	"armxor_ck",	&armxor_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK(NULL,	"armtim_ck",	&armtim_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap_wdt",	"fck",		&armwdt_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap_wdt",	"ick",		&armper_ck.clk,	CK_16XX),
-	CLK("omap_wdt", "ick",		&dummy_ck,	CK_1510 | CK_310),
-	CLK(NULL,	"arminth_ck",	&arminth_ck1510, CK_1510 | CK_310),
-	CLK(NULL,	"arminth_ck",	&arminth_ck16xx, CK_16XX),
-	/* CK_GEN2 clocks */
-	CLK(NULL,	"dsp_ck",	&dsp_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dspmmu_ck",	&dspmmu_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dspper_ck",	&dspper_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dspxor_ck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dsptim_ck",	&dsptim_ck,	CK_16XX | CK_1510 | CK_310),
-	/* CK_GEN3 clocks */
-	CLK(NULL,	"tc_ck",	&tc_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK(NULL,	"tipb_ck",	&tipb_ck,	CK_1510 | CK_310),
-	CLK(NULL,	"l3_ocpi_ck",	&l3_ocpi_ck,	CK_16XX | CK_7XX),
-	CLK(NULL,	"tc1_ck",	&tc1_ck,	CK_16XX),
-	CLK(NULL,	"tc2_ck",	&tc2_ck,	CK_16XX),
-	CLK(NULL,	"dma_ck",	&dma_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dma_lcdfree_ck", &dma_lcdfree_ck, CK_16XX),
-	CLK(NULL,	"api_ck",	&api_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK(NULL,	"lb_ck",	&lb_ck.clk,	CK_1510 | CK_310),
-	CLK(NULL,	"rhea1_ck",	&rhea1_ck,	CK_16XX),
-	CLK(NULL,	"rhea2_ck",	&rhea2_ck,	CK_16XX),
-	CLK(NULL,	"lcd_ck",	&lcd_ck_16xx,	CK_16XX | CK_7XX),
-	CLK(NULL,	"lcd_ck",	&lcd_ck_1510.clk, CK_1510 | CK_310),
-	/* ULPD clocks */
-	CLK(NULL,	"uart1_ck",	&uart1_1510,	CK_1510 | CK_310),
-	CLK(NULL,	"uart1_ck",	&uart1_16xx.clk, CK_16XX),
-	CLK(NULL,	"uart1_ck",	&uart1_7xx,	CK_7XX),
-	CLK(NULL,	"uart2_ck",	&uart2_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"uart2_ck",	&uart2_7xx,	CK_7XX),
-	CLK(NULL,	"uart3_ck",	&uart3_1510,	CK_1510 | CK_310),
-	CLK(NULL,	"uart3_ck",	&uart3_16xx.clk, CK_16XX),
-	CLK(NULL,	"usb_clko",	&usb_clko,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"usb_hhc_ck",	&usb_hhc_ck1510, CK_1510 | CK_310),
-	CLK(NULL,	"usb_hhc_ck",	&usb_hhc_ck16xx, CK_16XX),
-	CLK(NULL,	"usb_dc_ck",	&usb_dc_ck,	CK_16XX | CK_7XX),
-	CLK(NULL,	"mclk",		&mclk_1510,	CK_1510 | CK_310),
-	CLK(NULL,	"mclk",		&mclk_16xx,	CK_16XX),
-	CLK(NULL,	"bclk",		&bclk_1510,	CK_1510 | CK_310),
-	CLK(NULL,	"bclk",		&bclk_16xx,	CK_16XX),
-	CLK("mmci-omap.0", "fck",	&mmc1_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK("mmci-omap.0", "fck",	&mmc3_ck,	CK_7XX),
-	CLK("mmci-omap.0", "ick",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK("mmci-omap.1", "fck",	&mmc2_ck,	CK_16XX),
-	CLK("mmci-omap.1", "ick",	&armper_ck.clk,	CK_16XX),
-	/* Virtual clocks */
-	CLK(NULL,	"mpu",		&virtual_ck_mpu, CK_16XX | CK_1510 | CK_310),
-	CLK("omap_i2c.1", "fck",	&i2c_fck,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK("omap_i2c.1", "ick",	&i2c_ick,	CK_16XX),
-	CLK("omap_i2c.1", "ick",	&dummy_ck,	CK_1510 | CK_310 | CK_7XX),
-	CLK("omap1_spi100k.1", "fck",	&dummy_ck,	CK_7XX),
-	CLK("omap1_spi100k.1", "ick",	&dummy_ck,	CK_7XX),
-	CLK("omap1_spi100k.2", "fck",	&dummy_ck,	CK_7XX),
-	CLK("omap1_spi100k.2", "ick",	&dummy_ck,	CK_7XX),
-	CLK("omap_uwire", "fck",	&armxor_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap-mcbsp.1", "ick",	&dspper_ck,	CK_16XX),
-	CLK("omap-mcbsp.1", "ick",	&dummy_ck,	CK_1510 | CK_310),
-	CLK("omap-mcbsp.2", "ick",	&armper_ck.clk,	CK_16XX),
-	CLK("omap-mcbsp.2", "ick",	&dummy_ck,	CK_1510 | CK_310),
-	CLK("omap-mcbsp.3", "ick",	&dspper_ck,	CK_16XX),
-	CLK("omap-mcbsp.3", "ick",	&dummy_ck,	CK_1510 | CK_310),
-	CLK("omap-mcbsp.1", "fck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap-mcbsp.2", "fck",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap-mcbsp.3", "fck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
-};
-
-/*
- * init
- */
-
-static void __init omap1_show_rates(void)
-{
-	pr_notice("Clocking rate (xtal/DPLL1/MPU): %ld.%01ld/%ld.%01ld/%ld.%01ld MHz\n",
-		  ck_ref.rate / 1000000, (ck_ref.rate / 100000) % 10,
-		  ck_dpll1.rate / 1000000, (ck_dpll1.rate / 100000) % 10,
-		  arm_ck.rate / 1000000, (arm_ck.rate / 100000) % 10);
-}
-
-u32 cpu_mask;
-
-int __init omap1_clk_init(void)
-{
-	struct omap_clk *c;
-	int crystal_type = 0; /* Default 12 MHz */
-	u32 reg;
-
-#ifdef CONFIG_DEBUG_LL
-	/*
-	 * Resets some clocks that may be left on from bootloader,
-	 * but leaves serial clocks on.
-	 */
-	omap_writel(0x3 << 29, MOD_CONF_CTRL_0);
-#endif
-
-	/* USB_REQ_EN will be disabled later if necessary (usb_dc_ck) */
-	reg = omap_readw(SOFT_REQ_REG) & (1 << 4);
-	omap_writew(reg, SOFT_REQ_REG);
-	if (!cpu_is_omap15xx())
-		omap_writew(0, SOFT_REQ_REG2);
-
-	/* By default all idlect1 clocks are allowed to idle */
-	arm_idlect1_mask = ~0;
-
-	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
-		clk_preinit(c->lk.clk);
-
-	cpu_mask = 0;
-	if (cpu_is_omap1710())
-		cpu_mask |= CK_1710;
-	if (cpu_is_omap16xx())
-		cpu_mask |= CK_16XX;
-	if (cpu_is_omap1510())
-		cpu_mask |= CK_1510;
-	if (cpu_is_omap7xx())
-		cpu_mask |= CK_7XX;
-	if (cpu_is_omap310())
-		cpu_mask |= CK_310;
-
-	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
-		if (c->cpu & cpu_mask) {
-			clkdev_add(&c->lk);
-			clk_register(c->lk.clk);
-		}
-
-	/* Pointers to these clocks are needed by code in clock.c */
-	api_ck_p = clk_get(NULL, "api_ck");
-	ck_dpll1_p = clk_get(NULL, "ck_dpll1");
-	ck_ref_p = clk_get(NULL, "ck_ref");
-
-	if (cpu_is_omap7xx())
-		ck_ref.rate = 13000000;
-	if (cpu_is_omap16xx() && crystal_type == 2)
-		ck_ref.rate = 19200000;
-
-	pr_info("Clocks: ARM_SYSST: 0x%04x DPLL_CTL: 0x%04x ARM_CKCTL: 0x%04x\n",
-		omap_readw(ARM_SYSST), omap_readw(DPLL_CTL),
-		omap_readw(ARM_CKCTL));
-
-	/* We want to be in syncronous scalable mode */
-	omap_writew(0x1000, ARM_SYSST);
-
-
-	/*
-	 * Initially use the values set by bootloader. Determine PLL rate and
-	 * recalculate dependent clocks as if kernel had changed PLL or
-	 * divisors. See also omap1_clk_late_init() that can reprogram dpll1
-	 * after the SRAM is initialized.
-	 */
-	{
-		unsigned pll_ctl_val = omap_readw(DPLL_CTL);
-
-		ck_dpll1.rate = ck_ref.rate; /* Base xtal rate */
-		if (pll_ctl_val & 0x10) {
-			/* PLL enabled, apply multiplier and divisor */
-			if (pll_ctl_val & 0xf80)
-				ck_dpll1.rate *= (pll_ctl_val & 0xf80) >> 7;
-			ck_dpll1.rate /= ((pll_ctl_val & 0x60) >> 5) + 1;
-		} else {
-			/* PLL disabled, apply bypass divisor */
-			switch (pll_ctl_val & 0xc) {
-			case 0:
-				break;
-			case 0x4:
-				ck_dpll1.rate /= 2;
-				break;
-			default:
-				ck_dpll1.rate /= 4;
-				break;
-			}
-		}
-	}
-	propagate_rate(&ck_dpll1);
-	/* Cache rates for clocks connected to ck_ref (not dpll1) */
-	propagate_rate(&ck_ref);
-	omap1_show_rates();
-	if (machine_is_omap_perseus2() || machine_is_omap_fsample()) {
-		/* Select slicer output as OMAP input clock */
-		omap_writew(omap_readw(OMAP7XX_PCC_UPLD_CTRL) & ~0x1,
-				OMAP7XX_PCC_UPLD_CTRL);
-	}
-
-	/* Amstrad Delta wants BCLK high when inactive */
-	if (machine_is_ams_delta())
-		omap_writel(omap_readl(ULPD_CLOCK_CTRL) |
-				(1 << SDW_MCLK_INV_BIT),
-				ULPD_CLOCK_CTRL);
-
-	/* Turn off DSP and ARM_TIMXO. Make sure ARM_INTHCK is not divided */
-	/* (on 730, bit 13 must not be cleared) */
-	if (cpu_is_omap7xx())
-		omap_writew(omap_readw(ARM_CKCTL) & 0x2fff, ARM_CKCTL);
-	else
-		omap_writew(omap_readw(ARM_CKCTL) & 0x0fff, ARM_CKCTL);
-
-	/* Put DSP/MPUI into reset until needed */
-	omap_writew(0, ARM_RSTCT1);
-	omap_writew(1, ARM_RSTCT2);
-	omap_writew(0x400, ARM_IDLECT1);
-
-	/*
-	 * According to OMAP5910 Erratum SYS_DMA_1, bit DMACK_REQ (bit 8)
-	 * of the ARM_IDLECT2 register must be set to zero. The power-on
-	 * default value of this bit is one.
-	 */
-	omap_writew(0x0000, ARM_IDLECT2);	/* Turn LCD clock off also */
-
-	/*
-	 * Only enable those clocks we will need, let the drivers
-	 * enable other clocks as necessary
-	 */
-	clk_enable(&armper_ck.clk);
-	clk_enable(&armxor_ck.clk);
-	clk_enable(&armtim_ck.clk); /* This should be done by timer code */
-
-	if (cpu_is_omap15xx())
-		clk_enable(&arm_gpio_ck);
-
-	return 0;
-}
-
-#define OMAP1_DPLL1_SANE_VALUE	60000000
-
-void __init omap1_clk_late_init(void)
-{
-	unsigned long rate = ck_dpll1.rate;
-
-	/* Find the highest supported frequency and enable it */
-	if (omap1_select_table_rate(&virtual_ck_mpu, ~0)) {
-		pr_err("System frequencies not set, using default. Check your config.\n");
-		/*
-		 * Reprogramming the DPLL is tricky, it must be done from SRAM.
-		 */
-		omap_sram_reprogram_clock(0x2290, 0x0005);
-		ck_dpll1.rate = OMAP1_DPLL1_SANE_VALUE;
-	}
-	propagate_rate(&ck_dpll1);
-	omap1_show_rates();
-	loops_per_jiffy = cpufreq_scale(loops_per_jiffy, rate, ck_dpll1.rate);
-}
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 5ceff05e15c0..fb360902c6fc 100644
--- a/arch/arm/mach-omap1/common.h
+++ b/arch/arm/mach-omap1/common.h
@@ -77,6 +77,8 @@ void omap1_init_irq(void);
 void __exception_irq_entry omap1_handle_irq(struct pt_regs *regs);
 void omap1_init_late(void);
 void omap1_restart(enum reboot_mode, const char *);
+int omap1_clk_init(void);
+void omap1_clk_late_init(void);
 
 extern void __init omap_check_revision(void);
 
diff --git a/arch/arm/mach-omap1/devices.c b/arch/arm/mach-omap1/devices.c
index 36b03410b210..01213ad07b5c 100644
--- a/arch/arm/mach-omap1/devices.c
+++ b/arch/arm/mach-omap1/devices.c
@@ -25,7 +25,6 @@
 #include "camera.h"
 #include "hardware.h"
 #include "common.h"
-#include "clock.h"
 #include "mmc.h"
 #include "sram.h"
 
diff --git a/arch/arm/mach-omap1/io.c b/arch/arm/mach-omap1/io.c
index cf425aeeb240..b0465a956ea8 100644
--- a/arch/arm/mach-omap1/io.c
+++ b/arch/arm/mach-omap1/io.c
@@ -18,7 +18,6 @@
 #include "mux.h"
 #include "iomap.h"
 #include "common.h"
-#include "clock.h"
 
 /*
  * The machine specific code may provide the extra mapping besides the
diff --git a/arch/arm/mach-omap1/opp.h b/arch/arm/mach-omap1/opp.h
deleted file mode 100644
index 5b8b9c8edfe3..000000000000
--- a/arch/arm/mach-omap1/opp.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  linux/arch/arm/mach-omap1/opp.h
- *
- *  Copyright (C) 2004 - 2005 Nokia corporation
- *  Written by Tuukka Tikkanen <tuukka.tikkanen@elektrobit.com>
- *  Based on clocks.h by Tony Lindgren, Gordon McNutt and RidgeRun, Inc
- */
-
-#ifndef __ARCH_ARM_MACH_OMAP1_OPP_H
-#define __ARCH_ARM_MACH_OMAP1_OPP_H
-
-#include <linux/types.h>
-
-struct mpu_rate {
-	unsigned long		rate;
-	unsigned long		xtal;
-	unsigned long		pll_rate;
-	__u16			ckctl_val;
-	__u16			dpllctl_val;
-	u32			flags;
-};
-
-extern struct mpu_rate omap1_rate_table[];
-
-#endif
diff --git a/arch/arm/mach-omap1/opp_data.c b/arch/arm/mach-omap1/opp_data.c
deleted file mode 100644
index a27ca7dc03a2..000000000000
--- a/arch/arm/mach-omap1/opp_data.c
+++ /dev/null
@@ -1,51 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  linux/arch/arm/mach-omap1/opp_data.c
- *
- *  Copyright (C) 2004 - 2005 Nokia corporation
- *  Written by Tuukka Tikkanen <tuukka.tikkanen@elektrobit.com>
- *  Based on clocks.h by Tony Lindgren, Gordon McNutt and RidgeRun, Inc
- */
-
-#include "clock.h"
-#include "opp.h"
-
-/*-------------------------------------------------------------------------
- * Omap1 MPU rate table
- *-------------------------------------------------------------------------*/
-struct mpu_rate omap1_rate_table[] = {
-	/* MPU MHz, xtal MHz, dpll1 MHz, CKCTL, DPLL_CTL
-	 * NOTE: Comment order here is different from bits in CKCTL value:
-	 * armdiv, dspdiv, dspmmu, tcdiv, perdiv, lcddiv
-	 */
-	{ 216000000, 12000000, 216000000, 0x050d, 0x2910, /* 1/1/2/2/2/8 */
-			CK_1710 },
-	{ 195000000, 13000000, 195000000, 0x050e, 0x2790, /* 1/1/2/2/4/8 */
-			CK_7XX },
-	{ 192000000, 19200000, 192000000, 0x050f, 0x2510, /* 1/1/2/2/8/8 */
-			CK_16XX },
-	{ 192000000, 12000000, 192000000, 0x050f, 0x2810, /* 1/1/2/2/8/8 */
-			CK_16XX },
-	{  96000000, 12000000, 192000000, 0x055f, 0x2810, /* 2/2/2/2/8/8 */
-			CK_16XX },
-	{  48000000, 12000000, 192000000, 0x0baf, 0x2810, /* 4/4/4/8/8/8 */
-			CK_16XX },
-	{  24000000, 12000000, 192000000, 0x0fff, 0x2810, /* 8/8/8/8/8/8 */
-			CK_16XX },
-	{ 182000000, 13000000, 182000000, 0x050e, 0x2710, /* 1/1/2/2/4/8 */
-			CK_7XX },
-	{ 168000000, 12000000, 168000000, 0x010f, 0x2710, /* 1/1/1/2/8/8 */
-			CK_16XX|CK_7XX },
-	{ 150000000, 12000000, 150000000, 0x010a, 0x2cb0, /* 1/1/1/2/4/4 */
-			CK_1510 },
-	{ 120000000, 12000000, 120000000, 0x010a, 0x2510, /* 1/1/1/2/4/4 */
-			CK_16XX|CK_1510|CK_310|CK_7XX },
-	{  96000000, 12000000,  96000000, 0x0005, 0x2410, /* 1/1/1/1/2/2 */
-			CK_16XX|CK_1510|CK_310|CK_7XX },
-	{  60000000, 12000000,  60000000, 0x0005, 0x2290, /* 1/1/1/1/2/2 */
-			CK_16XX|CK_1510|CK_310|CK_7XX },
-	{  30000000, 12000000,  60000000, 0x0555, 0x2290, /* 2/2/2/2/2/2 */
-			CK_16XX|CK_1510|CK_310|CK_7XX },
-	{ 0, 0, 0, 0, 0 },
-};
-
diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index dd3743c891b7..754119028138 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -61,7 +61,6 @@
 #include "mux.h"
 #include "irqs.h"
 #include "iomap.h"
-#include "clock.h"
 #include "pm.h"
 #include "soc.h"
 #include "sram.h"
-- 
2.20.0

