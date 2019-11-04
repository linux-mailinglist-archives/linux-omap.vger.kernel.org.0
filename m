Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AED2EEA5B
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 21:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729836AbfKDUtb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 15:49:31 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51912 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729646AbfKDUta (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Nov 2019 15:49:30 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4KnM1l129245;
        Mon, 4 Nov 2019 14:49:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572900562;
        bh=0fj8Qp2adqwqoFx0I0SajIf2oiXQh0fr56mPE6nrtIM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cxKDavxoZ0edDg1LLVjvO+WPBjWVmhiuC0tv2ZzauwC0yPB8UOAKGBn4ajdNoU2Xu
         zCrc8eqVSe+hSLS8ge3+jOfiggGqFoDNqc5NmhbuIWS909ksFUcaTG+bkSOED2Ezm8
         84vG2dYp1NA1IZC0tFgClhjR/9lVJLhzdJyInpu0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4KnMw0005321;
        Mon, 4 Nov 2019 14:49:22 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 14:49:22 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 14:49:07 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kmv05038360;
        Mon, 4 Nov 2019 14:49:21 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 09/10] arm64: dts: k3-am65-main Add CAL node
Date:   Mon, 4 Nov 2019 14:48:52 -0600
Message-ID: <20191104204853.4355-10-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104204853.4355-1-bparrot@ti.com>
References: <20191104204853.4355-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add CAL dtsi node for AM654 device. Including proper power-domains and
clock properties.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 799c75fa7981..4c65ed445e8b 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -516,4 +516,27 @@
 		dma-coherent;
 		interrupts = <GIC_SPI 355 IRQ_TYPE_EDGE_RISING>;
 	};
+
+	cal: cal@6f03000 {
+		compatible = "ti,am654-cal";
+		reg = <0x0 0x06f03000 0x0 0x400>,
+		      <0x0 0x06f03800 0x0 0x40>;
+		reg-names = "cal_top",
+			    "cal_rx_core0";
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+		ti,camerrx-control = <&scm_conf 0x40c0>;
+		clock-names = "fck";
+		clocks = <&k3_clks 2 0>;
+		power-domains = <&k3_pds 2 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi2_0: port@0 {
+				reg = <0>;
+			};
+		};
+	};
 };
-- 
2.17.1

