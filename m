Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0293CF924A
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbfKLO0l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:26:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40664 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfKLO0k (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:26:40 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEQY0B044790;
        Tue, 12 Nov 2019 08:26:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568794;
        bh=xR1q4oJvoGA+wohzuEttJn191zD2w3UlwCSVL2BSxL8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vBQYJ46HB861NLdLbUOscG2Y+P4xqMZ4sup5DV295k5dQmDaOzx0JfOmGaZdo4T4b
         aWr6FC0iBaYdopO9Td9hasEJXmKeRt0s2SMtoCqPwnnNhPlcku7UNgcd3XauthhRqZ
         qiPqiufh3PiuNtutq7IeELftCBUSIMZJlcFMsRoo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEQYf2014428
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:26:34 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:26:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:26:16 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEQUtw040290;
        Tue, 12 Nov 2019 08:26:34 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 3/3] ARM: dts: am43x-epos-evm: Add VPFE and OV2659 entries
Date:   Tue, 12 Nov 2019 08:29:29 -0600
Message-ID: <20191112142929.23058-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112142929.23058-1-bparrot@ti.com>
References: <20191112142929.23058-1-bparrot@ti.com>
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
index 95314121d111..b0df37014888 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -145,6 +145,12 @@
 			system-clock-frequency = <12000000>;
 		};
 	};
+
+	audio_mstrclk: clock {
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

