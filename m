Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9A29D557
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 20:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387588AbfHZSCv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 14:02:51 -0400
Received: from muru.com ([72.249.23.125]:58738 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731879AbfHZSCu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 14:02:50 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6D3058191;
        Mon, 26 Aug 2019 18:03:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 5/6] ARM: dts: Drop legacy custom hwmods property for dra7 mmc
Date:   Mon, 26 Aug 2019 11:02:36 -0700
Message-Id: <20190826180237.31571-6-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -2004,7 +2004,6 @@
 
 		target-module@9c000 {			/* 0x4809c000, ap 51 38.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc1";
 			reg = <0x9c000 0x4>,
 			      <0x9c010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2064,7 +2063,6 @@
 
 		target-module@ad000 {			/* 0x480ad000, ap 61 20.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc3";
 			reg = <0xad000 0x4>,
 			      <0xad010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2124,7 +2122,6 @@
 
 		target-module@b4000 {			/* 0x480b4000, ap 65 40.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc2";
 			reg = <0xb4000 0x4>,
 			      <0xb4010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2223,7 +2220,6 @@
 
 		target-module@d1000 {			/* 0x480d1000, ap 71 28.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc4";
 			reg = <0xd1000 0x4>,
 			      <0xd1010 0x4>;
 			reg-names = "rev", "sysc";
-- 
2.23.0
