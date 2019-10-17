Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C06DB7CD
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394671AbfJQToV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:21 -0400
Received: from muru.com ([72.249.23.125]:37878 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726590AbfJQToU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:20 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 39DAA81AC;
        Thu, 17 Oct 2019 19:44:54 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 02/21] ARM: dts: Drop custom hwmod property for omap4 gpio
Date:   Thu, 17 Oct 2019 12:43:52 -0700
Message-Id: <20191017194411.18258-3-tony@atomide.com>
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
 arch/arm/boot/dts/omap4-l4.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1085,7 +1085,6 @@
 
 		gpio1_target: target-module@0 {			/* 0x4a310000, ap 5 14.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio1";
 			reg = <0x0 0x4>,
 			      <0x10 0x4>,
 			      <0x114 0x4>;
@@ -1550,7 +1549,6 @@
 
 		target-module@55000 {			/* 0x48055000, ap 15 0c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio2";
 			reg = <0x55000 0x4>,
 			      <0x55010 0x4>,
 			      <0x55114 0x4>;
@@ -1584,7 +1582,6 @@
 
 		target-module@57000 {			/* 0x48057000, ap 17 16.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio3";
 			reg = <0x57000 0x4>,
 			      <0x57010 0x4>,
 			      <0x57114 0x4>;
@@ -1618,7 +1615,6 @@
 
 		target-module@59000 {			/* 0x48059000, ap 19 10.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio4";
 			reg = <0x59000 0x4>,
 			      <0x59010 0x4>,
 			      <0x59114 0x4>;
@@ -1652,7 +1648,6 @@
 
 		target-module@5b000 {			/* 0x4805b000, ap 21 12.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio5";
 			reg = <0x5b000 0x4>,
 			      <0x5b010 0x4>,
 			      <0x5b114 0x4>;
@@ -1686,7 +1681,6 @@
 
 		target-module@5d000 {			/* 0x4805d000, ap 23 14.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio6";
 			reg = <0x5d000 0x4>,
 			      <0x5d010 0x4>,
 			      <0x5d114 0x4>;
-- 
2.23.0
