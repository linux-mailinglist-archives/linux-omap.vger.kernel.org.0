Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0569D9FC51
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfH1H5H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:57:07 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37160 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfH1H5H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:57:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7v2eU127649;
        Wed, 28 Aug 2019 02:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566979022;
        bh=usezFA71rznpN9ia/t+wJ4qi7Gg7ULvpWM8RBhJKtf8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=eVWVv26kx/ZLkUP2KsIMU9gkIDrDd+eOXNiLPGCXJafrU2Pdny9cfOlO4vk722rTG
         BEs9xW0LRjRKnl/LkMU66Iiq7LOqXmmLnjk3m0jrhFH+yv9xk/PSEumuCbv4bGxUhf
         hUBYf9FPfgw5jxTZ+CTluPyy4o+3fz0Cr03pf/AE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7v2Nc072155
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:57:02 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:57:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:57:01 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uuFm107124;
        Wed, 28 Aug 2019 02:57:00 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 03/10] ARM: dts: omap4: add PRM nodes
Date:   Wed, 28 Aug 2019 10:56:37 +0300
Message-ID: <20190828075644.4493-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828075644.4493-1-t-kristo@ti.com>
References: <20190828075644.4493-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add PRM nodes for omap4 series of SoCs. These are initially used to
support reset control for some of the nodes, but will be extended
later to add powerdomain control and support for PRCM irqs among
other things.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi |  2 +-
 arch/arm/boot/dts/omap4.dtsi    | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
index bea05dc4ef0f..0977bc39955b 100644
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -981,7 +981,7 @@
 			ranges = <0x0 0x6000 0x2000>;
 
 			prm: prm@0 {
-				compatible = "ti,omap4-prm";
+				compatible = "ti,omap4-prm", "simple-bus";
 				reg = <0x0 0x2000>;
 				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index c43e52fd5f65..e377f66fc322 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -443,3 +443,32 @@
 #include "omap4-l4.dtsi"
 #include "omap4-l4-abe.dtsi"
 #include "omap44xx-clocks.dtsi"
+
+&prm {
+	prm_tesla: prm@400 {
+		compatible = "ti,omap4-prm-inst";
+		reg = <0x400 0x100>;
+		#reset-cells = <1>;
+		clocks = <&tesla_clkctrl OMAP4_DSP_CLKCTRL 0>;
+	};
+
+	prm_core: prm@700 {
+		compatible = "ti,omap4-prm-inst";
+		reg = <0x700 0x100>;
+		#reset-cells = <1>;
+		clocks = <&ducati_clkctrl OMAP4_IPU_CLKCTRL 0>;
+	};
+
+	prm_ivahd: prm@f00 {
+		compatible = "ti,omap4-prm-inst";
+		reg = <0xf00 0x100>;
+		#reset-cells = <1>;
+		clocks = <&ivahd_clkctrl OMAP4_IVA_CLKCTRL 0>;
+	};
+
+	prm_device: prm@1b00 {
+		compatible = "ti,omap4-prm-inst";
+		reg = <0x1b00 0x40>;
+		#reset-cells = <1>;
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
