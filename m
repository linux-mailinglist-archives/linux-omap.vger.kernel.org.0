Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38A1122700
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 09:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfLQIuW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 03:50:22 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49604 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfLQIuW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 03:50:22 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH8oIgj011515;
        Tue, 17 Dec 2019 02:50:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576572618;
        bh=7VWSQNU7kHSJwi7TH4NML4wI3nW2GubcarW9HzOBN7Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=N52btY71OtDkSnFeBOSSRrRcoW29gHkRieddMJuRupAYEk0B//pL5jf88hLP+ECd7
         5G8q/jX0J9gR40qP6qan5hmVqQO1nS5zfGHZDouUD3QGi0B1NVUC5AbIaJKGI4dH70
         X49t4DVHOmCdsPOxN0eiYBjhqfSV0Xo2tTOnl9Os=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBH8oI0S040163
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 02:50:18 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 02:50:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 02:50:18 -0600
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH8o6dY062966;
        Tue, 17 Dec 2019 02:50:15 -0600
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
Subject: [PATCH 3/3] ARM: dts: beagle-x15-common: Model 5V0 regulator
Date:   Tue, 17 Dec 2019 14:21:24 +0530
Message-ID: <20191217085124.22480-4-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217085124.22480-1-kishon@ti.com>
References: <20191217085124.22480-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On am57xx-beagle-x15, 5V0 is connected to P16, P17, P18 and P19
connectors. On am57xx-evm, 5V0 regulator is used to get 3V6 regulator
which is connected to the COMQ port. Model 5V0 regulator here in order
for it to be used in am57xx-evm to model 3V6 regulator.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 .../boot/dts/am57xx-beagle-x15-common.dtsi    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index 9a94c96b0350..a813a0cf3ff3 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -29,6 +29,27 @@
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
 
+	main_12v0: fixedregulator-main_12v0 {
+		/* main supply */
+		compatible = "regulator-fixed";
+		regulator-name = "main_12v0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	evm_5v0: fixedregulator-evm_5v0 {
+		/* Output of TPS54531D */
+		compatible = "regulator-fixed";
+		regulator-name = "evm_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&main_12v0>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vdd_3v3: fixedregulator-vdd_3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_3v3";
-- 
2.17.1

