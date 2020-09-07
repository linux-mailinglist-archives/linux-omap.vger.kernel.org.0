Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A30B260596
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 22:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbgIGUVx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 16:21:53 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37374 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729938AbgIGUVw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 16:21:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 087KLorm103768;
        Mon, 7 Sep 2020 15:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599510110;
        bh=HaLMfItALcXWMj0Ouc1ztcuJ8ixf6dGwNMR6GUBD5hA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=T0OoCdl8tXcvGXoQGpSF5aotA6R0PF71kcG/+o4nctguCWMd1IcyrhShgSeJfLzs9
         1rGt5FH3pCE0sX1aYlTbjn4YkReoqhMQBAkbPKIAT4tAtwF8CBQ7Sz+IdRMIqAjwnm
         +Hb+/znrguiK/t7UrwVBjugeBlWUN4DAVYLGGpC4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 087KLo5i049473
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Sep 2020 15:21:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 15:21:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 15:21:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087KLmoZ053185;
        Mon, 7 Sep 2020 15:21:49 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 3/6] ARM: dts: beagle-x15: switch to new cpsw switch drv
Date:   Mon, 7 Sep 2020 23:21:22 +0300
Message-ID: <20200907202125.22943-4-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907202125.22943-1-grygorii.strashko@ti.com>
References: <20200907202125.22943-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Switch all TI AM5728 BeagleBoard-X15 boards to use new cpsw switch driver.
Those boards have 2 Ext. port wired and configured in dual_mac mode by
default. Hence, dual_mac mode has been preserved the same way between
legacy and new driver it's safe to switch drivers.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index b3a0206ebd6c..79338fb7dbee 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -451,7 +451,7 @@
 			      <&dra7_pmx_core 0x3f8>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy0: ethernet-phy@1 {
 		reg = <1>;
 	};
@@ -461,21 +461,20 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	status = "okay";
-	dual_emac;
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-rxid";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-rxid";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
 &mmc1 {
-- 
2.17.1

