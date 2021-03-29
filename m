Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEE934D571
	for <lists+linux-omap@lfdr.de>; Mon, 29 Mar 2021 18:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhC2QvM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 12:51:12 -0400
Received: from smtp-17-i2.italiaonline.it ([213.209.12.17]:39092 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230495AbhC2Quq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Mar 2021 12:50:46 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id Quy8lKyqctpGHQuyIliOm0; Mon, 29 Mar 2021 18:42:34 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617036154; bh=nbH1lCYkzDuJOmzMnHaDvCFk1I+LYdzwm2/11Mvim6g=;
        h=From;
        b=zBdY8WL2o1EwDALC64lY354sHSwBnW/kCdS4xsiBNdTP2KvlUi6RcSFuEWaHaGl6h
         9EXS4JKox3kpj1lFLXft/myXWTYJgTwAixHqZ83OQWvuu0Gar2wlA/D3nDxazcgfre
         LQ0cx4uw77W6YMB5TtIm+qBZYqXOwl5AWcAKtTxcH19xrF4pvrVcp3RiFDsKbv2elu
         AE3T+91Uzi825PrUNTzuI2OnLbiKnP338XZ+YZng0/RBK9/PxfVxrrWx5CpW5kEwMi
         pV+lGKsfstjSErBuUAfYlRDr7xxzxBjgSUqcur7037BeE5H8sDb+jSVbU1HD6QpmJu
         0v7MnrY7a5foA==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=6062037a cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=IkcTkHD0fZMA:10 a=o_rbLAqdoS-kjYQczG8A:9 a=QEXdDO2ut3YA:10
 a=fCgQI5UlmZDRPDxm0A3o:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Dario Binacchi <dariobin@libero.it>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v3 4/4] clk: ti: add am33xx spread spectrum clock support
Date:   Mon, 29 Mar 2021 18:42:21 +0200
Message-Id: <20210329164222.26794-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329164222.26794-1-dariobin@libero.it>
References: <20210329164222.26794-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOR5sfuN7CDFFUQ88TsfF0HHMJBZaMkZQKbATvMx0SfTeVaDp7fVsaCecIeyLBX8/d+G1bstcZDBADy2NQJIrQIptnGEweg1OqaE4mJjica+kR8FyFLb
 /AmZxcJHouBpWLUiZ5mUizeJOATj8KKHjfr3K3UHGLz2FiulZO3rJmbApmBYFE1ltDv25dsqMCmpeUXbRmpFM6WYST5OyuB/PQyKzcDFKWFJy6SDouUu2Clo
 iOeZnB7QLdcGcy9q+ZifKS5GfT+bLTbzmdY56kpBbw8dH/to5UXC1rBBYroyUpcJFdGE5YuHet8oy06lKGmzJtUP5IsvZBVnMjTcOY0UYe5U0zRIUjA/UUJl
 H8/XVyQM6ZKHKH6c/KxehfQKvn8D9N0ImTc/wY9YBR6/9gG3GK3glkTl4urBIwm/NaRUaRNndNkxOmYJa1C0BaqFmNKZT7ngbgc44vBpP75+nCvp6soT4ZMo
 r03r4SsW98JedLjvk608NzCmq3pbxnyfK7rqlA==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The patch enables spread spectrum clocking (SSC) for MPU and LCD PLLs.
As reported by the TI spruh73x RM, SSC is only supported for the
DISP/LCD and MPU PLLs on am33xx device. SSC is not supported for DDR,
PER, and CORE PLLs.

Calculating the required values and setting the registers accordingly
was taken from the set_mpu_spreadspectrum routine contained in the
arch/arm/mach-omap2/am33xx/clock_am33xx.c file of the u-boot project.

In locked condition, DPLL output clock = CLKINP *[M/N]. In case of
SSC enabled, the AM335x reference manual explains that there is a
restriction of range of M values. Since the omap2_dpll_round_rate
routine attempts to select the minimum possible N, the value of M
obtained is not guaranteed to be within the range required. With the new
"ti,min-div" parameter it is possible to increase N and consequently M
to satisfy the constraint imposed by SSC.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

Changes in v3:
- Use "ti,ssc-modfreq-hz" binding instead of "ti,ssc-modfreq".

Changes in v2:
- Move the DT changes to the previous patch in the series.

 drivers/clk/ti/dpll.c     | 42 +++++++++++++++++++
 drivers/clk/ti/dpll3xxx.c | 85 +++++++++++++++++++++++++++++++++++++++
 include/linux/clk/ti.h    | 24 +++++++++++
 3 files changed, 151 insertions(+)

diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index d6f1ac5b53e1..91bea2a9ee0d 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -290,7 +290,9 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	struct clk_init_data *init = NULL;
 	const char **parent_names = NULL;
 	struct dpll_data *dd = NULL;
+	int ssc_clk_index;
 	u8 dpll_mode = 0;
+	u32 min_div;
 
 	dd = kmemdup(ddt, sizeof(*dd), GFP_KERNEL);
 	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
