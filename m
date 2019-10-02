Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB48C8EAD
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 18:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJBQn7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 12:43:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:48188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfJBQn6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 12:43:58 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A8D921D82;
        Wed,  2 Oct 2019 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570034638;
        bh=hqR3oR3039Xuwre18nY2z8JHLqphmqqXmB0IT7So0Ms=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=t8txsmzdKtwkKtIPW27FgVn8DCokS8ighnxArfHg3lb+vpNBMtYfxQkwp1gMoth/m
         Gh2t90tGleZk6GN1AlkAgL7QMalP8JgKs31ZSH0jyjRWi1xKlOx3o0BC+iBCjJHfE3
         B8UO2R6Cuz+IlJGAH5X0Wiv2HZQSeJ3cEGGgGOns=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 02/10] dt-bindings: sram: Convert Samsung Exynos SYSRAM bindings to json-schema
Date:   Wed,  2 Oct 2019 18:43:08 +0200
Message-Id: <20191002164316.14905-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert Samsung Exynos SYSRAM bindings to DT schema format using
json-schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Use sram as name of node in example.

Changes since v1:
1. Indent example with four spaces (more readable).
---
 .../devicetree/bindings/sram/samsung-sram.txt | 38 ------------
 .../bindings/sram/samsung-sram.yaml           | 58 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sram/samsung-sram.txt
 create mode 100644 Documentation/devicetree/bindings/sram/samsung-sram.yaml

diff --git a/Documentation/devicetree/bindings/sram/samsung-sram.txt b/Documentation/devicetree/bindings/sram/samsung-sram.txt
deleted file mode 100644
index 61a9bbed303d..000000000000
--- a/Documentation/devicetree/bindings/sram/samsung-sram.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Samsung Exynos SYSRAM for SMP bringup:
-------------------------------------
-
-Samsung SMP-capable Exynos SoCs use part of the SYSRAM for the bringup
-of the secondary cores. Once the core gets powered up it executes the
-code that is residing at some specific location of the SYSRAM.
-
-Therefore reserved section sub-nodes have to be added to the mmio-sram
-declaration. These nodes are of two types depending upon secure or
-non-secure execution environment.
-
-Required sub-node properties:
-- compatible : depending upon boot mode, should be
-		"samsung,exynos4210-sysram" : for Secure SYSRAM
-		"samsung,exynos4210-sysram-ns" : for Non-secure SYSRAM
-
-The rest of the properties should follow the generic mmio-sram discription
-found in Documentation/devicetree/bindings/sram/sram.txt
-
-Example:
-
-	sysram@2020000 {
-		compatible = "mmio-sram";
-		reg = <0x02020000 0x54000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x02020000 0x54000>;
-
-		smp-sysram@0 {
-			compatible = "samsung,exynos4210-sysram";
-			reg = <0x0 0x1000>;
-		};
-
-		smp-sysram@53000 {
-			compatible = "samsung,exynos4210-sysram-ns";
-			reg = <0x53000 0x1000>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/sram/samsung-sram.yaml b/Documentation/devicetree/bindings/sram/samsung-sram.yaml
new file mode 100644
index 000000000000..3e77c434ecca
--- /dev/null
+++ b/Documentation/devicetree/bindings/sram/samsung-sram.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sram/samsung-sram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC SYSRAM for SMP bringup
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |+
+  Samsung SMP-capable Exynos SoCs use part of the SYSRAM for the bringup
+  of the secondary cores. Once the core gets powered up it executes the
+  code that is residing at some specific location of the SYSRAM.
+
+  Therefore reserved section sub-nodes have to be added to the mmio-sram
+  declaration. These nodes are of two types depending upon secure or
+  non-secure execution environment.
+
+allOf:
+  - $ref: "sram.yaml#"
+
+properties:
+  $nodename:
+    pattern: "^sysram(@.*)?"
+
+patternProperties:
+  "^([a-z]*-)?sysram@[a-f0-9]$":
+    type: object
+
+    properties:
+      compatible:
+        description:
+          Depending upon boot mode
+        enum:
+          - samsung,exynos4210-sysram                 # for Secure SYSRAM
+          - samsung,exynos4210-sysram-ns              # for Non-secure SYSRAM
+
+examples:
+  - |
+    sram@2020000 {
+        compatible = "mmio-sram";
+        reg = <0x02020000 0x54000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x02020000 0x54000>;
+
+        smp-sysram@0 {
+            compatible = "samsung,exynos4210-sysram";
+            reg = <0x0 0x1000>;
+        };
+
+        smp-sysram@53000 {
+            compatible = "samsung,exynos4210-sysram-ns";
+            reg = <0x53000 0x1000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b26b2009c230..53b426e27f30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2235,7 +2235,7 @@ F:	drivers/soc/samsung/
 F:	include/linux/soc/samsung/
 F:	Documentation/arm/samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
-F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
+F:	Documentation/devicetree/bindings/sram/samsung-sram.yaml
 F:	Documentation/devicetree/bindings/power/pd-samsung.txt
 N:	exynos
 
-- 
2.17.1

