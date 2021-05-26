Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169DA3916E2
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhEZMCH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:02:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33226 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbhEZMCB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:02:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QC0POv047511;
        Wed, 26 May 2021 07:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622030425;
        bh=Fk9IGG55x+JZlXlFHIC+N5jUDdCeMVpfGC8Xg0ZqEcc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QsohrEJa8GYkI5ny8GjxvuG4uqNg9dG6mlE+glKWaU+Ucfl9yTJCTOTvDXReGVxoW
         VjhZgUwItbvxR0hsaugq/stgxGsG1WSl+UZ1BAP7WDQaVUS57GlKbdHtOae2m3WCAs
         Rd5hc1XCWUbm67u48MBUlyqP7DiaTxNjL4lUv6YU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QC0PjQ093748
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 07:00:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 07:00:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 07:00:24 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QC0J2u108104;
        Wed, 26 May 2021 07:00:22 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/2] ARM: dts: am437x-l4: Drop ti,omap2-uart entry from UART nodes
Date:   Wed, 26 May 2021 17:29:56 +0530
Message-ID: <20210526115956.3065-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526115956.3065-1-vigneshr@ti.com>
References: <20210526115956.3065-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ti,omap2-uart was kept around to work with legacy omap-serial driver.
Now that we have completed move to 8250-omap.c drop legacy compatible.
This will simplify writing YAML schema.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index e217ffc09770..d4daf2f84de9 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -194,7 +194,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x9000 0x1000>;
 
 			uart0: serial@0 {
-				compatible = "ti,am4372-uart","ti,omap2-uart";
+				compatible = "ti,am4372-uart";
 				reg = <0x0 0x2000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			};
@@ -712,7 +712,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x22000 0x1000>;
 
 			uart1: serial@0 {
-				compatible = "ti,am4372-uart","ti,omap2-uart";
+				compatible = "ti,am4372-uart";
 				reg = <0x0 0x2000>;
 				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -740,7 +740,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x24000 0x1000>;
 
 			uart2: serial@0 {
-				compatible = "ti,am4372-uart","ti,omap2-uart";
+				compatible = "ti,am4372-uart";
 				reg = <0x0 0x2000>;
 				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -1399,7 +1399,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xa6000 0x1000>;
 
 			uart3: serial@0 {
-				compatible = "ti,am4372-uart","ti,omap2-uart";
+				compatible = "ti,am4372-uart";
 				reg = <0x0 0x2000>;
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -1427,7 +1427,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xa8000 0x1000>;
 
 			uart4: serial@0 {
-				compatible = "ti,am4372-uart","ti,omap2-uart";
+				compatible = "ti,am4372-uart";
 				reg = <0x0 0x2000>;
 				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -1455,7 +1455,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xaa000 0x1000>;
 
 			uart5: serial@0 {
-				compatible = "ti,am4372-uart","ti,omap2-uart";
+				compatible = "ti,am4372-uart";
 				reg = <0x0 0x2000>;
 				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
-- 
2.31.1

