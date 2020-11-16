Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D862B428C
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729645AbgKPLUS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:18 -0500
Received: from muru.com ([72.249.23.125]:48448 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbgKPLUR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:17 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BA500813D;
        Mon, 16 Nov 2020 11:20:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 06/17] ARM: dts: Configure RTC powerdomain for am4
Date:   Mon, 16 Nov 2020 13:19:28 +0200
Message-Id: <20201116111939.21405-7-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For genpd we need the RTC powerdomain configured.

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -422,6 +422,7 @@ rtc_target: target-module@3e000 {	/* 0x44e3e000, ap 34 60.0 */
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			/* Domains (P, C): rtc_pwrdm, l4_rtc_clkdm */
+			power-domains = <&prm_rtc>;
 			clocks = <&l4_rtc_clkctrl AM4_L4_RTC_RTC_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
-- 
2.29.2