@@ -345,6 +347,28 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	if (dd->autoidle_mask) {
 		if (ti_clk_get_reg_addr(node, 3, &dd->autoidle_reg))
 			goto cleanup;
+
+		ssc_clk_index = 4;
+	} else {
+		ssc_clk_index = 3;
+	}
+
+	if (dd->ssc_deltam_int_mask && dd->ssc_deltam_frac_mask &&
+	    dd->ssc_modfreq_mant_mask && dd->ssc_modfreq_exp_mask) {
+		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
+					&dd->ssc_deltam_reg))
+			goto cleanup;
+
+		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
+					&dd->ssc_modfreq_reg))
+			goto cleanup;
+
+		of_property_read_u32(node, "ti,ssc-modfreq-hz",
+				     &dd->ssc_modfreq);
+		of_property_read_u32(node, "ti,ssc-deltam", &dd->ssc_deltam);
+		if (of_property_read_bool(node, "ti,ssc-downspread"))
+			dd->ssc_downspread = 1;
+
 	}
 
 	if (of_property_read_bool(node, "ti,low-power-stop"))
@@ -356,6 +380,10 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	if (of_property_read_bool(node, "ti,lock"))
 		dpll_mode |= 1 << DPLL_LOCKED;
 
+	if (!of_property_read_u32(node, "ti,min-div", &min_div) &&
+	    min_div > dd->min_divider)
+		dd->min_divider = min_div;
+
 	if (dpll_mode)
 		dd->modes = dpll_mode;
 
