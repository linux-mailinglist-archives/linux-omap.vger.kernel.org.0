Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4655311ACBA
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729735AbfLKOCt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:02:49 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51474 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729742AbfLKOCq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:02:46 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2hiG036964;
        Wed, 11 Dec 2019 08:02:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576072963;
        bh=rRP6nZ5QSmHV4vVUjQ8KoXLwJhm7iGv4L56yHM0DLRM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=x5+/rdt0BARbv0DT3TrLJR4na6cshefzL8DJzHxADtlhuCXf6xF/M2VZpPXHZbnNX
         Xi1x05UQUdvkZra+JjB/cZbp1x1dGKn1tuXugSbCvw8fIyRl2yqUZUgMPIGM0wm+x3
         SakZ7VtJHQVn+NVAw4yxsQd2xQ3IoKHfQGphVedo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBE2hfp124546
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 08:02:43 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:02:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:02:42 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2afr007398;
        Wed, 11 Dec 2019 08:02:42 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 07/10] arm: dtsi: dra76x: Add CAL dtsi node
Date:   Wed, 11 Dec 2019 08:05:55 -0600
Message-ID: <20191211140558.10407-8-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211140558.10407-1-bparrot@ti.com>
References: <20191211140558.10407-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add the required dtsi node to support the Camera
Adaptation Layer (CAL) for the DRA76 family of devices.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/dra76x.dtsi | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
index cdcba3f561c4..2f7539afef2b 100644
--- a/arch/arm/boot/dts/dra76x.dtsi
+++ b/arch/arm/boot/dts/dra76x.dtsi
@@ -41,6 +41,48 @@
 
 };
 
+&l4_per3 {
+	target-module@1b0000 {			/* 0x489b0000, ap 25 34.0 */
+		compatible = "ti,sysc-omap4", "ti,sysc";
+		reg = <0x1b0000 0x4>,
+		      <0x1b0010 0x4>;
+		reg-names = "rev", "sysc";
+		ti,sysc-midle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>;
+		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>;
+		clocks = <&cam_clkctrl DRA7_CAM_VIP3_CLKCTRL 0>;
+		clock-names = "fck";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x1b0000 0x10000>;
+
+		cal: cal@0 {
+			compatible = "ti,dra76-cal";
+			reg = <0x0000 0x400>,
+			      <0x0800 0x40>,
+			      <0x0900 0x40>;
+			reg-names = "cal_top",
+				    "cal_rx_core0",
+				    "cal_rx_core1";
+			interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			ti,camerrx-control = <&scm_conf 0x6dc>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi2_0: port@0 {
+					reg = <0>;
+				};
+				csi2_1: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+	};
+};
+
 /* MCAN interrupts are hard-wired to irqs 67, 68 */
 &crossbar_mpu {
 	ti,irqs-skip = <10 67 68 133 139 140>;
-- 
2.17.1

