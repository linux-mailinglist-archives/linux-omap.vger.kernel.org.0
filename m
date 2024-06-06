Return-Path: <linux-omap+bounces-1482-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26C8FE508
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 13:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9FF61F24C24
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 11:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F1D194C8A;
	Thu,  6 Jun 2024 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="HuSNjaMF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4B15216D;
	Thu,  6 Jun 2024 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717672587; cv=none; b=eOmxa6l9cZFVZNztb6bmVGq4LDYgXnCL6+lM5Hq1vDmckuAs8Z4YJprEd145fDNya04eaYF1b3hbfxM6R3PmMDXdIeiAoQLH3ohqz8Oy9AlJHFrgxKIDxMsjwucbixsc6DYe+fsdfW39R6jEB1fUy4Jq4vxfk+4wPeuH+kjtar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717672587; c=relaxed/simple;
	bh=p3EvnH4BET0IOoYYG9hxFT/s+WgmFS0CvMHGfLThSVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AGBiV4j1s/1EDQV/jl+WT7hrLmprxPINUfeR2+tryMqyF3WohtYv+yQyyLJc3Ib5FTeUlbX2g+aj3YYO3mubwE9IHjnN12SKGbcUGSICJHZa4D7Oflmzej5HdXe8j/BQ7LkHjLfV+hRbuC2iqbzQkoZIlJjXzBKjV4eih6DuepM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=HuSNjaMF; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sFB6N-008zIr-2T;
	Thu, 06 Jun 2024 13:16:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=92o59J/uFvlSSUshSXQN9vqLEvcYswnWCXBWrPkGIVQ=; b=HuSNjaMF8Bfhnuc/4bLGqcl03U
	gF/tuGq7pMK/uMorD8GXRyewDnkG/5fEpebmqHD2HxccTbW33GOKU1srT2Z58t8ct3wtNUbpdYHD6
	HOGeyxVLrAt74eo6UtWxvuA9248P6NjMNbsA5lyKarm+T6vHNtua+fpuA46rVEX1YRDon7zx3eV3E
	7AoUmunxUTyZtwcu2E62pvGU19DXwfqNn19H2u25xNlPO0G02PCkdPbVqp8VbVYCJhSpgzgstXXdp
	s8mmhe8xgUISGliehvro5dlvNY7AeSKGvZlsHujkVjD8B+3BZykAkq8QtxGiX8jDU+Lr7wolvEZkm
	md+c6Yrg==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sFB6M-002mNF-0D;
	Thu, 06 Jun 2024 13:16:15 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sFB6M-001YdY-2t;
	Thu, 06 Jun 2024 13:16:14 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	andreas@kemnade.info,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4] dt-bindings: regulator: twl-regulator: convert to yaml
Date: Thu,  6 Jun 2024 13:16:11 +0200
Message-Id: <20240606111611.371463-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the regulator bindings to yaml.

Drop one twl5030 compatible due to no documentation on mfd side and no
users of the twl5030.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v4:
- remove a sentence in the commit message which only applies
  to v1 design
- add R-by

Changes in v3:
- define regulator stuff in toplevel
- simplified regulator-inital-mode
- extended example to contain both regulator-initial-mode and
  retain-on-reset

Changes in v2:
- add regulators directly to ti,twl.yaml
- less restrictions on regulator node name

 .../devicetree/bindings/mfd/ti,twl.yaml       | 166 +++++++++++++++++-
 .../bindings/regulator/twl-regulator.txt      |  80 ---------
 2 files changed, 164 insertions(+), 82 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regulator.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
index c2357fecb56c..2cbdd238f48f 100644
--- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
@@ -22,6 +22,32 @@ allOf:
           contains:
             const: ti,twl4030
     then:
+      patternProperties:
+        "^regulator-":
+          properties:
+            compatible:
+              enum:
+                - ti,twl4030-vaux1
+                - ti,twl4030-vaux2
+                - ti,twl4030-vaux3
+                - ti,twl4030-vaux4
+                - ti,twl4030-vmmc1
+                - ti,twl4030-vmmc2
+                - ti,twl4030-vpll1
+                - ti,twl4030-vpll2
+                - ti,twl4030-vsim
+                - ti,twl4030-vdac
+                - ti,twl4030-vintana2
+                - ti,twl4030-vio
+                - ti,twl4030-vdd1
+                - ti,twl4030-vdd2
+                - ti,twl4030-vintana1
+                - ti,twl4030-vintdig
+                - ti,twl4030-vusb1v5
+                - ti,twl4030-vusb1v8
+                - ti,twl4030-vusb3v1
+            ti,retain-on-reset: false
+
       properties:
         madc:
           type: object
