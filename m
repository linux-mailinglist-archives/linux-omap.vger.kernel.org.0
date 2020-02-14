Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60E2315EBB0
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 18:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391418AbgBNRWK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 12:22:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:35272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390454AbgBNQKD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 11:10:03 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B9B724650;
        Fri, 14 Feb 2020 16:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581696602;
        bh=0AGS+MlQMepeARnJsKYIBXgbmtmIqDDXRQy0zLTy+2Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iDjuYum31+mnFTHFC7UYKJhi3BzZJJOrtDcY562ThKjNO8UiXMWR8KjPohaa8HeoQ
         iq8qKFnwOOWY49bYR7OLdTQaqX8YqObdwBdAy2nGJfza61U5BsDcpIP4SDhRkO/5ip
         VFB84W1pWM+khZMpxQGNtAd97+kERtV6/FMNaGyk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tero Kristo <t-kristo@ti.com>, Benoit Parrot <bparrot@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 387/459] ARM: dts: am43xx: add support for clkout1 clock
Date:   Fri, 14 Feb 2020 11:00:37 -0500
Message-Id: <20200214160149.11681-387-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

[ Upstream commit 01053dadb79d63b65f7b353e68b4b6ccf4effedb ]

clkout1 clock node and its generation tree was missing. Add this based
on the data on TRM and PRCM functional spec.

commit 664ae1ab2536 ("ARM: dts: am43xx: add clkctrl nodes") effectively
reverted this commit 8010f13a40d3 ("ARM: dts: am43xx: add support for
clkout1 clock") which is needed for the ov2659 camera sensor clock
definition hence it is being re-applied here.

Note that because of the current dts node name dependency for mapping to
clock domain, we must still use "clkout1-*ck" naming instead of generic
"clock@" naming for the node. And because of this, it's probably best to
apply the dts node addition together along with the other clock changes.

Fixes: 664ae1ab2536 ("ARM: dts: am43xx: add clkctrl nodes")
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Benoit Parrot <bparrot@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/am43xx-clocks.dtsi | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/am43xx-clocks.dtsi b/arch/arm/boot/dts/am43xx-clocks.dtsi
index 091356f2a8c16..c726cd8dbdf1b 100644
--- a/arch/arm/boot/dts/am43xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
@@ -704,6 +704,60 @@
 		ti,bit-shift = <8>;
 		reg = <0x2a48>;
 	};
+
+	clkout1_osc_div_ck: clkout1-osc-div-ck {
+		#clock-cells = <0>;
+		compatible = "ti,divider-clock";
+		clocks = <&sys_clkin_ck>;
+		ti,bit-shift = <20>;
+		ti,max-div = <4>;
+		reg = <0x4100>;
+	};
+
+	clkout1_src2_mux_ck: clkout1-src2-mux-ck {
+		#clock-cells = <0>;
+		compatible = "ti,mux-clock";
+		clocks = <&clk_rc32k_ck>, <&sysclk_div>, <&dpll_ddr_m2_ck>,
+			 <&dpll_per_m2_ck>, <&dpll_disp_m2_ck>,
+			 <&dpll_mpu_m2_ck>;
+		reg = <0x4100>;
+	};
+
+	clkout1_src2_pre_div_ck: clkout1-src2-pre-div-ck {
+		#clock-cells = <0>;
+		compatible = "ti,divider-clock";
+		clocks = <&clkout1_src2_mux_ck>;
+		ti,bit-shift = <4>;
+		ti,max-div = <8>;
+		reg = <0x4100>;
+	};
+
+	clkout1_src2_post_div_ck: clkout1-src2-post-div-ck {
+		#clock-cells = <0>;
+		compatible = "ti,divider-clock";
+		clocks = <&clkout1_src2_pre_div_ck>;
+		ti,bit-shift = <8>;
+		ti,max-div = <32>;
+		ti,index-power-of-two;
+		reg = <0x4100>;
+	};
+
+	clkout1_mux_ck: clkout1-mux-ck {
+		#clock-cells = <0>;
+		compatible = "ti,mux-clock";
+		clocks = <&clkout1_osc_div_ck>, <&clk_rc32k_ck>,
+			 <&clkout1_src2_post_div_ck>, <&dpll_extdev_m2_ck>;
+		ti,bit-shift = <16>;
+		reg = <0x4100>;
+	};
+
+	clkout1_ck: clkout1-ck {
+		#clock-cells = <0>;
+		compatible = "ti,gate-clock";
+		clocks = <&clkout1_mux_ck>;
+		ti,bit-shift = <23>;
+		reg = <0x4100>;
+	};
 };
 
 &prcm {
-- 
2.20.1

