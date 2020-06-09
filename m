Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28D51F3826
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 12:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgFIKaS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 06:30:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40436 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgFIKaO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Jun 2020 06:30:14 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059AU9uI031174;
        Tue, 9 Jun 2020 05:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591698609;
        bh=m6rnOg4aubxQHY5UyGRUR+yzG6ejQ77td9cgNH4gXtg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zVQO17yLUoGwNGhH4nghc/NS0LIgWWwaI/XmOr6pshJOfPiiXofsU+IrpX28gGQl7
         Hfz6PCuUpwxhK6IfvUuFyvakEjXHfcivvrhIZ77MK+pIE2SyT03tc4qvNZbQfVxaXC
         MWreVL8zmOyCxliEzuoV+g/oTPn0XBIte85oumYY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059AU9Qg018268
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Jun 2020 05:30:09 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 05:30:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 05:30:08 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059AU5wE030929;
        Tue, 9 Jun 2020 05:30:07 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Tony Lindgren <tony@atomide.com>, <bcousson@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 2/3] ARM: dts: am437x-gp-evm: remove lcd timings
Date:   Tue, 9 Jun 2020 13:29:59 +0300
Message-ID: <20200609103000.753453-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609103000.753453-1-tomi.valkeinen@ti.com>
References: <20200609103000.753453-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

LCD timings now come from panel-simple. Having timings in the DT will
cause a WARN.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index d692e3b2812a..2ff9485c28a4 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -91,22 +91,6 @@ lcd0: display {
 
 		backlight = <&lcd_bl>;
 
-		panel-timing {
-			clock-frequency = <33000000>;
-			hactive = <800>;
-			vactive = <480>;
-			hfront-porch = <210>;
-			hback-porch = <16>;
-			hsync-len = <30>;
-			vback-porch = <10>;
-			vfront-porch = <22>;
-			vsync-len = <13>;
-			hsync-active = <0>;
-			vsync-active = <0>;
-			de-active = <1>;
-			pixelclk-active = <1>;
-		};
-
 		port {
 			lcd_in: endpoint {
 				remote-endpoint = <&dpi_out>;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

