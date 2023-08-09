Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83DBA7750EB
	for <lists+linux-omap@lfdr.de>; Wed,  9 Aug 2023 04:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjHICbC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 22:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjHICbC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 22:31:02 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396751BD4;
        Tue,  8 Aug 2023 19:31:00 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3792UmBD105891;
        Tue, 8 Aug 2023 21:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1691548248;
        bh=q8m4wFIz8S/ShwgjvZ0QVP0jEVigDhysdLHI7rwjDus=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=O07jOKZKF86ptD+7ZndcmRUh5zxtnsfFdONcM9YnFJeo1UsMPEvAAtYKnm+6WoFsp
         3ffeXTVNdGYzPRo8gcWhCDNLP/cLKSfqd8/h8Rhbskh7NI4+PBKD9aiGXZLr2bZsUB
         B7cis0Oz9P+VS1EsU5h5Wqwl772oRH6IyyxyV+5Y=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3792UmkY060916
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Aug 2023 21:30:48 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Aug 2023 21:30:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Aug 2023 21:30:46 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3792UkcD120106;
        Tue, 8 Aug 2023 21:30:46 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
CC:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Vibhore Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nishanth Menon <nm@ti.com>
Subject: [PATCH V3 1/2] dt-bindings: opp: Convert ti-omap5-opp-supply to json schema
Date:   Tue, 8 Aug 2023 21:30:44 -0500
Message-ID: <20230809023045.1870410-2-nm@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230809023045.1870410-1-nm@ti.com>
References: <20230809023045.1870410-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rename ti-omap5-opp-supply to be bit more generic omap-opp-supply and
convert the free text binding to json-schema.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V2:
- None.

V2: https://lore.kernel.org/r/20230801233341.1416552-2-nm@ti.com
V1: https://lore.kernel.org/all/20230724153911.1376830-5-nm@ti.com/
 .../bindings/opp/ti,omap-opp-supply.yaml      | 103 ++++++++++++++++++
 .../bindings/opp/ti-omap5-opp-supply.txt      |  63 -----------
 2 files changed, 103 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/opp/ti,omap-opp-supply.yaml
 delete mode 100644 Documentation/devicetree/bindings/opp/ti-omap5-opp-supply.txt

