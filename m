Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4A7DB7DA
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436976AbfJQTob (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:31 -0400
Received: from muru.com ([72.249.23.125]:37918 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQToa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D04A3816A;
        Thu, 17 Oct 2019 19:45:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 08/21] ARM: dts: Drop custom hwmod property for omap5 mcspi
Date:   Thu, 17 Oct 2019 12:43:58 -0700
Message-Id: <20191017194411.18258-9-tony@atomide.com>
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
 arch/arm/boot/dts/omap4-l4.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -2045,7 +2045,6 @@
 
 		target-module@98000 {			/* 0x48098000, ap 49 22.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi1";
 			reg = <0x98000 0x4>,
 			      <0x98010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2084,7 +2083,6 @@
 
 		target-module@9a000 {			/* 0x4809a000, ap 51 2c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi2";
 			reg = <0x9a000 0x4>,
 			      <0x9a010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2282,7 +2280,6 @@
 
 		target-module@b8000 {			/* 0x480b8000, ap 69 58.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi3";
 			reg = <0xb8000 0x4>,
 			      <0xb8010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2313,7 +2310,6 @@
 
 		target-module@ba000 {			/* 0x480ba000, ap 71 32.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi4";
 			reg = <0xba000 0x4>,
 			      <0xba010 0x4>;
 			reg-names = "rev", "sysc";
-- 
2.23.0
