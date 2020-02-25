Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F47D16F069
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 21:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbgBYUq7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 15:46:59 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39066 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729681AbgBYUq7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Feb 2020 15:46:59 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PKkuHb045201;
        Tue, 25 Feb 2020 14:46:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582663616;
        bh=In/GDRNcHKVb+kNbZ3USHpVGaKl5RflTnYtSQhkQj8A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ATYrR1uX/lHoMaWYRRp9SHXsoMVnq+sJGapXE46oEhQPrZDvsd2lLf2yMt72UY4hA
         2RgzT3Z0W2/LqZ7ORiGMJdyqY8JWSXrRVcKiHMCq+shcbrwYc1XtgW11zYVA5/+AQh
         V5+8+QCOwLq4Rxc/aZZoHQtBRg+iQzVFJ2p6PruQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PKkueH022020
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 14:46:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 14:46:55 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PKkuZ0059186;
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01PKkuYF025467;
        Tue, 25 Feb 2020 14:46:56 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 03/12] ARM: dts: AM33xx-l4: Update PRUSS interconnect target-module node
Date:   Tue, 25 Feb 2020 14:46:40 -0600
Message-ID: <20200225204649.28220-4-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225204649.28220-1-s-anna@ti.com>
References: <20200225204649.28220-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRU-ICSS present on some AM33xx SoCs has a very unique SYSC
register. The IP also uses a hard-reset line, and requires this
PRCM reset to be deasserted to be able to access any registers.
Update the existing PRUSS interconnect target-module with all
the required properties.

The PRUSS device itself shall be added as a child node to this
interconnect node in the future. PRU-ICSS is not supported on
AM3352 SoC though in the AM33xx family, so the target module node
should be enabled in only those derivative board files that use
a SoC containing PRU-ICSS.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 4e2986f0c604..5ed7f3c58c0f 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -759,12 +759,27 @@
 			ranges = <0x0 0x200000 0x80000>;
 		};
 
-		target-module@300000 {			/* 0x4a300000, ap 9 04.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+		pruss_tm: target-module@300000 {	/* 0x4a300000, ap 9 04.0 */
+			compatible = "ti,sysc-pruss", "ti,sysc";
+			reg = <0x326000 0x4>,
+			      <0x326004 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_PRUSS_STANDBY_INIT |
+					 SYSC_PRUSS_SUB_MWAIT)>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&pruss_ocp_clkctrl AM3_PRUSS_OCP_PRUSS_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_per 1>;
+			reset-names = "rstctrl";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x300000 0x80000>;
+			status = "disabled";
 		};
 	};
 };
-- 
2.23.0

