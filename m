Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A721DD2286
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 10:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733188AbfJJIVY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 04:21:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39298 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733192AbfJJIVY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 04:21:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A8LGiS101677;
        Thu, 10 Oct 2019 03:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570695676;
        bh=eTzIUfQtNTD3JWckXPA0kJGgMMdg/QU/zw3ZRvdBMLI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fcK3fH88uLsZiGDukqUAp376VDdYyxEQK/LAwnSuAmc/Qp4eIKcKY4np1otcwJxYe
         Lxe+SiMtcaEfFLgmEhRci5uAOUhnZ3Vm2b+oF7apg7mX1Mww714PLl7CIEjsy6I1e8
         LS69BlVdccMVv45CtB0O25OZSaXlnSyn1qSOJ8yA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A8LGwO003566
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 03:21:16 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 03:21:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 03:21:15 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A8LAtC012630;
        Thu, 10 Oct 2019 03:21:14 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 2/5] ARM: dts: omap4: add PRM nodes
Date:   Thu, 10 Oct 2019 11:21:05 +0300
Message-ID: <20191010082108.15448-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010082108.15448-1-t-kristo@ti.com>
References: <20191010082108.15448-1-t-kristo@ti.com>
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
index d60d5e0ecc4c..3421ef387e21 100644
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1007,7 +1007,7 @@
 			ranges = <0x0 0x6000 0x2000>;
 
 			prm: prm@0 {
-				compatible = "ti,omap4-prm";
+				compatible = "ti,omap4-prm", "simple-bus";
 				reg = <0x0 0x2000>;
 				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 7cc95bc1598b..f25f027e7c1c 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -442,3 +442,29 @@
 #include "omap4-l4.dtsi"
 #include "omap4-l4-abe.dtsi"
 #include "omap44xx-clocks.dtsi"
+
+&prm {
+	prm_tesla: prm@400 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x400 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_core: prm@700 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x700 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_ivahd: prm@f00 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0xf00 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_device: prm@1b00 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1b00 0x40>;
+		#reset-cells = <1>;
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
