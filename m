Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC427172B38
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 23:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729947AbgB0W25 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 17:28:57 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58828 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730320AbgB0W2z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 17:28:55 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSpwf079932;
        Thu, 27 Feb 2020 16:28:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582842531;
        bh=8uqWid/qyqBYNv8yA1pRbnk5QREMzjtuHMdPzc2iVoA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mwxH+F4+TOQIYgvCF+ttRUmdd9i2v0KlTIYJyo1YeKamwYpXKArxfX5mCe3iA39hr
         sLZE1dQdkLQJEqQMQyNzT6oD8wqkRmo8b+bWpLVq4EIzrunA4VlFi4vzx8ilF1pg14
         bEyzaDXRtEpH+9X0Hi4nr8B5s53XZ+xj7R5rhzbA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSpZr056991;
        Thu, 27 Feb 2020 16:28:51 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 16:28:51 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 16:28:51 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01RMSpv1116588;
        Thu, 27 Feb 2020 16:28:51 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01RMSpcR087107;
        Thu, 27 Feb 2020 16:28:51 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 5/5] ARM: dts: dra7: Add PRU-ICSS interconnect target-module nodes
Date:   Thu, 27 Feb 2020 16:28:37 -0600
Message-ID: <20200227222837.7329-6-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200227222837.7329-1-s-anna@ti.com>
References: <20200227222837.7329-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The AM57xx family of SoCs contains two identical PRU-ICSS instances
that have a very unique SYSC register. The IPs do not have any
PRCM reset lines unlike those on AM33xx/AM437x SoCs. Add the PRUSS
interconnect target-module nodes with all the required properties.

Each of the PRUSS devices themselves shall be added as child nodes
to the corresponding interconnect node in the future. The PRU-ICSS
instances are only available on AM57xx family of SoCs and are not
supported on DRA7xx family of SoCs in general, so the target module
nodes are added in a separate dtsi file. This new dtsi file is
included in all the AM57xx SoC dtsi files, so the nodes are
automatically inherited and enabled on all AM57xx boards.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
v2: No changes

 arch/arm/boot/dts/am57-pruss.dtsi | 50 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/am5718.dtsi     |  1 +
 arch/arm/boot/dts/am5728.dtsi     |  1 +
 arch/arm/boot/dts/am5748.dtsi     |  1 +
 arch/arm/boot/dts/dra7.dtsi       |  2 +-
 5 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/am57-pruss.dtsi

diff --git a/arch/arm/boot/dts/am57-pruss.dtsi b/arch/arm/boot/dts/am57-pruss.dtsi
new file mode 100644
index 000000000000..b1c583dee10b
--- /dev/null
+++ b/arch/arm/boot/dts/am57-pruss.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Common PRUSS data for TI AM57xx platforms
+ */
+
+&ocp {
+	pruss1_tm: target-module@4b226000 {
+		compatible = "ti,sysc-pruss", "ti,sysc";
+		reg = <0x4b226000 0x4>,
+		      <0x4b226004 0x4>;
+		reg-names = "rev", "sysc";
+		ti,sysc-mask = <(SYSC_PRUSS_STANDBY_INIT |
+				 SYSC_PRUSS_SUB_MWAIT)>;
+		ti,sysc-midle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>,
+				<SYSC_IDLE_SMART>;
+		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>,
+				<SYSC_IDLE_SMART>;
+		/* Domains (P, C): coreaon_pwrdm, l4per2_clkdm */
+		clocks = <&l4per2_clkctrl DRA7_L4PER2_PRUSS1_CLKCTRL 0>;
+		clock-names = "fck";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x00000000 0x4b200000 0x80000>;
+	};
+
+	pruss2_tm: target-module@4b2a6000 {
+		compatible = "ti,sysc-pruss", "ti,sysc";
+		reg = <0x4b2a6000 0x4>,
+		      <0x4b2a6004 0x4>;
+		reg-names = "rev", "sysc";
+		ti,sysc-mask = <(SYSC_PRUSS_STANDBY_INIT |
+				 SYSC_PRUSS_SUB_MWAIT)>;
+		ti,sysc-midle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>,
+				<SYSC_IDLE_SMART>;
+		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>,
+				<SYSC_IDLE_SMART>;
+		/* Domains (P, C): coreaon_pwrdm, l4per2_clkdm */
+		clocks = <&l4per2_clkctrl DRA7_L4PER2_PRUSS2_CLKCTRL 0>;
+		clock-names = "fck";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x00000000 0x4b280000 0x80000>;
+	};
+};
diff --git a/arch/arm/boot/dts/am5718.dtsi b/arch/arm/boot/dts/am5718.dtsi
index d51007c3e8c4..a80c2e3eee2e 100644
--- a/arch/arm/boot/dts/am5718.dtsi
+++ b/arch/arm/boot/dts/am5718.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "dra72x.dtsi"
+#include "am57-pruss.dtsi"
 
 / {
 	compatible = "ti,am5718", "ti,dra7";
diff --git a/arch/arm/boot/dts/am5728.dtsi b/arch/arm/boot/dts/am5728.dtsi
index 82e5427ef6a9..9a3810f5adcc 100644
--- a/arch/arm/boot/dts/am5728.dtsi
+++ b/arch/arm/boot/dts/am5728.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "dra74x.dtsi"
+#include "am57-pruss.dtsi"
 
 / {
 	compatible = "ti,am5728", "ti,dra7";
diff --git a/arch/arm/boot/dts/am5748.dtsi b/arch/arm/boot/dts/am5748.dtsi
index 5e129759d04a..2b65317b1513 100644
--- a/arch/arm/boot/dts/am5748.dtsi
+++ b/arch/arm/boot/dts/am5748.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "dra76x.dtsi"
+#include "am57-pruss.dtsi"
 
 / {
 	compatible = "ti,am5748", "ti,dra762", "ti,dra7";
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index d78b684e7fca..f2e44c0dcd1e 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -143,7 +143,7 @@
 	 * the moment, just use a fake OCP bus entry to represent the whole bus
 	 * hierarchy.
 	 */
-	ocp {
+	ocp: ocp {
 		compatible = "ti,dra7-l3-noc", "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.23.0

