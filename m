Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837B03A4BEF
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhFLBRK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:17:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60726 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhFLBRK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:17:10 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1FAFv093699;
        Fri, 11 Jun 2021 20:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460510;
        bh=U72lxsjbMRPTmWCQI2QKNRi7nyjDhKOOmBiRPA3uxLE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wsf+Oc3G8mlPb9cP8eR5KcN9qlRaxt50vsniK+lEwy+rcMtKoIK3LrwfQeBekAwxJ
         tRU7/RGMLDq8Q2rpbdUGDidoITnefr35TZC17Sp2l6UFu1a5zASMrbuaiUbGO49usB
         0Mp2APHHTDYxrfwSFrA0bJvnevEz3x5FoTtcCVw8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1FAx8057540
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:15:10 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:15:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:15:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1F8xl063508;
        Fri, 11 Jun 2021 20:15:09 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 03/15] ARM: dts: am335x-chiliboard: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:24 +0300
Message-ID: <20210612011436.10437-4-grygorii.strashko@ti.com>
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

So, switch AM335x Chiliboard to use new cpsw switch driver. Those boards
have or 2 Ext. port wired and configured in dual_mac mode by default, or
only 1 Ext. port.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-chiliboard.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-chiliboard.dts b/arch/arm/boot/dts/am335x-chiliboard.dts
index 5660b5f6942d..a223cdd3e30e 100644
--- a/arch/arm/boot/dts/am335x-chiliboard.dts
+++ b/arch/arm/boot/dts/am335x-chiliboard.dts
@@ -128,28 +128,31 @@
 };
 
 /* Ethernet */
-&mac {
-	slaves = <1>;
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
 
 	ethphy0: ethernet-phy@0 {
 		reg = <0>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rmii";
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
 };
 
 /* USB */
-- 
2.17.1

