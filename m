Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B24CC11ACD9
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbfLKOD3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:03:29 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59022 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729686AbfLKODP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:03:15 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2c7a050806;
        Wed, 11 Dec 2019 08:02:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576072958;
        bh=9amqIT/f1jOkWzSxPUQbHpxBfg7WY/+ml8BadDaKf1w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dgAz4l8N77wO/m9qC7DLn4ktOy88JPrsBxP6qBaosN+k0GZQfTyokWe0SqGA4YEye
         dRjAEa5GQo8utY8L3LKz3W0VGOUuG9qu0XtbodCnI1kDCBhahBbw0QvGC30b5/gvwM
         ePGSLtBBK7rpCd2kL0NUaoNG/3J9VMVfmP1gdclw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBE2c2X094033
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 08:02:38 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:02:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:02:38 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2afm007398;
        Wed, 11 Dec 2019 08:02:38 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 02/10] ARM: dts: dra7: add cam clkctrl node
Date:   Wed, 11 Dec 2019 08:05:50 -0600
Message-ID: <20191211140558.10407-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211140558.10407-1-bparrot@ti.com>
References: <20191211140558.10407-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add clkctrl nodes for CAM domain.

Note that because of the current dts node name dependency for mapping to
clock domain, we must still use "cam-clkctrl@" naming instead of generic
"clock@" naming for the node. And because of this, it's probably best to
apply the dts node addition together along with the other clock changes.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
index d1c2406ec71c..199f8d483f75 100644
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -1734,6 +1734,20 @@
 		};
 	};
 
+	cam_cm: cam-cm@1000 {
+		compatible = "ti,omap4-cm";
+		reg = <0x1000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x1000 0x100>;
+
+		cam_clkctrl: cam-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x2c>;
+			#clock-cells = <2>;
+		};
+	};
+
 	dss_cm: dss-cm@1100 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1100 0x100>;
-- 
2.17.1

