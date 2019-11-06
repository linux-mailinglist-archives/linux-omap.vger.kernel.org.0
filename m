Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CD2F1FB1
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 21:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732353AbfKFUYF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Nov 2019 15:24:05 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41372 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfKFUYE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Nov 2019 15:24:04 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6KNuxH060697;
        Wed, 6 Nov 2019 14:23:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573071836;
        bh=8802dADt23gudPuHuQTsQCUgEmLe/TiFogJEbCDwyNk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nljccjlzLsjZXd8a3hLstJfMDE9xoebWW6H1ad+cnxlqwHvH0MxO4+3aKKAD95Eqw
         UBngVtwyk4BDi0B5AuBW0X+zYcLihRqHfDDWEDtL4xuPq7kfvrh7TDweEqUdiNidAg
         wG9I1hBtmK4agCPhfMqv1km6i2QxRpVGhkB1hLJU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6KNuch120447
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 14:23:56 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 14:23:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 14:23:40 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6KNsis119124;
        Wed, 6 Nov 2019 14:23:55 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 1/5] dt-bindings: media: ti-vpe: Document VPE driver
Date:   Wed, 6 Nov 2019 14:26:18 -0600
Message-ID: <20191106202622.2648-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106202622.2648-1-bparrot@ti.com>
References: <20191106202622.2648-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Device Tree bindings for the Video Processing Engine (VPE).

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/ti,vpe.yaml     | 64 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vpe.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,vpe.yaml b/Documentation/devicetree/bindings/media/ti,vpe.yaml
new file mode 100644
index 000000000000..f3a8a350e85f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vpe.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
index fb8e7d94492b..bb60674cf89d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16324,6 +16324,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 S:	Maintained
 F:	drivers/media/platform/ti-vpe/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
-- 
2.17.1

