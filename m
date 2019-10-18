Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEFBDC98C
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 17:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502263AbfJRPqV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 11:46:21 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49658 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409069AbfJRPqU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 11:46:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkHkJ016648;
        Fri, 18 Oct 2019 10:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571413577;
        bh=p5em5IRObfpcqp3l0KWyJiTGrR9ie7pRTYi/0m+Xung=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VflyZUvXhATlJZ6PQCSsRB2H7xJyQGp5f4d6CobnvxxxS12HbzjMe22SGv5fpAWy6
         5fcabMFNCd8iH2DYssXQnSC1Dsr1ZrQxs3xZ0RVTQbhWEQBHv6JcFbMn1lNUlOHXmc
         Uswrzwx4PLoiKrwVjyfklZ6G7FPY+qCevF7cs43s=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkHjL128755;
        Fri, 18 Oct 2019 10:46:17 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:46:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:46:17 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkDAP045642;
        Fri, 18 Oct 2019 10:46:17 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 3/9] ARM: dts: dra7-l4: Add ti-sysc node for CAM
Date:   Fri, 18 Oct 2019 10:48:43 -0500
Message-ID: <20191018154849.3127-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018154849.3127-1-bparrot@ti.com>
References: <20191018154849.3127-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add CAM nodes as a child of l4 interconnect in order for it to probe
using ti-sysc.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 43 +++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 0917231a20e2..8f5c26a4f7c8 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4135,27 +4135,58 @@
 		};
 
 		target-module@170000 {			/* 0x48970000, ap 21 0a.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x170010 0x4>;
+			reg-names = "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&cam_clkctrl DRA7_CAM_VIP1_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x170000 0x10000>;
+			status = "disabled";
 		};
 
 		target-module@190000 {			/* 0x48990000, ap 23 2e.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x190010 0x4>;
+			reg-names = "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&cam_clkctrl DRA7_CAM_VIP2_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x190000 0x10000>;
+			status = "disabled";
 		};
 
 		target-module@1b0000 {			/* 0x489b0000, ap 25 34.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x1b0000 0x4>,
+			      <0x1b0010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&cam_clkctrl DRA7_CAM_VIP3_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x1b0000 0x10000>;
+			status = "disabled";
 		};
 
 		target-module@1d0010 {			/* 0x489d0000, ap 27 30.0 */
-- 
2.17.1

