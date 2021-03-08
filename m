Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392A5330FA8
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhCHNj4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:56 -0500
Received: from muru.com ([72.249.23.125]:40896 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230144AbhCHNjZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 67A3580D4;
        Mon,  8 Mar 2021 13:40:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 12/12] ARM: dts: Prepare for simple-pm-bus for omap4 l3
Date:   Mon,  8 Mar 2021 15:39:10 +0200
Message-Id: <20210308133910.12454-13-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308133910.12454-1-tony@atomide.com>
References: <20210308133910.12454-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's configure omap4 l3 for power-domain and clocks in preparation for
starting to use simple-pm-bus. We will flip over to using simple-pm-bus
later on after dropping the legacy data for all the devices on l3
interconnect.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -108,6 +108,10 @@ wakeupgen: interrupt-controller@48281000 {
 	 */
 	ocp {
 		compatible = "simple-bus";
+		power-domains = <&prm_l4per>;
+		clocks = <&l3_1_clkctrl OMAP4_L3_MAIN_1_CLKCTRL 0>,
+			 <&l3_2_clkctrl OMAP4_L3_MAIN_2_CLKCTRL 0>,
+			 <&l3_instr_clkctrl OMAP4_L3_MAIN_3_CLKCTRL 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-- 
2.30.1
