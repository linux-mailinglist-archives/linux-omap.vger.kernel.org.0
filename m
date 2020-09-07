Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E4B2605A0
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 22:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730173AbgIGUWL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 16:22:11 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38542 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730224AbgIGUWH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 16:22:07 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 087KM5sx070222;
        Mon, 7 Sep 2020 15:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599510125;
        bh=A9sNX+xsTb+BdyPioA1mPvqCAGKjC7PtJvx+F5+f4CE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TYXT0tmstT3sL0Ngqfk7CTjuczfJePdEPv7afJEU/UJrJWbpNt1y6lq6GHBytBYSq
         gOz3Vraj5WeoejrO6gU5BLBsWK3LK1eZoAcS1Mdx4QI+pvOxYXgbkZQahJUIdTV7sr
         T9qKQngIFT3XmWtVPHakp3o00vDPMDOlfOr/2It4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 087KM4gF085619
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Sep 2020 15:22:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 15:22:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 15:22:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087KM3IE128334;
        Mon, 7 Sep 2020 15:22:04 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 5/6] ARM: dts: am57xx-cl-som-am57x: switch to new cpsw switch drv
Date:   Mon, 7 Sep 2020 23:21:24 +0300
Message-ID: <20200907202125.22943-6-grygorii.strashko@ti.com>
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

Switch CompuLab CL-SOM-AM57x board to use new cpsw switch driver. Those
board configured in dual_mac mode by default. Hence, dual_mac mode has been
preserved the same way between legacy and new driver it's safe to switch
drivers.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
index 34ca761aeded..0d5fe2bfb683 100644
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -546,27 +546,26 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cpsw_pins_default>;
 	pinctrl-1 = <&cpsw_pins_sleep>;
-	dual_emac;
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-txid";
-	dual_emac_res_vlan = <0>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "rgmii-txid";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_pins_default>;
 	pinctrl-1 = <&davinci_mdio_pins_sleep>;
-- 
2.17.1

