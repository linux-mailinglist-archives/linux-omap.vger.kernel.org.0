Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E3C3A4C09
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhFLBSQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:18:16 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:32908 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhFLBSP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:18:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1GGjL094191;
        Fri, 11 Jun 2021 20:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460576;
        bh=XLWSL129ZCsUF7sT9nq+bbvsngOfs+0cjgyCL4rU03Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=isOiTuvFacE+RCGqT4iqQcSMExqy0jJBKha3tkVTShHKfxF5p1bhOMQDf71/0qJD/
         TrhoFftUMWIJxw/5YhtX4sR0RkzCl9lpDWod7tsZF2kvOGqFZBk15UHNjgrkt00n96
         iYLfukxvrNUUkk90SlhvSy1g8vfz1JESl3SaOB7A=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1GGX9082372
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:16:16 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:16:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:16:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1GEKg009054;
        Fri, 11 Jun 2021 20:16:15 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 13/15] ARM: dts: am335x-shc: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:34 +0300
Message-ID: <20210612011436.10437-14-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210612011436.10437-1-grygorii.strashko@ti.com>
References: <20210612011436.10437-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The dual_mac mode has been preserved the same way between legacy and new
driver, and one port devices works the same as 1 dual_mac port - it's safe
to switch drivers.

So, switch Bosch SHC to use new cpsw switch driver.
Those boards have or 2 Ext. port wired and configured in dual_mac mode by
default, or only 1 Ext. port.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-shc.dts | 38 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-shc.dts b/arch/arm/boot/dts/am335x-shc.dts
index 2bfe60d32783..6b9877560741 100644
--- a/arch/arm/boot/dts/am335x-shc.dts
+++ b/arch/arm/boot/dts/am335x-shc.dts
@@ -117,18 +117,6 @@
 	status = "okay";
 };
 
-&davinci_mdio {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&davinci_mdio_default>;
-	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
-
-	ethernetphy0: ethernet-phy@0 {
-		reg = <0>;
-		smsc,disable-energy-detect;
-	};
-};
-
 &epwmss1 {
 	status = "okay";
 
@@ -193,15 +181,31 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cpsw_default>;
 	pinctrl-1 = <&cpsw_sleep>;
 	status = "okay";
-	slaves = <1>;
-	cpsw_emac0: slave@200 {
-		phy-mode = "mii";
-		phy-handle = <&ethernetphy0>;
+};
+
+&cpsw_port1 {
+	phy-mode = "mii";
+	phy-handle = <&ethernetphy0>;
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
+};
+
+&davinci_mdio_sw {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&davinci_mdio_default>;
+	pinctrl-1 = <&davinci_mdio_sleep>;
+
+	ethernetphy0: ethernet-phy@0 {
+		reg = <0>;
+		smsc,disable-energy-detect;
 	};
 };
 
-- 
2.17.1

