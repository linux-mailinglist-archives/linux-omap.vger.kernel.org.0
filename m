Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661C310EF9E
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2019 19:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbfLBS5o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Dec 2019 13:57:44 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45986 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfLBS5o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Dec 2019 13:57:44 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2IvZEH037270;
        Mon, 2 Dec 2019 12:57:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575313055;
        bh=DWBbhnE6qXaM66hNWm292SwxJiicsKfBcrA4AX4NS6A=;
        h=From:To:CC:Subject:Date;
        b=eTB7v2lfyPJq2tA3EeQNWlMzZuvcPnGltujoflXNiLqLfDC+twyqJxeCYM3QCV3Jr
         O9vPOq7gq7sm/0hUn+I1c5R4jRtNOOXNdgtsGGnrWzYZZ8+DhKBTj0VlBp9fDPPISw
         20bw3sdBfQyqEUOU0HzqfkJvAq4Oa237RyTbm2ZU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2IvZae129273;
        Mon, 2 Dec 2019 12:57:35 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 12:57:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 12:57:32 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2IvUI3057431;
        Mon, 2 Dec 2019 12:57:30 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH] ARM: dts: am335x-evm: Use drm simple-panel instead of tilcdc-panel
Date:   Mon, 2 Dec 2019 20:57:29 +0200
Message-ID: <20191202185729.12921-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Move to use the new drm panel support in tilcdc together with added
"tfc,s9700rtwv43tr-01b"-panel support in drm panel-simple.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
"tfc,s9700rtwv43tr-01b" in panel-simple has been in for some time now
so it is about time to get this in too.

 arch/arm/boot/dts/am335x-evm.dts | 44 +++++++++++++-------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index a00145705c9b..0e286a1c9cc5 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -113,7 +113,7 @@
 		};
 	};
 
-	backlight {
+	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&ecap0 0 50000 0>;
 		brightness-levels = <0 51 53 56 62 75 101 152 255>;
@@ -121,35 +121,19 @@
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "tfc,s9700rtwv43tr-01b";
+
 		status = "okay";
+
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pins_s0>;
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <32>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
-		};
 
-		display-timings {
-			800x480p62 {
-				clock-frequency = <30000000>;
-				hactive = <800>;
-				vactive = <480>;
-				hfront-porch = <39>;
-				hback-porch = <39>;
-				hsync-len = <47>;
-				vback-porch = <29>;
-				vfront-porch = <13>;
-				vsync-len = <2>;
-				hsync-active = <1>;
-				vsync-active = <1>;
+		backlight = <&backlight>;
+		ports {
+			port {
+				panel_0: endpoint@0 {
+					remote-endpoint = <&lcdc_0>;
+				};
 			};
 		};
 	};
@@ -525,6 +509,14 @@
 	status = "okay";
 
 	blue-and-red-wiring = "crossed";
+
+	ports {
+		port {
+			lcdc_0: endpoint@0 {
+				remote-endpoint = <&panel_0>;
+			};
+		};
+	};
 };
 
 &elm {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

