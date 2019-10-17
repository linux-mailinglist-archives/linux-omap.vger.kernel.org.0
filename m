Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73444DB7E9
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440323AbfJQTol (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:41 -0400
Received: from muru.com ([72.249.23.125]:37966 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQTol (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:41 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E63D181B1;
        Thu, 17 Oct 2019 19:45:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 15/21] ARM: dts: Drop custom hwmod property for omap5 i2c
Date:   Thu, 17 Oct 2019 12:44:05 -0700
Message-Id: <20191017194411.18258-16-tony@atomide.com>
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
 arch/arm/boot/dts/omap5-l4.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -1405,7 +1405,6 @@
 
 		target-module@60000 {			/* 0x48060000, ap 23 24.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c3";
 			reg = <0x60000 0x8>,
 			      <0x60010 0x8>,
 			      <0x60090 0x8>;
@@ -1582,7 +1581,6 @@
 
 		target-module@70000 {			/* 0x48070000, ap 30 14.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c1";
 			reg = <0x70000 0x8>,
 			      <0x70010 0x8>,
 			      <0x70090 0x8>;
@@ -1614,7 +1612,6 @@
 
 		target-module@72000 {			/* 0x48072000, ap 32 1c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c2";
 			reg = <0x72000 0x8>,
 			      <0x72010 0x8>,
 			      <0x72090 0x8>;
@@ -1654,7 +1651,6 @@
 
 		target-module@7a000 {			/* 0x4807a000, ap 81 2c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c4";
 			reg = <0x7a000 0x8>,
 			      <0x7a010 0x8>,
 			      <0x7a090 0x8>;
@@ -1686,7 +1682,6 @@
 
 		target-module@7c000 {			/* 0x4807c000, ap 83 34.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c5";
 			reg = <0x7c000 0x8>,
 			      <0x7c010 0x8>,
 			      <0x7c090 0x8>;
-- 
2.23.0
