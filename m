Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E03786E4B
	for <lists+linux-omap@lfdr.de>; Thu, 24 Aug 2023 13:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241158AbjHXLrW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Aug 2023 07:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241171AbjHXLrB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Aug 2023 07:47:01 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8241198A;
        Thu, 24 Aug 2023 04:46:56 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37OBkWLR056620;
        Thu, 24 Aug 2023 06:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1692877592;
        bh=vRQfeIpNPrHFHBKjrQPdUu8diGOjgw0drpu5tiXNPz0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=S31o9RuF/Oz6yiTbynxcG+ZdmBg4LlHYKzSqsc+8ziUjHnNsVfUm0wT1D8Yvsz3nj
         /XWtIFyhPAPOfhcfQjBPfirkvcsjwAYMxaCg6phr9V+X4DlQLidtTfWD/KnT23ixir
         r8ZoVBreIqahPPXKE5y6jzZ2XZ2FogYmuJ0zFI6Q=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37OBkWIr029546
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Aug 2023 06:46:32 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Aug 2023 06:46:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Aug 2023 06:46:32 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37OBkWdP084154;
        Thu, 24 Aug 2023 06:46:32 -0500
Received: from localhost (uda0501179.dhcp.ti.com [172.24.227.35])
        by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 37OBkVMF010520;
        Thu, 24 Aug 2023 06:46:31 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        MD Danish Anwar <danishanwar@ti.com>
CC:     <nm@ti.com>, <srk@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 1/5] dt-bindings: net: Add ICSS IEP
Date:   Thu, 24 Aug 2023 17:16:14 +0530
Message-ID: <20230824114618.877730-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230824114618.877730-1-danishanwar@ti.com>
References: <20230824114618.877730-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add a DT binding document for the ICSS Industrial Ethernet Peripheral(IEP)
hardware. IEP supports packet timestamping, PTP and PPS.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 .../devicetree/bindings/net/ti,icss-iep.yaml  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,icss-iep.yaml

diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
new file mode 100644
index 000000000000..f5c22d6dcaee
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ti,icss-iep.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments ICSS Industrial Ethernet Peripheral (IEP) module
+
+maintainers:
+  - Md Danish Anwar <danishanwar@ti.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,am642-icss-iep
+              - ti,j721e-icss-iep
+          - const: ti,am654-icss-iep
+
+      - const: ti,am654-icss-iep
+
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: phandle to the IEP source clock
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    /* AM65x */
+    icssg0_iep0: iep@2e000 {
+        compatible = "ti,am654-icss-iep";
+        reg = <0x2e000 0x1000>;
+        clocks = <&icssg0_iepclk_mux>;
+    };
-- 
2.34.1

