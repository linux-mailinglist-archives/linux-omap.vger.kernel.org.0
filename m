Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8EE397049
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jun 2021 11:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhFAJ1I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Jun 2021 05:27:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37114 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbhFAJ1G (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Jun 2021 05:27:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1519PMLo025228;
        Tue, 1 Jun 2021 04:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622539522;
        bh=mPiWYFmxWf0vuJEj+d4Rpx6EE/SAXnWg8d+PJ5087vc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=smlvNjibnlxmxJuFI6qd86e7al3pKhpsWZTELus6aQz+oallCCjkMqK341NkUjJEH
         KDwm/rDDhP0YRiUbmRFTSQkQ/rfIRNlb79zQACUGplcAmurHF6OqFQ1AoSdTla4Kr8
         ZSHsv1Wdm593ohJHUFD20qkRmQT0E13B+M1QgD3s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1519PMlb091631
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Jun 2021 04:25:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 04:25:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 1 Jun 2021 04:25:21 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1519Owru127212;
        Tue, 1 Jun 2021 04:25:02 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Vignesh R <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/3] ARM: dts: ti: Drop usage of ti,am33xx-ecap from DT nodes
Date:   Tue, 1 Jun 2021 14:54:55 +0530
Message-ID: <20210601092457.5039-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601092457.5039-1-lokeshvutla@ti.com>
References: <20210601092457.5039-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ti,am33xx-ecap is used to represent device nodes using ti,hwmod data.
Now that hwmod entries are entirely removed, drop usage of
ti,am33xx-ecap compatible from all DT nodes.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 9 +++------
 arch/arm/boot/dts/am437x-l4.dtsi | 9 +++------
 arch/arm/boot/dts/da850.dtsi     | 9 +++------
 3 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index fbf3458ab246..457d1b0fe510 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1996,8 +1996,7 @@ epwmss0: epwmss@0 {
 				ranges = <0 0 0x1000>;
 
 				ecap0: ecap@100 {
-					compatible = "ti,am3352-ecap",
-						     "ti,am33xx-ecap";
+					compatible = "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
@@ -2056,8 +2055,7 @@ epwmss1: epwmss@0 {
 				ranges = <0 0 0x1000>;
 
 				ecap1: ecap@100 {
-					compatible = "ti,am3352-ecap",
-						     "ti,am33xx-ecap";
+					compatible = "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
@@ -2116,8 +2114,7 @@ epwmss2: epwmss@0 {
 				ranges = <0 0 0x1000>;
 
 				ecap2: ecap@100 {
-					compatible = "ti,am3352-ecap",
-						     "ti,am33xx-ecap";
+					compatible = "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index e796b9bcc54e..4fa746c186be 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1749,8 +1749,7 @@ epwmss0: epwmss@0 {
 
 				ecap0: ecap@100 {
 					compatible = "ti,am4372-ecap",
-						     "ti,am3352-ecap",
-						     "ti,am33xx-ecap";
+						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
@@ -1800,8 +1799,7 @@ epwmss1: epwmss@0 {
 
 				ecap1: ecap@100 {
 					compatible = "ti,am4372-ecap",
-						     "ti,am3352-ecap",
-						     "ti,am33xx-ecap";
+						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
@@ -1851,8 +1849,7 @@ epwmss2: epwmss@0 {
 
 				ecap2: ecap@100 {
 					compatible = "ti,am4372-ecap",
-						     "ti,am3352-ecap",
-						     "ti,am33xx-ecap";
+						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index afdf3d3747ce..8e5748e6b270 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -592,8 +592,7 @@ ehrpwm1: pwm@302000 {
 			status = "disabled";
 		};
 		ecap0: ecap@306000 {
-			compatible = "ti,da850-ecap", "ti,am3352-ecap",
-				     "ti,am33xx-ecap";
+			compatible = "ti,da850-ecap", "ti,am3352-ecap";
 			#pwm-cells = <3>;
 			reg = <0x306000 0x80>;
 			clocks = <&psc1 20>;
@@ -602,8 +601,7 @@ ecap0: ecap@306000 {
 			status = "disabled";
 		};
 		ecap1: ecap@307000 {
-			compatible = "ti,da850-ecap", "ti,am3352-ecap",
-				     "ti,am33xx-ecap";
+			compatible = "ti,da850-ecap", "ti,am3352-ecap";
 			#pwm-cells = <3>;
 			reg = <0x307000 0x80>;
 			clocks = <&psc1 20>;
@@ -612,8 +610,7 @@ ecap1: ecap@307000 {
 			status = "disabled";
 		};
 		ecap2: ecap@308000 {
-			compatible = "ti,da850-ecap", "ti,am3352-ecap",
-				     "ti,am33xx-ecap";
+			compatible = "ti,da850-ecap", "ti,am3352-ecap";
 			#pwm-cells = <3>;
 			reg = <0x308000 0x80>;
 			clocks = <&psc1 20>;
-- 
2.31.1

