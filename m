Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38079EE9D1
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 21:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbfKDUi6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 15:38:58 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50848 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfKDUi5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Nov 2019 15:38:57 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4KcoLV127054;
        Mon, 4 Nov 2019 14:38:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572899930;
        bh=j6v6hUic5BjjXk1q+Fi505llsyamQoKSP5LAlTy2Psc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=p57l6ke03OfzJ1AE4ulgp3FiB8sR8rXNNusR+IdIrz0rQcri65lQ/loKq4GcVXOzY
         2XHFXggRhNz8h/X3eU/lkFZ8uVCB9yE6cTk3eCMvCVy1P7v90Hg32NS7c5ZcthfABf
         iL8fnGQXr4Z3LNxXO3R9u9evHg9feMq2JVM4kI3I=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4KcoIe105000
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 14:38:50 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 14:38:35 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 14:38:35 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kcl4m020670;
        Mon, 4 Nov 2019 14:38:49 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 1/5] dt-bindings: media: ti-vpe: Document VPE driver
Date:   Mon, 4 Nov 2019 14:38:37 -0600
Message-ID: <20191104203841.3628-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104203841.3628-1-bparrot@ti.com>
References: <20191104203841.3628-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Device Tree bindings for the Video Processing Engine (VPE).

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 .../devicetree/bindings/media/ti,vpe.yaml     | 64 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vpe.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,vpe.yaml b/Documentation/devicetree/bindings/media/ti,vpe.yaml
new file mode 100644
index 000000000000..eb9f3e1b7f5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vpe.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,vpe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DRA7x Video Processing Engine (VPE) Device Tree Bindings
+
+maintainers:
+  - Benoit Parrot <bparrot@ti.com>
+
+description: |-
+  The Video Processing Engine (VPE) is a key component for image post
+  processing applications. VPE consist of a single memory to memory
+  path which can perform chroma up/down sampling, deinterlacing,
+  scaling and color space conversion.
+
+properties:
+  compatible:
+      const: ti,dra7-vpe
+
+  reg:
+    items:
+      - description: The VPE main register region
+      - description: Scaler (SC) register region
+      - description: Color Space Conversion (CSC) register region
+      - description: Video Port Direct Memory Access (VPDMA) register region
+
+  reg-names:
+    items:
+      - const: vpe_top
+      - const: sc
+      - const: csc
+      - const: vpdma
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vpe: vpe@489d0000 {
+        compatible = "ti,dra7-vpe";
+        reg = <0x489d0000 0x120>,
+              <0x489d0700 0x80>,
+              <0x489d5700 0x18>,
+              <0x489dd000 0x400>;
+        reg-names = "vpe_top",
+                    "sc",
+                    "csc",
+                    "vpdma";
+        interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d360df48f9f2..baf3aac1ab7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16316,6 +16316,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 S:	Maintained
 F:	drivers/media/platform/ti-vpe/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
-- 
2.17.1

