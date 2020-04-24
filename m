Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD5B1B7920
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgDXPNT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:19 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36470 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgDXPNS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDBHI037841;
        Fri, 24 Apr 2020 10:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741191;
        bh=L6+4Ywk3mLjT6xYyEv4DZiPQ9nxUKE/wYv7YFATsfBw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nfo3KgVJ11I/4+ziKsvfhFRgTLgo6369gXkurASST1y6jJB2io0XXnEJQPgGv7PFr
         DlKQQ5vYWUys37vQ6Kzycr8sU2H9xdfjGbvvzRb+Qlbbj6TNJRfe+t/9Fy0Xtj/ncl
         8BRPPcrrsUsjg44sQCLqad3uqrvM4jZRp43r8u3Y=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDBFE043384;
        Fri, 24 Apr 2020 10:13:11 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:11 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7H122378;
        Fri, 24 Apr 2020 10:13:10 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 09/17] ARM: dts: dra7-evm: Add CMA pools and enable IPU & DSP rprocs
Date:   Fri, 24 Apr 2020 18:12:36 +0300
Message-ID: <20200424151244.3225-10-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424151244.3225-1-t-kristo@ti.com>
References: <20200424151244.3225-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The CMA reserved memory nodes have been added for all the IPU and DSP
remoteproc devices on DRA7 EVM board. These nodes are assigned to the
respective rproc device nodes, and all the IPU and DSP remote processors
are enabled for this board.

The current CMA pools and sizes are defined statically for each device.
The CMA pools and sizes are defined using 64-bit values to support LPAE.
The starting addresses are fixed to meet current dependencies on the
remote processor firmwares, and this will go away when the remote-side
code has been improved to gather this information runtime during its
initialization.

An associated pair of the rproc node and its CMA node can be disabled
later on if there is no use-case defined to use that remote processor.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra7-evm.dts | 54 ++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index af06a55d1c5c..7aeb30daf3b8 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -35,6 +35,40 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ipu2_memory_region: ipu2-memory@95800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x95800000 0x0 0x3800000>;
+			reusable;
+			status = "okay";
+		};
+
+		dsp1_memory_region: dsp1-memory@99000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x99000000 0x0 0x4000000>;
+			reusable;
+			status = "okay";
+		};
+
+		ipu1_memory_region: ipu1-memory@9d000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x9d000000 0x0 0x2000000>;
+			reusable;
+			status = "okay";
+		};
+
+		dsp2_memory_region: dsp2-memory@9f000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x9f000000 0x0 0x800000>;
+			reusable;
+			status = "okay";
+		};
+	};
+
 	evm_3v3_sd: fixedregulator-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "evm_3v3_sd";
@@ -537,3 +571,23 @@
 	pinctrl-1 = <&dcan1_pins_sleep>;
 	pinctrl-2 = <&dcan1_pins_default>;
 };
+
+&ipu2 {
+	status = "okay";
+	memory-region = <&ipu2_memory_region>;
+};
+
+&ipu1 {
+	status = "okay";
+	memory-region = <&ipu1_memory_region>;
+};
+
+&dsp1 {
+	status = "okay";
+	memory-region = <&dsp1_memory_region>;
+};
+
+&dsp2 {
+	status = "okay";
+	memory-region = <&dsp2_memory_region>;
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
