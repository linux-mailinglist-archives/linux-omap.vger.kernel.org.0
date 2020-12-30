Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6602E7A31
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 16:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgL3PIZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 10:08:25 -0500
Received: from muru.com ([72.249.23.125]:40594 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgL3PIZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Dec 2020 10:08:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 305F680BA;
        Wed, 30 Dec 2020 15:07:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: omap4-droid4: Fix lost keypad slide interrupts for droid4
Date:   Wed, 30 Dec 2020 17:07:40 +0200
Message-Id: <20201230150740.53528-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We may lose edge interrupts for gpio banks other than the first gpio
bank as they are not always powered. Instead, we must use the padconf
interrupt as that is always powered.

Note that we still also use the gpio for reading the pin state as that
can't be done with the padconf device.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -16,8 +16,13 @@ volume_down {
 			debounce-interval = <10>;
 		};
 
+		/*
+		 * We use pad 0x4a100116 abe_dmic_din3.gpio_122 as the irq instead
+		 * of the gpio interrupt to avoid lost events in deeper idle states.
+		*/
 		slider {
 			label = "Keypad Slide";
+			interrupts-extended = <&omap4_pmx_core 0xd6>;
 			gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>; /* gpio122 */
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_KEYPAD_SLIDE>;
-- 
2.29.2
