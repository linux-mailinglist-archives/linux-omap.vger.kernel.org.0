Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A53CF167A76
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 11:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbgBUKUA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 05:20:00 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:32970 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgBUKUA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Feb 2020 05:20:00 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LAJuk5028849;
        Fri, 21 Feb 2020 04:19:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582280396;
        bh=TxWn8rUcinsejInpcKOgDRY9tGl+wXh/X4uKM6YooEs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CJUAW8ZeGrfzEjC3inyqEsnso7qJgRWyfaf4he27ml24elOwTbI03+6BLVNPyj8lv
         PKH+Tqqyx1RTV6tLhQ+Ep/YIbSYOh9ttyRpy4P75GPuix5Mlg+lcEr0fOyCESHC/tL
         A+35NVuDEPKSsordz3q3ezLqPhuMFCDq6RSmKg5Y=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LAJuUs115818
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 Feb 2020 04:19:56 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 04:19:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 04:19:55 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LAJnwo034983;
        Fri, 21 Feb 2020 04:19:52 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <afd@ti.com>, <s-anna@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        <devicetree@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv7 01/15] dt-bindings: remoteproc: Add OMAP remoteproc bindings
Date:   Fri, 21 Feb 2020 12:19:22 +0200
Message-ID: <20200221101936.16833-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221101936.16833-1-t-kristo@ti.com>
References: <20200221101936.16833-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Add the device tree bindings document for the IPU and DSP
remote processor devices on OMAP4+ SoCs.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Suman Anna <s-anna@ti.com>
[t-kristo@ti.com: converted to schema]
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v7:
 - Added Rob's Reviewed-by
 - Added extra comment about recommended delay/effect of negative value
   under ti,autosuspend-delay-ms
 - Fixed typo in the omap5 example for firmware file extension (xem4 instead
   of xem)

 .../remoteproc/ti,omap-remoteproc.yaml        | 324 ++++++++++++++++++
 1 file changed, 324 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
