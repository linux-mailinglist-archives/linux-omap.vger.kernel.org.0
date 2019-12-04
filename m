Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8C0511299A
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 11:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfLDK4G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 05:56:06 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53204 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727472AbfLDK4F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 05:56:05 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4Atvdu007551;
        Wed, 4 Dec 2019 04:55:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575456957;
        bh=h5GEQ/bOy6qrn1uLO+MeHYnwvzdjeB/Vg3QaUt0L+kQ=;
        h=From:To:CC:Subject:Date;
        b=T1A5sWLRESMOAamKW8mEHG74z4sfakKoL47h8tZknq4RfGq3Q3rDPi3RoAdcbJSo4
         sMYznc7Rw6Y8SB+WpNTKn0u4etO+HlrUcJojDcD+23qK8CFu6/dYX8Vi+nNtjpbsQk
         BALnmySyDjOooC5uOOSSMjY4g0L81w5XdsSM46kE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4AtvJC053258
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Dec 2019 04:55:57 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 04:55:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 04:55:56 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4AtsrZ081308;
        Wed, 4 Dec 2019 04:55:54 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH] ARM: dts: am335x-evmsk: Use drm simple-panel instead of tilcdc-panel
Date:   Wed, 4 Dec 2019 12:55:54 +0200
Message-ID: <20191204105554.14212-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Move to use the new drm panel support in tilcdc together with added
"newhaven,nhd-4.3-480272ef-atxl"-panel support in drm panel-simple.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 arch/arm/boot/dts/am335x-evmsk.dts | 38 ++++++++++--------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index e28a5b82fdf3..b149e48520b4 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -183,36 +183,16 @@
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "newhaven,nhd-4.3-480272ef-atxl";
+
 		pinctrl-names = "default", "sleep";
 		pinctrl-0 = <&lcd_pins_default>;
 		pinctrl-1 = <&lcd_pins_sleep>;
 		backlight = <&lcd_bl>;
-		status = "okay";
-		panel-info {
-			ac-bias		= <255>;
-			ac-bias-intrpt	= <0>;
-			dma-burst-sz	= <16>;
-			bpp		= <32>;
-			fdd		= <0x80>;
-			sync-edge	= <0>;
-			sync-ctrl	= <1>;
-			raster-order	= <0>;
-			fifo-th		= <0>;
-		};
-		display-timings {
-			480x272 {
-				hactive		= <480>;
-				vactive		= <272>;
-				hback-porch	= <43>;
-				hfront-porch	= <8>;
-				hsync-len	= <4>;
-				vback-porch	= <12>;
-				vfront-porch	= <4>;
-				vsync-len	= <10>;
-				clock-frequency = <9000000>;
-				hsync-active	= <0>;
-				vsync-active	= <0>;
+
+		port {
+			panel_0: endpoint@0 {
+				remote-endpoint = <&lcdc_0>;
 			};
 		};
 	};
@@ -750,6 +730,12 @@
 	status = "okay";
 
 	blue-and-red-wiring = "crossed";
+
+	port {
+		lcdc_0: endpoint@0 {
+			remote-endpoint = <&panel_0>;
+		};
+	};
 };
 
 &rtc {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

