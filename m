Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970209FC50
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfH1H5E (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:57:04 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58694 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfH1H5E (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:57:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7v0T1123126;
        Wed, 28 Aug 2019 02:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566979020;
        bh=uXEzRmZ8z51c3KPk6HSXAw3k87purAqVMHp+qIFsIyU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fn8qFFe/hwbwjccB2ES+C1PtMuLaz/Mn6HnJCxBQqhQfHUxt7Av3rDMF0/omntq/G
         mH1biLT5jOw8ZJfi/oYOKGlpbZ7DhXkYpqCjbL4QFDaRSBPN3ZIhg6C4RgndIUk8mL
         IaRayL34CGDqnrrpAw0Piu7e0Bmdg8JJNLL0mW1U=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7v0jr123876
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:57:00 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:57:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:57:00 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uuFl107124;
        Wed, 28 Aug 2019 02:56:59 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 02/10] ARM: dts: dra7: add PRM nodes
Date:   Wed, 28 Aug 2019 10:56:36 +0300
Message-ID: <20190828075644.4493-3-t-kristo@ti.com>
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

Add PRM nodes for dra7 series of SoCs. These are initially used to
support reset control for some of the nodes, but will be extended
later to add powerdomain control and support for PRCM irqs among
other things.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra7.dtsi | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index 953f0ffce2a9..95147289be9c 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -763,3 +763,58 @@
 
 #include "dra7-l4.dtsi"
 #include "dra7xx-clocks.dtsi"
+
+&prm {
+	prm_dsp1: prm@400 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x400 0x100>;
+		#reset-cells = <1>;
+		clocks = <&dsp1_clkctrl DRA7_DSP1_MMU0_DSP1_CLKCTRL 0>;
+	};
+
+	prm_ipu: prm@500 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x500 0x100>;
+		#reset-cells = <1>;
+		clocks = <&ipu1_clkctrl DRA7_IPU1_MMU_IPU1_CLKCTRL 0>;
+	};
+
+	prm_core: prm@700 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x700 0x100>;
+		#reset-cells = <1>;
+		clocks = <&ipu2_clkctrl DRA7_IPU2_MMU_IPU2_CLKCTRL 0>;
+	};
+
+	prm_iva: prm@f00 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0xf00 0x100>;
+	};
+
+	prm_dsp2: prm@1b00 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x1b00 0x40>;
+		#reset-cells = <1>;
+		clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
+	};
+
+	prm_eve1: prm@1b40 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x1b40 0x40>;
+	};
+
+	prm_eve2: prm@1b80 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x1b80 0x40>;
+	};
+
+	prm_eve3: prm@1bc0 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x1bc0 0x40>;
+	};
+
+	prm_eve4: prm@1c00 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x1c00 0x60>;
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
