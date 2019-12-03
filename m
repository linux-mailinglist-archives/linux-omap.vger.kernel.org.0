Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B15010FA7D
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2019 10:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfLCJLc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Dec 2019 04:11:32 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47394 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbfLCJLb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Dec 2019 04:11:31 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB39BNQ9103282;
        Tue, 3 Dec 2019 03:11:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575364283;
        bh=Bw2S3+Umha1Z+hIKv1Ph4zlTyHuhz/OeMZsRMtvyaT0=;
        h=From:To:CC:Subject:Date;
        b=l3jVpkgGW5wzF2yD1eS723IXh3tU+ZCoftOOz2WiUYJllu/CYvU3PbYCzpvcWE8ze
         OfDSrBVnJLK0cqE/ZpTn+Mv1bLQxYgk8pAhiLArRrrf5DyOF1ghLJ85NTiDLr0xvj1
         k2KVkZkzCYrtV5WHAk4mUtkikEYb5Pc+GElyVaKM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB39BNM1129780;
        Tue, 3 Dec 2019 03:11:23 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 3 Dec
 2019 03:11:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 3 Dec 2019 03:11:22 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB39BJNg090065;
        Tue, 3 Dec 2019 03:11:20 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH v2] ARM: dts: am335x-evm: Use drm simple-panel instead of tilcdc-panel
Date:   Tue, 3 Dec 2019 11:11:19 +0200
Message-ID: <20191203091119.3352-1-jsarha@ti.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
"tfc,s9700rtwv43tr-01b" in panel-simple has been in for some time now
so it is about time to get this in too.

Since first version:
- drop status = "okay";
- blank line before port node
- drop ports node
- drop Tomi's reviewed-by because of above changes
- add Laurent's reviewed-by

 arch/arm/boot/dts/am335x-evm.dts | 40 +++++++++++---------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index a00145705c9b..84dfc40af7c5 100644
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
@@ -121,35 +121,15 @@
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
-		status = "okay";
+		compatible = "tfc,s9700rtwv43tr-01b";
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
+		backlight = <&backlight>;
 
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
+		port {
+			panel_0: endpoint@0 {
+				remote-endpoint = <&lcdc_0>;
 			};
 		};
 	};
@@ -525,6 +505,12 @@
 	status = "okay";
 
 	blue-and-red-wiring = "crossed";
+
+	port {
+		lcdc_0: endpoint@0 {
+			remote-endpoint = <&panel_0>;
+		};
+	};
 };
 
 &elm {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

