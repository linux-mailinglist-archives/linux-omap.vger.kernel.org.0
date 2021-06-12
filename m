Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975D93A4C05
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhFLBSI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:18:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51798 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbhFLBSI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:18:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1G7M0058183;
        Fri, 11 Jun 2021 20:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460567;
        bh=/3yt5MixPALFiw45w63mh14Poyilq5iISBy9nyqxuL8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=KpDDqLnYGQXW10CWTqgotZWXsYMYSQvJK+ENa/1wLK+1bPfw3OUWcOdvwGwU3pAjE
         uuQsr/9b6CBFeJ3tMPlmkaJnMdrgM5CQquuVYxuwZvT0mH1eqaUK7gv5+skHrwKFnR
         t/+KZFZSiiKN3rL0IQI/29t7yV1WTP8oua/lJbFI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1G72I082099
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:16:07 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:16:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:16:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1G5MK065229;
        Fri, 11 Jun 2021 20:16:06 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 11/15] ARM: dts: am335x-pepper: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:32 +0300
Message-ID: <20210612011436.10437-12-grygorii.strashko@ti.com>
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

So, switch Gumstix Pepper to use new cpsw switch driver.
Those boards have or 2 Ext. port wired and configured in dual_mac mode by
default, or only 1 Ext. port.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-pepper.dts | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pepper.dts b/arch/arm/boot/dts/am335x-pepper.dts
index f9a027b47962..b5e88e627bc1 100644
--- a/arch/arm/boot/dts/am335x-pepper.dts
+++ b/arch/arm/boot/dts/am335x-pepper.dts
@@ -260,20 +260,19 @@
 };
 
 /* Ethernet */
-&cpsw_emac0 {
-	status = "okay";
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii";
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
-	status = "okay";
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "rgmii";
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
-	status = "okay";
+&davinci_mdio_sw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mdio_pins>;
 
@@ -286,13 +285,12 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet_pins>;
 };
 
-
 &am33xx_pinmux {
 	ethernet_pins: pinmux_ethernet {
 		pinctrl-single,pins = <
-- 
2.17.1

