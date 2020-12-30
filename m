Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D832E7719
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 09:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgL3InT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 03:43:19 -0500
Received: from muru.com ([72.249.23.125]:40450 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726161AbgL3InS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Dec 2020 03:43:18 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D8D6280BA;
        Wed, 30 Dec 2020 08:42:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/3] ARM: dts: Configure missing thermal interrupt for 4430
Date:   Wed, 30 Dec 2020 10:42:30 +0200
Message-Id: <20201230084232.19221-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have gpio_86 wired internally to the bandgap thermal shutdown
interrupt on 4430 like we have it on 4460 according to the TRM.
This can be found easily by searching for TSHUT.

For some reason the thermal shutdown interrupt was never added
for 4430, let's add it. I believe this is needed for the thermal
shutdown interrupt handler ti_bandgap_tshut_irq_handler() to call
orderly_poweroff().

Fixes: aa9bb4bb8878 ("arm: dts: add omap4430 thermal data")
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap443x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/omap443x.dtsi b/arch/arm/boot/dts/omap443x.dtsi
--- a/arch/arm/boot/dts/omap443x.dtsi
+++ b/arch/arm/boot/dts/omap443x.dtsi
@@ -33,10 +33,12 @@ thermal-zones {
 	};
 
 	ocp {
+		/* 4430 has only gpio_86 tshut and no talert interrupt */
 		bandgap: bandgap@4a002260 {
 			reg = <0x4a002260 0x4
 			       0x4a00232C 0x4>;
 			compatible = "ti,omap4430-bandgap";
+			gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 
 			#thermal-sensor-cells = <0>;
 		};
-- 
2.29.2
