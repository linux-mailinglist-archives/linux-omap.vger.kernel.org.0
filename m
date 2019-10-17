Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD56DB7EB
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440378AbfJQTom (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:42 -0400
Received: from muru.com ([72.249.23.125]:37978 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQTom (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:42 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4DBCE81B8;
        Thu, 17 Oct 2019 19:45:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 16/21] ARM: dts: Drop custom hwmod property for am3 mmc
Date:   Thu, 17 Oct 2019 12:44:06 -0700
Message-Id: <20191017194411.18258-17-tony@atomide.com>
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
 arch/arm/boot/dts/am33xx-l4.dtsi | 2 --
 arch/arm/boot/dts/am33xx.dtsi    | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1305,7 +1305,6 @@
 
 		target-module@60000 {			/* 0x48060000, ap 36 0c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mmc1";
 			reg = <0x602fc 0x4>,
 			      <0x60110 0x4>,
 			      <0x60114 0x4>;
@@ -1792,7 +1791,6 @@
 
 		target-module@d8000 {			/* 0x481d8000, ap 64 66.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mmc2";
 			reg = <0xd82fc 0x4>,
 			      <0xd8110 0x4>,
 			      <0xd8114 0x4>;
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -236,7 +236,6 @@
 
 		target-module@47810000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mmc3";
 			reg = <0x478102fc 0x4>,
 			      <0x47810110 0x4>,
 			      <0x47810114 0x4>;
-- 
2.23.0
