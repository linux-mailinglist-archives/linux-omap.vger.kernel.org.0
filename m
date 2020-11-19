Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486942B9376
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgKSNNX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:13:23 -0500
Received: from muru.com ([72.249.23.125]:48920 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727256AbgKSNNX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:13:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A805180C1;
        Thu, 19 Nov 2020 13:13:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 8/8] ARM: dts: Configure power domain for omap5 dss
Date:   Thu, 19 Nov 2020 15:12:59 +0200
Message-Id: <20201119131259.63829-9-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119131259.63829-1-tony@atomide.com>
References: <20201119131259.63829-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This allows shutting down dss domain when the screen blanks.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -410,6 +410,7 @@ target-module@58000000 {
 			      <0x58000014 4>;
 			reg-names = "rev", "syss";
 			ti,syss-mask = <1>;
+			power-domains = <&prm_dss>;
 			clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 0>,
 				 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
 				 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
-- 
2.29.2
