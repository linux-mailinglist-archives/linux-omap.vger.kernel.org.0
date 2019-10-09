Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB2DD1728
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 19:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731827AbfJIRyK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 13:54:10 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50196 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbfJIRyB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 13:54:01 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99HrwvL040647;
        Wed, 9 Oct 2019 12:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570643638;
        bh=8XTNYrkHwCbkeIV5uyh8v0iAToXLLeGCVlM89otja1Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ppTEu7YQOUKagD0SpZgIG21XaRiFl+EDcCWY9+flUsnXZOAfcrDiZmCfci43/y81r
         SgNlp00C8BMA9olnZInuzfyCMuVyBJpDjV8tMOwG+cvb3kPQ9ox0p8l7DXLxTZQv5m
         M/1xWYhLQINC5l1jWWkA1OjwDxw4YFi+YLjz8iPs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99Hrwl3068024
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 12:53:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 12:53:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 12:53:54 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99HrshB069742;
        Wed, 9 Oct 2019 12:53:57 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 3/3] ARM: dts: dra7: Add ti-sysc node for VPE
Date:   Wed, 9 Oct 2019 12:56:28 -0500
Message-ID: <20191009175628.20570-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009175628.20570-1-bparrot@ti.com>
References: <20191009175628.20570-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add VPE node as a child of l4 interconnect in order for it to probe
using ti-sysc.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index ea0e7c19eb4e..d876c1754f33 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4158,12 +4158,36 @@
 			ranges = <0x0 0x1b0000 0x10000>;
 		};
 
-		target-module@1d0000 {			/* 0x489d0000, ap 27 30.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+		target-module@1d0010 {			/* 0x489d0000, ap 27 30.0 */
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x1d0010 0x4>;
+			reg-names = "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&vpe_clkctrl DRA7_VPE_VPE_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x1d0000 0x10000>;
+
+			vpe: vpe@0 {
+				compatible = "ti,vpe";
+				reg = <0x0000 0x120>,
+				      <0x0700 0x80>,
+				      <0x5700 0x18>,
+				      <0xd000 0x400>;
+				reg-names = "vpe_top",
+					    "sc",
+					    "csc",
+					    "vpdma";
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 	};
 };
-- 
2.17.1

