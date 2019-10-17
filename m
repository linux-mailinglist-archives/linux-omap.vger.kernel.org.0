Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA28DB7EF
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394675AbfJQTop (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:45 -0400
Received: from muru.com ([72.249.23.125]:37988 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389248AbfJQToo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:44 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CFE33816A;
        Thu, 17 Oct 2019 19:45:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 18/21] ARM: dts: Drop custom hwmod property for omap5 mmc
Date:   Thu, 17 Oct 2019 12:44:08 -0700
Message-Id: <20191017194411.18258-19-tony@atomide.com>
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
@@ -1850,7 +1850,6 @@
 
 		target-module@9c000 {			/* 0x4809c000, ap 51 3a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc1";
 			reg = <0x9c000 0x4>,
 			      <0x9c010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1910,7 +1909,6 @@
 
 		target-module@ad000 {			/* 0x480ad000, ap 61 20.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc3";
 			reg = <0xad000 0x4>,
 			      <0xad010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1951,7 +1949,6 @@
 
 		target-module@b4000 {			/* 0x480b4000, ap 65 42.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc2";
 			reg = <0xb4000 0x4>,
 			      <0xb4010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2044,7 +2041,6 @@
 
 		target-module@d1000 {			/* 0x480d1000, ap 71 28.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc4";
 			reg = <0xd1000 0x4>,
 			      <0xd1010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2077,7 +2073,6 @@
 
 		target-module@d5000 {			/* 0x480d5000, ap 73 30.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc5";
 			reg = <0xd5000 0x4>,
 			      <0xd5010 0x4>;
 			reg-names = "rev", "sysc";
-- 
2.23.0
