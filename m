Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EA725537E
	for <lists+linux-omap@lfdr.de>; Fri, 28 Aug 2020 06:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgH1EPD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Aug 2020 00:15:03 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54794 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgH1EPC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 Aug 2020 00:15:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07S4EqSs004217;
        Thu, 27 Aug 2020 23:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598588092;
        bh=ksMDBIEYDIQj+YhE72Vk5Tv1UMCKHZejKBgmKasY+So=;
        h=From:To:CC:Subject:Date;
        b=pKMdyDGBxj8VVeIEiXcX6qZbYNzUrWq549XPILUxUS61+xoVgc7CXfwuCpTcdhoS+
         UDcJ/SnHR+V3Q1QfhLieubgxgSOV9srjkmlg4lqGxp7ue4rkSz7SDHNIaGY3drHbSR
         PaKsO3HOrO6Gyujf6XMbneiG9MaeJ9L2Qy0seitE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07S4Eq2p124957;
        Thu, 27 Aug 2020 23:14:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 23:14:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 23:14:52 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07S4EqIX024893;
        Thu, 27 Aug 2020 23:14:52 -0500
Received: from localhost ([10.250.69.147])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07S4Eqxm079287;
        Thu, 27 Aug 2020 23:14:52 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH] dt-bindings: hwlock: omap: Convert binding to YAML
Date:   Thu, 27 Aug 2020 23:14:47 -0500
Message-ID: <20200828041447.5900-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert the current OMAP hwspinlock binding from text format to YAML
format/DT schema, and delete the legacy text binding file.

The new YAML binding conversion is a slightly updated version compared
to the original. The legacy "ti,hwmods" property is now obsolete and
is dropped altogether, and the K3 example is updated to showcase the
actual dts node usage.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Tony,

Only warning with dtbs_check is on dm816x. What's the plan for
converting that platform to ti,sysc?

regards
Suman

 .../bindings/hwlock/omap-hwspinlock.txt       | 41 ----------
 .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 76 +++++++++++++++++++
 2 files changed, 76 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt
 create mode 100644 Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt
deleted file mode 100644
index 8d365f89694c..000000000000
--- a/Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-TI HwSpinlock for OMAP and K3 based SoCs
-=========================================
-
-Required properties:
-- compatible:		Should be one of the following,
-			  "ti,omap4-hwspinlock" for
-				OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
-			  "ti,am654-hwspinlock" for
-				K3 AM65x and J721E SoCs
-- reg:			Contains the hwspinlock module register address space
-			(base address and length)
-- ti,hwmods:		Name of the hwmod associated with the hwspinlock device
-			(for OMAP architecture based SoCs only)
-- #hwlock-cells:	Should be 1. The OMAP hwspinlock users will use a
-			0-indexed relative hwlock number as the argument
-			specifier value for requesting a specific hwspinlock
-			within a hwspinlock bank.
-
-Please look at the generic hwlock binding for usage information for consumers,
-"Documentation/devicetree/bindings/hwlock/hwlock.txt"
-
-Example:
-
-1. OMAP4 SoCs
-hwspinlock: spinlock@4a0f6000 {
-	compatible = "ti,omap4-hwspinlock";
-	reg = <0x4a0f6000 0x1000>;
-	ti,hwmods = "spinlock";
-	#hwlock-cells = <1>;
-};
-
-2. AM65x SoCs and J721E SoCs
-&cbass_main {
-	cbass_main_navss: interconnect0 {
-		hwspinlock: spinlock@30e00000 {
-			compatible = "ti,am654-hwspinlock";
-			reg = <0x00 0x30e00000 0x00 0x1000>;
-			#hwlock-cells = <1>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
new file mode 100644
index 000000000000..2765758d95e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/ti,omap-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI HwSpinlock for OMAP and K3 based SoCs
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,omap4-hwspinlock  # for OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
+      - ti,am654-hwspinlock  # for K3 AM65x, J721E and J7200 SoCs
+
+  reg:
+    maxItems: 1
+
+  "#hwlock-cells":
+    const: 1
+    description: |
+      The OMAP hwspinlock users will use a 0-indexed relative hwlock number as
+      the argument specifier value for requesting a specific hwspinlock within
+      a hwspinlock bank.
+
+      Please look at the generic hwlock binding for usage information for
+      consumers, "Documentation/devicetree/bindings/hwlock/hwlock.txt"
+
+required:
+  - compatible
+  - reg
+  - "#hwlock-cells"
+
+additionalProperties: false
+
+examples:
+
+  - |
+    /* OMAP4 SoCs */
+    hwspinlock: spinlock@4a0f6000 {
+        compatible = "ti,omap4-hwspinlock";
+        reg = <0x4a0f6000 0x1000>;
+        #hwlock-cells = <1>;
+    };
+
+  - |
+    / {
+        /* K3 AM65x SoCs */
+        model = "Texas Instruments K3 AM654 SoC";
+        compatible = "ti,am654";
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        bus@100000 {
+            compatible = "simple-bus";
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x00 0x00100000 0x00 0x00100000 0x00 0x00020000>, /* ctrl mmr */
+                     <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>; /* Main NavSS */
+
+            main_navss@30800000 {
+                compatible = "simple-mfd";
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges = <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>;
+
+                spinlock@30e00000 {
+                    compatible = "ti,am654-hwspinlock";
+                    reg = <0x00 0x30e00000 0x00 0x1000>;
+                    #hwlock-cells = <1>;
+                };
+            };
+        };
+    };
-- 
2.28.0

