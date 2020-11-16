Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA612B4285
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbgKPLUN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:13 -0500
Received: from muru.com ([72.249.23.125]:48432 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbgKPLUN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:13 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 36442819C;
        Mon, 16 Nov 2020 11:20:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 04/17] ARM: dts: Configure also interconnect clocks for am4 system timer
Date:   Mon, 16 Nov 2020 13:19:26 +0200
Message-Id: <20201116111939.21405-5-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We now manage clocksource and clockevent clocks directly with
timer-ti-dm-systimer. In order to use genpd with prm_omap,
GENPD_FLAG_PM_CLK and simple-pm-bus, we need to keep the system
timer related interconnect clocks enabled until clocksource suspend
is done.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -604,6 +604,9 @@ prm_device: prm@4000 {
 &timer1_target {
 	ti,no-reset-on-init;
 	ti,no-idle;
+	clocks = <&l4_wkup_clkctrl AM4_L4_WKUP_TIMER1_CLKCTRL 0>,
+		 <&l4_wkup_clkctrl AM4_L4_WKUP_L4_WKUP_CLKCTRL 0>;
+	clock-names = "fck", "ick";
 	timer@0 {
 		assigned-clocks = <&timer1_fck>;
 		assigned-clock-parents = <&sys_clkin_ck>;
@@ -614,6 +617,9 @@ timer@0 {
 &timer2_target {
 	ti,no-reset-on-init;
 	ti,no-idle;
+	clocks = <&l4ls_clkctrl AM4_L4LS_TIMER2_CLKCTRL 0>,
+		 <&l4ls_clkctrl AM4_L4LS_L4_LS_CLKCTRL 0>;
+	clock-names = "fck", "ick";
 	timer@0 {
 		assigned-clocks = <&timer2_fck>;
 		assigned-clock-parents = <&sys_clkin_ck>;
-- 
2.29.2
