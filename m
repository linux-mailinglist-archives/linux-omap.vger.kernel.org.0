Return-Path: <linux-omap+bounces-1401-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022B8D1516
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 09:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31E181C21C8D
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 07:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD93171750;
	Tue, 28 May 2024 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="3Vuv5frC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5E6F079;
	Tue, 28 May 2024 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716880429; cv=none; b=W/p8WhyCLordBc98a3EkKsDmhtX6QVoOzuzrP3tqXxajigH38fruP2Vr8U1zZlOW5XOuJYfWvSrSBTtzq+zLGJS5tzrNbdItqfD83QxWKrY0+NJGsbq22tUb+RHql7GECT4xPqDRPlcxbILP2qx5rH3Tx4UYVkOUVZSCyemv30Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716880429; c=relaxed/simple;
	bh=RYfVNlAKOzTzjlPX+tX2W1nJbTXUoYMb5XzPX8MB2wM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Uonxzbrqoir9Gg9eUkWki89iGqSA/ubZyPwFRyvs7W6t43uK01i+AibG5odzkyvatDD+DD/r9mutntEg1BjfBU2LUKGAJTaFsNVVfxGu/oTvvkIPMWhI7DENsyPFZNvGArxcK6qnEnNsfyarLRJhMElTrQ3WlWosq4Y3limVcfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=3Vuv5frC; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sBqmi-0086Ls-2v;
	Tue, 28 May 2024 08:58:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GL+aZS1f7q0b9Vpx0YmIWFbutOGrFykefVkuOGBy/G8=; b=3Vuv5frC4zv/TvdgWhbl+mSAcf
	ZgxF/YGtirY3f54diz0LAs2Q8czQIl6Uy7xppDy4OM34O1haplaj6sJKwWKhkdoyOmEcl/NShZtbJ
	ivAj/UadZ06nan5QHMyC8WyWIOFahZZrOIj6n5nqlMRddMYVXdX2KqMLV4coEc7MKPMUhTbVrrI0n
	QlAneEoKI33l/gzjobsTKCmbosvbiAc5Q02ZWcfSX6bqGfqfEfZvOsQQbFYMtVLkGl70KOsUH/woN
	7a5UGKSjBUsbVOmaRMLv/jvoCde+xSrZwmhap3beHXXoTfhWIfdcF44HDEoguDoYFijgRQ/ZfJJBQ
	Y3/NJGZQ==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sBqmf-001szJ-1E;
	Tue, 28 May 2024 08:58:10 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sBqmg-008EX9-0g;
	Tue, 28 May 2024 08:58:10 +0200
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
Subject: [RFC PATCH] dt-bindings: regulator: twl-regulator: convert to yaml
Date: Tue, 28 May 2024 08:57:56 +0200
Message-Id: <20240528065756.1962482-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the regulator bindings to yaml files. To allow only the regulator
compatible corresponding to the toplevel mfd compatible, split the file
into one per device.

To not need to allow any subnode name, specify clearly node names
for all the regulators.

Drop one twl5030 compatible due to no documentation on mfd side and no
users of the twl5030.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Reason for being RFC:
the integration into ti,twl.yaml seems not to work as expected
make dt_binding_check crashes without any clear error message
if used on the ti,twl.yaml

 .../devicetree/bindings/mfd/ti,twl.yaml       |   4 +-
 .../regulator/ti,twl4030-regulator.yaml       | 402 ++++++++++++++++++
 .../regulator/ti,twl6030-regulator.yaml       | 292 +++++++++++++
 .../regulator/ti,twl6032-regulator.yaml       | 238 +++++++++++
 .../bindings/regulator/twl-regulator.txt      |  80 ----
 5 files changed, 935 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regulator.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
index c2357fecb56cc..4ced6e471d338 100644
--- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
@@ -50,7 +50,7 @@ allOf:
           properties:
             compatible:
               const: ti,twl4030-wdt
-
+        $ref: /schemas/regulator/ti,twl4030-regulator.yaml
   - if:
       properties:
         compatible:
