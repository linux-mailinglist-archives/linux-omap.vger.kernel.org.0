Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09BE69FC54
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfH1H5K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:57:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58720 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfH1H5K (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:57:10 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7v6Ar123169;
        Wed, 28 Aug 2019 02:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566979026;
        bh=hxpUWyPrR3KIUmCy4NBe4h8DLkiKMukqt5xjoDbP8T4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dLpyv4z1izWujIj6V5XauobGguNoQtJ8rpHSYuo7NkMcNT0FkLzEBonMKT8G9Am+j
         XAhVPYHkSu9LcV16wdTDlupqzDhZLJegOsRH9DRpcIqoo2UudEr8wfdBhQRrZz9JZe
         5rhw4T4DbGp2/wDkWeGo+cxOd1gmixiohmbQ72bY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7v6ND124268
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:57:06 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:57:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:57:06 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uuFp107124;
        Wed, 28 Aug 2019 02:57:05 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 06/10] ARM: dts: omap5: Add PRM data
Date:   Wed, 28 Aug 2019 10:56:40 +0300
Message-ID: <20190828075644.4493-7-t-kristo@ti.com>
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

Add PRM data for OMAP54xx SoC. Initially this is used to provide reset
support, but will be expanded later to support also powerdomain control.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap5.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index edfd26c03462..c8bde171a949 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -412,3 +412,33 @@
 
 #include "omap5-l4-abe.dtsi"
 #include "omap54xx-clocks.dtsi"
+
+&prm {
+	prm_dsp: prm@400 {
+		compatible = "ti,omap5-prm-inst";
+		reg = <0x400 0x100>;
+		#reset-cells = <1>;
+		clocks = <&dsp_clkctrl OMAP5_MMU_DSP_CLKCTRL 0>;
+
+	};
+
+	prm_core: prm@700 {
+		compatible = "ti,omap5-prm-inst";
+		reg = <0x700 0x100>;
+		#reset-cells = <1>;
+		clocks = <&ipu_clkctrl OMAP5_MMU_IPU_CLKCTRL 0>;
+	};
+
+	prm_iva: prm@1200 {
+		compatible = "ti,omap5-prm-inst";
+		reg = <0x1200 0x100>;
+		#reset-cells = <1>;
+		clocks = <&iva_clkctrl OMAP5_IVA_CLKCTRL 0>;
+	};
+
+	prm_device: prm@1c00 {
+		compatible = "ti,omap5-prm-inst";
+		reg = <0x1c00 0x100>;
+		#reset-cells = <1>;
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
