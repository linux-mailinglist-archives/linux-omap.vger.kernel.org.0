Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E736B9FC52
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfH1H5I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:57:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37166 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfH1H5I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:57:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7v3kS127658;
        Wed, 28 Aug 2019 02:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566979023;
        bh=kh0XqWPOVpwPZwZq3NDgP1PINZHnA6n9NcYoIfo7Ms8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xELkV4NvKsUmAKWgdTz8PyPcHUwUK9sCG1T27KPYW9bKxygVrN1x0LqKTOWMsI3zd
         7Me+zMWTkrCrDkm5NHid4PubiN7mgtoU3wiiSEWkh6lDdD/CsniydC5GoZ0Ta7WuHv
         2jdNDbHslir1Ee4VI3ia7h3Xk5QpLUIaaWE91X8s=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7v3II124014
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:57:03 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:57:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:57:03 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uuFn107124;
        Wed, 28 Aug 2019 02:57:02 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 04/10] ARM: dts: am33xx: Add PRM data
Date:   Wed, 28 Aug 2019 10:56:38 +0300
Message-ID: <20190828075644.4493-5-t-kristo@ti.com>
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

Add PRM data for AM33xx SoC. Initially this is used to provide reset
support, but will be expanded later to support also powerdomain control.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index e5c2f71a7c77..7448400a119e 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -445,3 +445,32 @@
 
 #include "am33xx-l4.dtsi"
 #include "am33xx-clocks.dtsi"
+
+&prcm {
+	prm_per: prm@c00 {
+		compatible = "ti,am3-prm-inst";
+		reg = <0xc00 0x100>;
+		#reset-cells = <1>;
+		clocks = <&pruss_ocp_clkctrl AM3_PRUSS_OCP_PRUSS_CLKCTRL 0>;
+	};
+
+	prm_wkup: prm@d00 {
+		compatible = "ti,am3-prm-inst";
+		reg = <0xd00 0x100>;
+		#reset-cells = <1>;
+		clocks = <&l4_wkup_clkctrl AM3_WKUP_M3_CLKCTRL 0>;
+	};
+
+	prm_device: prm@f00 {
+		compatible = "ti,am3-prm-inst";
+		reg = <0xf00 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_gfx: prm@1100 {
+		compatible = "ti,am3-prm-inst";
+		reg = <0x1100 0x100>;
+		#reset-cells = <1>;
+		clocks = <&gfx_l3_clkctrl AM3_GFX_CLKCTRL 0>;
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
