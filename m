Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9636611AD03
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbfLKOFJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:05:09 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48164 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbfLKOEx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:04:53 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE4oTd034781;
        Wed, 11 Dec 2019 08:04:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576073090;
        bh=xyvVBLiJTFMvhAFyHR5rfI4R9SdbhMSl11RXn373Pi4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fhG9zQfYIE9/UJf7FA1L4kB+64DllDZLFPQNt9RvusezGZUF5ncYNepCk9T2176DQ
         x9ibbGWT5I0pCcqNt/aKfuhWODnLm6lObbeAQOHUHem3r1/I3A8vz4Ccm3dLeYea8f
         9jQDbWb9ednP0eSCktd3Dzqcx76/BMAI82/OCwDA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBE4oI2026822
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 08:04:50 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:04:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:04:50 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE4m6g088450;
        Wed, 11 Dec 2019 08:04:50 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v5 2/3] ARM: dts: dra7: add vpe clkctrl node
Date:   Wed, 11 Dec 2019 08:08:09 -0600
Message-ID: <20191211140810.10657-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211140810.10657-1-bparrot@ti.com>
References: <20191211140810.10657-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add clkctrl nodes for VPE module.

Note that because of the current dts node name dependency for mapping to
clock domain, we must still use "vpe-clkctrl@" naming instead of generic
"clock@" naming for the node. And because of this, it's probably best to
apply the dts node addition together along with the other clock changes.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
index 93e1eb83bed9..d1c2406ec71c 100644
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -1591,10 +1591,10 @@
 
 	rtc_cm: rtc-cm@700 {
 		compatible = "ti,omap4-cm";
-		reg = <0x700 0x100>;
+		reg = <0x700 0x60>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0 0x700 0x100>;
+		ranges = <0 0x700 0x60>;
 
 		rtc_clkctrl: rtc-clkctrl@20 {
 			compatible = "ti,clkctrl";
@@ -1603,6 +1603,20 @@
 		};
 	};
 
+	vpe_cm: vpe-cm@760 {
+		compatible = "ti,omap4-cm";
+		reg = <0x760 0xc>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x760 0xc>;
+
+		vpe_clkctrl: vpe-clkctrl@0 {
+			compatible = "ti,clkctrl";
+			reg = <0x0 0xc>;
+			#clock-cells = <2>;
+		};
+	};
+
 };
 
 &cm_core {
-- 
2.17.1

