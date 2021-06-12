Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FBB3A4BEA
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhFLBRD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:17:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60678 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhFLBRD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:17:03 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1F3BN093651;
        Fri, 11 Jun 2021 20:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460503;
        bh=huxIhc8Bo84mx+hqIxCW7mwrQIKZT8whWeRTctygwLM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Iw6b2TnKhnbkS2XPRrqouyXrx9FrGn2urywgKuv16zfCfeJvYrxUYIP39rH6gsgVS
         t90Go1uBRsGfnUL08TaIFhnMyHX2FWmBhiczThz2Tj/98cMP8Bwc8WTzaGuNE3L7JT
         kOGhMwHE/XtYv2lSy6LI5vVSCN0hVQmbAXmWhxMA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1F2gF079535
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:15:03 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:15:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:15:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1F1JD006264;
        Fri, 11 Jun 2021 20:15:02 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 02/15] ARM: dts: am335x-nano: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:23 +0300
Message-ID: <20210612011436.10437-3-grygorii.strashko@ti.com>
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

So, switch Newflow AM335x NanoBone to use new cpsw switch driver. Those
boards have or 2 Ext. port wired and configured in dual_mac mode by
default, or only 1 Ext. port.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-nano.dts | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
index 0dbc72d726c9..b6f2567bd65a 100644
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -369,12 +369,11 @@
 	};
 };
 
-&mac {
-	dual_emac;
+&mac_sw {
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	status = "okay";
 
 	ethphy0: ethernet-phy@0 {
@@ -386,16 +385,16 @@
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "mii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "mii";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
 &mmc1 {
-- 
2.17.1