@@ -585,8 +613,15 @@ static void __init of_ti_am3_no_gate_dpll_setup(struct device_node *node)
 	const struct dpll_data dd = {
 		.idlest_mask = 0x1,
 		.enable_mask = 0x7,
+		.ssc_enable_mask = 0x1 << 12,
+		.ssc_ack_mask = 0x1 << 13,
+		.ssc_downspread_mask = 0x1 << 14,
 		.mult_mask = 0x7ff << 8,
 		.div1_mask = 0x7f,
+		.ssc_deltam_int_mask = 0x3 << 18,
+		.ssc_deltam_frac_mask = 0x3ffff,
+		.ssc_modfreq_mant_mask = 0x7f,
+		.ssc_modfreq_exp_mask = 0x7 << 8,
 		.max_multiplier = 2047,
 		.max_divider = 128,
 		.min_divider = 1,
@@ -645,8 +680,15 @@ static void __init of_ti_am3_dpll_setup(struct device_node *node)
 	const struct dpll_data dd = {
 		.idlest_mask = 0x1,
 		.enable_mask = 0x7,
+		.ssc_enable_mask = 0x1 << 12,
+		.ssc_ack_mask = 0x1 << 13,
+		.ssc_downspread_mask = 0x1 << 14,
 		.mult_mask = 0x7ff << 8,
 		.div1_mask = 0x7f,
+		.ssc_deltam_int_mask = 0x3 << 18,
+		.ssc_deltam_frac_mask = 0x3ffff,
+		.ssc_modfreq_mant_mask = 0x7f,
+		.ssc_modfreq_exp_mask = 0x7 << 8,
 		.max_multiplier = 2047,
 		.max_divider = 128,
 		.min_divider = 1,
diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 94d5b5fe9a2b..e32b3515f9e7 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -291,6 +291,88 @@ static void _lookup_sddiv(struct clk_hw_omap *clk, u8 *sd_div, u16 m, u8 n)
 	*sd_div = sd;
 }
 
+/**
+ * omap3_noncore_dpll_ssc_program - set spread-spectrum clocking registers
+ * @clk:	struct clk * of DPLL to set
+ *
+ * Enable the DPLL spread spectrum clocking if frequency modulation and
+ * frequency spreading have been set, otherwise disable it.
+ */
+static void omap3_noncore_dpll_ssc_program(struct clk_hw_omap *clk)
+{
+	struct dpll_data *dd = clk->dpll_data;
+	unsigned long ref_rate;
+	u32 v, ctrl, mod_freq_divider, exponent, mantissa;
+	u32 deltam_step, deltam_ceil;
+
+	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
+
+	if (dd->ssc_modfreq && dd->ssc_deltam) {
+		ctrl |= dd->ssc_enable_mask;
+
+		if (dd->ssc_downspread)
+			ctrl |= dd->ssc_downspread_mask;
+		else
+			ctrl &= ~dd->ssc_downspread_mask;
+
+		ref_rate = clk_hw_get_rate(dd->clk_ref);
+		mod_freq_divider =
+		    (ref_rate / dd->last_rounded_n) / (4 * dd->ssc_modfreq);
+		if (dd->ssc_modfreq > (ref_rate / 70))
+			pr_warn("clock: SSC modulation frequency of DPLL %s greater than %ld\n",
+				__clk_get_name(clk->hw.clk), ref_rate / 70);
+
+		exponent = 0;
+		mantissa = mod_freq_divider;
+		while ((mantissa > 127) && (exponent < 7)) {
+			exponent++;
+			mantissa /= 2;
+		}
+		if (mantissa > 127)
+			mantissa = 127;
+
+		v = ti_clk_ll_ops->clk_readl(&dd->ssc_modfreq_reg);
+		v &= ~(dd->ssc_modfreq_mant_mask | dd->ssc_modfreq_exp_mask);
+		v |= mantissa << __ffs(dd->ssc_modfreq_mant_mask);
+		v |= exponent << __ffs(dd->ssc_modfreq_exp_mask);
+		ti_clk_ll_ops->clk_writel(v, &dd->ssc_modfreq_reg);
+
+		deltam_step = dd->last_rounded_m * dd->ssc_deltam;
+		deltam_step /= 10;
+		if (dd->ssc_downspread)
+			deltam_step /= 2;
+
+		deltam_step <<= __ffs(dd->ssc_deltam_int_mask);
+		deltam_step /= 100;
+		deltam_step /= mod_freq_divider;
+		if (deltam_step > 0xFFFFF)
+			deltam_step = 0xFFFFF;
+
+		deltam_ceil = (deltam_step & dd->ssc_deltam_int_mask) >>
+		    __ffs(dd->ssc_deltam_int_mask);
+		if (deltam_step & dd->ssc_deltam_frac_mask)
+			deltam_ceil++;
+
+		if ((dd->ssc_downspread &&
+		     ((dd->last_rounded_m - (2 * deltam_ceil)) < 20 ||
+		      dd->last_rounded_m > 2045)) ||
+		    ((dd->last_rounded_m - deltam_ceil) < 20 ||
+		     (dd->last_rounded_m + deltam_ceil) > 2045))
+			pr_warn("clock: SSC multiplier of DPLL %s is out of range\n",
+				__clk_get_name(clk->hw.clk));
+
+		v = ti_clk_ll_ops->clk_readl(&dd->ssc_deltam_reg);
+		v &= ~(dd->ssc_deltam_int_mask | dd->ssc_deltam_frac_mask);
+		v |= deltam_step << __ffs(dd->ssc_deltam_int_mask |
+					  dd->ssc_deltam_frac_mask);
+		ti_clk_ll_ops->clk_writel(v, &dd->ssc_deltam_reg);
+	} else {
+		ctrl &= ~dd->ssc_enable_mask;
+	}
+
+	ti_clk_ll_ops->clk_writel(ctrl, &dd->control_reg);
+}
+
 /**
  * omap3_noncore_dpll_program - set non-core DPLL M,N values directly
  * @clk:	struct clk * of DPLL to set
@@ -390,6 +472,9 @@ static int omap3_noncore_dpll_program(struct clk_hw_omap *clk, u16 freqsel)
 		ti_clk_ll_ops->clk_writel(v, &dd->control_reg);
 	}
 
+	if (dd->ssc_enable_mask)
+		omap3_noncore_dpll_ssc_program(clk);
+
 	/* We let the clock framework set the other output dividers later */
 
 	/* REVISIT: Set ramp-up delay? */
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index c62f6fa6763d..cba093de62d8 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -63,6 +63,18 @@ struct clk_omap_reg {
  * @auto_recal_bit: bitshift of the driftguard enable bit in @control_reg
  * @recal_en_bit: bitshift of the PRM_IRQENABLE_* bit for recalibration IRQs
  * @recal_st_bit: bitshift of the PRM_IRQSTATUS_* bit for recalibration IRQs
+ * @ssc_deltam_reg: register containing the DPLL SSC frequency spreading
+ * @ssc_modfreq_reg: register containing the DPLL SSC modulation frequency
+ * @ssc_modfreq_mant_mask: mask of the mantissa component in @ssc_modfreq_reg
+ * @ssc_modfreq_exp_mask: mask of the exponent component in @ssc_modfreq_reg
+ * @ssc_enable_mask: mask of the DPLL SSC enable bit in @control_reg
+ * @ssc_ack_mask: mask of the DPLL SSC turned on/off bit in @control_reg
+ * @ssc_downspread_mask: mask of the DPLL SSC low frequency only bit in
+ *                       @control_reg
+ * @ssc_modfreq: the DPLL SSC frequency modulation in kHz
+ * @ssc_deltam: the DPLL SSC frequency spreading in permille (10th of percent)
+ * @ssc_downspread: require the only low frequency spread of the DPLL in SSC
+ *                   mode
  * @flags: DPLL type/features (see below)
  *
  * Possible values for @flags:
@@ -110,6 +122,18 @@ struct dpll_data {
 	u8			auto_recal_bit;
 	u8			recal_en_bit;
 	u8			recal_st_bit;
+	struct clk_omap_reg	ssc_deltam_reg;
+	struct clk_omap_reg	ssc_modfreq_reg;
+	u32			ssc_deltam_int_mask;
+	u32			ssc_deltam_frac_mask;
+	u32			ssc_modfreq_mant_mask;
+	u32			ssc_modfreq_exp_mask;
+	u32                     ssc_enable_mask;
+	u32                     ssc_ack_mask;
+	u32                     ssc_downspread_mask;
+	u32                     ssc_modfreq;
+	u32                     ssc_deltam;
+	u8                      ssc_downspread;
 	u8			flags;
 };
 
-- 
2.17.1

