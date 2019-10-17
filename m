Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62A14DB7E2
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439724AbfJQToh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:37 -0400
Received: from muru.com ([72.249.23.125]:37944 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQToh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:37 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EBBE5816A;
        Thu, 17 Oct 2019 19:45:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 12/21] ARM: dts: Drop custom hwmod property for omap5 uart
Date:   Thu, 17 Oct 2019 12:44:02 -0700
Message-Id: <20191017194411.18258-13-tony@atomide.com>
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
 arch/arm/boot/dts/omap5-l4.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -1032,7 +1032,6 @@
 
 		target-module@20000 {			/* 0x48020000, ap 3 04.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart3";
 			reg = <0x20050 0x4>,
 			      <0x20054 0x4>,
 			      <0x20058 0x4>;
@@ -1438,7 +1437,6 @@
 
 		target-module@66000 {			/* 0x48066000, ap 63 4c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart5";
 			reg = <0x66050 0x4>,
 			      <0x66054 0x4>,
 			      <0x66058 0x4>;
@@ -1468,7 +1466,6 @@
 
 		target-module@68000 {			/* 0x48068000, ap 53 54.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart6";
 			reg = <0x68050 0x4>,
 			      <0x68054 0x4>,
 			      <0x68058 0x4>;
@@ -1498,7 +1495,6 @@
 
 		target-module@6a000 {			/* 0x4806a000, ap 24 0a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart1";
 			reg = <0x6a050 0x4>,
 			      <0x6a054 0x4>,
 			      <0x6a058 0x4>;
@@ -1528,7 +1524,6 @@
 
 		target-module@6c000 {			/* 0x4806c000, ap 26 22.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart2";
 			reg = <0x6c050 0x4>,
 			      <0x6c054 0x4>,
 			      <0x6c058 0x4>;
@@ -1558,7 +1553,6 @@
 
 		target-module@6e000 {			/* 0x4806e000, ap 28 44.1 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart4";
 			reg = <0x6e050 0x4>,
 			      <0x6e054 0x4>,
 			      <0x6e058 0x4>;
-- 
2.23.0
