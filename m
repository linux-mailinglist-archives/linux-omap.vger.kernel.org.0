Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D801F3824
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 12:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgFIKaL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 06:30:11 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40426 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgFIKaK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Jun 2020 06:30:10 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059AU7Yx031157;
        Tue, 9 Jun 2020 05:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591698607;
        bh=F8y285HGggp3kNOfT0NBkJ5B7DySbJlLAwrHCC+Q5Xk=;
        h=From:To:CC:Subject:Date;
        b=khpW/3FQpaJQKWU+pbpPM2vIVwDpskpOrkoCZJTSLeSJIqk0mnOoxxDhPDYVMgjYK
         NFYLtYfeuU09lWy7ZWIfSDCM7P8SDHz1MHSHU5wLl4kELjEBEFMYJwEFu7+B/VA3Jj
         eAm1mkb2P1YXzLm9ZkuiKD9KW7jHNtgEQK6xdIQ8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059AU7VW053977
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Jun 2020 05:30:07 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 05:30:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 05:30:07 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059AU5wD030929;
        Tue, 9 Jun 2020 05:30:05 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Tony Lindgren <tony@atomide.com>, <bcousson@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 1/3] ARM: dts: am437x-sk-evm: remove lcd timings
Date:   Tue, 9 Jun 2020 13:29:58 +0300
Message-ID: <20200609103000.753453-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
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
 arch/arm/boot/dts/am437x-sk-evm.dts | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 4d5a7ca2e25d..6c83812407bf 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -134,22 +134,6 @@ lcd0: display {
 
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 
-		panel-timing {
-			clock-frequency = <9000000>;
-			hactive = <480>;
-			vactive = <272>;
-			hfront-porch = <2>;
-			hback-porch = <2>;
-			hsync-len = <41>;
-			vfront-porch = <2>;
-			vback-porch = <2>;
-			vsync-len = <10>;
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

