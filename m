Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B798E1D0014
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 23:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgELVEp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 17:04:45 -0400
Received: from muru.com ([72.249.23.125]:54202 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELVEp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 17:04:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 086118047;
        Tue, 12 May 2020 21:05:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: dts: Fix wrong mdio clock for dm814x
Date:   Tue, 12 May 2020 14:04:37 -0700
Message-Id: <20200512210437.32635-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Recent PTP-specific cpsw driver changes started exposing an issue on at
at least j5eco-evm:

Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0169004
...
(davinci_mdio_runtime_suspend) from [<c063f2a4>] (__rpm_callback+0x84/0x154)
(__rpm_callback) from [<c063f394>] (rpm_callback+0x20/0x80)
(rpm_callback) from [<c063f4f0>] (rpm_suspend+0xfc/0x6ac)
(rpm_suspend) from [<c0640af0>] (pm_runtime_work+0x88/0xa4)
(pm_runtime_work) from [<c0155338>] (process_one_work+0x228/0x568)
...

Let's fix the issue by using the correct the mdio clock as suggested by
Grygorii Strashko <grygorii.strashko@ti.com>.

The DM814_ETHERNET_CPGMAC0_CLKCTRL clock is the interconnect target module
clock and managed by ti-sysc.

Fixes: 6398f3478e45 ("ARM: dts: Configure interconnect target module for dm814x cpsw")
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dm814x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/dm814x.dtsi b/arch/arm/boot/dts/dm814x.dtsi
--- a/arch/arm/boot/dts/dm814x.dtsi
+++ b/arch/arm/boot/dts/dm814x.dtsi
@@ -693,7 +693,7 @@ mac: ethernet@0 {
 
 					davinci_mdio: mdio@800 {
 						compatible = "ti,cpsw-mdio", "ti,davinci_mdio";
-						clocks = <&alwon_ethernet_clkctrl DM814_ETHERNET_CPGMAC0_CLKCTRL 0>;
+						clocks = <&cpsw_125mhz_gclk>;
 						clock-names = "fck";
 						#address-cells = <1>;
 						#size-cells = <0>;
-- 
2.26.2