@@ -63,6 +63,7 @@ allOf:
           properties:
             compatible:
               const: ti,twl6030-gpadc
+        $ref: /schemas/regulator/ti,twl6030-regulator.yaml
   - if:
       properties:
         compatible:
@@ -75,6 +76,7 @@ allOf:
           properties:
             compatible:
               const: ti,twl6032-gpadc
+        $ref: /schemas/regulator/ti,twl6032-regulator.yaml
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml b/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
new file mode 100644
index 0000000000000..9623c110605ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
@@ -0,0 +1,402 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,twl4030-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Regulators in the TWL4030 PMIC
+
+maintainers:
+  - Andreas Kemnade <andreas@kemnade.info>
+
+properties:
+  regulator-vaux1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vaux1"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vaux2:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vaux2"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vaux3:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vaux3"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vaux4:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vaux4"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vmmc1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vmmc1"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vmmc2:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vmmc2"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vpll1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vpll1"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vpll2:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vpll2"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vsim:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vsim"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vdac:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vdac"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vintana2:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vintana2"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vio:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vio"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vdd1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vdd1"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vdd2:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vdd2"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vintana1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vintana1"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vintdig:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vintdig"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vusb1v5:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vusb1v5"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vusb1v8:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vusb1v8"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+  regulator-vusb3v1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl4030-vusb3v1"
+
+      regulator-initial-mode:
+        items:
+          - items:
+              enum:
+                - 0x08 # Sleep mode, the nominal output voltage is maintained
+                       # with low power consumption with low load current capability
+                - 0x0e # Active mode, the regulator can deliver its nominal output
+                       # voltage with full-load current capability
+
+    required:
+      - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    regulator-vaux1 {
+        compatible = "ti,twl4030-vaux1";
+        regulator-min-microvolt  = <1000000>;
+        regulator-max-microvolt  = <3000000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml b/Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml
new file mode 100644
index 0000000000000..bda4c83a789d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml
@@ -0,0 +1,292 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,twl6030-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Regulators in the TWL6030 PMIC
+
+maintainers:
+  - Andreas Kemnade <andreas@kemnade.info>
+
+properties:
+  regulator-vaux1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vaux1"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vaux2:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vaux2"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vaux3:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vaux3"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vmmc:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vmmc"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vpp:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vpp"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vusim:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vusim"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vana:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vana"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vcxio:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vcxio"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vdac:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vdac"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vusb:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vusb"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-v1v8:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-v1v8"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-v2v1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-v2v1"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vdd1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vdd1"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vdd2:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vdd2"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vdd3:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6030-vdd3"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    regulator-vaux1 {
+        compatible = "ti,twl6030-vaux1";
+        regulator-min-microvolt  = <1000000>;
+        regulator-max-microvolt  = <3000000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml b/Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml
new file mode 100644
index 0000000000000..2e9871e178151
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml
@@ -0,0 +1,238 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,twl6032-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Regulators in the TWL6032 PMIC
+
+maintainers:
+  - Andreas Kemnade <andreas@kemnade.info>
+
+properties:
+  regulator-ldo1:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldo1"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-ldo2:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldo2"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-ldo3:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldo3"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-ldo4:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldo4"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-ldo5:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldo5"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-ldo6:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldo6"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-ldo7:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldo7"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-ldoln:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldoln"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-ldousb:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-ldousb"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-smps3:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-smps3"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-smps4:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-smps4"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+  regulator-vio:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: "ti,twl6032-vio"
+      ti,retain-on-reset:
+        description:
+          Does not turn off the supplies during warm
+          reset. Could be needed for VMMC, as TWL6030
+          reset sequence for this signal does not comply
+          with the SD specification.
+        type: boolean
+
+    required:
+      - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    regulator-ldo1 {
+        compatible = "ti,twl6032-ldo1";
+        regulator-min-microvolt  = <1000000>;
+        regulator-max-microvolt  = <3000000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/twl-regulator.txt b/Documentation/devicetree/bindings/regulator/twl-regulator.txt
deleted file mode 100644
index 549f80436debc..0000000000000
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


