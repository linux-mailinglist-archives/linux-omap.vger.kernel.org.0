Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEE11B7923
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgDXPNW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41542 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgDXPNW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:22 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDHYr044807;
        Fri, 24 Apr 2020 10:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741197;
        bh=cOgcfNckbUvPCDfNoXRZYWFzLhXc2ONpGN/G6G7Fmek=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=s2GU4N6Q5euuUPqG5CX0+apEEoVuc95NJNTbgzqY3V/adeS/W139Xyw2GicuWxfYM
         4slsOc17cBXYaMCeSJXyw6wuL5FwH3iP/vNJoPJGAGPQCcD8fh/lU0Z3ffHT2ICcdT
         XqNR2vyUXMQ8CKs8krmmK+vYvCYrA1i+8z//Rifg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDHL9043505;
        Fri, 24 Apr 2020 10:13:17 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:17 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7L122378;
        Fri, 24 Apr 2020 10:13:16 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 13/17] ARM: dts: dra76-evm: Add CMA pools and enable IPU & DSP rprocs
Date:   Fri, 24 Apr 2020 18:12:40 +0300
Message-ID: <20200424151244.3225-14-t-kristo@ti.com>
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

The CMA reserved memory nodes have been added for all the IPU and
the DSP remoteproc devices on the DRA76 EVM board, and assigned to
the respective rproc device nodes. These match the configuration
used on the DRA7 EVM board. Both the CMA nodes and the corresponding
rproc nodes are also enabled to enable these processors on the
DRA76 EVM board.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra76-evm.dts | 54 +++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index e958cb3d1b31..820a0ece20d4 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -25,6 +25,40 @@
 		reg = <0x0 0x80000000 0x0 0x80000000>;
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
+
+		dsp2_cma_pool: dsp2_cma@9f000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x9f000000 0x0 0x800000>;
+			reusable;
+			status = "okay";
+		};
+	};
+
 	vsys_12v0: fixedregulator-vsys12v0 {
 		/* main supply */
 		compatible = "regulator-fixed";
@@ -548,3 +582,23 @@
 		data-lanes = <1 2>;
 	};
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
+
+&dsp2 {
+	status = "okay";
+	memory-region = <&dsp2_cma_pool>;
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
