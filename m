Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7DC4252A2
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 14:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241246AbhJGMKz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 08:10:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:50606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241261AbhJGMKi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 08:10:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FB8761371;
        Thu,  7 Oct 2021 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633608524;
        bh=ljXjd5pcasmgD1UZ78TZJXM0B0V+0TAJ7IYUhsqC3L8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=el7zAvdcPshQXLVDb6MVFYvGrNFZNcTzy5avlHm/TFre/2u6b7Zy6aGP0B7v6t0Il
         /z5iZ/EPJ0hO4XcZYqRU4IHrw7hEQANtPyHNPN9YInHh5qooO8HV6nwwwZLBpCp/eK
         T4SzG3N3EpUPIaN/iwmMECNE4jzv4hjI4G+OmpErLpK2poys7MEq2lNWNab0NNUngR
         uclY97wSiV/ODB/1B2u8DW5CrNiXlhPo9gl6CTtMcv3D2+6AmuVQGq/1nNzCoJrOJh
         9qqGrcqs84ReI5pauMiryQMxk0ua5b+QDz7vEsNFLiii9EA2gvEdIvgyVLiR+7r/ga
         duOl83RhTy3Lg==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v5 3/8] dt-bindings: memory-controllers: Introduce ti,gpmc-child
Date:   Thu,  7 Oct 2021 15:08:25 +0300
Message-Id: <20211007120830.17221-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007120830.17221-1-rogerq@kernel.org>
References: <20211007120830.17221-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This binding is meant for the child nodes of the TI GPMC node. The node
represents any device connected to the GPMC bus. It may be a Flash chip,
RAM chip or Ethernet controller, etc. These properties are meant for
configuring the GPMC settings/timings and will accompany the bindings
supported by the respective device.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../memory-controllers/ti,gpmc-child.yaml     | 245 ++++++++++++++++++
 1 file changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
