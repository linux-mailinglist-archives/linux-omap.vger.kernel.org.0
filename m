Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6CF0DC99C
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 17:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389749AbfJRPqi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 11:46:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38454 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505522AbfJRPqY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 11:46:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkMFo067405;
        Fri, 18 Oct 2019 10:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571413582;
        bh=ijyNp0/kEYQZvQ4u+WUWGhUvE1sdXw4DDj4+j/JH998=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VCXN3DAzncda58LYtLvzEF7QK6rR+oOEusLK01siSwdjz3ABlVAEl/UhadkGoz9Dm
         yvRKLqEPWORE3wKLIn/B1nXWNToKclL1n6UmC4gz34CFbn2xXhcNFc00G51LvYnpcc
         +JfUMb7iCQ6NaOVPBCBaAw/QrkaGR/z3XJuI0Fcw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFkMMH005521
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:46:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:46:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:46:13 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkDAT045642;
        Fri, 18 Oct 2019 10:46:21 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 7/9] arm: dts: dra76-evm: Add CAL and OV5640 nodes
Date:   Fri, 18 Oct 2019 10:48:47 -0500
Message-ID: <20191018154849.3127-8-bparrot@ti.com>
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

Add device nodes for CSI2 camera board OV5640.
Add the CAL port nodes with the necessary linkage to the ov5640 nodes.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/dra76-evm.dts | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 1fb6f13fb5e2..c9fdf62c68e9 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -116,6 +116,12 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	clk_ov5640_fixed: clk_ov5640_fixed {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &i2c1 {
@@ -317,6 +323,27 @@
 	};
 };
 
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+
+		clocks = <&clk_ov5640_fixed>;
+		clock-names = "xclk";
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2_phy0>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &cpu0 {
 	vdd-supply = <&buck10_reg>;
 };
@@ -447,3 +474,15 @@
 		max-bitrate = <5000000>;
 	};
 };
+
+&cal {
+	status = "okay";
+};
+
+&csi2_0 {
+	csi2_phy0: endpoint@0 {
+		remote-endpoint = <&csi2_cam0>;
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
-- 
2.17.1

