Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19987DB7CE
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394686AbfJQToW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:22 -0400
Received: from muru.com ([72.249.23.125]:37886 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726590AbfJQToW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:22 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 983B381B1;
        Thu, 17 Oct 2019 19:44:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 03/21] ARM: dts: Drop custom hwmod property for omap5 gpio
Date:   Thu, 17 Oct 2019 12:43:53 -0700
Message-Id: <20191017194411.18258-4-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017194411.18258-1-tony@atomide.com>
References: <20191017194411.18258-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the custom ti,hwmods dts property. We have already
dropped the platform data earlier, but have been still allocating it
dynamically, which is no longer needed.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -1176,7 +1176,6 @@
 
 		target-module@51000 {			/* 0x48051000, ap 45 2e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio7";
 			reg = <0x51000 0x4>,
 			      <0x51010 0x4>,
 			      <0x51114 0x4>;
@@ -1210,7 +1209,6 @@
 
 		target-module@53000 {			/* 0x48053000, ap 35 36.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio8";
 			reg = <0x53000 0x4>,
 			      <0x53010 0x4>,
 			      <0x53114 0x4>;
@@ -1244,7 +1242,6 @@
 
 		target-module@55000 {			/* 0x48055000, ap 13 0e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio2";
 			reg = <0x55000 0x4>,
 			      <0x55010 0x4>,
 			      <0x55114 0x4>;
@@ -1278,7 +1275,6 @@
 
 		target-module@57000 {			/* 0x48057000, ap 15 06.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio3";
 			reg = <0x57000 0x4>,
 			      <0x57010 0x4>,
 			      <0x57114 0x4>;
@@ -1312,7 +1308,6 @@
 
 		target-module@59000 {			/* 0x48059000, ap 17 16.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio4";
 			reg = <0x59000 0x4>,
 			      <0x59010 0x4>,
 			      <0x59114 0x4>;
@@ -1346,7 +1341,6 @@
 
 		target-module@5b000 {			/* 0x4805b000, ap 19 1e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio5";
 			reg = <0x5b000 0x4>,
 			      <0x5b010 0x4>,
 			      <0x5b114 0x4>;
@@ -1380,7 +1374,6 @@
 
 		target-module@5d000 {			/* 0x4805d000, ap 21 26.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio6";
 			reg = <0x5d000 0x4>,
 			      <0x5d010 0x4>,
 			      <0x5d114 0x4>;
@@ -2296,7 +2289,6 @@
 
 		target-module@0 {			/* 0x4ae10000, ap 5 10.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio1";
 			reg = <0x0 0x4>,
 			      <0x10 0x4>,
 			      <0x114 0x4>;
-- 
2.23.0
