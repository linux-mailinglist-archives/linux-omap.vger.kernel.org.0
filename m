Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BC71B791F
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgDXPNS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50450 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgDXPNS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDDLS051947;
        Fri, 24 Apr 2020 10:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741193;
        bh=tvrGp1br/B2N2WfSE01TfYRxsjwdfzzCSMi9JUtw558=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=M6ajpNPQ3trSMedJ0NE1zyrc5sR07ZflVCCw+H9yIGLTAuIdpPdNYaByFFUuQOS5l
         M83WXM9A4cHpB8ou3cbVfM0m7ZyzUJ+8wj7cCVTtJRS18LSNmZaaqym/yxFSyA/Kdp
         lyAxo0RlGoNVE1UxJtJrizm5AzSO351l1tmmmtcg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OFDDJl100221
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 10:13:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:12 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7I122378;
        Fri, 24 Apr 2020 10:13:11 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 10/17] ARM: dts: dra72-evm: Add CMA pools and enable IPUs & DSP1 rprocs
Date:   Fri, 24 Apr 2020 18:12:37 +0300
Message-ID: <20200424151244.3225-11-t-kristo@ti.com>
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

The CMA reserved memory nodes have been added for both the IPUs and the
DSP1 remoteproc devices on DRA72 EVM board. These nodes are assigned to
the respective rproc device nodes, and both the IPUs and the DSP1 remote
processors are enabled for this board.

The current CMA pools and sizes are defined statically for each device.
The addresses chosen are the same as the respective processors on the
DRA7 EVM board to maintain firmware compatibility between the two boards.
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
 arch/arm/boot/dts/dra72-evm.dts | 42 +++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/dra72-evm.dts b/arch/arm/boot/dts/dra72-evm.dts
index 9adb77585ef1..951152fe206a 100644
--- a/arch/arm/boot/dts/dra72-evm.dts
+++ b/arch/arm/boot/dts/dra72-evm.dts
@@ -12,6 +12,33 @@
 		reg = <0x0 0x80000000 0x0 0x40000000>; /* 1024 MB */
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
+	};
+
 	evm_1v8_sw: fixedregulator-evm_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "evm_1v8";
@@ -78,3 +105,18 @@
 	pinctrl-3 = <&mmc2_pins_hs200 &mmc2_iodelay_hs200_rev10_conf>;
 	vmmc-supply = <&evm_1v8_sw>;
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
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
