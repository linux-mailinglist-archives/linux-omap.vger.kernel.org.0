Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26AAA2E771A
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 09:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgL3InZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 03:43:25 -0500
Received: from muru.com ([72.249.23.125]:40474 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgL3InU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Dec 2020 03:43:20 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 40427812F;
        Wed, 30 Dec 2020 08:42:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [PATCH 2/3] ARM: dts: motorola-mapphone: Configure lower temperature passive cooling
Date:   Wed, 30 Dec 2020 10:42:31 +0200
Message-Id: <20201230084232.19221-2-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230084232.19221-1-tony@atomide.com>
References: <20201230084232.19221-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The current cooling device temperature is too high at 100C as we have a
battery on the device right next to the SoC as pointed out by Carl Philipp
Klemm <philipp@uvos.xyz>. Let's configure the max temperature to 80C.

As we only have a tshut interrupt and no talert interrupt on 4430, we have
a passive cooling device configured for 4430. However, we want the poll
interval to be 10 seconds instead of 1 second for power management. The
value of 10 seconds seems like plenty of time to notice the temperature
increase above the 75C temperatures. Having the bandgap temperature change
seems to take several tens of seconds because of heat dissipation above
75C range as monitored with a full CPU load.

Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Suggested-by: Carl Philipp Klemm <philipp@uvos.xyz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -192,6 +192,14 @@ backlight: backlight {
 	};
 };
 
+&cpu_thermal {
+	polling-delay = <10000>; /* milliseconds */
+};
+
+&cpu_alert0 {
+        temperature = <80000>; /* millicelsius */
+};
+
 &dss {
 	status = "okay";
 };
-- 
2.29.2
