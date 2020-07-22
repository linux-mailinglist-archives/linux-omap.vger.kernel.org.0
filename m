Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE51229706
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jul 2020 13:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732239AbgGVLEU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jul 2020 07:04:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39092 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732232AbgGVLET (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jul 2020 07:04:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06MB492J070527;
        Wed, 22 Jul 2020 06:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595415849;
        bh=pHVwr0B9RS5UQH+s1G6hqrpNKMvHCsZKgu0aWdichPo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=snk6AnZFSehevFH352lv7cptVVx80lSsZ4ECP470qg2DH++Npz105lSlJqNb8MS+8
         PjhkJAfE4ByzmnFtZKMMd7eZyZv212ZmHyfEsZ5ueiRzg916nnnvnZot2Nuxynyjag
         zYAysP7xqr7go8JBUwKmipkf0hMkdyfuAddvkiM4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06MB49Va020568
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jul 2020 06:04:09 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 22
 Jul 2020 06:04:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 22 Jul 2020 06:04:08 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06MB3IFk078616;
        Wed, 22 Jul 2020 06:04:05 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     Tom Joseph <tjoseph@cadence.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v8 12/15] dt-bindings: PCI: Add EP mode dt-bindings for TI's J721E SoC
Date:   Wed, 22 Jul 2020 16:33:14 +0530
Message-ID: <20200722110317.4744-13-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722110317.4744-1-kishon@ti.com>
References: <20200722110317.4744-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add PCIe EP mode dt-bindings for TI's J721E SoC.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pci/ti,j721e-pci-ep.yaml         | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml

diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
new file mode 100644
index 000000000000..cfe25cface21
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/pci/ti,j721e-pci-ep.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: TI J721E PCI EP (PCIe Wrapper)
+
+maintainers:
+  - Kishon Vijay Abraham I <kishon@ti.com>
+
+allOf:
+  - $ref: "cdns-pcie-ep.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - ti,j721e-pcie-ep
+
+  reg:
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: intd_cfg
+      - const: user_cfg
+      - const: reg
+      - const: mem
+
+  ti,syscon-pcie-ctrl:
+    description: Phandle to the SYSCON entry required for configuring PCIe mode
+                 and link speed.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: clock-specifier to represent input to the PCIe
+
+  clock-names:
+    items:
+      - const: fck
+
+  dma-coherent:
+    description: Indicates that the PCIe IP block can ensure the coherency
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,syscon-pcie-ctrl
+  - max-link-speed
+  - num-lanes
+  - power-domains
+  - clocks
+  - clock-names
+  - cdns,max-outbound-regions
+  - dma-coherent
+  - max-functions
+  - phys
+  - phy-names
+
+examples:
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie0_ep: pcie-ep@d000000 {
+           compatible = "ti,j721e-pcie-ep";
+           reg = <0x00 0x02900000 0x00 0x1000>,
+                 <0x00 0x02907000 0x00 0x400>,
+                 <0x00 0x0d000000 0x00 0x00800000>,
+                 <0x00 0x10000000 0x00 0x08000000>;
+           reg-names = "intd_cfg", "user_cfg", "reg", "mem";
+           ti,syscon-pcie-ctrl = <&pcie0_ctrl>;
+           max-link-speed = <3>;
+           num-lanes = <2>;
+           power-domains = <&k3_pds 239 TI_SCI_PD_EXCLUSIVE>;
+           clocks = <&k3_clks 239 1>;
+           clock-names = "fck";
+           cdns,max-outbound-regions = <16>;
+           max-functions = /bits/ 8 <6>;
+           dma-coherent;
+           phys = <&serdes0_pcie_link>;
+           phy-names = "pcie-phy";
+       };
+    };
-- 
2.17.1

