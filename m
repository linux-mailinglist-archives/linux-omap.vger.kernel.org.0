Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2CCA14CF10
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jan 2020 18:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgA2RDe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jan 2020 12:03:34 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35580 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgA2RDe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jan 2020 12:03:34 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TH3ARn028845;
        Wed, 29 Jan 2020 11:03:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580317390;
        bh=V4Een5bn49I3Vtd9T/lM+OWuxq0pVWOOl4j/tunVZT4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wdK0ivJfe2vWWmVF4IVphzMhTILwRIaQ1QpXXIVpn9dgWpNv8rZ+q1Fe1SMFUeMaz
         BoIfA4loZ2iTIW0zfLbVRRBh2HFzlhO5Z5Ptn9tRRFICbLQmTpnp5HnF5djTf4EM7T
         SSSeEacr7wDJPa3lVv9AnCOU7cLnTg2d5CqLeNec=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00TH3Adj001097
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Jan 2020 11:03:10 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 11:03:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 11:03:08 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TH33Iw102348;
        Wed, 29 Jan 2020 11:03:06 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <tony@atomide.com>, <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <tomi.valkeinen@ti.com>, <peter.ujfalusi@ti.com>, <bparrot@ti.com>,
        <praneeth@ti.com>
Subject: [PATCH 1/2] ARM: dts: keystone-k2g: Add DSS node
Date:   Wed, 29 Jan 2020 19:03:02 +0200
Message-ID: <0744088604f744e1263805082f4c2e6c2382e28c.1580317147.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580317147.git.jsarha@ti.com>
References: <cover.1580317147.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add DT node for DSS. K2G has DSS version 6. Keystone family DSS are
somewhat different compered to the old OMAP family DSSes and the
binding looks different too.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 1c833105d6c5..08ba31780baa 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -324,6 +324,28 @@
 			clock-names = "gpio";
 		};
 
+		dss: dss@02540000 {
+			compatible = "ti,k2g-dss";
+			reg =	<0x02540000 0x400>,
+				<0x02550000 0x1000>,
+				<0x02557000 0x1000>,
+				<0x0255a800 0x100>,
+				<0x0255ac00 0x100>;
+			reg-names = "cfg", "common", "vid1", "ovr1", "vp1";
+			clocks =	<&k2g_clks 0x2 0>,
+					<&k2g_clks 0x2 1>;
+			clock-names = "fck", "vp1";
+			interrupts = <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&k2g_pds 0x2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			max-memory-bandwidth = <230000000>;
+		};
+
 		edma0: edma@2700000 {
 			compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
 			reg =	<0x02700000 0x8000>;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

