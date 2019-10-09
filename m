Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D21D1724
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 19:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731619AbfJIRyB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 13:54:01 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55366 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731452AbfJIRyA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 13:54:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99Hrus2038532;
        Wed, 9 Oct 2019 12:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570643636;
        bh=yMB2DynVIW799TxxlMc8fECNSvjeukD5Qo455dDBhes=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xIryS4Dd0ks8zUI1vtffWYgLEWvBXWK/z3oUIPJhRsceuZoYyasJKIuxROphCwiFc
         ZpjRly5BKn05tZNu3gFeRyH59egfRULfx9lwuE1W+Va+KtUigWrN2J/p7SvVcH6ZGL
         puUx3LazdXMheGLZZ831EYSnnQbLdjGkgRnPBZ6s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99Hru9n041165
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 12:53:56 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 12:53:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 12:53:52 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99Hrsh9069742;
        Wed, 9 Oct 2019 12:53:55 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 1/3] dt-bindings: media: ti-vpe: Document VPE driver
Date:   Wed, 9 Oct 2019 12:56:26 -0500
Message-ID: <20191009175628.20570-2-bparrot@ti.com>
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

Device Tree bindings for the Video Processing Engine (VPE) driver.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 .../devicetree/bindings/media/ti-vpe.txt      | 48 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti-vpe.txt

diff --git a/Documentation/devicetree/bindings/media/ti-vpe.txt b/Documentation/devicetree/bindings/media/ti-vpe.txt
new file mode 100644
index 000000000000..b2942fa8c3ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti-vpe.txt
@@ -0,0 +1,48 @@
+Texas Instruments DRA7x VIDEO PROCESSING ENGINE (VPE)
+------------------------------------------------------
+
+The Video Processing Engine (VPE) is a key component for image post
+processing applications. VPE consist of a single memory to memory
+path which can perform chroma up/down sampling, deinterlacing,
+scaling and color space conversion.
+
+Required properties:
+- compatible: must be "ti,vpe"
+- reg:	physical base address and length of the registers set for the 4
+	memory regions required;
+- reg-names: name associated with the memory regions described is <reg>;
+- interrupts: should contain IRQ line for VPE;
+
+Example:
+
+	target-module@1d0010 {                  /* 0x489d0000, ap 27 30.0 */
+		compatible = "ti,sysc-omap4", "ti,sysc";
+		reg = <0x1d0010 0x4>;
+		reg-names = "sysc";
+		ti,sysc-midle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>,
+				<SYSC_IDLE_SMART>;
+		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>,
+				<SYSC_IDLE_SMART>;
+		clocks = <&vpe_clkctrl DRA7_VPE_VPE_CLKCTRL 0>;
+		clock-names = "fck";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x1d0000 0x10000>;
+
+		vpe: vpe@0 {
+			compatible = "ti,vpe";
+			reg = <0x0000 0x120>,
+			      <0x0700 0x80>,
+			      <0x5700 0x18>,
+			      <0xd000 0x400>;
+			reg-names = "vpe_top",
+				    "sc",
+				    "csc",
+				    "vpdma";
+			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 8598f49fa2c8..63dcda51f8ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16299,6 +16299,7 @@ W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 S:	Maintained
 F:	drivers/media/platform/ti-vpe/
+F:	Documentation/devicetree/bindings/media/ti-vpe.txt
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
-- 
2.17.1

