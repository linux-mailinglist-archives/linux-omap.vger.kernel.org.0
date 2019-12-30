Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46A6312D46F
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 21:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbfL3UVY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 15:21:24 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:26535 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbfL3UVY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Dec 2019 15:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577737279;
        s=strato-dkim-0002; d=dawncrow.de;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=1fEvtm3yODCntar2DrEwrxk34L4DYJSOx40B0uTFp9g=;
        b=niHpVfg0Pbdz3Ykxi5IS2wDFZ08LhM/foyiFmyGXRBq+UdluPJiMLl25+/ygbj0urC
        JGUIwt04iLlfX3SNyY7zloat2KUI8zg2/d6ws73GEVRUsLj5zPRpAjnT5S9ULjMb/Mm5
        +rnUtzs+B8n7Gdp8MGCDh/uvpIcNoz4GRVAVZHUz5Xh8RdTJoArhnTWgX/n9t3FSQYmX
        xD7ymFstRb92V1vVX466mQUmjnAryR8DIBkx7a327ely54nlVnCd4Cy3j57wKyksTCqL
        oWCdO028L2AbAdTOL2D38dm/rhfpOFcBvEylHhHfgHx7bpTxkf0dZZs69TT7p0qqTlBm
        t/AA==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOaLnXzn3ovD+FrFdXyk="
X-RZG-CLASS-ID: mo00
Received: from tesla.fritz.box
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id I099d1vBUKL4G7z
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 30 Dec 2019 21:21:04 +0100 (CET)
From:   =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
To:     linux@arm.linux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com,
        bcousson@baylibre.com, tony@atomide.com, linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: dts: Move interconnect target module for omap3 sgx to separate dtsi files
Date:   Mon, 30 Dec 2019 21:20:36 +0100
Message-Id: <20191230202037.28836-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Only dm3730 and am3715 come with SGX support

Signed-off-by: André Hentschel <nerv@dawncrow.de>
---

I changed some dtsi files where I could be sure it's dm3730

 arch/arm/boot/dts/am3715.dtsi            | 38 ++++++++++++++++++++++++
 arch/arm/boot/dts/dm3730.dtsi            |  6 ++++
 arch/arm/boot/dts/omap3-gta04.dtsi       |  2 +-
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi  |  2 +-
 arch/arm/boot/dts/omap3-pandora-1ghz.dts |  2 +-
 arch/arm/boot/dts/omap36xx.dtsi          | 28 -----------------
 6 files changed, 47 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm/boot/dts/am3715.dtsi
 create mode 100644 arch/arm/boot/dts/dm3730.dtsi

diff --git a/arch/arm/boot/dts/am3715.dtsi b/arch/arm/boot/dts/am3715.dtsi
new file mode 100644
index 000000000000..f53d1f24dc53
--- /dev/null
+++ b/arch/arm/boot/dts/am3715.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 André Hentschel <nerv@dawncrow.de>
+ */
+
+#include "omap36xx.dtsi"
+
+/ {
+	ocp@68000000 {
+		/*
+		 * Note that the sysconfig register layout is a subset of the
+		 * "ti,sysc-omap4" type register with just sidle and midle bits
+		 * available while omap34xx has "ti,sysc-omap2" type sysconfig.
+		 */
+		sgx_module: target-module@50000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5000fe00 0x4>,
+			      <0x5000fe10 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&sgx_fck>, <&sgx_ick>;
+			clock-names = "fck", "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x50000000 0x2000000>;
+
+			/*
+			 * Closed source PowerVR driver, no child device
+			 * binding or driver in mainline
+			 */
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/dm3730.dtsi b/arch/arm/boot/dts/dm3730.dtsi
new file mode 100644
index 000000000000..8d278499965b
--- /dev/null
+++ b/arch/arm/boot/dts/dm3730.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 André Hentschel <nerv@dawncrow.de>
+ */
+
+#include "am3715.dtsi"
diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index b6ef1a7ac8a4..564bce9164f9 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -6,7 +6,7 @@
  */
 /dts-v1/;
 
-#include "omap36xx.dtsi"
+#include "dm3730.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm/boot/dts/omap3-lilly-a83x.dtsi b/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
index c22833d4e568..1086cde24ba5 100644
--- a/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
+++ b/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
@@ -3,7 +3,7 @@
  * Copyright (C) 2014 Christoph Fritz <chf.fritzc@googlemail.com>
  */
 
-#include "omap36xx.dtsi"
+#include "dm3730.dtsi"
 
 / {
 	model = "INCOstartec LILLY-A83X module (DM3730)";
diff --git a/arch/arm/boot/dts/omap3-pandora-1ghz.dts b/arch/arm/boot/dts/omap3-pandora-1ghz.dts
index 81b957f33c9f..da71dd68a84a 100644
--- a/arch/arm/boot/dts/omap3-pandora-1ghz.dts
+++ b/arch/arm/boot/dts/omap3-pandora-1ghz.dts
@@ -10,7 +10,7 @@
 
 /dts-v1/;
 
-#include "omap36xx.dtsi"
+#include "dm3730.dtsi"
 #include "omap3-pandora-common.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 1e552f08f120..6fb23ada1f64 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -139,34 +139,6 @@
 				interrupts = <18>;
 			};
 		};
-
-		/*
-		 * Note that the sysconfig register layout is a subset of the
-		 * "ti,sysc-omap4" type register with just sidle and midle bits
-		 * available while omap34xx has "ti,sysc-omap2" type sysconfig.
-		 */
-		sgx_module: target-module@50000000 {
-			compatible = "ti,sysc-omap4", "ti,sysc";
-			reg = <0x5000fe00 0x4>,
-			      <0x5000fe10 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-midle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
-			clocks = <&sgx_fck>, <&sgx_ick>;
-			clock-names = "fck", "ick";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x50000000 0x2000000>;
-
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
-		};
 	};
 
 	thermal_zones: thermal-zones {
-- 
2.17.1

