Return-Path: <linux-omap+bounces-3207-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F58A1B5C8
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 13:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C0F0162A6C
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 12:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C14321B1AA;
	Fri, 24 Jan 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="DcPflmgX"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399B21ADD3;
	Fri, 24 Jan 2025 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737721521; cv=none; b=R7FbPUWbnNr91aGmZ33Wxu3zxwaafL9fzHmBnTeJrrz2jeeTtUngLESwLbiM0Wkry1olfEYYHvb4L598U5lho+zOdit4Ykj/mrU/Ms0RrqmRbvmIQ5vFzaO5/98rJGx3vLtHAkmGK6jWlN4c/nxdG8WibFx5CZDuiqajPJ3RjzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737721521; c=relaxed/simple;
	bh=E40mAfBBb7G7p27O0ak3e8WZnNUe+RmzDq3hGNOTLt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ofkI0ihY2yg6PUBLOGhRDm5BQrGizxAaknkK+IO7W+/9b4o2JGCk3b2OItsjmXqpTngY1VKN65eJYbsq1AqpqMRtnCii2/QFt2tQCLKz7P4tlsYQDAKTLXHaRvW4Ts3QAAVfJ4Y0pijzauceb3YyzBM0MqYr/BidQExR4NOkqhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=DcPflmgX; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QFeCmxkkpSLUaB2tYkNLfEa5lfh5o+0HAfk4rLLxQFQ=; b=DcPflmgXUuuRHjUoKGqOU5YpkW
	iMvWyG8iyr/3AHpD2BvtaPk1BDL1YSFwwVGXlDKFlssG8fnjLC8MIQp1G9Q0UR2yXRFdneNRjDReW
	8ODvvR5UCXMi0R6wVrnVyXUJUU5qY4hqOYzwIa4orjA2m/QopWEvHx7gM43YRXPJA/swVMGSdPWnm
	LPhw1C7d+w3LD6a8Cq6NmQBf6QD4p47svJJJHtog005Zj7FKpgT3RAcF8hMS2Dg5tpGQ4+sBwfAft
	E6Nf33IdM1JOjhzNN5Jp9tjbPnLjj3buk1hgIgDhLxLg312SiYtU21ONOdohkMNcPNv0rns7SfBwe
	MMI4XRDg==;
