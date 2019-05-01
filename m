Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAB410EA6
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 23:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfEAVlv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 May 2019 17:41:51 -0400
Received: from muru.com ([72.249.23.125]:47920 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbfEAVls (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 May 2019 17:41:48 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CC86F8176;
        Wed,  1 May 2019 21:42:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/2] ARM: dts: Configure osc clock for d_can on am335x
Date:   Wed,  1 May 2019 14:41:28 -0700
Message-Id: <20190501214129.12572-2-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190501214129.12572-1-tony@atomide.com>
References: <20190501214129.12572-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Reading the module revision register can cause an external abort on
non-linefetch depending of osc clock is not already enabled. This
started happening with commit 1a5cd7c23cc5 ("bus: ti-sysc: Enable all
clocks directly during init to read revision") as reported by
Sebastian Andrzej Siewior <bigeasy@linutronix.de>.

The reason why the issue happens is because we now attempt to read the
interconnect target module revision register by first manually enabling
all the device clocks in sysc_probe(). And looks like d_can also needs
the osc clock in addition to the module clock, and it may or may not be
enabled depending on the bootloader version and if other devices have
already requested osc clock.

Let's fix the issue by adding osc clock as an optional clock for the
module for am335x. Note that am437x does not seem to list the osc clock
at all, so presumably it is not needed for am437x.

I also noticed that we're incorrectly assuming the revision register for
d_can exists. But the module does not seem to have any revision, sysconfig
or sysstatus registers. But that's mostly a cosmetic issues, so I'll send
a patch separately for that.

Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to read revision")
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1762,8 +1762,9 @@
 			reg = <0xcc000 0x4>;
 			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM3_L4LS_D_CAN0_CLKCTRL 0>;
-			clock-names = "fck";
+			clocks = <&l4ls_clkctrl AM3_L4LS_D_CAN0_CLKCTRL 0>,
+				 <&dcan0_fck>;
+			clock-names = "fck", "osc";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xcc000 0x2000>;
@@ -1785,8 +1786,9 @@
 			reg = <0xd0000 0x4>;
 			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM3_L4LS_D_CAN1_CLKCTRL 0>;
-			clock-names = "fck";
+			clocks = <&l4ls_clkctrl AM3_L4LS_D_CAN1_CLKCTRL 0>,
+				 <&dcan1_fck>;
+			clock-names = "fck", "osc";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xd0000 0x2000>;
-- 
2.21.0