new file mode 100644
index 000000000000..6e3995bb1630
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -0,0 +1,245 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ti,gpmc-child.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: device tree bindings for children of the Texas Instruments GPMC
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+  - Roger Quadros <rogerq@kernel.org>
+
+description:
+  This binding is meant for the child nodes of the GPMC node. The node
+  represents any device connected to the GPMC bus. It may be a Flash chip,
+  RAM chip or Ethernet controller, etc. These properties are meant for
+  configuring the GPMC settings/timings and will accompany the bindings
+  supported by the respective device.
+
+properties:
+  reg: true
+
+# GPMC Timing properties for child nodes. All are optional and default to 0.
+  gpmc,sync-clk-ps:
+    description: Minimum clock period for synchronous mode
+    default: 0
+
+# Chip-select signal timings corresponding to GPMC_CONFIG2:
+  gpmc,cs-on-ns:
+    description: Assertion time
+    default: 0
+
+  gpmc,cs-rd-off-ns:
+    description: Read deassertion time
+    default: 0
+
+  gpmc,cs-wr-off-ns:
+    description: Write deassertion time
+    default: 0
+
+# ADV signal timings corresponding to GPMC_CONFIG3:
+  gpmc,adv-on-ns:
+    description: Assertion time
+    default: 0
+
+  gpmc,adv-rd-off-ns:
+    description: Read deassertion time
+    default: 0
+
+  gpmc,adv-wr-off-ns:
+    description: Write deassertion time
+    default: 0
+
+  gpmc,adv-aad-mux-on-ns:
+    description: Assertion time for AAD
+    default: 0
+
+  gpmc,adv-aad-mux-rd-off-ns:
+    description: Read deassertion time for AAD
+    default: 0
+
+  gpmc,adv-aad-mux-wr-off-ns:
+    description: Write deassertion time for AAD
+    default: 0
+
+# WE signals timings corresponding to GPMC_CONFIG4:
+  gpmc,we-on-ns:
+    description: Assertion time
+    default: 0
+
+  gpmc,we-off-ns:
+    description: Deassertion time
+    default: 0
+
+# OE signals timings corresponding to GPMC_CONFIG4:
+  gpmc,oe-on-ns:
+    description: Assertion time
+    default: 0
+
+  gpmc,oe-off-ns:
+    description: Deassertion time
+    default: 0
+
+  gpmc,oe-aad-mux-on-ns:
+    description: Assertion time for AAD
+    default: 0
+
+  gpmc,oe-aad-mux-off-ns:
+    description: Deassertion time for AAD
+    default: 0
+
+# Access time and cycle time timings (in nanoseconds) corresponding to
+# GPMC_CONFIG5:
+  gpmc,page-burst-access-ns:
+    description: Multiple access word delay
+    default: 0
+
+  gpmc,access-ns:
+    description: Start-cycle to first data valid delay
+    default: 0
+
+  gpmc,rd-cycle-ns:
+    description: Total read cycle time
+    default: 0
+
+  gpmc,wr-cycle-ns:
+    description: Total write cycle time
+    default: 0
+
+  gpmc,bus-turnaround-ns:
+    description: Turn-around time between successive accesses
+    default: 0
+
+  gpmc,cycle2cycle-delay-ns:
+    description: Delay between chip-select pulses
+    default: 0
+
+  gpmc,clk-activation-ns:
+    description: GPMC clock activation time
+    default: 0
+
+  gpmc,wait-monitoring-ns:
+    description: Start of wait monitoring with regard to valid data
+    default: 0
+
+# Boolean timing parameters. If property is present, parameter is enabled
+# otherwise disabled.
+  gpmc,adv-extra-delay:
+    description: ADV signal is delayed by half GPMC clock
+    type: boolean
+
+  gpmc,cs-extra-delay:
+    description: CS signal is delayed by half GPMC clock
+    type: boolean
+
+  gpmc,cycle2cycle-diffcsen:
+    description: |
+      Add "cycle2cycle-delay" between successive accesses
+      to a different CS
+    type: boolean
+
+  gpmc,cycle2cycle-samecsen:
+    description: |
+      Add "cycle2cycle-delay" between successive accesses
+      to the same CS
+    type: boolean
+
+  gpmc,oe-extra-delay:
+    description: OE signal is delayed by half GPMC clock
+    type: boolean
+
+  gpmc,we-extra-delay:
+    description: WE signal is delayed by half GPMC clock
+    type: boolean
+
+  gpmc,time-para-granularity:
+    description: Multiply all access times by 2
+    type: boolean
+
+# The following two properties are applicable only to OMAP3+ and AM335x:
+  gpmc,wr-access-ns:
+    description: |
+      In synchronous write mode, for single or
+      burst accesses, defines the number of
+      GPMC_FCLK cycles from start access time
+      to the GPMC_CLK rising edge used by the
+      memory device for the first data capture.
+    default: 0
+
+  gpmc,wr-data-mux-bus-ns:
+    description: |
+      In address-data multiplex mode, specifies
+      the time when the first data is driven on
+      the address-data bus.
+    default: 0
+
+# GPMC chip-select settings properties for child nodes. All are optional.
+  gpmc,burst-length:
+    description: Page/burst length.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 4, 8, 16]
+    default: 0
+
+  gpmc,burst-wrap:
+    description: Enables wrap bursting
+    type: boolean
+
+  gpmc,burst-read:
+    description: Enables read page/burst mode
+    type: boolean
+
+  gpmc,burst-write:
+    description: Enables write page/burst mode
+    type: boolean
+
+  gpmc,device-width:
+    description: |
+      Total width of device(s) connected to a GPMC
+      chip-select in bytes. The GPMC supports 8-bit
+      and 16-bit devices and so this property must be
+      1 or 2.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+    default: 1
+
+  gpmc,mux-add-data:
+    description: |
+      Address and data multiplexing configuration.
+      Valid values are
+      0 for Non multiplexed mode
+      1 for address-address-data multiplexing mode and
+      2 for address-data multiplexing mode.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+
+  gpmc,sync-read:
+    description: |
+      Enables synchronous read. Defaults to asynchronous
+      is this is not set.
+    type: boolean
+
+  gpmc,sync-write:
+    description: |
+      Enables synchronous writes. Defaults to asynchronous
+      is this is not set.
+    type: boolean
+
+  gpmc,wait-pin:
+    description: |
+      Wait-pin used by client. Must be less than "gpmc,num-waitpins".
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  gpmc,wait-on-read:
+    description: Enables wait monitoring on reads.
+    type: boolean
+
+  gpmc,wait-on-write:
+    description: Enables wait monitoring on writes.
+    type: boolean
+
+required:
+  - reg
+
+# the GPMC child will have its own native properties
+additionalProperties: true
-- 
2.17.1

