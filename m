Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72606180A03
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 22:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgCJVJs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 17:09:48 -0400
Received: from muru.com ([72.249.23.125]:59710 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbgCJVJs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 17:09:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9A961810A;
        Tue, 10 Mar 2020 21:10:33 +0000 (UTC)
Date:   Tue, 10 Mar 2020 14:09:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] ARM: dts: omap4-droid4: Fix sgx clock rate
Message-ID: <20200310210944.GU37466@atomide.com>
References: <20200310201818.15989-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310201818.15989-1-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200310 20:19]:
> +&sgx_module {

Sorry the sgx_module label came from the linux_openpvrsgx branch
I had merged in as Arthur noticed.

Below is an updated patch against v5.6-rc series.

Regards,

Tony

8< ------------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Tue, 10 Mar 2020 14:02:48 -0700
Subject: [PATCH] ARM: dts: omap4-droid4: Fix sgx clock rate

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
 arch/arm/boot/dts/omap4.dtsi                    |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -678,6 +678,16 @@ &rng_target {
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
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -390,7 +390,7 @@ abb_iva: regulator-abb-iva {
 			status = "disabled";
 		};
 
-		target-module@56000000 {
+		sgx_module: target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5600fe00 0x4>,
 			      <0x5600fe10 0x4>;
-- 
2.25.1
