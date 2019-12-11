Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865B611ACE9
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729779AbfLKOEM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:04:12 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59140 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbfLKOEH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:04:07 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE41uI051143;
        Wed, 11 Dec 2019 08:04:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576073041;
        bh=xR1q4oJvoGA+wohzuEttJn191zD2w3UlwCSVL2BSxL8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=iubDUfZLZ22RH6jpFTMPY6baRNP5PjblOGq4Jrh6XOV/0tOHab+e1OICTb9IrtMBD
         lHR03h43TxAJ8OKwM2dEnej/kC1QI1y1lKVlpThutXXxg+4zT/1TlkHXiZfp0LzCnh
         +Iu67EId7Mt6rPa8FZhRna2eq5Nq4i3ME+lEHIQU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBE41rT095736
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 08:04:01 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:04:01 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:04:00 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE3wco086061;
        Wed, 11 Dec 2019 08:04:00 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 3/3] ARM: dts: am43x-epos-evm: Add VPFE and OV2659 entries
Date:   Wed, 11 Dec 2019 08:07:20 -0600
Message-ID: <20191211140720.10539-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211140720.10539-1-bparrot@ti.com>
References: <20191211140720.10539-1-bparrot@ti.com>
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