@@ -50,13 +76,34 @@ allOf:
           properties:
             compatible:
               const: ti,twl4030-wdt
-
   - if:
       properties:
         compatible:
           contains:
             const: ti,twl6030
     then:
+      patternProperties:
+        "^regulator-":
+          properties:
+            compatible:
+              enum:
+                - ti,twl6030-vaux1
+                - ti,twl6030-vaux2
+                - ti,twl6030-vaux3
+                - ti,twl6030-vmmc
+                - ti,twl6030-vpp
+                - ti,twl6030-vusim
+                - ti,twl6030-vana
+                - ti,twl6030-vcxio
+                - ti,twl6030-vdac
+                - ti,twl6030-vusb
+                - ti,twl6030-v1v8
+                - ti,twl6030-v2v1
+                - ti,twl6030-vdd1
+                - ti,twl6030-vdd2
+                - ti,twl6030-vdd3
+            regulator-initial-mode: false
+
       properties:
         gpadc:
           type: object
@@ -69,6 +116,25 @@ allOf:
           contains:
             const: ti,twl6032
     then:
+      patternProperties:
+        "^regulator-":
+          properties:
+            compatible:
+              enum:
+                - ti,twl6032-ldo1
+                - ti,twl6032-ldo2
+                - ti,twl6032-ldo3
+                - ti,twl6032-ldo4
+                - ti,twl6032-ldo5
+                - ti,twl6032-ldo6
+                - ti,twl6032-ldo7
+                - ti,twl6032-ldoln
+                - ti,twl6032-ldousb
+                - ti,twl6032-smps3
+                - ti,twl6032-smps4
+                - ti,twl6032-vio
+            regulator-initial-mode: false
+
       properties:
         gpadc:
           type: object
@@ -112,6 +178,27 @@ properties:
       interrupts:
         maxItems: 1
 
+patternProperties:
+  "^regulator-":
+    type: object
+    unevaluatedProperties: false
+    $ref: /schemas/regulator/regulator.yaml
+    properties:
+      compatible: true
+      regulator-initial-mode:
+        enum:
+          - 0x08 # Sleep mode, the nominal output voltage is maintained
+                 # with low power consumption with low load current capability
+          - 0x0e # Active mode, the regulator can deliver its nominal output
+                 # voltage with full-load current capability
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
 unevaluatedProperties: false
 
 required:
@@ -131,9 +218,84 @@ examples:
         compatible = "ti,twl6030";
         reg = <0x48>;
         interrupts = <39>; /* IRQ_SYS_1N cascaded to gic */
+        interrupt-parent = <&gic>;
         interrupt-controller;
         #interrupt-cells = <1>;
