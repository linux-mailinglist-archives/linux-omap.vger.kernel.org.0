Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FB53A4C00
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhFLBRy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:17:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60948 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbhFLBRx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:17:53 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1FrAd093974;
        Fri, 11 Jun 2021 20:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460553;
        bh=4YYCoYozfNzRiEaIYbJn89MZKgNuoj2kdPUK+s6qBKM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vAyRBQ/i3bycYbJ7IGrn8OZoOUTHDLyPOlZFK3mWEkWv54OoLyyDrTV4M1KT99aC1
         9ToIswvmDelYshr/DoxqQ5Lsu/wQYRDneTJdxJfZtAgsV9BO24vUn/9ymeDDwRVtOU
         lB1CxwQJYb36OigvByJorOk1YzXsZr4tgNHf8dzs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1FrKj127823
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:15:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:15:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:15:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1Fpu3055789;
        Fri, 11 Jun 2021 20:15:52 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 09/15] ARM: dts: am335x-osd3358-sm-red: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:30 +0300
Message-ID: <20210612011436.10437-10-grygorii.strashko@ti.com>
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

So, switch Octavo Systems OSD3358-SM-RED to use new cpsw switch driver.
Those boards have or 2 Ext. port wired and configured in dual_mac mode by
default, or only 1 Ext. port.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
index 5403e47c07e2..605b2a436edf 100644
--- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
@@ -391,24 +391,27 @@
 	clock-frequency = <100000>;
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-txid";
+	ti,dual-emac-pvid = <1>;
 };
 
-&mac {
-	slaves = <1>;
+&cpsw_port2 {
+	status = "disabled";
+};
+
+&mac_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cpsw_default>;
 	pinctrl-1 = <&cpsw_sleep>;
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
 	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
 
 	ethphy0: ethernet-phy@4 {
 		reg = <4>;
-- 
2.17.1

