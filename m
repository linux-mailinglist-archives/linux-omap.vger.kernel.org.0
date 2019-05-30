Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983B12F7A4
	for <lists+linux-omap@lfdr.de>; Thu, 30 May 2019 08:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfE3G4k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 May 2019 02:56:40 -0400
Received: from muru.com ([72.249.23.125]:51864 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727377AbfE3G4k (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 May 2019 02:56:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 73BE4803A;
        Thu, 30 May 2019 06:57:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] ARM: dts: Drop bogus CLKSEL for timer12 on dra7
Date:   Wed, 29 May 2019 23:56:35 -0700
Message-Id: <20190530065635.42811-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is no CLKSEL for timer12 on dra6 unlike for timer1. This
causes issues on booting the device that Tomi noticed if
DEBUG_SLAB is enabled and the clkctrl clock does not properly
handle non-existing clock. Let's drop the bogus CLKSEL clock,
the clkctrl clock handling gets fixed separately.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Fixes: 4ed0dfe3cf39 ("ARM: dts: dra7: Move l4 child devices to probe them with ti-sysc")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4450,8 +4450,6 @@
 			timer12: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER12_CLKCTRL 24>;
-				clock-names = "fck";
 				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-alwon;
 				ti,timer-secure;
-- 
2.21.0
