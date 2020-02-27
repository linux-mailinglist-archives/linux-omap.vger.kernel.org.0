Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488D0172B35
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 23:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgB0W2z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 17:28:55 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41222 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730293AbgB0W2y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 17:28:54 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSoXu106637;
        Thu, 27 Feb 2020 16:28:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582842530;
        bh=jzIJRcVXGg56lh4wpxg3DO2Gscg2H+zIF2k2SSUW4Aw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TFrcXta830h5plXX03l2X4I3jvhOFOAO8SKKzJ7M8eZT1ueWaXJWdTOed50FSU9JE
         ExHTi0zXJOkYqXnYCxnTHGDfSYiY4tR51yhb4/9leK8HxoIj9HzNTOWH4GKzUHR/YU
         v3vZQYUhTi4BxtxhbK5oNh9tMLuiUOs9P2M8dWbk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RMSoCe084652
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Feb 2020 16:28:50 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 16:28:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 16:28:50 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSouP121976;
        Thu, 27 Feb 2020 16:28:50 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01RMSo25087087;
        Thu, 27 Feb 2020 16:28:50 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 3/5] ARM: dts: AM33xx-l4: Update PRUSS interconnect target-module node
Date:   Thu, 27 Feb 2020 16:28:35 -0600
Message-ID: <20200227222837.7329-4-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200227222837.7329-1-s-anna@ti.com>
References: <20200227222837.7329-1-s-anna@ti.com>
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
AM3351/AM3352/AM3354 SoCs though in the AM33xx family, so the
target module node should be disabled in derivative board files
that use any of these SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Revise patch description, no code changes

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

