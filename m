Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507A0298BE3
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769087AbgJZLWl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:41 -0400
Received: from muru.com ([72.249.23.125]:46654 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:41 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9F56E80AA;
        Mon, 26 Oct 2020 11:22:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 02/18] ARM: dts: Configure also interconnect clocks for am3 system timers
Date:   Mon, 26 Oct 2020 13:22:06 +0200
Message-Id: <20201026112222.56894-3-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026112222.56894-1-tony@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
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
 arch/arm/boot/dts/am33xx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -645,6 +645,9 @@ prm_cefuse: prm@1200 {
 
 /* Preferred always-on timer for clocksource */
 &timer1_target {
+	clocks = <&l4_wkup_clkctrl AM3_L4_WKUP_TIMER1_CLKCTRL 0>,
+		 <&l4_wkup_clkctrl AM3_L4_WKUP_L4_WKUP_CLKCTRL 0>;
+	clock-names = "fck", "ick";
 	ti,no-reset-on-init;
 	ti,no-idle;
 	timer@0 {
@@ -655,6 +658,9 @@ timer@0 {
 
 /* Preferred timer for clockevent */
 &timer2_target {
+	clocks = <&l4ls_clkctrl AM3_L4LS_TIMER2_CLKCTRL 0>,
+		 <&l4ls_clkctrl AM3_L4LS_L4_LS_CLKCTRL 0>;
+	clock-names = "fck", "ick";
 	ti,no-reset-on-init;
 	ti,no-idle;
 	timer@0 {
-- 
2.29.1
