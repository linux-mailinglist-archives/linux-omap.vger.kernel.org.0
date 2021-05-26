Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF98391DD6
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 19:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbhEZRWe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 13:22:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57326 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234489AbhEZRW1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 13:22:27 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QHKnV3045129;
        Wed, 26 May 2021 12:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622049649;
        bh=DOzpQie/mGWTTenkXEi80ULFXld6+uPVu0nfBLM42BU=;
        h=From:To:CC:Subject:Date;
        b=LYtumEw42av7RPsqlvvkQ586rh+IRdKHX0lUVSYM1FfdCaSRS6wCJ/Lw6LU17rFHL
         OKlWxZXzwe32xnaB/42w8j88nnTo0+NKQrYBTnTdVv4bQOMyned7en//uFruW4HkHM
         Zcm04sePONzijIbc4jcuHF9pSOmGLgyZf76jbO9c=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QHKnrT102834
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 12:20:49 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 12:20:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 12:20:49 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QHKnle011356;
        Wed, 26 May 2021 12:20:49 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 14QHKnK3007817;
        Wed, 26 May 2021 12:20:49 -0500
From:   Gowtham Tammana <g-tammana@ti.com>
To:     <tony@atomide.com>, <bcousson@baylibre.com>,
        Suman Anna <s-anna@ti.com>
CC:     <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Nisanth Menon <nm@ti.com>, Gowtham Tammana <g-tammana@ti.com>
Subject: [PATCH v2] ARM: dts: dra7: Fix duplicate USB4 device node
Date:   Wed, 26 May 2021 12:20:38 -0500
Message-ID: <20210526172038.17542-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With [1] USB4 device node got defined in dra74x.dtsi file. However,
there was a prior defintion of the same in [2] which didn't get removed
causing boot failures. USB4 node is present only in DRA74x variants so
keeping the entry in dra74x.dtsi and removing it from the top level
interconnect hierarchy dra7-l4.dtsi file.

Since USB4 is only included in DRA74x variants, remove its reference
for AM5718, DRA71x and DR72x boards.

[1]: commit 549fce068a311 ("ARM: dts: dra7: Add l4 interconnect
hierarchy and ti-sysc data")
[2]: commit c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for
dra7 dwc3")

Fixes: c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for dra7 dwc3")
Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2:
  - changed reference to commit sha instead of line numbers
  - added Fixes: tag
  - moved the definition to dra74.dtsi as per Suman and Tony review comments

 arch/arm/boot/dts/am5718.dtsi  |  6 +-----
 arch/arm/boot/dts/dra7-l4.dtsi | 22 ----------------------
 arch/arm/boot/dts/dra71x.dtsi  |  4 ----
 arch/arm/boot/dts/dra72x.dtsi  |  4 ----
 arch/arm/boot/dts/dra74x.dtsi  |  2 +-
 5 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/am5718.dtsi b/arch/arm/boot/dts/am5718.dtsi
index ebf4d3cc1cfb..6d7530a48c73 100644
--- a/arch/arm/boot/dts/am5718.dtsi
+++ b/arch/arm/boot/dts/am5718.dtsi
@@ -17,17 +17,13 @@ / {
  * VCP1, VCP2
  * MLB
  * ISS
- * USB3, USB4
+ * USB3
  */
 
 &usb3_tm {
 	status = "disabled";
 };
 
-&usb4_tm {
-	status = "disabled";
-};
-
 &atl_tm {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 149144cdff35..648d23f7f748 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4129,28 +4129,6 @@ usb3: usb@10000 {
 			};
 		};
 
-		usb4_tm: target-module@140000 {		/* 0x48940000, ap 75 3c.0 */
-			compatible = "ti,sysc-omap4", "ti,sysc";
-			reg = <0x140000 0x4>,
-			      <0x140010 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
-			ti,sysc-midle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			/* Domains (P, C): l3init_pwrdm, l3init_clkdm */
-			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0x140000 0x20000>;
-		};
-
 		target-module@170000 {			/* 0x48970000, ap 21 0a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x170010 0x4>;
diff --git a/arch/arm/boot/dts/dra71x.dtsi b/arch/arm/boot/dts/dra71x.dtsi
index cad0e4a2bd8d..9c270d8f75d5 100644
--- a/arch/arm/boot/dts/dra71x.dtsi
+++ b/arch/arm/boot/dts/dra71x.dtsi
@@ -11,7 +11,3 @@
 &rtctarget {
 	status = "disabled";
 };
-
-&usb4_tm {
-	status = "disabled";
-};
diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index d403acc754b6..f3e934ef7d3e 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -108,7 +108,3 @@ &pcie1_ep {
 &pcie2_rc {
 	compatible = "ti,dra726-pcie-rc", "ti,dra7-pcie";
 };
-
-&usb4_tm {
-	status = "disabled";
-};
diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index e1850d6c841a..60f2ab8d34d5 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -49,7 +49,7 @@ dsp2_system: dsp_system@41500000 {
 			reg = <0x41500000 0x100>;
 		};
 
-		target-module@48940000 {
+		usb4_tm: target-module@48940000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x48940000 0x4>,
 			      <0x48940010 0x4>;
-- 
2.31.1

