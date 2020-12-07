Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA1D2D13D5
	for <lists+linux-omap@lfdr.de>; Mon,  7 Dec 2020 15:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgLGOfh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Dec 2020 09:35:37 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47834 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgLGOfh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Dec 2020 09:35:37 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7EXiqa125376;
        Mon, 7 Dec 2020 08:33:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607351624;
        bh=T/Si6X3+hPpzSyC/ceWH+JobyZh/k8+1zn4bjkHV0XY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HSpwxtx6IWBCl48aRLWUvUfNUcnwuxXwl86ZI3P/J9XLH91/ew49xo+gvO4voaRf9
         CSJCh9llfnUD4XEqbi4RqNtbWSgICHS220ty1mLQ5BJXoe3RwSW02Ohi8MCzlFOVn8
         dRxPZknnZpLKDtVU+rpyAxvqZKMXmH3MQZS3PgdA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7EXixJ122203
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Dec 2020 08:33:44 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 08:33:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 08:33:44 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7EXfx0071446;
        Mon, 7 Dec 2020 08:33:43 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/3] ARM: dts: am574x-idk: add support for EMIF1 ECC
Date:   Mon, 7 Dec 2020 16:33:37 +0200
Message-ID: <20201207143339.15674-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207143339.15674-1-t-kristo@ti.com>
References: <20201207143339.15674-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

EMIF1 has ECC support, so add the DT node with address and interrupt
details to handle this.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/am574x-idk.dts | 4 ++++
 arch/arm/boot/dts/dra76x.dtsi    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/am574x-idk.dts b/arch/arm/boot/dts/am574x-idk.dts
index 37758761cd88..1b8f3a28af05 100644
--- a/arch/arm/boot/dts/am574x-idk.dts
+++ b/arch/arm/boot/dts/am574x-idk.dts
@@ -39,3 +39,7 @@
 &m_can0 {
 	status = "disabled";
 };
+
+&emif1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
index b69c7d40f5d8..4a2840c0b6ad 100644
--- a/arch/arm/boot/dts/dra76x.dtsi
+++ b/arch/arm/boot/dts/dra76x.dtsi
@@ -9,6 +9,13 @@
 	compatible = "ti,dra762", "ti,dra7";
 
 	ocp {
+		emif1: emif@4c000000 {
+			compatible = "ti,emif-dra7xx";
+			reg = <0x4c000000 0x200>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		target-module@42c01900 {
 			compatible = "ti,sysc-dra7-mcan", "ti,sysc";
 			ranges = <0x0 0x42c00000 0x2000>;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
