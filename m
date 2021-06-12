Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2770D3A4BF4
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhFLBR1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:17:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60792 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhFLBRY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:17:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1FOM3093783;
        Fri, 11 Jun 2021 20:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460524;
        bh=GMyqFvO4yMiI6nl68s/Lun5Fw8JnG8bopErpDFQY3Xk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Fe0hQ1rZAWy/5OZCGHsiuYHDLDZz2tt1Du+I2bafJW5WklMHHonS9AvZ79BVApBsZ
         qWtUbVzbe3LZE56nyKsG3RjjwzMim9NAJo0sQ+nSGrw7g4o1Kqj4I/UbSU+g1gsKEF
         lzM3Dhz/Mg4DLDXuJ5pNC9p+Rtcnv7mRDT+qFcyo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1FOj0081144
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:15:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:15:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:15:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1FNL2063718;
        Fri, 11 Jun 2021 20:15:23 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 05/15] ARM: dts: am335x-igep0033: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:26 +0300
Message-ID: <20210612011436.10437-6-grygorii.strashko@ti.com>
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

So, switch am335x-igep0033 to use new cpsw switch driver. Those boards have
or 2 Ext. port wired and configured in dual_mac mode by default, or only 1
Ext. port.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-igep0033.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-igep0033.dtsi b/arch/arm/boot/dts/am335x-igep0033.dtsi
index 7ec23d47a429..cc14415a4eb9 100644
--- a/arch/arm/boot/dts/am335x-igep0033.dtsi
+++ b/arch/arm/boot/dts/am335x-igep0033.dtsi
@@ -93,12 +93,11 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	status = "okay";
 };
 
-&davinci_mdio {
-	status = "okay";
+&davinci_mdio_sw {
 
 	ethphy0: ethernet-phy@0 {
 		reg = <0>;
@@ -109,15 +108,16 @@
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rmii";
-
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "rmii";
+	ti,dual-emac-pvid = <2>;
 };
 
 &elm {
-- 
2.17.1

