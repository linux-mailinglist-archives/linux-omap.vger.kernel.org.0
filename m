Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5BCDB7E6
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440043AbfJQToj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:39 -0400
Received: from muru.com ([72.249.23.125]:37958 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQToj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:39 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9FBB3804F;
        Thu, 17 Oct 2019 19:45:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 14/21] ARM: dts: Drop custom hwmod property for am4 i2c
Date:   Thu, 17 Oct 2019 12:44:04 -0700
Message-Id: <20191017194411.18258-15-tony@atomide.com>
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
 arch/arm/boot/dts/am437x-l4.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -193,7 +193,6 @@
 
 		target-module@b000 {			/* 0x44e0b000, ap 18 48.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c1";
 			reg = <0xb000 0x8>,
 			      <0xb010 0x8>,
 			      <0xb090 0x8>;
@@ -733,7 +732,6 @@
 
 		target-module@2a000 {			/* 0x4802a000, ap 12 22.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c2";
 			reg = <0x2a000 0x8>,
 			      <0x2a010 0x8>,
 			      <0x2a090 0x8>;
@@ -1256,7 +1254,6 @@
 
 		target-module@9c000 {			/* 0x4819c000, ap 38 52.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c3";
 			reg = <0x9c000 0x8>,
 			      <0x9c010 0x8>,
 			      <0x9c090 0x8>;
-- 
2.23.0
