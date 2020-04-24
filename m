Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D819D1B7921
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgDXPNU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50452 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgDXPNT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:19 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDEEi051952;
        Fri, 24 Apr 2020 10:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741194;
        bh=MVYUKywY9ySS1cFJR3cItqHS8fTfRy7NAHQhQoF8Vqc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MKiLxflx6zy6eHq3UscDlM1IJae5XgVBIhkHAwcB5bkYeMjL/FE9K0cc0iWUgI3A0
         cFvfZHfWgJO013uC8ipjFjg0uDtm83fBKWxy7WxE6MGlDYcvi+eE+K5vRdemPQ2HHw
         riWyCdlVIz6I9qBrSpk21z8GZQxPaMOKT6VHljKg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDEmr043418;
        Fri, 24 Apr 2020 10:13:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:14 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7J122378;
        Fri, 24 Apr 2020 10:13:13 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 11/17] ARM: dts: dra72-evm-revc: Add CMA pools and enable IPUs & DSP1 rprocs
Date:   Fri, 24 Apr 2020 18:12:38 +0300
Message-ID: <20200424151244.3225-12-t-kristo@ti.com>
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

The CMA reserved memory nodes have been added for both the IPUs and
the DSP1 remoteproc devices on the DRA72 EVM rev C board, and assigned
to the respective rproc device nodes. These match the configuration
used on the DRA72 EVM board. Both the CMA nodes and the corresponding
rproc nodes are also enabled to enable these processors on the
DRA72 EVM rev C board.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra72-evm-revc.dts | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/dra72-evm-revc.dts b/arch/arm/boot/dts/dra72-evm-revc.dts
index 2bb2e8be6276..6e70858f6313 100644
--- a/arch/arm/boot/dts/dra72-evm-revc.dts
+++ b/arch/arm/boot/dts/dra72-evm-revc.dts
@@ -14,6 +14,33 @@
 		reg = <0x0 0x80000000 0x0 0x80000000>; /* 2GB */
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ipu2_cma_pool: ipu2_cma@95800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x95800000 0x0 0x3800000>;
+			reusable;
+			status = "okay";
+		};
+
+		dsp1_cma_pool: dsp1_cma@99000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x99000000 0x0 0x4000000>;
+			reusable;
+			status = "okay";
+		};
+
+		ipu1_cma_pool: ipu1_cma@9d000000 {
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
@@ -113,3 +140,18 @@
 	pinctrl-3 = <&mmc2_pins_hs200 &mmc2_iodelay_hs200_rev20_conf>;
 	vmmc-supply = <&evm_1v8_sw>;
 };
+
+&ipu2 {
+	status = "okay";
+	memory-region = <&ipu2_cma_pool>;
+};
+
+&ipu1 {
+	status = "okay";
+	memory-region = <&ipu1_cma_pool>;
+};
+
+&dsp1 {
+	status = "okay";
+	memory-region = <&dsp1_cma_pool>;
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
