Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A481593C8
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 16:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbgBKPvU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 10:51:20 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52454 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgBKPvT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 10:51:19 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BFpGJT118865;
        Tue, 11 Feb 2020 09:51:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581436276;
        bh=vv4zoH/nm3fq4NMB86OifWyuiibLHNCHiWQsiTJUeFI=;
        h=From:To:CC:Subject:Date;
        b=O9ztT96Wpp251DqB8cqfs/QA6uCLhLollfo45U4lss+IW4oSzdsCvXWGlhV22e5ta
         4IL6kQMNZZUSKFykD37kk4bZllm6CwTWzXWWYcM0lvWRUwZHhVABaKGxBFJiWm2X2F
         bfD7WrOWiVXxwGZZ+umpf/5aEzQWMwO/eZEjyaf0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BFpGEN015469
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Feb 2020 09:51:16 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 09:51:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 09:51:16 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BFpFtf084713;
        Tue, 11 Feb 2020 09:51:16 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01BFpF300146;
        Tue, 11 Feb 2020 09:51:15 -0600 (CST)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH] ARM: dts: dra7xx-clocks: Fixup IPU1 mux clock parent source
Date:   Tue, 11 Feb 2020 09:51:03 -0600
Message-ID: <20200211155103.23973-1-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The IPU1 functional clock is the output of a mux clock (represented
by ipu1_gfclk_mux previously) and the clock source for this has been
updated to be sourced from dpll_core_h22x2_ck in commit 39879c7d963e
("ARM: dts: dra7xx-clocks: Source IPU1 functional clock from CORE DPLL").
ipu1_gfclk_mux is an obsolete clock now with the clkctrl conversion,
and this clock source parenting is lost during the new clkctrl layout
conversion.

Remove this stale clock and fix up the clock source for this mux
clock using the latest equivalent clkctrl clock. This restores the
previous logic and ensures that the IPU1 continues to run at the
same frequency of IPU2 and independent of the ABE DPLL.

Fixes: b5f8ffbb6fad ("ARM: dts: dra7: convert to use new clkctrl layout")
Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Tony,

Patch on top of 5.6-rc1. Appreciate it if you can include it for the 5.6-rc
cycle.

regards
Suman

 arch/arm/boot/dts/dra7xx-clocks.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
index 55cef4cac5f1..dc0a93bccbf1 100644
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -796,16 +796,6 @@
 		clock-div = <1>;
 	};
 
-	ipu1_gfclk_mux: ipu1_gfclk_mux@520 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&dpll_abe_m2x2_ck>, <&dpll_core_h22x2_ck>;
-		ti,bit-shift = <24>;
-		reg = <0x0520>;
-		assigned-clocks = <&ipu1_gfclk_mux>;
-		assigned-clock-parents = <&dpll_core_h22x2_ck>;
-	};
-
 	dummy_ck: dummy_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -1564,6 +1554,8 @@
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
+			assigned-clocks = <&ipu1_clkctrl DRA7_IPU1_MMU_IPU1_CLKCTRL 24>;
+			assigned-clock-parents = <&dpll_core_h22x2_ck>;
 		};
 
 		ipu_clkctrl: ipu-clkctrl@50 {
-- 
2.23.0

