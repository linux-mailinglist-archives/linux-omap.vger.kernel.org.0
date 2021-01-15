Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B032F8709
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 22:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbhAOVBC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 16:01:02 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59434 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733195AbhAOVBA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jan 2021 16:01:00 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10FKwSrX040711;
        Fri, 15 Jan 2021 14:58:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1610744308;
        bh=Sc+E12C0KeMsBR6ZQgAShxwFlyogleIJrGrKpJQw9+I=;
        h=From:To:CC:Subject:Date;
        b=hAMQdGnvcb+3/Pvup+bHNMIKe6CD91W4IfLTwa0vehyzv+7A0+jJ3V5ZPwVva9WU0
         0F59yFvUzIPWjpaXMSBSTPxuwOzMWAgu9bEJLhHBfy7V/EHerB2wsLJZYqnxRfrFIG
         qcj5rMx0D804of+T5c8Jy29RitVo/nGntMGo5h+U=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10FKwSQs041781
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Jan 2021 14:58:28 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 Jan 2021 14:58:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 Jan 2021 14:58:28 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10FKwSCL042823;
        Fri, 15 Jan 2021 14:58:28 -0600
Received: from localhost ([10.250.34.42])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 10FKwRS9077904;
        Fri, 15 Jan 2021 14:58:28 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Lechner <david@lechnology.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH] dt-bindings: irqchip: Add #address-cells to PRUSS INTC
Date:   Fri, 15 Jan 2021 14:58:19 -0600
Message-ID: <20210115205819.19426-1-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The '#address-cells' property looks to be a required property for
interrupt controller nodes as indicated by a warning message seen
when building dtbs with W=2. Adding the property to the PRUSS INTC
dts nodes though fails the dtbs_check. Add this property to the
PRUSS INTC binding to make it compliant with both dtbs_check and
building dtbs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Rob,

This patch is also part of our effort to get rid of the warnings seen
around interrupt providers on TI K3 dtbs [1]. I needed this in the PRUSS
INTC bindings to not get a warning with dtbs_check while also ensuring
no warnings while building dtbs with W=2.

I would have expected the '#address-cells' requirement to be inherited
automatically. And looking through the schema files, I actually do not
see the interrupt-controller.yaml included automatically anywhere. You
had asked us to drop the inclusion in this binding in our first version
with YAML [3]. Am I missing something, and how do we ensure that this
is enforced automatically for everyone?

regards
Suman

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210115083003.27387-1-lokeshvutla@ti.com/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210114194805.8231-1-s-anna@ti.com/
[3] https://patchwork.kernel.org/comment/23484523/

 .../bindings/interrupt-controller/ti,pruss-intc.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
index c2ce215501a5..dcbfe08e997d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
@@ -79,6 +79,9 @@ properties:
       mapping and channels to host interrupts so through this property entire
       mapping is provided.
 
+  "#address-cells":
+    const: 0
+
   ti,irqs-reserved:
     $ref: /schemas/types.yaml#/definitions/uint8
     description: |
@@ -100,6 +103,7 @@ required:
   - interrupt-names
   - interrupt-controller
   - "#interrupt-cells"
+  - "#address-cells"
 
 additionalProperties: false
 
@@ -123,6 +127,7 @@ examples:
                               "host_intr6", "host_intr7";
             interrupt-controller;
             #interrupt-cells = <3>;
+            #address-cells = <0>;
         };
     };
 
@@ -142,6 +147,7 @@ examples:
             reg = <0x20000 0x2000>;
             interrupt-controller;
             #interrupt-cells = <3>;
+            #address-cells = <0>;
             interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
                    <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
                    <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.29.2

