Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5B22B9323
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgKSNHl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:07:41 -0500
Received: from muru.com ([72.249.23.125]:48826 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727214AbgKSNHk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:07:40 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0363A80C1;
        Thu, 19 Nov 2020 13:07:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 5/7] ARM: dts: Configure power domain for omap4 dsp
Date:   Thu, 19 Nov 2020 15:07:18 +0200
Message-Id: <20201119130720.63140-6-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119130720.63140-1-tony@atomide.com>
References: <20201119130720.63140-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This allows shutting down the dsp domain when not in use.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -330,6 +330,7 @@ SYSC_OMAP2_SOFTRESET |
 			/* Domains (V, P, C): iva, tesla_pwrdm, tesla_clkdm */
 			clocks = <&tesla_clkctrl OMAP4_DSP_CLKCTRL 0>;
 			clock-names = "fck";
+			power-domains = <&prm_tesla>;
 			resets = <&prm_tesla 1>;
 			reset-names = "rstctrl";
 			#address-cells = <1>;
-- 
2.29.2
