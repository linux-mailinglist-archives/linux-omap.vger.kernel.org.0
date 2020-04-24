Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DBA1B791B
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgDXPNO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:14 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50434 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgDXPNN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:13 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFD7dY051932;
        Fri, 24 Apr 2020 10:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741187;
        bh=371wtatG9tgeda4nwkD/IYDtwfRgbQpv7P7Q6jkweSM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HiODIgWMriel5SYQk1widDSOskMGEUBma0uSdorcYWu/qH40yCjvqfVXiNpFioN9N
         hqhMFQTr7fzGEogT1wa5DOnyPZoXc6l1tdpDin82dsNXPp6nSaB0iBWcuQoK1xNfAB
         MvHL8BidtixmXua+uFB3LMM8DrCYX80F1n8D7Wys=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFD7be043324;
        Fri, 24 Apr 2020 10:13:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:06 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7E122378;
        Fri, 24 Apr 2020 10:13:05 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 06/17] ARM: dts: dra7-ipu-dsp-common: Move mailboxes into common files
Date:   Fri, 24 Apr 2020 18:12:33 +0300
Message-ID: <20200424151244.3225-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424151244.3225-1-t-kristo@ti.com>
References: <20200424151244.3225-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The System Mailboxes 5 and 6 and their corresponding child sub-mailbox
(IPC 3.x) nodes are enabled in each of the DRA7xx and AM57xx board
dts files individually at present. These mailboxes enable the Remote
Processor Messaging (RPMsg) communication stack between the MPU host
processor and each of the IPU1, IPU2, DSP1 and DSP2 remote processors.

Move these nodes into two common dtsi files - dra7-ipu-dsp-common and
dra74-ipu-dsp-common files, which are then included in various board
dts files. These files can be used to add all the common configuration
properties (except memory data) required by remote processor nodes.
The memory pools and the remote processor nodes themselves are to be
enabled in the actual board dts files. The first file is to used by
platforms using DRA72x/DRA71x/AM571x/AM570x SoCs, and the second file
is to be used by platforms using DRA74x/DRA76x/AM572x/AM574x SoCs.
The second file includes the first file and contains additional data
only applicable for DSP2 remote processor.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/am571x-idk.dts              | 18 +---------------
 arch/arm/boot/dts/am572x-idk-common.dtsi      | 21 +------------------
 .../boot/dts/am57xx-beagle-x15-common.dtsi    | 21 +------------------
 arch/arm/boot/dts/dra7-evm-common.dtsi        |  1 +
 arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi    | 21 +++++++++++++++++++
 arch/arm/boot/dts/dra72-evm-common.dtsi       | 18 +---------------
 arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi   | 12 +++++++++++
 7 files changed, 38 insertions(+), 74 deletions(-)
 create mode 100644 arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
 create mode 100644 arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi

diff --git a/arch/arm/boot/dts/am571x-idk.dts b/arch/arm/boot/dts/am571x-idk.dts
index 669559c9c95b..98f12231728a 100644
--- a/arch/arm/boot/dts/am571x-idk.dts
+++ b/arch/arm/boot/dts/am571x-idk.dts
@@ -10,6 +10,7 @@
 #include "dra7-mmc-iodelay.dtsi"
 #include "dra72x-mmc-iodelay.dtsi"
 #include "am57xx-idk-common.dtsi"
+#include "dra7-ipu-dsp-common.dtsi"
 
 / {
 	model = "TI AM5718 IDK";
@@ -148,23 +149,6 @@
 	load-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
 };
 
-&mailbox5 {
-	status = "okay";
-	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
-		status = "okay";
-	};
-	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
-		status = "okay";
-	};
-};
-
-&mailbox6 {
-	status = "okay";
-	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
-		status = "okay";
-	};
-};
-
 &pcie1_rc {
 	status = "okay";
 	gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/am572x-idk-common.dtsi b/arch/arm/boot/dts/am572x-idk-common.dtsi
index ddf123620e96..06f51f5239f0 100644
--- a/arch/arm/boot/dts/am572x-idk-common.dtsi
+++ b/arch/arm/boot/dts/am572x-idk-common.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "am57xx-idk-common.dtsi"
+#include "dra74-ipu-dsp-common.dtsi"
 
 / {
 	memory@0 {
@@ -146,23 +147,3 @@
 	status = "okay";
 	gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
 };
-
-&mailbox5 {
-	status = "okay";
-	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
-		status = "okay";
-	};
-	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
-		status = "okay";
-	};
-};
-
-&mailbox6 {
-	status = "okay";
-	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
-		status = "okay";
-	};
-	mbox_dsp2_ipc3x: mbox_dsp2_ipc3x {
-		status = "okay";
-	};
-};
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index a813a0cf3ff3..33bb89eee658 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -7,6 +7,7 @@
 #include "am5728.dtsi"
 #include "am57xx-commercial-grade.dtsi"
 #include "dra74x-mmc-iodelay.dtsi"
+#include "dra74-ipu-dsp-common.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -583,23 +584,3 @@
 	tx-num-evt = <32>;
 	rx-num-evt = <32>;
 };
-
-&mailbox5 {
-	status = "okay";
-	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
-		status = "okay";
-	};
-	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
-		status = "okay";
-	};
-};
-
-&mailbox6 {
-	status = "okay";
-	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
-		status = "okay";
-	};
-	mbox_dsp2_ipc3x: mbox_dsp2_ipc3x {
-		status = "okay";
-	};
-};
diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
index 23244b5a9942..f89a64cbcd53 100644
--- a/arch/arm/boot/dts/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
  */
 
+#include "dra74-ipu-dsp-common.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/ti-dra7-atl.h>
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi b/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
new file mode 100644
index 000000000000..478a07e29538
--- /dev/null
+++ b/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common IPU and DSP data for TI DRA7xx/AM57xx platforms
+ */
+
+&mailbox5 {
+	status = "okay";
+	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
+		status = "okay";
+	};
+	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
+		status = "okay";
+	};
+};
+
+&mailbox6 {
+	status = "okay";
+	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
+		status = "okay";
+	};
+};
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index 01558a86af82..c84b63bf0fc8 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "dra72x.dtsi"
+#include "dra7-ipu-dsp-common.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/ti-dra7-atl.h>
 
@@ -583,23 +584,6 @@
 	rx-num-evt = <32>;
 };
 
-&mailbox5 {
-	status = "okay";
-	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
-		status = "okay";
-	};
-	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
-		status = "okay";
-	};
-};
-
-&mailbox6 {
-	status = "okay";
-	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
-		status = "okay";
-	};
-};
-
 &pcie1_rc {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi b/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
new file mode 100644
index 000000000000..645063d0df13
--- /dev/null
+++ b/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common IPU and DSP data for TI DRA74x/DRA76x/AM572x/AM574x platforms
+ */
+
+#include "dra7-ipu-dsp-common.dtsi"
+
+&mailbox6 {
+	mbox_dsp2_ipc3x: mbox_dsp2_ipc3x {
+		status = "okay";
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
