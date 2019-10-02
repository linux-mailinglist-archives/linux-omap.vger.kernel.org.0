Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC03C87E9
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 14:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfJBMGg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 08:06:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35132 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfJBMGg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 08:06:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92C6WKQ081458;
        Wed, 2 Oct 2019 07:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570017992;
        bh=7RBfSmkQoAYuNy+ndpyRQLl8Mu1h3P64bsoNcfuhnL4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hgzlYenc7QBQ9F1CPLBNh9ZtgNlgA75bVOQM//Aasomq6motDGQXj9zM4WjEmI6g+
         FFyfqy3nzSGZ0ieBIPFpnn/pb3gI70S94MHuI/RcThbHJa5wyWK8j1FZELqCUVu0GI
         2HAMj2gNMS9NifyIaxwtoJuZcnnced3WpBug3Gk4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92C6WRm078118;
        Wed, 2 Oct 2019 07:06:32 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:06:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:06:21 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92C6L3l046205;
        Wed, 2 Oct 2019 07:06:30 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>,
        <aford173@gmail.com>, <tomi.valkeinen@ti.com>
Subject: [PATCH 4/4] ARM: dts: omap3: fix DPLL4 M4 divider max value
Date:   Wed, 2 Oct 2019 15:06:11 +0300
Message-ID: <20191002120611.26121-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002120611.26121-1-t-kristo@ti.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The maximum divider value for DPLL4 M4 divider appears wrong. For most
OMAP3 family SoCs this is 16, but it is defined as 32, which is maybe
only valid for omap36xx. To avoid any overflows in trying to write this
register, set the max to 16 for all omap3 family, except omap36xx. For
omap36xx the maximum is set to 31, as it appears value 32 is not working
properly.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap36xx-clocks.dtsi | 4 ++++
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap36xx-clocks.dtsi
index e66fc57ec35d..4e9cc9003594 100644
--- a/arch/arm/boot/dts/omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-clocks.dtsi
@@ -105,3 +105,7 @@
 			 <&mcbsp4_ick>, <&uart4_fck>;
 	};
 };
+
+&dpll4_m4_ck {
+	ti,max-div = <31>;
+};
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
index 685c82a9d03e..0656c32439d2 100644
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -416,7 +416,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&dpll4_ck>;
-		ti,max-div = <32>;
+		ti,max-div = <16>;
 		reg = <0x0e40>;
 		ti,index-starts-at-one;
 	};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
