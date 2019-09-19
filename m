Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7B8B6FD8
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 02:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbfISABO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 20:01:14 -0400
Received: from muru.com ([72.249.23.125]:33814 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbfISABO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 20:01:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C1C6D806C;
        Thu, 19 Sep 2019 00:01:43 +0000 (UTC)
Date:   Wed, 18 Sep 2019 17:01:09 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name
 with reg-names
Message-ID: <20190919000109.GG5610@atomide.com>
References: <20190905215532.8357-1-tony@atomide.com>
 <20190907035518.EB40C208C3@mail.kernel.org>
 <20190908194241.GL52127@atomide.com>
 <20190918180729.C2BB521907@mail.kernel.org>
 <20190918205344.GE5610@atomide.com>
 <20190918232842.E2CBB21907@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918232842.E2CBB21907@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [190918 23:29]:
> Quoting Tony Lindgren (2019-09-18 13:53:44)
> > Hi,
> > 
> > * Stephen Boyd <sboyd@kernel.org> [190918 18:08]:
> > > Quoting Tony Lindgren (2019-09-08 12:42:41)
> > > > Or do you have some better ideas on how to name a clock controller
> > > > in the device tree?
> > > > 
> > > 
> > > Why does the name of the clock controller or clkdm_name matter? Using a
> > > string from reg-names smells like a workaround to describe some sort of
> > > linkage between things that isn't being described in DT today.
> > 
> > Correct. This problem will eventually disappear with genpd
> > handling the clockdomains.
> > 
> > But currently the clockdomain name is parsed from the dt node
> > name, which is not standard practise. Using reg-names
> > is a standard binding, and it's usage follows the standand
> > here to describe the reg range.
> > 
> > Then eventually with genpd, the reg-names will just become
> > optinoal. But until that happens the $subject patch fixes
> > issues as described in the patch.
> > 
> 
> Is anything broken? It looks like the hidden dependency on the node name
> is being changed to be a slightly less hidden dependency on reg-names.

Yes I agree. This is still way better than relying on dts node names :)

> reg-names is supposed to be an optional property, so we're trading one
> thing for another. I still don't understand the reasoning here, but if
> Tero is happy to ack/review this change then I'm not too worried about
> it assuming the reg-names property eventually becomes optional. Just
> seems like more work and DT churn for no to little gain?

Yeah with genpd the reg-names becomes optional.

What is currently broken is we can get a wrong clockdomain or no
clockdomain for a clock if the clock controller has multiple
domains.

This happens at least with rng for omap4 and 5 where l4_per has two
clock domains (l4_per and l4_sec). I'll be posting rng dts patches
for all the SoCs after -rc1, but below is what's needed for rng on
omap4 for example after the $subject patch for reference. See the
addition of "l4_secure_clkctrl: clock@1a0" node below.

The other option would be to search and replace the "clk@" domains
with "foo@" type domains with more churn. See for example the
changes from "clk@" to "foo@" for dra7 done in b5f8ffbb6fad:

$ git show b5f8ffbb6fad | grep -C1 "clk@"

-               mpu_clkctrl: clk@20 {
+               mpu_clkctrl: mpu-clkctrl@20 {
--

-               ipu_clkctrl: clk@40 {
+               ipu1_clkctrl: ipu1-clkctrl@20 {
...

And we cannot mix "clk@" naming and "foo@" naming as a flag for all
instances is set by "clk@" naming during clkctrl clock init. So all
the clock domain nodes would need to be renamed just to add l4_sec
domain for omap4 and 5.

Anyways, if acceptable, an immutable branch against v5.3 or v5.4-rc1
with just the $subject patch would be great so I can merge it in too
for the related rng changes for v5.5.

I'm not yet sure if the $subject patch is needed for some SoC as a
fix together with a dts change to add the reg-names, but it is
possible.

Regards,

Tony

8< -----------------------
diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -653,6 +653,11 @@
 	};
 };
 
+/* RNG is used by secure mode and not accessible */
+&rng_target {
+	status = "disabled";
+};
+
 /* Configure pwm clock source for timers 8 & 9 */
 &timer8 {
 	assigned-clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>;
diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -2010,12 +2010,26 @@
 			};
 		};
 
-		target-module@90000 {			/* 0x48090000, ap 57 2a.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+		rng_target: target-module@90000 {	/* 0x48090000, ap 57 2a.0 */
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x91fe0 0x4>,
+			      <0x91fe4 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>;
+			/* Domains (P, C): l4per_pwrdm, l4_secure_clkdm */
+			clocks = <&l4_secure_clkctrl OMAP4_RNG_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x90000 0x2000>;
+
+			rng: rng@0 {
+				compatible = "ti,omap4-rng";
+				reg = <0x0 0x2000>;
+				interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@96000 {			/* 0x48096000, ap 37 26.0 */
diff --git a/arch/arm/boot/dts/omap44xx-clocks.dtsi b/arch/arm/boot/dts/omap44xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap44xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap44xx-clocks.dtsi
@@ -1284,8 +1284,14 @@
 			reg = <0x20 0x144>;
 			#clock-cells = <2>;
 		};
-	};
 
+		l4_secure_clkctrl: clock@1a0 {
+			compatible = "ti,clkctrl";
+			reg = <0x1a0 0x28>;
+			reg-names = "l4_secure";
+			#clock-cells = <2>;
+		};
+	};
 };
 
 &prm {
diff --git a/drivers/clk/ti/clk-44xx.c b/drivers/clk/ti/clk-44xx.c
--- a/drivers/clk/ti/clk-44xx.c
+++ b/drivers/clk/ti/clk-44xx.c
@@ -604,6 +604,12 @@ static const struct omap_clkctrl_reg_data omap4_l4_per_clkctrl_regs[] __initcons
 	{ 0 },
 };
 
+static const struct
+omap_clkctrl_reg_data omap4_l4_secure_clkctrl_regs[] __initconst = {
+	{ OMAP4_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
+	{ 0 },
+};
+
 static const struct omap_clkctrl_bit_data omap4_gpio1_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, omap4_gpio2_dbclk_parents, NULL },
 	{ 0 },
@@ -691,6 +697,7 @@ const struct omap_clkctrl_data omap4_clkctrl_data[] __initconst = {
 	{ 0x4a009220, omap4_l3_gfx_clkctrl_regs },
 	{ 0x4a009320, omap4_l3_init_clkctrl_regs },
 	{ 0x4a009420, omap4_l4_per_clkctrl_regs },
+	{ 0x4a0095a0, omap4_l4_secure_clkctrl_regs },
 	{ 0x4a307820, omap4_l4_wkup_clkctrl_regs },
 	{ 0x4a307a20, omap4_emu_sys_clkctrl_regs },
 	{ 0 },
diff --git a/include/dt-bindings/clock/omap4.h b/include/dt-bindings/clock/omap4.h
--- a/include/dt-bindings/clock/omap4.h
+++ b/include/dt-bindings/clock/omap4.h
@@ -124,6 +124,11 @@
 #define OMAP4_UART4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x158)
 #define OMAP4_MMC5_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x160)
 
+/* l4_secure clocks */
+#define OMAP4_L4_SECURE_CLKCTRL_OFFSET	0x1a0
+#define OMAP4_L4_SECURE_CLKCTRL_INDEX(offset)	((offset) - OMAP4_L4_SECURE_CLKCTRL_OFFSET)
+#define OMAP4_RNG_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1c0)
+
 /* l4_wkup clocks */
 #define OMAP4_L4_WKUP_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
 #define OMAP4_WD_TIMER2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-- 
2.23.0
