Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0FADC998
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 17:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406133AbfJRPqc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 11:46:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38458 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633634AbfJRPqZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 11:46:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkNP9067413;
        Fri, 18 Oct 2019 10:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571413583;
        bh=tI7h4BaN3NlDalQrh/+Bi4yeNO3NNRokoBjlUSGTQw4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YH/fdwR4lKFtP9D3tTXDV8n1StOm/ATV8PBqAQDp029P+gwIwGMo1zePWx5PYuQXf
         n6MOASjN7vWZGO4z8Fz8uhId1q5p3XuEtLlw0Gn3jCDx4oGIF/dSynV68kxQ2Gpe47
         IsqBaeP+TqVKlyz9hZyXnuGTobaZyGAT2QpGJQdQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFkNaS103886
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:46:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:46:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:46:14 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkDAU045642;
        Fri, 18 Oct 2019 10:46:22 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 8/9] arm64: dts: k3-am65-main Add CAL node
Date:   Fri, 18 Oct 2019 10:48:48 -0500
Message-ID: <20191018154849.3127-9-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018154849.3127-1-bparrot@ti.com>
References: <20191018154849.3127-1-bparrot@ti.com>
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
index 799c75fa7981..9bd9a74d5e33 100644
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
+		syscon-camerrx = <&scm_conf 0x40c0>;
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

