Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82AD3D1458
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 18:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731432AbfJIQnr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 12:43:47 -0400
Received: from muru.com ([72.249.23.125]:36210 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730708AbfJIQnr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 12:43:47 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 784C78140;
        Wed,  9 Oct 2019 16:44:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Eyal Reizer <eyalr@ti.com>, Guy Mishol <guym@ti.com>,
        John Stultz <john.stultz@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] ARM: dts: Use level interrupt for omap4 & 5 wlcore
Date:   Wed,  9 Oct 2019 09:43:44 -0700
Message-Id: <20191009164344.41093-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 572cf7d7b07d ("ARM: dts: Improve omap l4per idling with wlcore edge
sensitive interrupt") changed wlcore interrupts to use edge interrupt based
on what's specified in the wl1835mod.pdf data sheet.

However, there are still cases where we can have lost interrupts as
described in omap_gpio_unidle(). And using a level interrupt instead of edge
interrupt helps as we avoid the check for untriggered GPIO interrupts in
omap_gpio_unidle().

And with commit e6818d29ea15 ("gpio: gpio-omap: configure edge detection
for level IRQs for idle wakeup") GPIOs idle just fine with level interrupts.

Let's change omap4 and 5 wlcore users back to using level interrupt
instead of edge interrupt. Let's not change the others as I've only seen
this on omap4 and 5, probably because the other SoCs don't have l4per idle
independent of the CPUs.

Fixes: 572cf7d7b07d ("ARM: dts: Improve omap l4per idling with wlcore edge sensitive interrupt")
Depends-on: e6818d29ea15 ("gpio: gpio-omap: configure edge detection for level IRQs for idle wakeup")
Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Eyal Reizer <eyalr@ti.com>
Cc: Guy Mishol <guym@ti.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts       | 2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi      | 2 +-
 arch/arm/boot/dts/omap4-sdp.dts                | 2 +-
 arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi | 2 +-
 arch/arm/boot/dts/omap5-board-common.dtsi      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -369,7 +369,7 @@
 		compatible = "ti,wl1285", "ti,wl1283";
 		reg = <2>;
 		/* gpio_100 with gpmc_wait2 pad as wakeirq */
-		interrupts-extended = <&gpio4 4 IRQ_TYPE_EDGE_RISING>,
+		interrupts-extended = <&gpio4 4 IRQ_TYPE_LEVEL_HIGH>,
 				      <&omap4_pmx_core 0x4e>;
 		interrupt-names = "irq", "wakeup";
 		ref-clock-frequency = <26000000>;
diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -474,7 +474,7 @@
 		compatible = "ti,wl1271";
 		reg = <2>;
 		/* gpio_53 with gpmc_ncs3 pad as wakeup */
-		interrupts-extended = <&gpio2 21 IRQ_TYPE_EDGE_RISING>,
+		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_HIGH>,
 				      <&omap4_pmx_core 0x3a>;
 		interrupt-names = "irq", "wakeup";
 		ref-clock-frequency = <38400000>;
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -512,7 +512,7 @@
 		compatible = "ti,wl1281";
 		reg = <2>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <21 IRQ_TYPE_EDGE_RISING>; /* gpio 53 */
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>; /* gpio 53 */
 		ref-clock-frequency = <26000000>;
 		tcxo-clock-frequency = <26000000>;
 	};
diff --git a/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi b/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
--- a/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
+++ b/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
@@ -69,7 +69,7 @@
 		compatible = "ti,wl1271";
 		reg = <2>;
 		interrupt-parent = <&gpio2>;
-		interrupts = <9 IRQ_TYPE_EDGE_RISING>; /* gpio 41 */
+		interrupts = <9 IRQ_TYPE_LEVEL_HIGH>; /* gpio 41 */
 		ref-clock-frequency = <38400000>;
 	};
 };
diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
--- a/arch/arm/boot/dts/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/omap5-board-common.dtsi
@@ -362,7 +362,7 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlcore_irq_pin>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <14 IRQ_TYPE_EDGE_RISING>;	/* gpio 14 */
+		interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;	/* gpio 14 */
 		ref-clock-frequency = <26000000>;
 	};
 };
-- 
2.23.0
