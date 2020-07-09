Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F9521AB66
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGIXUM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:12 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49290 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgGIXUL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:11 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK6Og122930;
        Thu, 9 Jul 2020 18:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336806;
        bh=CNBtCJ1QxYrYPVuB3zh0QajQVwCm8p+F9zhXyfSPlEI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sEEFG/7g8zTe4Q4neAkITmtjd6ZijNs2c194Rlt7Smbc1cYIrA5qhB1yB11lMSbFg
         nDs8+mIPK2L0c1TIvKZm4Bs3hUEocxRlj7f3TKs+pGOFE2uR16gHAMB4Zt5uc5LaIA
         p45coctb/QSIGQq003vofMvOjfN/7l3wh9Vz916I=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK6PG099341;
        Thu, 9 Jul 2020 18:20:06 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:06 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK6s1096031;
        Thu, 9 Jul 2020 18:20:06 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK6tx124433;
        Thu, 9 Jul 2020 18:20:06 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 06/13] ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
Date:   Thu, 9 Jul 2020 18:19:47 -0500
Message-ID: <20200709231954.1973-7-s-anna@ti.com>
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
remoteproc devices on all the OMAP4-based Panda boards. These nodes
are assigned to the respective rproc device nodes, and both the
IPU and DSP remote processors are enabled for all these boards.

The current CMA pools and sizes are defined statically for each device.
The starting addresses are fixed to meet current dependencies on the
remote processor firmwares, and will go away when the remote-side
code has been improved to gather this information runtime during
its initialization.

An associated pair of the rproc node and its CMA node can be disabled
later on if there is no use-case defined to use that remote processor.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap4-panda-common.dtsi | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index 55ea8b6189af..ef79028fc95f 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -12,6 +12,26 @@ memory@80000000 {
 		reg = <0x80000000 0x40000000>; /* 1 GB */
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dsp_memory_region: dsp-memory@98000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x98000000 0x800000>;
+			reusable;
+			status = "okay";
+		};
+
+		ipu_memory_region: ipu-memory@98800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x98800000 0x7000000>;
+			reusable;
+			status = "okay";
+		};
+	};
+
 	chosen {
 		stdout-path = &uart3;
 	};
@@ -571,3 +591,13 @@ hdmi_out: endpoint {
 		};
 	};
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

