Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5E19D555
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 20:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387600AbfHZSCt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 14:02:49 -0400
Received: from muru.com ([72.249.23.125]:58732 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387588AbfHZSCt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 14:02:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 12CAE80AA;
        Mon, 26 Aug 2019 18:03:17 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 4/6] ARM: dts: Drop legacy custom hwmods property for dra7 i2c
Date:   Mon, 26 Aug 2019 11:02:35 -0700
Message-Id: <20190826180237.31571-5-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1500,7 +1500,6 @@
 
 		target-module@60000 {			/* 0x48060000, ap 23 32.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c3";
 			reg = <0x60000 0x8>,
 			      <0x60010 0x8>,
 			      <0x60090 0x8>;
@@ -1693,7 +1692,6 @@
 
 		target-module@70000 {			/* 0x48070000, ap 30 22.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c1";
 			reg = <0x70000 0x8>,
 			      <0x70010 0x8>,
 			      <0x70090 0x8>;
@@ -1726,7 +1724,6 @@
 
 		target-module@72000 {			/* 0x48072000, ap 32 2a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c2";
 			reg = <0x72000 0x8>,
 			      <0x72010 0x8>,
 			      <0x72090 0x8>;
@@ -1789,7 +1786,6 @@
 
 		target-module@7a000 {			/* 0x4807a000, ap 81 3a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c4";
 			reg = <0x7a000 0x8>,
 			      <0x7a010 0x8>,
 			      <0x7a090 0x8>;
@@ -1822,7 +1818,6 @@
 
 		target-module@7c000 {			/* 0x4807c000, ap 83 4a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c5";
 			reg = <0x7c000 0x8>,
 			      <0x7c010 0x8>,
 			      <0x7c090 0x8>;
-- 
2.23.0
