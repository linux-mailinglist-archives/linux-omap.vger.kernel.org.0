Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26CCD1808FD
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 21:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgCJUSX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 16:18:23 -0400
Received: from muru.com ([72.249.23.125]:59694 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgCJUSX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 16:18:23 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 30226810A;
        Tue, 10 Mar 2020 20:19:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ARM: dts: omap4-droid4: Fix sgx clock rate
Date:   Tue, 10 Mar 2020 13:18:18 -0700
Message-Id: <20200310201818.15989-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We currently have a different clock rate for droid4 compared to the
stock v3.0.8 based Android Linux kernel:

# cat /sys/kernel/debug/clk/dpll_*_m7x2_ck/clk_rate
266666667
307200000
# cat /sys/kernel/debug/clk/l3_gfx_cm:clk:0000:0/clk_rate
307200000

Let's fix this by configuring sgx to use 153.6 MHz instead of 307.2 MHz.

This helps a bit with thermal issues that seem to be related to memory
corruption when using sgx. It seems that other driver related issues
still remain though.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -689,6 +689,16 @@ &rng_target {
 	status = "disabled";
 };
 
+/*
+ * Use dpll_per for sgx at 153.6MHz like the stock v3.0.8 Android kernel
+ */
+&sgx_module {
+	assigned-clocks = <&l3_gfx_clkctrl OMAP4_GPU_CLKCTRL 24>,
+			  <&dpll_per_m7x2_ck>;
+	assigned-clock-rates = <0>, <153600000>;
+	assigned-clock-parents = <&dpll_per_m7x2_ck>;
+};
+
 /* Configure pwm clock source for timers 8 & 9 */
 &timer8 {
 	assigned-clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>;
-- 
2.25.1
