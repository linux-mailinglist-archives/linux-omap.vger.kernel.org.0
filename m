Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACCFF79A23A
	for <lists+linux-omap@lfdr.de>; Mon, 11 Sep 2023 06:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjIKEIl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Sep 2023 00:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjIKEIk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Sep 2023 00:08:40 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 697C3EB;
        Sun, 10 Sep 2023 21:08:34 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B9BDD8027;
        Mon, 11 Sep 2023 04:08:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/4] ARM: dts: ti: omap: Fix bandgap thermal cells addressing for omap3/4
Date:   Mon, 11 Sep 2023 07:08:24 +0300
Message-ID: <20230911040828.39386-1-tony@atomide.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix "thermal_sys: cpu_thermal: Failed to read thermal-sensors cells: -2"
error on boot for omap3/4. This is caused by wrong addressing in the dts
for bandgap sensor for single sensor instances.

Note that omap4-cpu-thermal.dtsi is shared across omap4/5 and dra7, so
we can't just change the addressing in omap4-cpu-thermal.dtsi.

Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Fixes: a761d517bbb1 ("ARM: dts: omap3: Add cpu_thermal zone")
Fixes: 0bbf6c54d100 ("arm: dts: add omap4 CPU thermal data")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi | 3 +--
 arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi | 5 ++++-
 arch/arm/boot/dts/ti/omap/omap443x.dtsi          | 1 +
 arch/arm/boot/dts/ti/omap/omap4460.dtsi          | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi b/arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi
@@ -12,8 +12,7 @@ cpu_thermal: cpu-thermal {
 	polling-delay = <1000>; /* milliseconds */
 	coefficients = <0 20000>;
 
-			/* sensor       ID */
-	thermal-sensors = <&bandgap     0>;
+	thermal-sensors = <&bandgap>;
 
 	cpu_trips: trips {
 		cpu_alert0: cpu_alert {
diff --git a/arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi b/arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi
@@ -12,7 +12,10 @@ cpu_thermal: cpu_thermal {
 	polling-delay-passive = <250>; /* milliseconds */
 	polling-delay = <1000>; /* milliseconds */
 
-			/* sensor       ID */
+	/*
+	 * See 44xx files for single sensor addressing, omap5 and dra7 need
+	 * also sensor ID for addressing.
+	 */
 	thermal-sensors = <&bandgap     0>;
 
 	cpu_trips: trips {
diff --git a/arch/arm/boot/dts/ti/omap/omap443x.dtsi b/arch/arm/boot/dts/ti/omap/omap443x.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap443x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap443x.dtsi
@@ -69,6 +69,7 @@ abb_iva: regulator-abb-iva {
 };
 
 &cpu_thermal {
+	thermal-sensors = <&bandgap>;
 	coefficients = <0 20000>;
 };
 
diff --git a/arch/arm/boot/dts/ti/omap/omap4460.dtsi b/arch/arm/boot/dts/ti/omap/omap4460.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap4460.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4460.dtsi
@@ -79,6 +79,7 @@ abb_iva: regulator-abb-iva {
 };
 
 &cpu_thermal {
+	thermal-sensors = <&bandgap>;
 	coefficients = <348 (-9301)>;
 };
 
-- 
2.42.0
