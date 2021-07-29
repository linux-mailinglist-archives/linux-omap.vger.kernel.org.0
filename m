Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A924C3DAF62
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhG2Wqj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:39 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60430 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbhG2Wqi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkLTx036075;
        Thu, 29 Jul 2021 17:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598781;
        bh=vM/yAiJxeF9QjfZ+Zxw224o28OaO1uD4tG4H/TVHmvs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lljMEU1Nfs9KbTgqIF7iCK4l/x8zs3Y65H64b2wD6YAJx7J/DMlk+SoxYaa9Z6bP8
         fJh+yg1wOwyyp3vUYkPjCF0ApHHwm2hpA70HifMINuinb+IlntLLdHPxCw/E9iuBS4
         aLF2HsNvBlId48SfecyGVwp46sitWwT1RLFsNsjE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkLq8010649
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:21 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkLqW073994;
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkLkY016255;
        Thu, 29 Jul 2021 17:46:21 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 02/11] ARM: dts: am33xx-l4: Add PRUSS MDIO controller node
Date:   Thu, 29 Jul 2021 17:46:12 -0500
Message-ID: <20210729224621.2295-3-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729224621.2295-1-s-anna@ti.com>
References: <20210729224621.2295-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRUSS on AM335x SoCs has a MDIO sub-module that can be used
to control external PHYs associated with the Industrial Ethernet
peripherals within the PRUSS. The MDIO module used within the
PRU-ICSS is an instance of the MDIO Controller used in TI Davinci
SoCs. The same bus frequency of 1 MHz is chosen as the regular
MDIO node.

The node is added to the common am33xx-l4.dtsi file and is disabled.
This needs to be enabled in the respective board files using the
relevant AM335x SoCs supporting PRUSS and where the ethernet is
pinned out and connected properly.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 148176361b4e..c9629cb5ccd1 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -923,6 +923,17 @@ pru1: pru@38000 {
 					reg-names = "iram", "control", "debug";
 					firmware-name = "am335x-pru1-fw";
 				};
+
+				pruss_mdio: mdio@32400 {
+					compatible = "ti,davinci_mdio";
+					reg = <0x32400 0x90>;
+					clocks = <&dpll_core_m4_ck>;
+					clock-names = "fck";
+					bus_freq = <1000000>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+				};
 			};
 		};
 	};
-- 
2.32.0

