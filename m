Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B472B494
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 14:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfE0MOf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 08:14:35 -0400
Received: from muru.com ([72.249.23.125]:51250 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727222AbfE0MOe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 May 2019 08:14:34 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4A3E280F3;
        Mon, 27 May 2019 12:14:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 12/12] ARM: dts: Drop legacy custom hwmods property for omap4 mmc
Date:   Mon, 27 May 2019 05:13:48 -0700
Message-Id: <20190527121348.45251-13-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527121348.45251-1-tony@atomide.com>
References: <20190527121348.45251-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With recent ti-sysc driver changes, we can now finally probe most
modules without needing the custom ti,hwmods property.

Let's drop it for omap4 MMC as we can test that for runtime PM
for core retention idle mode for wlcore WLAN.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -2103,7 +2103,6 @@
 
 		target-module@9c000 {			/* 0x4809c000, ap 53 36.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc1";
 			reg = <0x9c000 0x4>,
 			      <0x9c010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2171,7 +2170,6 @@
 
 		target-module@ad000 {			/* 0x480ad000, ap 63 50.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc3";
 			reg = <0xad000 0x4>,
 			      <0xad010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2237,7 +2235,6 @@
 
 		target-module@b4000 {			/* 0x480b4000, ap 67 46.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc2";
 			reg = <0xb4000 0x4>,
 			      <0xb4010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2332,7 +2329,6 @@
 
 		target-module@d1000 {			/* 0x480d1000, ap 73 44.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc4";
 			reg = <0xd1000 0x4>,
 			      <0xd1010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2365,7 +2361,6 @@
 
 		target-module@d5000 {			/* 0x480d5000, ap 75 4e.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mmc5";
 			reg = <0xd5000 0x4>,
 			      <0xd5010 0x4>;
 			reg-names = "rev", "sysc";
-- 
2.21.0
