Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDBC260592
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 22:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729726AbgIGUVt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 16:21:49 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38518 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729862AbgIGUVs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 16:21:48 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 087KLfUZ070178;
        Mon, 7 Sep 2020 15:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599510101;
        bh=DndXHxrHBEGJZ0P3K7dz8g+iOjJ6ahMtkEMkEAT5I00=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=t8NWtSsBZSLR+EiU4TjlwI+uDryR9/0ALqMkKOsVyjSdJKXdtiAHt8ppZdQK4g4tw
         /APuROXjdRZCTtkuo35jBvCxrMNpRzs7FseE6bc4Ej8EX59fwl15iSTBXEJq4aAaU7
         ARlWJAVvswtk872srbB63bUhmthf8Tr4W9SDeK2s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087KLfZg115715;
        Mon, 7 Sep 2020 15:21:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 15:21:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 15:21:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087KLebs127278;
        Mon, 7 Sep 2020 15:21:40 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 1/6] ARM: dts: am5729: beagleboneai: switch to new cpsw switch drv
Date:   Mon, 7 Sep 2020 23:21:20 +0300
Message-ID: <20200907202125.22943-2-grygorii.strashko@ti.com>
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

Switch BeagleBone AI to use new cpsw switch driver.
It has one Ext. port only and fits dual_mac mode with no issues.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am5729-beagleboneai.dts | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
index e9c7f44126e7..149cfafb90bf 100644
--- a/arch/arm/boot/dts/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
@@ -488,25 +488,29 @@
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	reset-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
 	reset-delay-us = <2>;
 
-	phy0: ethernet-phy@1 {
+	phy0: ethernet-phy@4 {
 		reg = <4>;
 		eee-broken-100tx;
 		eee-broken-1000t;
 	};
 };
 
-&mac {
-	slaves = <1>;
+&mac_sw {
 	status = "okay";
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-rxid";
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
 };
 
 &ocp {
-- 
2.17.1

