Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FE0DB7DE
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437100AbfJQTof (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:35 -0400
Received: from muru.com ([72.249.23.125]:37932 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQToe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:34 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 32F5F8216;
        Thu, 17 Oct 2019 19:45:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 10/21] ARM: dts: Drop custom hwmod property for am33xx uart
Date:   Thu, 17 Oct 2019 12:44:00 -0700
Message-Id: <20191017194411.18258-11-tony@atomide.com>
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

Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -162,7 +162,6 @@
 
 		target-module@9000 {			/* 0x44e09000, ap 16 04.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart1";
 			reg = <0x9050 0x4>,
 			      <0x9054 0x4>,
 			      <0x9058 0x4>;
@@ -911,7 +910,6 @@
 
 		target-module@22000 {			/* 0x48022000, ap 10 12.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart2";
 			reg = <0x22050 0x4>,
 			      <0x22054 0x4>,
 			      <0x22058 0x4>;
@@ -943,7 +941,6 @@
 
 		target-module@24000 {			/* 0x48024000, ap 12 14.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart3";
 			reg = <0x24050 0x4>,
 			      <0x24054 0x4>,
 			      <0x24058 0x4>;
@@ -1589,7 +1586,6 @@
 
 		target-module@a6000 {			/* 0x481a6000, ap 48 16.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart4";
 			reg = <0xa6050 0x4>,
 			      <0xa6054 0x4>,
 			      <0xa6058 0x4>;
@@ -1619,7 +1615,6 @@
 
 		target-module@a8000 {			/* 0x481a8000, ap 50 20.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart5";
 			reg = <0xa8050 0x4>,
 			      <0xa8054 0x4>,
 			      <0xa8058 0x4>;
@@ -1649,7 +1644,6 @@
 
 		target-module@aa000 {			/* 0x481aa000, ap 52 1a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart6";
 			reg = <0xaa050 0x4>,
 			      <0xaa054 0x4>,
 			      <0xaa058 0x4>;
-- 
2.23.0
