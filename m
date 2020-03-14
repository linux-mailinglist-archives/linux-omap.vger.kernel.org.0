Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EC71857A8
	for <lists+linux-omap@lfdr.de>; Sun, 15 Mar 2020 02:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgCOBo0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Mar 2020 21:44:26 -0400
Received: from muru.com ([72.249.23.125]:60428 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCOBo0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Mar 2020 21:44:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 16C308167;
        Sat, 14 Mar 2020 20:55:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, maemo-leste@lists.dyne.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ARM: dts: omap4-droid4: Fix lost touchscreen interrupts
Date:   Sat, 14 Mar 2020 13:55:05 -0700
Message-Id: <20200314205505.44953-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like we can have the maxtouch touchscreen stop producing interrupts
if an edge interrupt is lost. This can happen easily when the SoC idles as
the gpio controller may not see any state for an edge interrupt if it
is briefly triggered when the system is idle.

Also it looks like maxtouch stops sending any further interrupts if the
interrupt is not handled. And we do have several cases of maxtouch already
configured with a level interrupt, so let's do that.

With level interrupt the gpio controller has the interrupt state visible
after idle. Note that eventually we will probably also be using the
Linux generic wakeirq configured for the controller, but that cannot be
done until the maxtouch driver supports runtime PM.

Cc: maemo-leste@lists.dyne.org
Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -429,7 +429,7 @@ touchscreen@4a {
 		reset-gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>; /* gpio173 */
 
 		/* gpio_183 with sys_nirq2 pad as wakeup */
-		interrupts-extended = <&gpio6 23 IRQ_TYPE_EDGE_FALLING>,
+		interrupts-extended = <&gpio6 23 IRQ_TYPE_LEVEL_LOW>,
 				      <&omap4_pmx_core 0x160>;
 		interrupt-names = "irq", "wakeup";
 		wakeup-source;
-- 
2.25.1
