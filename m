Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099723916DD
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhEZMB5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:01:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58872 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbhEZMB4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:01:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QC0Mjl122750;
        Wed, 26 May 2021 07:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622030422;
        bh=w+1yG06oMM2gTxx2gryJE3Zg3WgFOgAaSk6Mad9RwTQ=;
        h=From:To:CC:Subject:Date;
        b=N58g+pjdInLV1EE+rFcVoS0dR8zR2QEY0wX5k0K9fSvTVzvPrpAIBOztK/ds272NB
         OcCKTSprCwf7lwTtNzdVzf4qwKJjkNcslj+Uu/r70q3tGroLVrsUd+mnfJYE2gnE0O
         WG1tfLMrYWc2EgkT9I8NgOx7NjCdoFqScRRxpRik=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QC0M4Y093725
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 07:00:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 07:00:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 07:00:22 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QC0J2t108104;
        Wed, 26 May 2021 07:00:20 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 1/2] ARM: dts: dra7-l4: Drop ti,omap4-uart entry from UART nodes
Date:   Wed, 26 May 2021 17:29:55 +0530
Message-ID: <20210526115956.3065-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ti,omap4-uart was kept around to work with legacy omap-serial driver.
Now that we have completed move to 8250-omap.c drop legacy compatible.
This will simplify writing YAML schema.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 149144cdff35..a750f7829f79 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1159,7 +1159,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x20000 0x1000>;
 
 			uart3: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -1562,7 +1562,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x66000 0x1000>;
 
 			uart5: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -1594,7 +1594,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x68000 0x1000>;
 
 			uart6: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -1626,7 +1626,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x6a000 0x1000>;
 
 			uart1: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts-extended = <&crossbar_mpu GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -1658,7 +1658,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x6c000 0x1000>;
 
 			uart2: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -1690,7 +1690,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x6e000 0x1000>;
 
 			uart4: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -2424,7 +2424,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x20000 0x1000>;
 
 			uart7: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -2454,7 +2454,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x22000 0x1000>;
 
 			uart8: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -2484,7 +2484,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x24000 0x1000>;
 
 			uart9: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
@@ -4530,7 +4530,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xb000 0x1000>;
 
 			uart10: serial@0 {
-				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				compatible = "ti,dra742-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
-- 
2.31.1

