Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380C71BAB23
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 19:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgD0R0N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 13:26:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45048 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgD0R0M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Apr 2020 13:26:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RHQ8Rp103828;
        Mon, 27 Apr 2020 12:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588008369;
        bh=j3QH00sY/Htwct4WFyjr8/dZw3NB/QmGpMKW/G19WeM=;
        h=From:To:CC:Subject:Date;
        b=h3fldpMoyf0BEKHpn3WjlQtgYlCzTgAVKdtTRO4autseuCbo/k2QGw0wtqnx6Ga1Y
         ZdO4XLnMnV3y9zheZtPbHHZWmnyl9ngvU+mCQQdIJhELm0RUc4DmzTg+hY06geFV7Z
         oR++m/QDQ2qaN/knYCD7oJvYYZMHgElJ3DwPFQNw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RHQ818064603;
        Mon, 27 Apr 2020 12:26:08 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 12:26:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 12:26:08 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RHQ5TE072591;
        Mon, 27 Apr 2020 12:26:06 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH] arm: dts: Add 32KHz clock as default clock source
Date:   Mon, 27 Apr 2020 22:56:04 +0530
Message-ID: <20200427172604.16351-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Clocksource to timer configured in pwm mode can be selected using the DT
property ti,clock-source. There are few pwm timers which are not
selecting the clock source and relying on default value in hardware or
selected by driver. Instead of relying on default value, always select
the clock source from DT. 

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Tony,
	This is in preparation with removal of selecting clock source in
	prepare() api. Let me know if you prefer separate patches for
	each dts.

 arch/arm/boot/dts/am335x-guardian.dts            | 1 +
 arch/arm/boot/dts/am3517-evm.dts                 | 1 +
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi | 1 +
 arch/arm/boot/dts/omap3-gta04.dtsi               | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-guardian.dts b/arch/arm/boot/dts/am335x-guardian.dts
index 81e0f63e94d3..0ebe9e2c150e 100644
--- a/arch/arm/boot/dts/am335x-guardian.dts
+++ b/arch/arm/boot/dts/am335x-guardian.dts
@@ -105,6 +105,7 @@
 		ti,timers = <&timer7>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dmtimer7_pins>;
+		ti,clock-source = <0x01>;
 	};
 
 	vmmcsd_fixed: regulator-3v3 {
diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
index a1fd3e63e86e..92466b9eb6ba 100644
--- a/arch/arm/boot/dts/am3517-evm.dts
+++ b/arch/arm/boot/dts/am3517-evm.dts
@@ -156,6 +156,7 @@
 		pinctrl-0 = <&pwm_pins>;
 		ti,timers = <&timer11>;
 		#pwm-cells = <3>;
+		ti,clock-source = <0x01>;
 	};
 
 	/* HS USB Host PHY on PORT 1 */
diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index f7b82ced4080..381f0e82bb70 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -65,6 +65,7 @@
 		pinctrl-0 = <&pwm_pins>;
 		ti,timers = <&timer10>;
 		#pwm-cells = <3>;
+		ti,clock-source = <0x01>;
 	};
 
 };
diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index 409a758c99f1..ecc45862b4f3 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -150,6 +150,7 @@
 		compatible = "ti,omap-dmtimer-pwm";
 		ti,timers = <&timer11>;
 		#pwm-cells = <3>;
+		ti,clock-source = <0x01>;
 	};
 
 	hsusb2_phy: hsusb2_phy {
-- 
2.23.0

