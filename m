Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A44F1BCC76
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2019 18:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfIXQ32 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Sep 2019 12:29:28 -0400
Received: from muru.com ([72.249.23.125]:34416 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbfIXQ32 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Sep 2019 12:29:28 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7F27380E2;
        Tue, 24 Sep 2019 16:29:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH] ARM: dts: Fix gpio0 flags for am335x-icev2
Date:   Tue, 24 Sep 2019 09:29:24 -0700
Message-Id: <20190924162924.9914-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ti,no-idle-on-init and ti,no-reset-on-init flags need to be at
the interconnect target module level for the modules that have it
defined. Otherwise we get the following warnings:

dts flag should be at module level for ti,no-idle-on-init
dts flag should be at module level for ti,no-reset-on-init

Fixes: 87fc89ced3a7 ("ARM: dts: am335x: Move l4 child devices to probe them with ti-sysc")
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Reported-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am335x-icev2.dts | 2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-icev2.dts b/arch/arm/boot/dts/am335x-icev2.dts
--- a/arch/arm/boot/dts/am335x-icev2.dts
+++ b/arch/arm/boot/dts/am335x-icev2.dts
@@ -432,7 +432,7 @@
 	pinctrl-0 = <&mmc0_pins_default>;
 };
 
-&gpio0 {
+&gpio0_target {
 	/* Do not idle the GPIO used for holding the VTT regulator */
 	ti,no-reset-on-init;
 	ti,no-idle-on-init;
diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -127,7 +127,7 @@
 			ranges = <0x0 0x5000 0x1000>;
 		};
 
-		target-module@7000 {			/* 0x44e07000, ap 14 20.0 */
+		gpio0_target: target-module@7000 {	/* 0x44e07000, ap 14 20.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "gpio1";
 			reg = <0x7000 0x4>,
-- 
2.23.0