-        interrupt-parent = <&gic>;
+
+        gpadc {
+          compatible = "ti,twl6030-gpadc";
+          interrupts = <6>;
+        };
+
+        rtc {
+          compatible = "ti,twl4030-rtc";
+          interrupts = <8>;
+        };
+
+        regulator-vaux1 {
+          compatible = "ti,twl6030-vaux1";
+          regulator-min-microvolt = <1000000>;
+          regulator-max-microvolt = <3000000>;
+        };
+
+        regulator-vmmc1 {
+          compatible = "ti,twl6030-vmmc";
+          ti,retain-on-reset;
+        };
       };
     };
 
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@48 {
+        compatible = "ti,twl4030";
+        reg = <0x48>;
+        interrupts = <7>; /* SYS_NIRQ cascaded to intc */
+        interrupt-parent = <&intc>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        bci {
+          compatible = "ti,twl4030-bci";
+          interrupts = <9>, <2>;
+          bci3v1-supply = <&vusb3v1>;
+          io-channels = <&twl_madc 11>;
+          io-channel-names = "vac";
+        };
+
+        twl_madc: madc {
+          compatible = "ti,twl4030-madc";
+          interrupts = <3>;
+          #io-channel-cells = <1>;
+        };
+
+        pwrbutton {
+          compatible = "ti,twl4030-pwrbutton";
+          interrupts = <8>;
+        };
+
+        rtc {
+          compatible = "ti,twl4030-rtc";
+          interrupts = <11>;
+        };
+
+        regulator-vaux1 {
+          compatible = "ti,twl4030-vaux1";
+          regulator-min-microvolt = <1000000>;
+          regulator-max-microvolt = <3000000>;
+          regulator-initial-mode = <0xe>;
+        };
+
+        vusb3v1: regulator-vusb3v1 {
+          compatible = "ti,twl4030-vusb3v1";
+        };
+
+        watchdog {
+          compatible = "ti,twl4030-wdt";
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/twl-regulator.txt b/Documentation/devicetree/bindings/regulator/twl-regulator.txt
deleted file mode 100644
index 549f80436deb..000000000000
--- a/Documentation/devicetree/bindings/regulator/twl-regulator.txt
+++ /dev/null
@@ -1,80 +0,0 @@
-TWL family of regulators
-
-Required properties:
-For twl6030 regulators/LDOs
-- compatible:
-  - "ti,twl6030-vaux1" for VAUX1 LDO
-  - "ti,twl6030-vaux2" for VAUX2 LDO
-  - "ti,twl6030-vaux3" for VAUX3 LDO
-  - "ti,twl6030-vmmc" for VMMC LDO
-  - "ti,twl6030-vpp" for VPP LDO
-  - "ti,twl6030-vusim" for VUSIM LDO
-  - "ti,twl6030-vana" for VANA LDO
-  - "ti,twl6030-vcxio" for VCXIO LDO
-  - "ti,twl6030-vdac" for VDAC LDO
-  - "ti,twl6030-vusb" for VUSB LDO
-  - "ti,twl6030-v1v8" for V1V8 LDO
-  - "ti,twl6030-v2v1" for V2V1 LDO
-  - "ti,twl6030-vdd1" for VDD1 SMPS
-  - "ti,twl6030-vdd2" for VDD2 SMPS
-  - "ti,twl6030-vdd3" for VDD3 SMPS
-For twl6032 regulators/LDOs
-- compatible:
-  - "ti,twl6032-ldo1" for LDO1 LDO
-  - "ti,twl6032-ldo2" for LDO2 LDO
-  - "ti,twl6032-ldo3" for LDO3 LDO
-  - "ti,twl6032-ldo4" for LDO4 LDO
-  - "ti,twl6032-ldo5" for LDO5 LDO
-  - "ti,twl6032-ldo6" for LDO6 LDO
-  - "ti,twl6032-ldo7" for LDO7 LDO
-  - "ti,twl6032-ldoln" for LDOLN LDO
-  - "ti,twl6032-ldousb" for LDOUSB LDO
-  - "ti,twl6032-smps3" for SMPS3 SMPS
-  - "ti,twl6032-smps4" for SMPS4 SMPS
-  - "ti,twl6032-vio" for VIO SMPS
-For twl4030 regulators/LDOs
-- compatible:
-  - "ti,twl4030-vaux1" for VAUX1 LDO
-  - "ti,twl4030-vaux2" for VAUX2 LDO
-  - "ti,twl5030-vaux2" for VAUX2 LDO
-  - "ti,twl4030-vaux3" for VAUX3 LDO
-  - "ti,twl4030-vaux4" for VAUX4 LDO
-  - "ti,twl4030-vmmc1" for VMMC1 LDO
-  - "ti,twl4030-vmmc2" for VMMC2 LDO
-  - "ti,twl4030-vpll1" for VPLL1 LDO
-  - "ti,twl4030-vpll2" for VPLL2 LDO
-  - "ti,twl4030-vsim" for VSIM LDO
-  - "ti,twl4030-vdac" for VDAC LDO
-  - "ti,twl4030-vintana2" for VINTANA2 LDO
-  - "ti,twl4030-vio" for VIO LDO
-  - "ti,twl4030-vdd1" for VDD1 SMPS
-  - "ti,twl4030-vdd2" for VDD2 SMPS
-  - "ti,twl4030-vintana1" for VINTANA1 LDO
-  - "ti,twl4030-vintdig" for VINTDIG LDO
-  - "ti,twl4030-vusb1v5" for VUSB1V5 LDO
-  - "ti,twl4030-vusb1v8" for VUSB1V8 LDO
-  - "ti,twl4030-vusb3v1" for VUSB3V1 LDO
-
-Optional properties:
-- Any optional property defined in bindings/regulator/regulator.txt
-For twl4030 regulators/LDOs:
- - regulator-initial-mode:
-  - 0x08 - Sleep mode, the nominal output voltage is maintained with low power
-           consumption with low load current capability.
-  - 0x0e - Active mode, the regulator can deliver its nominal output voltage
-           with full-load current capability.
-
-Example:
-
-	xyz: regulator@0 {
-		compatible = "ti,twl6030-vaux1";
-		regulator-min-microvolt  = <1000000>;
-		regulator-max-microvolt  = <3000000>;
-	};
-
-For twl6030 regulators/LDOs:
-
- - ti,retain-on-reset: Does not turn off the supplies during warm
-                       reset. Could be needed for VMMC, as TWL6030
-                       reset sequence for this signal does not comply
-                       with the SD specification.
-- 
2.39.2


