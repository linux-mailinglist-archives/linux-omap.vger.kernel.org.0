Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF019141FD8
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jan 2020 20:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgASTpE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jan 2020 14:45:04 -0500
Received: from muru.com ([72.249.23.125]:51754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbgASTpE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 19 Jan 2020 14:45:04 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 23B84804F;
        Sun, 19 Jan 2020 19:45:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] ARM: dts: motorola-cpcap-mapphone: Configure calibration interrupt
Date:   Sun, 19 Jan 2020 11:45:01 -0800
Message-Id: <20200119194501.17125-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We added coulomb counter calibration support With commit 0cb90f071f73
("power: supply: cpcap-battery: Add basic coulomb counter calibrate
support"), but we also need to configure the related interrupt.

Without the interrupt calibration happens based on a timeout after two
seconds, with the interrupt the calibration just gets done a bit faster.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -27,11 +27,12 @@
 			compatible = "motorola,cpcap-battery";
 			interrupts-extended = <
 				&cpcap 6 0 &cpcap 5 0 &cpcap 3 0
-				&cpcap 20 0 &cpcap 54 0
+				&cpcap 20 0 &cpcap 54 0 &cpcap 57 0
 			>;
 			interrupt-names =
 				"eol", "lowbph", "lowbpl",
-				"chrgcurr1", "battdetb";
+				"chrgcurr1", "battdetb",
+				"cccal";
 			io-channels = <&cpcap_adc 0 &cpcap_adc 1
 				       &cpcap_adc 5 &cpcap_adc 6>;
 			io-channel-names = "battdetb", "battp",
-- 
2.24.1
