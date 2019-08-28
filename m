Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA36A9FC4E
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfH1H5D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:57:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58684 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfH1H5C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:57:02 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uxJF123121;
        Wed, 28 Aug 2019 02:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566979019;
        bh=u5tysN0SZOq/tSuyufNeM9PorN2KHwQ83/BegyqbgjI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JvmWmEIFfFauU/RYUeBDx/hWp4iBOZ5NHIPqqF1LoRkYn9PTGhqtyeL9UAIUpxqnL
         FjoFJfvthz+qTiu3JmrPyy/Xu0TAOqU2oB7kxDkWjNfty1fycn9HuKtxVDJpE4oVl5
         i3kx7Q/KDmPjEGr1wbiF69zwetJSmR6qGWz+VBts=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7ux4H072041
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:56:59 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:56:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:56:59 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uuFk107124;
        Wed, 28 Aug 2019 02:56:58 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 01/10] ARM: dts: omap5: add IVA clkctrl nodes
Date:   Wed, 28 Aug 2019 10:56:35 +0300
Message-ID: <20190828075644.4493-2-t-kristo@ti.com>
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

Add clkctrtl nodes for Image and Video Accelerator subsystem for omap5.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap54xx-clocks.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
index 33e8dd905bff..f1ab2777e33e 100644
--- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
@@ -1132,6 +1132,20 @@
 		};
 	};
 
+	iva_cm: iva_cm@1200 {
+		compatible = "ti,omap4-cm";
+		reg = <0x1200 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x1200 0x100>;
+
+		iva_clkctrl: clk@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0xc>;
+			#clock-cells = <2>;
+		};
+	};
+
 	dss_cm: dss_cm@1400 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1400 0x100>;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
