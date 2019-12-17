Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EC2122706
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 09:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfLQIuR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 03:50:17 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33412 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfLQIuQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 03:50:16 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH8oDNH105909;
        Tue, 17 Dec 2019 02:50:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576572613;
        bh=YXtLTj89js37cLsNHord1gEpvjrsNcBGcdKN+dgAREk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=llXfGmTb15yKvxs9lbSm+QrPavst7Ogw8S8RmSV4wXMnTWqpBEb3hsBVPc+lyigrt
         kLMa7DlDLLiNGQE8Xz+gqqYbiMMsY0ntxiGX7Bjo+hyjg+XzktXSgok8xBvD/NxEcQ
         25cW3swd19dpi/j/a4kPOyd/Kz1Li/kW6xKHlus4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBH8oCiP040003
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 02:50:13 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 02:50:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 02:50:12 -0600
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH8o6dW062966;
        Tue, 17 Dec 2019 02:50:10 -0600
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
Subject: [PATCH 1/3] ARM: dts: am57xx-beagle-x15/am57xx-idk: Remove "gpios" for  endpoint dt nodes
Date:   Tue, 17 Dec 2019 14:21:22 +0530
Message-ID: <20191217085124.22480-2-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217085124.22480-1-kishon@ti.com>
References: <20191217085124.22480-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

PERST# line in the PCIE connector is driven by the host mode and not
EP mode. The gpios property here is used for driving the PERST# line.
Remove gpios property from all endpoint device tree nodes.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/am571x-idk.dts                | 4 ----
 arch/arm/boot/dts/am572x-idk-common.dtsi        | 4 ----
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/am571x-idk.dts b/arch/arm/boot/dts/am571x-idk.dts
index 820ce3b60bb6..67239f7c22b8 100644
--- a/arch/arm/boot/dts/am571x-idk.dts
+++ b/arch/arm/boot/dts/am571x-idk.dts
@@ -170,10 +170,6 @@
 	gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
 };
 
-&pcie1_ep {
-	gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
-};
-
 &mmc1 {
 	pinctrl-names = "default", "hs";
 	pinctrl-0 = <&mmc1_pins_default_no_clk_pu>;
diff --git a/arch/arm/boot/dts/am572x-idk-common.dtsi b/arch/arm/boot/dts/am572x-idk-common.dtsi
index a064f13b3880..ddf123620e96 100644
--- a/arch/arm/boot/dts/am572x-idk-common.dtsi
+++ b/arch/arm/boot/dts/am572x-idk-common.dtsi
@@ -147,10 +147,6 @@
 	gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
 };
 
-&pcie1_ep {
-	gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
-};
-
 &mailbox5 {
 	status = "okay";
 	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index bc76f1705c0f..9a94c96b0350 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -547,10 +547,6 @@
 	gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
 };
 
-&pcie1_ep {
-	gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
-};
-
 &mcasp3 {
 	#sound-dai-cells = <0>;
 	assigned-clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
-- 
2.17.1

