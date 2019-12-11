Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3783711ACBC
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729779AbfLKOCu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:02:50 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44640 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729686AbfLKOCt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:02:49 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2k6j113649;
        Wed, 11 Dec 2019 08:02:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576072966;
        bh=bfalUsxFj27T0FowFliUu6eiLC2NXWQoppPanqn7G9I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QHTS0au7DK1ABhxpI1YHvoBbbJeQiauwzfEQkuPEjmU7Fzdf/PVJ0If1uxu9wIHTb
         +mccxBRkRIYhOuuoAkUWvDZGRLI3WpHdWFJcXXd8KQHR6lwzboSJgpdyafghAF72I3
         LatvDiKGx9mQHqc8AAcD9SsEV9ecOUmbTMW0/qBk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBE2kt3023573
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 08:02:46 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:02:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:02:45 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2afu007398;
        Wed, 11 Dec 2019 08:02:45 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 10/10] arm64: dts: k3-am654-base-board: Add CSI2 OV5640 camera
Date:   Wed, 11 Dec 2019 08:05:58 -0600
Message-ID: <20191211140558.10407-11-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211140558.10407-1-bparrot@ti.com>
References: <20191211140558.10407-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add support for the OV5640 CSI camera:
- add the OV5640 nodes
- add the CAL node linkage
- enable CAL node

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 8a85b482ad31..f918c5804589 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -53,6 +53,12 @@
 			gpios = <&wkup_gpio0 27 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	clk_ov5640_fixed: clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &wkup_pmx0 {
@@ -184,6 +190,23 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c1_pins_default>;
 	clock-frequency = <400000>;
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
+
 };
 
 &main_i2c2 {
@@ -339,3 +362,12 @@
 &mailbox0_cluster11 {
 	status = "disabled";
 };
+
+&csi2_0 {
+	csi2_phy0: endpoint {
+		remote-endpoint = <&csi2_cam0>;
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
+
-- 
2.17.1

