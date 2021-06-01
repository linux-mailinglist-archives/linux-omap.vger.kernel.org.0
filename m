Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715FC39704B
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jun 2021 11:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbhFAJ1M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Jun 2021 05:27:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37126 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbhFAJ1L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Jun 2021 05:27:11 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1519PRfn025249;
        Tue, 1 Jun 2021 04:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622539527;
        bh=DEyw51w9tr60RjlU5BOyp/1ifKk2N+XUX9rpzpc5ARg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=DjaZBV8Kf/IP93SWaS8GOpdcPnC0LNvK9l69q23xUUclrGqZK1FTuampwnV97JYpr
         vYSvdUr8jDewiRVhPdtMAK5Hq+m4VyfUFkI9kTNvuNiiRe4SSI/LNQ5ywtIeikm8m9
         BKGL1Tyo4AoKmdE/YVHj6UIdHtTGVUgz5iAI3qn8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1519PRmR043109
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Jun 2021 04:25:27 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 04:25:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 1 Jun 2021 04:25:27 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1519Owrv127212;
        Tue, 1 Jun 2021 04:25:22 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Vignesh R <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 2/3] ARM: dts: ti: Fix node name for all ecap dt nodes
Date:   Tue, 1 Jun 2021 14:54:56 +0530
Message-ID: <20210601092457.5039-3-lokeshvutla@ti.com>
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

dtbs_check produces the following warning for ecap node name:
ecap@100: $nodename:0: 'ecap@100' does not match '^pwm(@.*|-[0-9a-f])*$'

Fix this by replacing ecap with pwm in node name

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm/boot/dts/am335x-cm-t335.dts | 2 +-
 arch/arm/boot/dts/am335x-evm.dts     | 2 +-
 arch/arm/boot/dts/am335x-evmsk.dts   | 2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi     | 6 +++---
 arch/arm/boot/dts/am437x-l4.dtsi     | 6 +++---
 arch/arm/boot/dts/da850.dtsi         | 6 +++---
 arch/arm/boot/dts/dra7-l4.dtsi       | 6 +++---
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-cm-t335.dts b/arch/arm/boot/dts/am335x-cm-t335.dts
index 36d963db4026..a306b0ccd06f 100644
--- a/arch/arm/boot/dts/am335x-cm-t335.dts
+++ b/arch/arm/boot/dts/am335x-cm-t335.dts
@@ -333,7 +333,7 @@ tlv320aic23: codec@1a {
 &epwmss0 {
 	status = "okay";
 
-	ecap0: ecap@100 {
+	ecap0: pwm@100 {
 		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&ecap0_pins>;
diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 902e295b309e..9cf39c93defb 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -495,7 +495,7 @@ &elm {
 &epwmss0 {
 	status = "okay";
 
-	ecap0: ecap@100 {
+	ecap0: pwm@100 {
 		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&ecap0_pins>;
diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index d5f8d5e2eb5d..a35f727dcd12 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -510,7 +510,7 @@ &usb1 {
 &epwmss2 {
 	status = "okay";
 
-	ecap2: ecap@100 {
+	ecap2: pwm@100 {
 		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&ecap2_pins>;
diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 457d1b0fe510..6359416b0fa7 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1995,7 +1995,7 @@ epwmss0: epwmss@0 {
 				status = "disabled";
 				ranges = <0 0 0x1000>;
 
-				ecap0: ecap@100 {
+				ecap0: pwm@100 {
 					compatible = "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
@@ -2054,7 +2054,7 @@ epwmss1: epwmss@0 {
 				status = "disabled";
 				ranges = <0 0 0x1000>;
 
-				ecap1: ecap@100 {
+				ecap1: pwm@100 {
 					compatible = "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
@@ -2113,7 +2113,7 @@ epwmss2: epwmss@0 {
 				status = "disabled";
 				ranges = <0 0 0x1000>;
 
-				ecap2: ecap@100 {
+				ecap2: pwm@100 {
 					compatible = "ti,am3352-ecap";
 					#pwm-cells = <3>;
 					reg = <0x100 0x80>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index 4fa746c186be..f9345e948fca 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1747,7 +1747,7 @@ epwmss0: epwmss@0 {
 				ranges = <0 0 0x1000>;
 				status = "disabled";
 
-				ecap0: ecap@100 {
+				ecap0: pwm@100 {
 					compatible = "ti,am4372-ecap",
 						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
@@ -1797,7 +1797,7 @@ epwmss1: epwmss@0 {
 				ranges = <0 0 0x1000>;
 				status = "disabled";
 
-				ecap1: ecap@100 {
+				ecap1: pwm@100 {
 					compatible = "ti,am4372-ecap",
 						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
@@ -1847,7 +1847,7 @@ epwmss2: epwmss@0 {
 				ranges = <0 0 0x1000>;
 				status = "disabled";
 
-				ecap2: ecap@100 {
+				ecap2: pwm@100 {
 					compatible = "ti,am4372-ecap",
 						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 8e5748e6b270..c3942b4e82ad 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -591,7 +591,7 @@ ehrpwm1: pwm@302000 {
 			power-domains = <&psc1 17>;
 			status = "disabled";
 		};
-		ecap0: ecap@306000 {
+		ecap0: pwm@306000 {
 			compatible = "ti,da850-ecap", "ti,am3352-ecap";
 			#pwm-cells = <3>;
 			reg = <0x306000 0x80>;
@@ -600,7 +600,7 @@ ecap0: ecap@306000 {
 			power-domains = <&psc1 20>;
 			status = "disabled";
 		};
-		ecap1: ecap@307000 {
+		ecap1: pwm@307000 {
 			compatible = "ti,da850-ecap", "ti,am3352-ecap";
 			#pwm-cells = <3>;
 			reg = <0x307000 0x80>;
@@ -609,7 +609,7 @@ ecap1: ecap@307000 {
 			power-domains = <&psc1 20>;
 			status = "disabled";
 		};
-		ecap2: ecap@308000 {
+		ecap2: pwm@308000 {
 			compatible = "ti,da850-ecap", "ti,am3352-ecap";
 			#pwm-cells = <3>;
 			reg = <0x308000 0x80>;
diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 149144cdff35..896ea110523a 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -2561,7 +2561,7 @@ epwmss0: epwmss@0 {
 				status = "disabled";
 				ranges = <0 0 0x1000>;
 
-				ecap0: ecap@100 {
+				ecap0: pwm@100 {
 					compatible = "ti,dra746-ecap",
 						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
@@ -2607,7 +2607,7 @@ epwmss1: epwmss@0 {
 				status = "disabled";
 				ranges = <0 0 0x1000>;
 
-				ecap1: ecap@100 {
+				ecap1: pwm@100 {
 					compatible = "ti,dra746-ecap",
 						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
@@ -2653,7 +2653,7 @@ epwmss2: epwmss@0 {
 				status = "disabled";
 				ranges = <0 0 0x1000>;
 
-				ecap2: ecap@100 {
+				ecap2: pwm@100 {
 					compatible = "ti,dra746-ecap",
 						     "ti,am3352-ecap";
 					#pwm-cells = <3>;
-- 
2.31.1

