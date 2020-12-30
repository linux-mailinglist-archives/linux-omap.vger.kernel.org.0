Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2BDB2E7718
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 09:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgL3InY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 03:43:24 -0500
Received: from muru.com ([72.249.23.125]:40488 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgL3InX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Dec 2020 03:43:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id ADE9681B8;
        Wed, 30 Dec 2020 08:42:55 +0000 (UTC)
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
Subject: [PATCH 3/3] ARM: dts: motorola-mapphone: Add 1.2GHz OPP
Date:   Wed, 30 Dec 2020 10:42:32 +0200
Message-Id: <20201230084232.19221-3-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230084232.19221-1-tony@atomide.com>
References: <20201230084232.19221-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Carl Philipp Klemm <philipp@uvos.xyz>

The omap4430 HS HIGH performance devces support 1.2GHz opp, lower speed
variants do not. However for mapphone devices Motorola seems to have
decided that this does not really matter for the SoC variants they have
tested to use, and decided to clock all devices, including the ones with
STANDARD performance chips at 1.2GHz upon release of the 3.0.8 vendor
kernel shiped with Android 4.0. Therefore it seems safe to do the same,
but let's only do it for Motorola devices as the others have not been
tested.

Note that we prevent overheating with the passive cooling device
cpu_alert0 configured in the dts file that starts lowering the speed as
needed.

This also removes the "failed to find current OPP for freq 1200000000"
warning.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
[tony@atomide.com: made motorola specific, updated comments]
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -200,6 +200,21 @@ &cpu_alert0 {
         temperature = <80000>; /* millicelsius */
 };
 
+&cpu0 {
+        /*
+	 * Note that the 1.2GiHz mode is enabled for all SoC variants for
+	 * the Motorola Android Linux v3.0.8 based kernel.
+	 */
+        operating-points = <
+	        /* kHz    uV */
+	        300000  1025000
+	        600000  1200000
+	        800000  1313000
+	        1008000 1375000
+		1200000 1375000
+        >;
+};
+
 &dss {
 	status = "okay";
 };
-- 
2.29.2
