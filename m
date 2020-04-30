Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9E51C032B
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 18:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgD3Qwi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 12:52:38 -0400
Received: from muru.com ([72.249.23.125]:52198 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgD3Qwh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Apr 2020 12:52:37 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 414DC8123;
        Thu, 30 Apr 2020 16:53:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, maemo-leste@lists.dyne.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ARM: dts: omap4-droid4: Fix occasional lost wakeirq for uart1
Date:   Thu, 30 Apr 2020 09:52:33 -0700
Message-Id: <20200430165233.45844-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like using the UART CTS pin does not always trigger for a wake-up
when the SoC is idle.

This is probably because the modem first uses gpio_149 to signal the SoC
that data will be sent, and the CTS will only get used later when the
data transfer is starting.

Let's fix the issue by configuring the gpio_149 pad as the wakeirq for
UART. We have gpio_149 managed by the USB PHY for powering up the right
USB mode, and after that, the gpio gets recycled as the modem wake-up
pin. If needeed, the USB PHY can also later on be configured to use
gpio_149 pad as the wakeirq as a shared irq.

Let's also configure the missing properties for uart-has-rtscts and
current-speed for the modem port while at it. We already configure the
hardware flow control pins with uart1_pins pinctrl setting.

Cc: maemo-leste@lists.dyne.org
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -690,14 +690,18 @@ &timer9 {
 };
 
 /*
- * As uart1 is wired to mdm6600 with rts and cts, we can use the cts pin for
- * uart1 wakeirq.
+ * The uart1 port is wired to mdm6600 with rts and cts. The modem uses gpio_149
+ * for wake-up events for both the USB PHY and the UART. We can use gpio_149
+ * pad as the shared wakeirq for the UART rather than the RX or CTS pad as we
+ * have gpio_149 trigger before the UART transfer starts.
  */
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>;
 	interrupts-extended = <&wakeupgen GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH
-			       &omap4_pmx_core 0xfc>;
+			       &omap4_pmx_core 0x110>;
+	uart-has-rtscts;
+	current-speed = <115200>;
 };
 
 &uart3 {
-- 
2.26.2
