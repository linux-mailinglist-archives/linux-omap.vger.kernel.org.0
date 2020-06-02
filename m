Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9500E1EB2A8
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jun 2020 02:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgFBAUA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Jun 2020 20:20:00 -0400
Received: from muru.com ([72.249.23.125]:56666 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgFBAT7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 1 Jun 2020 20:19:59 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4219C804F;
        Tue,  2 Jun 2020 00:20:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, maemo-leste@lists.dyne.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ARM: dts: omap4-droid4: Fix spi configuration and increase rate
Date:   Mon,  1 Jun 2020 17:19:54 -0700
Message-Id: <20200602001954.30736-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can currently sometimes get "RXS timed out" errors and "EOT timed out"
errors with spi transfers.

These errors can be made easy to reproduce by reading the cpcap iio
values in a loop while keeping the CPUs busy by also reading /dev/urandom.

The "RXS timed out" errors we can fix by adding spi-cpol and spi-cpha
in addition to the spi-cs-high property we already have.

The "EOT timed out" errors we can fix by increasing the spi clock rate
to 9.6 MHz. Looks similar MC13783 PMIC says it works at spi clock rates
up to 20 MHz, so let's assume we can pick any rate up to 20 MHz also
for cpcap.

Cc: maemo-leste@lists.dyne.org
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -13,8 +13,10 @@ cpcap: pmic@0 {
 		#interrupt-cells = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		spi-max-frequency = <3000000>;
+		spi-max-frequency = <9600000>;
 		spi-cs-high;
+		spi-cpol;
+		spi-cpha;
 
 		cpcap_adc: adc {
 			compatible = "motorola,mapphone-cpcap-adc";
-- 
2.26.2