Received: from [122.175.9.182] (port=47173 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tbIkL-0004DJ-12;
	Fri, 24 Jan 2025 17:55:13 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	ssantosh@kernel.org,
	tony@atomide.com,
	richardcochran@gmail.com,
	parvathi@couthit.com,
	basharath@couthit.com,
	schnelle@linux.ibm.com,
	rdunlap@infradead.org,
	diogo.ivo@siemens.com,
	m-karicheri2@ti.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com,
	afd@ti.com,
	s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [RFC v2 PATCH 01/10] dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Date: Fri, 24 Jan 2025 17:53:44 +0530
Message-Id: <20250124122353.1457174-2-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124122353.1457174-1-basharath@couthit.com>
References: <20250124122353.1457174-1-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Parvathi Pudi <parvathi@couthit.com>

Documentation update for the newly added "pruss2_eth" device tree
node and its dependencies along with compatibility for PRU-ICSS
Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
(eCAP) peripheral and using YAML binding document for AM57xx SoCs.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
---
 .../devicetree/bindings/net/ti,icss-iep.yaml  |   5 +
 .../bindings/net/ti,icssm-prueth.yaml         | 147 ++++++++++++++++++
 .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
 .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
 4 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
 create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml

diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
index e36e3a622904..aad7d37fb47e 100644
--- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
+++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
@@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Peripheral (IEP) module
 
 maintainers:
   - Md Danish Anwar <danishanwar@ti.com>
+  - Parvathi Pudi <parvathi@couthit.com>
+  - Basharath Hussain Khaja <basharath@couthit.com>
 
 properties:
   compatible:
@@ -20,6 +22,9 @@ properties:
 
       - const: ti,am654-icss-iep
 
+      - items:
+          - enum:
+              - ti,am5728-icss-iep
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
new file mode 100644
index 000000000000..51e99beb5f5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments ICSSM PRUSS Ethernet
+
+maintainers:
+  - Roger Quadros <rogerq@ti.com>
+  - Andrew F. Davis <afd@ti.com>
+  - Parvathi Pudi <parvathi@couthit.com>
+  - Basharath Hussain Khaja <basharath@couthit.com>
+
+description:
+  Ethernet based on the Programmable Real-Time Unit and Industrial
+  Communication Subsystem.
+
+properties:
+  compatible:
+    enum:
+      - ti,am57-prueth     # for AM57x SoC family
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to OCMC SRAM node
+
+  ti,mii-rt:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to MII_RT module's syscon regmap
+
+  ti,iep:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
+
+  ecap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to Enhanced Capture (eCAP) event for ICSS
+
+  interrupts:
+    items:
+      - description: High priority Rx Interrupt specifier.
+      - description: Low priority Rx Interrupt specifier.
+
+  interrupt-names:
+    items:
+      - const: rx_hp
+      - const: rx_lp
+
+  ethernet-ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      ^ethernet-port@[0-1]$:
+        type: object
+        description: ICSSM PRUETH external ports
+        $ref: ethernet-controller.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              - enum: [0, 1]
+            description: ICSSM PRUETH port number
+
+          interrupts:
+            maxItems: 3
+
+          interrupt-names:
+            items:
+              - const: rx
+              - const: emac_ptp_tx
+              - const: hsr_ptp_tx
+
+        required:
+          - reg
+
+    anyOf:
+      - required:
+          - ethernet-port@0
+      - required:
+          - ethernet-port@1
+
+required:
+  - compatible
+  - sram
+  - ti,mii-rt
+  - ti,iep
+  - ecap
+  - ethernet-ports
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: /schemas/remoteproc/ti,pru-consumer.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* Dual-MAC Ethernet application node on PRU-ICSS2 */
+    pruss2_eth: pruss2-eth {
+      compatible = "ti,am57-prueth";
+      ti,prus = <&pru2_0>, <&pru2_1>;
+      sram = <&ocmcram1>;
+      ti,mii-rt = <&pruss2_mii_rt>;
+      ti,iep = <&pruss2_iep>;
+      ecap = <&pruss2_ecap>;
+      interrupts = <20 2 2>, <21 3 3>;
+      interrupt-names = "rx_hp", "rx_lp";
+      interrupt-parent = <&pruss2_intc>;
+
+      ethernet-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pruss2_emac0: ethernet-port@0 {
+          reg = <0>;
+          phy-handle = <&pruss2_eth0_phy>;
+          phy-mode = "mii";
+          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
+          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
+          /* Filled in by bootloader */
+          local-mac-address = [00 00 00 00 00 00];
+        };
+
+        pruss2_emac1: ethernet-port@1 {
+          reg = <1>;
+          phy-handle = <&pruss2_eth1_phy>;
+          phy-mode = "mii";
+          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
+          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
+          /* Filled in by bootloader */
+          local-mac-address = [00 00 00 00 00 00];
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
new file mode 100644
index 000000000000..42f217099b2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ti,pruss-ecap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PRU-ICSS Enhanced Capture (eCAP) event module
+
+maintainers:
+  - Murali Karicheri <m-karicheri2@ti.com>
+  - Parvathi Pudi <parvathi@couthit.com>
+  - Basharath Hussain Khaja <basharath@couthit.com>
+
+properties:
+  compatible:
+    const: ti,pruss-ecap
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pruss2_ecap: ecap@30000 {
+        compatible = "ti,pruss-ecap";
+        reg = <0x30000 0x60>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index 927b3200e29e..594f54264a8c 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -251,6 +251,15 @@ patternProperties:
 
     type: object
 
+  ecap@[a-f0-9]+$:
+    description:
+      PRU-ICSS has a Enhanced Capture (eCAP) event module which can generate
+      and capture periodic timer based events which will be used for features
+      like RX Pacing to rise interrupt when the timer event has occurred.
+      Each PRU-ICSS instance has one eCAP modeule irrespective of SOCs.
+
+    type: object
+
   mii-rt@[a-f0-9]+$:
     description: |
       Real-Time Ethernet to support multiple industrial communication protocols.
-- 
2.34.1


