Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155A4D9978
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 20:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394356AbfJPSr2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 14:47:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33350 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390765AbfJPSrZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Oct 2019 14:47:25 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GIlME3035332;
        Wed, 16 Oct 2019 13:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571251642;
        bh=3IxeNu4wchrQeZ/ZlnZUz1zyjoHUMiEjO9eFxiakpnc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QulLEWG4Oez6xCGdmtOxGSAlJl+gtgWxHPRFc8fY0JuDemyWN+/BMHRA3BdTYKJmX
         aDlcMW8L58cFB9cfDiZYnqNemq2GVIW1scTRdd5cCxKS+qHXQo4vr6eXYY3Aua/VKd
         CI72C1df+Raz9mGF8BSFv2lfdq0MrJ4x1VY/zhbw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GIlM0L073570
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 13:47:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 13:47:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 13:47:21 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GIlIhB094854;
        Wed, 16 Oct 2019 13:47:21 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 3/3] ARM: dts: am43x-epos-evm: Add VPFE and OV2659 entries
Date:   Wed, 16 Oct 2019 13:49:54 -0500
Message-ID: <20191016184954.14048-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016184954.14048-1-bparrot@ti.com>
References: <20191016184954.14048-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add VPFE device nodes entries.
Add OmniVision OV2659 sensor device nodes and linkage.

Since Rev1.2a on this board the sensor source clock (xvclk) has a
dedicated 12Mhz oscillator instead of using clkout1.
Add 'audio_mstrclk' fixed clock object to represent it.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/am43x-epos-evm.dts | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index 95314121d111..1958d0985f76 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -145,6 +145,12 @@
 			system-clock-frequency = <12000000>;
 		};
 	};
+
+	audio_mstrclk: mclk_osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
 };
 
 &am43xx_pinmux {
@@ -696,6 +702,21 @@
 		IOVDD-supply = <&dcdc4>; /* V3_3D -> DCDC4 */
 		DVDD-supply = <&ldo1>; /* V1_8AUD -> V1_8D -> LDO1 */
 	};
+
+	ov2659@30 {
+		compatible = "ovti,ov2659";
+		reg = <0x30>;
+
+		clocks = <&audio_mstrclk>;
+		clock-names = "xvclk";
+
+		port {
+			ov2659_1: endpoint {
+				remote-endpoint = <&vpfe1_ep>;
+				link-frequencies = /bits/ 64 <70000000>;
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -962,7 +983,7 @@
 
 	port {
 		vpfe1_ep: endpoint {
-			/* remote-endpoint = <&sensor>; add once we have it */
+			remote-endpoint = <&ov2659_1>;
 			ti,am437x-vpfe-interface = <0>;
 			bus-width = <8>;
 			hsync-active = <0>;
-- 
2.17.1

