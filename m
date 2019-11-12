Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC7DCF91F3
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKLOYI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:24:08 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38508 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfKLOYI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:24:08 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEO3qh097838;
        Tue, 12 Nov 2019 08:24:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568643;
        bh=tPqdhNixIKdQvbkA4FXOFaYElMurFZuh15DBk3awDgM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=N/2bLdDUVGZPiJaNp65GX3W/6JnhNmB1w+ET6MJvSjVNWVxcr65dZc9+q6Fr+lecx
         LaoWY/JHp+KzpbgqCbHT9u8dP6dl5fcxorOzJ0zcUS2eOWyk/ENTF8XNZdPdTRBYN1
         l7AmeCmFjEHpINE/WUoyf49GjFKxSnCqT8UGK1dY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEO3Sa018760
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:24:03 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:24:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:24:03 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACENwTk099408;
        Tue, 12 Nov 2019 08:24:03 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 3/3] ARM: dts: dra7: Add ti-sysc node for VPE
Date:   Tue, 12 Nov 2019 08:26:57 -0600
Message-ID: <20191112142657.22898-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112142657.22898-1-bparrot@ti.com>
References: <20191112142657.22898-1-bparrot@ti.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index ea0e7c19eb4e..0917231a20e2 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4158,12 +4158,34 @@
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
+				compatible = "ti,dra7-vpe";
+				reg = <0x0000 0x120>,
+				      <0x0700 0x80>,
+				      <0x5700 0x18>,
+				      <0xd000 0x400>;
+				reg-names = "vpe_top",
+					    "sc",
+					    "csc",
+					    "vpdma";
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 	};
 };
-- 
2.17.1

