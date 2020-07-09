Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6430C21AB70
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgGIXUQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34598 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbgGIXUP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK8hi053753;
        Thu, 9 Jul 2020 18:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336808;
        bh=CyiHZQsfhTO5vLN7NiKzVMU247TNjDR4ol5AODJOUfg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xrAeqnR5nstmWpZGyl8R2kLPaRLti6sxwL19BxmncbPoV7WJ9rTaPx/FDtf7dOnSn
         PVA6AVup20WR+YFJuKjsy0LZu1Mq6fLEofc3Xw66IIuE7KrgeT6kg6jhzgApIr0sPM
         qgynQJY+Sx7z0zhp3SK30opSOTwSH1Z3GSynVgO4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069NK82L012077
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 18:20:08 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:08 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK8HW096124;
        Thu, 9 Jul 2020 18:20:08 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK8QA124469;
        Thu, 9 Jul 2020 18:20:08 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 10/13] ARM: dts: omap5-uevm: Add CMA pools and enable IPU & DSP
Date:   Thu, 9 Jul 2020 18:19:51 -0500
Message-ID: <20200709231954.1973-11-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The CMA reserved memory nodes have been added for the IPU and DSP
remoteproc devices on the OMAP5 uEVM board. These nodes are assigned
to the respective rproc device nodes, and both the IPU and DSP remote
processors are enabled for this board.

The current CMA pools and sizes are defined statically for each device.
The starting addresses are fixed to meet current dependencies on the
remote processor firmwares, and will go away when the remote-side
code has been improved to gather this information runtime during
its initialization.

An associated pair of the rproc node and its CMA node can be disabled
later on if there is no use-case defined to use that remote processor.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap5-uevm.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/omap5-uevm.dts b/arch/arm/boot/dts/omap5-uevm.dts
index 9441e9a572ad..251885656697 100644
--- a/arch/arm/boot/dts/omap5-uevm.dts
+++ b/arch/arm/boot/dts/omap5-uevm.dts
@@ -15,6 +15,26 @@ memory@80000000 {
 		reg = <0 0x80000000 0 0x7f000000>; /* 2032 MB */
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		dsp_memory_region: dsp-memory@95000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x95000000 0 0x800000>;
+			reusable;
+			status = "okay";
+		};
+
+		ipu_memory_region: ipu-memory@95800000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x95800000 0 0x3800000>;
+			reusable;
+			status = "okay";
+		};
+	};
+
 	aliases {
 		ethernet = &ethernet;
 	};
@@ -198,3 +218,13 @@ ethernet: usbether@3 {
 &wlcore {
 	compatible = "ti,wl1837";
 };
+
+&dsp {
+	status = "okay";
+	memory-region = <&dsp_memory_region>;
+};
+
+&ipu {
+	status = "okay";
+	memory-region = <&ipu_memory_region>;
+};
-- 
2.26.0

