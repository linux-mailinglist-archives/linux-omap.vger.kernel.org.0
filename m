Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 876DDF9235
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfKLOZm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:25:42 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49456 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbfKLOZD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:25:03 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEOwPq090447;
        Tue, 12 Nov 2019 08:24:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568698;
        bh=22YioS899q9Ll42QHlfNQAPOlj+BD8xYT6U/0yMCex8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IrN79z7+ILqHN7QpSIhflcCinilYdMoaryxHTBD99c80ReyLi+kEGU4waaIzp04fN
         rZka47b0OWJIYckmNbTmvuL53DlRRk5HkyhrQo5q/De1x1mbR1+TMcQCcVaLbfo9Yt
         X5ikkcqD17QegtoCmHjvh1yCvsNhOpVomMwHVFkg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEOwMc030516;
        Tue, 12 Nov 2019 08:24:58 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:24:40 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:24:40 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEOrBh036029;
        Tue, 12 Nov 2019 08:24:57 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 02/10] ARM: dts: dra7: add cam clkctrl node
Date:   Tue, 12 Nov 2019 08:27:45 -0600
Message-ID: <20191112142753.22976-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112142753.22976-1-bparrot@ti.com>
References: <20191112142753.22976-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add clkctrl nodes for CAM domain.

Note that because of the current dts node name dependency for mapping to
clock domain, we must still use "cam-clkctrl@" naming instead of generic
"clock@" naming for the node. And because of this, it's probably best to
apply the dts node addition together along with the other clock changes.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
index d1c2406ec71c..199f8d483f75 100644
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -1734,6 +1734,20 @@
 		};
 	};
 
+	cam_cm: cam-cm@1000 {
+		compatible = "ti,omap4-cm";
+		reg = <0x1000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x1000 0x100>;
+
+		cam_clkctrl: cam-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x2c>;
+			#clock-cells = <2>;
+		};
+	};
+
 	dss_cm: dss-cm@1100 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1100 0x100>;
-- 
2.17.1