new file mode 100644
index 000000000000..084960a8f17a
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
@@ -0,0 +1,324 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,omap-remoteproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP4+ Remoteproc Devices
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description:
+  The OMAP family of SoCs usually have one or more slave processor sub-systems
+  that are used to offload some of the processor-intensive tasks, or to manage
+  other hardware accelerators, for achieving various system level goals.
+
+  The processor cores in the sub-system are usually behind an IOMMU, and may
+  contain additional sub-modules like Internal RAM and/or ROMs, L1 and/or L2
+  caches, an Interrupt Controller, a Cache Controller etc.
+
+  The OMAP SoCs usually have a DSP processor sub-system and/or an IPU processor
+  sub-system. The DSP processor sub-system can contain any of the TI's C64x,
+  C66x or C67x family of DSP cores as the main execution unit. The IPU processor
+  sub-system usually contains either a Dual-Core Cortex-M3 or Dual-Core
+  Cortex-M4 processors.
+
+  Each remote processor sub-system is represented as a single DT node. Each node
+  has a number of required or optional properties that enable the OS running on
+  the host processor (MPU) to perform the device management of the remote
+  processor and to communicate with the remote processor. The various properties
+  can be classified as constant or variable. The constant properties are
+  dictated by the SoC and does not change from one board to another having the
+  same SoC. Examples of constant properties include 'iommus', 'reg'. The
+  variable properties are dictated by the system integration aspects such as
+  memory on the board, or configuration used within the corresponding firmware
+  image. Examples of variable properties include 'mboxes', 'memory-region',
+  'timers', 'watchdog-timers' etc.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap4-dsp
+      - ti,omap5-dsp
+      - ti,dra7-dsp
+      - ti,omap4-ipu
+      - ti,omap5-ipu
+      - ti,dra7-ipu
+
+  iommus:
+    minItems: 1
+    maxItems: 2
+    description: |
+      phandles to OMAP IOMMU nodes, that need to be programmed
+      for this remote processor to access any external RAM memory or
+      other peripheral device address spaces. This property usually
+      has only a single phandle. Multiple phandles are used only in
+      cases where the sub-system has different ports for different
+      sub-modules within the processor sub-system (eg: DRA7 DSPs),
+      and need the same programming in both the MMUs.
+
+  mboxes:
+    minItems: 1
+    maxItems: 2
+    description: |
+      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
+      communication with the remote processor. The specifier format is
+      as per the bindings,
+      Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
+      This property should match with the sub-mailbox node used in
+      the firmware image.
+
+  clocks:
+    description: |
+      Main functional clock for the remote processor
+
+  resets:
+    description: |
+      Reset handles for the remote processor
+
+  firmware-name:
+    description: |
+      Default name of the firmware to load to the remote processor.
+
+# Optional properties:
+# --------------------
+# Some of these properties are mandatory on some SoCs, and some are optional
+# depending on the configuration of the firmware image to be executed on the
+# remote processor. The conditions are mentioned for each property.
+#
+# The following are the optional properties:
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the reserved memory node to be associated
+      with the remoteproc device. The reserved memory node
+      can be a CMA memory node, and should be defined as
+      per the bindings,
+      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
+  reg:
+    description: |
+      Address space for any remoteproc memories present on
+      the SoC. Should contain an entry for each value in
+      'reg-names'. These are mandatory for all DSP and IPU
+      processors that have them (OMAP4/OMAP5 DSPs do not have
+      any RAMs)
+
+  reg-names:
+    description: |
+      Required names for each of the address spaces defined in
+      the 'reg' property. Expects the names from the following
+      list, in the specified order, each representing the corresponding
+      internal RAM memory region.
+    minItems: 1
+    maxItems: 3
+    items:
+      - const: l2ram
+      - const: l1pram
+      - const: l1dram
+
+  ti,bootreg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Should be a triple of the phandle to the System Control
+      Configuration region that contains the boot address
+      register, the register offset of the boot address
+      register within the System Control module, and the bit
+      shift within the register. This property is required for
+      all the DSP instances on OMAP4, OMAP5 and DRA7xx SoCs.
+
+  ti,autosuspend-delay-ms:
+    description: |
+      Custom autosuspend delay for the remoteproc in milliseconds.
+      Recommended values is preferable to be in the order of couple
+      of seconds. A negative value can also be used to disable the
+      autosuspend behavior.
+
+  ti,timers:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      One or more phandles to OMAP DMTimer nodes, that serve
+      as System/Tick timers for the OS running on the remote
+      processors. This will usually be a single timer if the
+      processor sub-system is running in SMP mode, or one per
+      core in the processor sub-system. This can also be used
+      to reserve specific timers to be dedicated to the
+      remote processors.
+
+      This property is mandatory on remote processors requiring
+      external tick wakeup, and to support Power Management
+      features. The timers to be used should match with the
+      timers used in the firmware image.
+
+  ti,watchdog-timers:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      One or more phandles to OMAP DMTimer nodes, used to
+      serve as Watchdog timers for the processor cores. This
+      will usually be one per executing processor core, even
+      if the processor sub-system is running a SMP OS.
+
+      The timers to be used should match with the watchdog
+      timers used in the firmware image.
+
+if:
+  properties:
+    compatible:
+      enum:
+        - ti,dra7-dsp
+then:
+  properties:
+    reg:
+      minItems: 3
+      maxItems: 3
+  required:
+    - reg
+    - reg-names
+    - ti,bootreg
+
+else:
+  if:
+    properties:
+      compatible:
+        enum:
+          - ti,omap4-ipu
+          - ti,omap5-ipu
+          - ti,dra7-ipu
+  then:
+    properties:
+      reg:
+        minItems: 1
+        maxItems: 1
+      ti,bootreg: false
+    required:
+      - reg
+      - reg-names
+
+  else:
+    properties:
+      reg: false
+    required:
+      - ti,bootreg
+
+required:
+  - compatible
+  - iommus
+  - mboxes
+  - clocks
+  - resets
+  - firmware-name
+
+additionalProperties: false
+
+examples:
+  - |
+
+    //Example 1: OMAP4 DSP
+
+    /* DSP Reserved Memory node */
+    #include <dt-bindings/clock/omap4.h>
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        dsp_memory_region: dsp-memory@98000000 {
+            compatible = "shared-dma-pool";
+            reg = <0x98000000 0x800000>;
+            reusable;
+        };
+    };
+
+    /* DSP node */
+    ocp {
+        dsp: dsp {
+            compatible = "ti,omap4-dsp";
+            ti,bootreg = <&scm_conf 0x304 0>;
+            iommus = <&mmu_dsp>;
+            mboxes = <&mailbox &mbox_dsp>;
+            memory-region = <&dsp_memory_region>;
+            ti,timers = <&timer5>;
+            ti,watchdog-timers = <&timer6>;
+            clocks = <&tesla_clkctrl OMAP4_DSP_CLKCTRL 0>;
+            resets = <&prm_tesla 0>, <&prm_tesla 1>;
+            firmware-name = "omap4-dsp-fw.xe64T";
+        };
+    };
+
+  - |+
+
+    //Example 2: OMAP5 IPU
+
+    /* IPU Reserved Memory node */
+    #include <dt-bindings/clock/omap5.h>
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ipu_memory_region: ipu-memory@95800000 {
+            compatible = "shared-dma-pool";
+            reg = <0 0x95800000 0 0x3800000>;
+            reusable;
+        };
+    };
+
+    /* IPU node */
+    ocp {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ipu: ipu@55020000 {
+            compatible = "ti,omap5-ipu";
+            reg = <0x55020000 0x10000>;
+            reg-names = "l2ram";
+            iommus = <&mmu_ipu>;
+            mboxes = <&mailbox &mbox_ipu>;
+            memory-region = <&ipu_memory_region>;
+            ti,timers = <&timer3>, <&timer4>;
+            ti,watchdog-timers = <&timer9>, <&timer11>;
+            clocks = <&ipu_clkctrl OMAP5_MMU_IPU_CLKCTRL 0>;
+            resets = <&prm_core 2>;
+            firmware-name = "omap5-ipu-fw.xem4";
+        };
+    };
+
+  - |+
+
+    //Example 3: DRA7xx/AM57xx DSP
+
+    /* DSP1 Reserved Memory node */
+    #include <dt-bindings/clock/dra7.h>
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dsp1_memory_region: dsp1-memory@99000000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0x99000000 0x0 0x4000000>;
+            reusable;
+        };
+    };
+
+    /* DSP1 node */
+    ocp {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        dsp1: dsp@40800000 {
+            compatible = "ti,dra7-dsp";
+            reg = <0x40800000 0x48000>,
+                  <0x40e00000 0x8000>,
+                  <0x40f00000 0x8000>;
+            reg-names = "l2ram", "l1pram", "l1dram";
+            ti,bootreg = <&scm_conf 0x55c 0>;
+            iommus = <&mmu0_dsp1>, <&mmu1_dsp1>;
+            mboxes = <&mailbox5 &mbox_dsp1_ipc3x>;
+            memory-region = <&dsp1_memory_region>;
+            ti,timers = <&timer5>;
+            ti,watchdog-timers = <&timer10>;
+            resets = <&prm_dsp1 0>;
+            clocks = <&dsp1_clkctrl DRA7_DSP1_MMU0_DSP1_CLKCTRL 0>;
+            firmware-name = "dra7-dsp1-fw.xe66";
+        };
+    };
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