diff --git a/Documentation/devicetree/bindings/opp/ti,omap-opp-supply.yaml b/Documentation/devicetree/bindings/opp/ti,omap-opp-supply.yaml
new file mode 100644
index 000000000000..4db80e418829
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/ti,omap-opp-supply.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/opp/ti,omap-opp-supply.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP compatible OPP supply
+
+description:
+  OMAP5, DRA7, and AM57 family of SoCs have Class0 AVS eFuse registers which
+  contain data that can be used to adjust voltages programmed for some of their
+  supplies for more efficient operation. This binding provides the information
+  needed to read these values and use them to program the main regulator during
+  an OPP transitions.
+
+  Also, some supplies may have an associated vbb-supply which is an Adaptive Body
+  Bias regulator which much be transitioned in a specific sequence with regards
+  to the vdd-supply and clk when making an OPP transition. By supplying two
+  regulators to the device that will undergo OPP transitions we can make use
+  of the multi regulator binding that is part of the OPP core described
+  to describe both regulators needed by the platform.
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+
+properties:
+  $nodename:
+    pattern: '^opp-supply(@[0-9a-f]+)?$'
+
+  compatible:
+    oneOf:
+      - description: Basic OPP supply controlling VDD and VBB
+        items:
+          - const: ti,omap-opp-supply
+      - description: OMAP5+ optimized voltages in efuse(Class 0) VDD along with
+          VBB.
+        items:
+          - const: ti,omap5-opp-supply
+      - description: OMAP5+ optimized voltages in efuse(class0) VDD but no VBB
+        items:
+          - const: ti,omap5-core-opp-supply
+
+  reg:
+    maxItems: 1
+
+  ti,absolute-max-voltage-uv:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Absolute maximum voltage for the OPP supply in micro-volts.
+    minimum: 750000
+    maximum: 1500000
+
+  ti,efuse-settings:
+    description: An array of u32 tuple items providing information about
+      optimized efuse configuration.
+    minItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        -
+          description: Reference voltage in micro-volts (OPP Voltage)
+          minimum: 750000
+          maximum: 1500000
+          multipleOf: 10000
+        -
+          description: efuse offset where the optimized voltage is located
+          multipleOf: 4
+          maximum: 256
+
+required:
+  - compatible
+  - ti,absolute-max-voltage-uv
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: ti,omap-opp-supply
+    then:
+      required:
+        - reg
+        - ti,efuse-settings
+
+additionalProperties: false
+
+examples:
+  - |
+    opp-supply {
+        compatible = "ti,omap-opp-supply";
+        ti,absolute-max-voltage-uv = <1375000>;
+    };
+  - |
+    opp-supply@4a003b20 {
+        compatible = "ti,omap5-opp-supply";
+        reg = <0x4a003b20 0x8>;
+        ti,efuse-settings =
+            /* uV   offset */
+            <1060000 0x0>,
+            <1160000 0x4>,
+            <1210000 0x8>;
+        ti,absolute-max-voltage-uv = <1500000>;
+    };
diff --git a/Documentation/devicetree/bindings/opp/ti-omap5-opp-supply.txt b/Documentation/devicetree/bindings/opp/ti-omap5-opp-supply.txt
deleted file mode 100644
index b70d326117cd..000000000000
--- a/Documentation/devicetree/bindings/opp/ti-omap5-opp-supply.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-Texas Instruments OMAP compatible OPP supply description
-
-OMAP5, DRA7, and AM57 family of SoCs have Class0 AVS eFuse registers which
-contain data that can be used to adjust voltages programmed for some of their
-supplies for more efficient operation. This binding provides the information
-needed to read these values and use them to program the main regulator during
-an OPP transitions.
-
-Also, some supplies may have an associated vbb-supply which is an Adaptive Body
-Bias regulator which much be transitioned in a specific sequence with regards
-to the vdd-supply and clk when making an OPP transition. By supplying two
-regulators to the device that will undergo OPP transitions we can make use
-of the multi regulator binding that is part of the OPP core described here [1]
-to describe both regulators needed by the platform.
-
-[1] Documentation/devicetree/bindings/opp/opp-v2.yaml
-
-Required Properties for Device Node:
-- vdd-supply: phandle to regulator controlling VDD supply
-- vbb-supply: phandle to regulator controlling Body Bias supply
-	      (Usually Adaptive Body Bias regulator)
-
-Required Properties for opp-supply node:
-- compatible: Should be one of:
-	"ti,omap-opp-supply" - basic OPP supply controlling VDD and VBB
-	"ti,omap5-opp-supply" - OMAP5+ optimized voltages in efuse(class0)VDD
-			    along with VBB
-	"ti,omap5-core-opp-supply" - OMAP5+ optimized voltages in efuse(class0) VDD
-			    but no VBB.
-- reg: Address and length of the efuse register set for the device (mandatory
-	only for "ti,omap5-opp-supply")
-- ti,efuse-settings: An array of u32 tuple items providing information about
-	optimized efuse configuration. Each item consists of the following:
-	volt: voltage in uV - reference voltage (OPP voltage)
-	efuse_offseet: efuse offset from reg where the optimized voltage is stored.
-- ti,absolute-max-voltage-uv: absolute maximum voltage for the OPP supply.
-
-Example:
-
-/* Device Node (CPU)  */
-cpus {
-	cpu0: cpu@0 {
-		device_type = "cpu";
-
-		...
-
-		vdd-supply = <&vcc>;
-		vbb-supply = <&abb_mpu>;
-	};
-};
-
-/* OMAP OPP Supply with Class0 registers */
-opp_supply_mpu: opp_supply@4a003b20 {
-	compatible = "ti,omap5-opp-supply";
-	reg = <0x4a003b20 0x8>;
-	ti,efuse-settings = <
-	/* uV   offset */
-	1060000 0x0
-	1160000 0x4
-	1210000 0x8
-	>;
-	ti,absolute-max-voltage-uv = <1500000>;
-};
-- 
2.40.0

