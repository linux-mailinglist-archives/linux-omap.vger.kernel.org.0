Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0D49D552
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 20:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387597AbfHZSCs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 14:02:48 -0400
Received: from muru.com ([72.249.23.125]:58726 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387588AbfHZSCs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 14:02:48 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 979D38120;
        Mon, 26 Aug 2019 18:03:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 3/6] ARM: dts: Drop legacy custom hwmods property for dra7 uart
Date:   Mon, 26 Aug 2019 11:02:34 -0700
Message-Id: <20190826180237.31571-4-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1118,7 +1118,6 @@
 
 		target-module@20000 {			/* 0x48020000, ap 3 04.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart3";
 			reg = <0x20050 0x4>,
 			      <0x20054 0x4>,
 			      <0x20058 0x4>;
@@ -1534,7 +1533,6 @@
 
 		target-module@66000 {			/* 0x48066000, ap 63 14.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart5";
 			reg = <0x66050 0x4>,
 			      <0x66054 0x4>,
 			      <0x66058 0x4>;
@@ -1567,7 +1565,6 @@
 
 		target-module@68000 {			/* 0x48068000, ap 53 1c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart6";
 			reg = <0x68050 0x4>,
 			      <0x68054 0x4>,
 			      <0x68058 0x4>;
@@ -1600,7 +1597,6 @@
 
 		target-module@6a000 {			/* 0x4806a000, ap 24 24.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart1";
 			reg = <0x6a050 0x4>,
 			      <0x6a054 0x4>,
 			      <0x6a058 0x4>;
@@ -1633,7 +1629,6 @@
 
 		target-module@6c000 {			/* 0x4806c000, ap 26 2c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart2";
 			reg = <0x6c050 0x4>,
 			      <0x6c054 0x4>,
 			      <0x6c058 0x4>;
@@ -1666,7 +1661,6 @@
 
 		target-module@6e000 {			/* 0x4806e000, ap 28 0c.1 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart4";
 			reg = <0x6e050 0x4>,
 			      <0x6e054 0x4>,
 			      <0x6e058 0x4>;
@@ -2380,7 +2374,6 @@
 
 		target-module@20000 {			/* 0x48420000, ap 47 02.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart7";
 			reg = <0x20050 0x4>,
 			      <0x20054 0x4>,
 			      <0x20058 0x4>;
@@ -2411,7 +2404,6 @@
 
 		target-module@22000 {			/* 0x48422000, ap 49 0a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart8";
 			reg = <0x22050 0x4>,
 			      <0x22054 0x4>,
 			      <0x22058 0x4>;
@@ -2442,7 +2434,6 @@
 
 		target-module@24000 {			/* 0x48424000, ap 51 12.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart9";
 			reg = <0x24050 0x4>,
 			      <0x24054 0x4>,
 			      <0x24058 0x4>;
@@ -4467,7 +4458,6 @@
 
 		target-module@b000 {			/* 0x4ae2b000, ap 28 02.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "uart10";
 			reg = <0xb050 0x4>,
 			      <0xb054 0x4>,
 			      <0xb058 0x4>;
-- 
2.23.0
