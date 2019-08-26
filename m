Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5FE69D559
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 20:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387604AbfHZSCw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 14:02:52 -0400
Received: from muru.com ([72.249.23.125]:58744 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731879AbfHZSCw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 14:02:52 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B4FBC80AA;
        Mon, 26 Aug 2019 18:03:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 6/6] ARM: dts: Drop legacy custom hwmods property for dra7 gpio
Date:   Mon, 26 Aug 2019 11:02:37 -0700
Message-Id: <20190826180237.31571-7-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826180237.31571-1-tony@atomide.com>
References: <20190826180237.31571-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With recent ti-sysc driver changes, we can probe most devices with device
tree data only and drop the custom "ti,hwmods" property.

We have already added the related device tree data earlier, and have
already dropped the platform data. But we have been still dynamically
allocating the platform data based on "ti,hwmods" property. With recent
ti-sysc driver changes this is no longer needed.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1262,7 +1262,6 @@
 
 		gpio7_target: target-module@51000 {		/* 0x48051000, ap 45 2e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio7";
 			reg = <0x51000 0x4>,
 			      <0x51010 0x4>,
 			      <0x51114 0x4>;
@@ -1296,7 +1295,6 @@
 
 		target-module@53000 {			/* 0x48053000, ap 35 36.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio8";
 			reg = <0x53000 0x4>,
 			      <0x53010 0x4>,
 			      <0x53114 0x4>;
@@ -1330,7 +1328,6 @@
 
 		target-module@55000 {			/* 0x48055000, ap 13 0e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio2";
 			reg = <0x55000 0x4>,
 			      <0x55010 0x4>,
 			      <0x55114 0x4>;
@@ -1364,7 +1361,6 @@
 
 		target-module@57000 {			/* 0x48057000, ap 15 06.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio3";
 			reg = <0x57000 0x4>,
 			      <0x57010 0x4>,
 			      <0x57114 0x4>;
@@ -1398,7 +1394,6 @@
 
 		target-module@59000 {			/* 0x48059000, ap 17 16.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio4";
 			reg = <0x59000 0x4>,
 			      <0x59010 0x4>,
 			      <0x59114 0x4>;
@@ -1432,7 +1427,6 @@
 
 		target-module@5b000 {			/* 0x4805b000, ap 19 1e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio5";
 			reg = <0x5b000 0x4>,
 			      <0x5b010 0x4>,
 			      <0x5b114 0x4>;
@@ -1466,7 +1460,6 @@
 
 		target-module@5d000 {			/* 0x4805d000, ap 21 26.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio6";
 			reg = <0x5d000 0x4>,
 			      <0x5d010 0x4>,
 			      <0x5d114 0x4>;
@@ -4281,7 +4274,6 @@
 
 		target-module@0 {			/* 0x4ae10000, ap 5 20.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio1";
 			reg = <0x0 0x4>,
 			      <0x10 0x4>,
 			      <0x114 0x4>;
-- 
2.23.0
