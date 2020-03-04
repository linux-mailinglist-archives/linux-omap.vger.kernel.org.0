Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E945B178CFD
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 10:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgCDJA5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 04:00:57 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44212 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgCDJA5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Mar 2020 04:00:57 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02490k32090738;
        Wed, 4 Mar 2020 03:00:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583312447;
        bh=ha9OQnDcooAmHEgCcB9O6rbxK86frAqOmsgVJJ3RY+E=;
        h=From:To:CC:Subject:Date;
        b=EZ0jXAZCXO4y5aS1mftire1uwF1aP/rNpADio3gg6IYo11C3tJkqKyRKbwq4xj6tB
         vkhAiAAZPeQT7bd6PIx8FDbT3wL7QVHsaD/ENqGv7zlkmRIFKcPQ7B0QNwP7dFpW68
         uBVVPc0KZaTNwNCzSp3RglAAQSLfkC54VdhSgcrk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02490kSf126521
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Mar 2020 03:00:46 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Mar
 2020 03:00:46 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Mar 2020 03:00:46 -0600
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 02490hm9093867;
        Wed, 4 Mar 2020 03:00:43 -0600
From:   Roger Quadros <rogerq@ti.com>
To:     <tony@atomide.com>
CC:     <yan-liu@ti.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>, Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dra7: sata: Fix SATA with CONFIG_ARM_LPAE enabled
Date:   Wed, 4 Mar 2020 11:00:31 +0200
Message-ID: <20200304090031.30360-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the TRM says that SATA IP has 36 address bits
wired in the SoC, we see bus errors whenever any address
greater than 32-bit is given to the controller.

This happens on dra7-EVM with 4G of RAM with CONFIG_ARM_LPAE=y.

As a workaround we limit the DMA address range to 32-bits
for SATA.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Reported-by: Yan Liu <yan-liu@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---

NOTE: Currently ARM dma-mapping code doesn't account for devices
bus_dma_limit. This is fixed in [1].

[1] https://lkml.org/lkml/2020/2/18/712

 arch/arm/boot/dts/dra7.dtsi | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index d78b684e7fca..895462c22d1c 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -642,15 +642,22 @@
 		};
 
 		/* OCP2SCP3 */
-		sata: sata@4a141100 {
-			compatible = "snps,dwc-ahci";
-			reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
-			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&sata_phy>;
-			phy-names = "sata-phy";
-			clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
-			ti,hwmods = "sata";
-			ports-implemented = <0x1>;
+		sata_aux_bus {
+			#address-cells = <1>;
+			#size-cells = <2>;
+			compatible = "simple-bus";
+			ranges = <0x0 0x4a140000 0x0 0x1200>;
+			dma-ranges = <0x0 0x0 0x1 0x00000000>;
+			sata: sata@4a141100 {
+				compatible = "snps,dwc-ahci";
+				reg = <0x0 0x0 0x1100>, <0x1100 0x0 0x7>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&sata_phy>;
+				phy-names = "sata-phy";
+				clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
+				ti,hwmods = "sata";
+				ports-implemented = <0x1>;
+			};
 		};
 
 		/* OCP2SCP1 */
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

