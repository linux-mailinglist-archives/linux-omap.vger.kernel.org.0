Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415973CFD15
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 17:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239641AbhGTO2w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 10:28:52 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:36725 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240094AbhGTOBD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Jul 2021 10:01:03 -0400
Received: by mail-il1-f176.google.com with SMTP id j5so19343542ilk.3;
        Tue, 20 Jul 2021 07:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcuwSgrZWM3C5L1B2lT/FIFYmLWWWq+SQtW4nqrJcYs=;
        b=jH+Kcau+7VK44dbHqJdhykfh+Wk75Ep/nzsvLUy6OtYvcEYsz+I7Vyee0Fz2t3OIs6
         9YdZakEcQSY1/Ox+B8jZTxOZ7RwQmn9Tjx5uj4BWQQZ5LNRW2GtvbzezK2ob4St4PlnY
         EkloVLJ3xidLM25L8Z1uEMwWkhuR597jJ+7Wfptp9HBbMrNw/ThorMfsGR/WCrYEV+NW
         pu0iheStiu1hXb6g0aCi/uVfMgyENi1VlW1qLdbdiA/jcwNWujJQ6IB6QZOs5Vb56s/G
         6i9acnzeVFZcAKDk38uD6oMCT417rZC+8Sgx+Wgw3xx1cClpZX+extcJmTybsGtsS/rw
         /M2Q==
X-Gm-Message-State: AOAM532wqunHlh+sU1fVxttNSTGMRX0uBkjYtNT8EHsgq9PuPGxLXAWy
        aisLkjy7+uuyN4Vg8T3YJw==
X-Google-Smtp-Source: ABdhPJw9GgcXbsOtCGGqUN+fFRXzkIU5t36tXfKt3fnbOI1ND4RlhTTrlRS7dKOJsVITVg7I51K5Qw==
X-Received: by 2002:a92:b50d:: with SMTP id f13mr21061912ile.253.1626792088364;
        Tue, 20 Jul 2021 07:41:28 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id 10sm2091407iln.39.2021.07.20.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 07:41:27 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] dt-bindings: opp: Convert to DT schema
Date:   Tue, 20 Jul 2021 08:41:21 -0600
Message-Id: <20210720144121.66713-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210720144121.66713-1-robh@kernel.org>
References: <20210720144121.66713-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert the OPP v1 and v2 bindings to DT schema format. As the OPPv2 binding
can be extended by vendors, we need to split the common part out from the
"operating-points-v2" conforming compatible.

Cc: Yangtao Li <tiny.windzz@gmail.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
- Update opp.txt references
- Change vendor,cpu-type to foo,cpu-type to avoid compatible warning

v2:
- move opp-peak-kBps next to opp-avg-kBps. Also add a dependency schema.
- Correct the opp-microamp schemas. It's always a single value for each
  regulator.
- Add missing type for '^opp-microamp-'
---
 .../bindings/cpufreq/cpufreq-dt.txt           |   2 +-
 .../bindings/cpufreq/cpufreq-mediatek.txt     |   2 +-
 .../bindings/cpufreq/cpufreq-st.txt           |   6 +-
 .../cpufreq/nvidia,tegra20-cpufreq.txt        |   2 +-
 .../bindings/devfreq/rk3399_dmc.txt           |   2 +-
 .../allwinner,sun50i-h6-operating-points.yaml |   4 +
 .../devicetree/bindings/opp/opp-v1.yaml       |  51 ++
 .../devicetree/bindings/opp/opp-v2-base.yaml  | 214 ++++++
 .../devicetree/bindings/opp/opp-v2.yaml       | 475 +++++++++++++
 Documentation/devicetree/bindings/opp/opp.txt | 622 ------------------
 .../devicetree/bindings/opp/qcom-opp.txt      |   2 +-
 .../bindings/opp/ti-omap5-opp-supply.txt      |   2 +-
 .../bindings/power/power-domain.yaml          |   2 +-
 13 files changed, 753 insertions(+), 633 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v1.yaml
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v2-base.yaml
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v2.yaml
 delete mode 100644 Documentation/devicetree/bindings/opp/opp.txt

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-dt.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-dt.txt
index 56f442374383..1d7e49167666 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-dt.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-dt.txt
@@ -11,7 +11,7 @@ Required properties:
 - None
 
 Optional properties:
-- operating-points: Refer to Documentation/devicetree/bindings/opp/opp.txt for
+- operating-points: Refer to Documentation/devicetree/bindings/opp/opp-v1.yaml for
   details. OPPs *must* be supplied either via DT, i.e. this property, or
   populated at runtime.
 - clock-latency: Specify the possible maximum transition latency for clock,
diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
index ef68711716fb..b8233ec91d3d 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
@@ -10,7 +10,7 @@ Required properties:
 			  transition and not stable yet.
 	Please refer to Documentation/devicetree/bindings/clock/clock-bindings.txt for
 	generic clock consumer properties.
-- operating-points-v2: Please refer to Documentation/devicetree/bindings/opp/opp.txt
+- operating-points-v2: Please refer to Documentation/devicetree/bindings/opp/opp-v2.yaml
 	for detail.
 - proc-supply: Regulator for Vproc of CPU cluster.
 
diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-st.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-st.txt
index d91a02a3b6b0..6b0b452acef0 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-st.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-st.txt
@@ -6,8 +6,6 @@ from the SoC, then supplies the OPP framework with 'prop' and 'supported
 hardware' information respectively.  The framework is then able to read
 the DT and operate in the usual way.
 
-For more information about the expected DT format [See: ../opp/opp.txt].
-
 Frequency Scaling only
 ----------------------
 
@@ -15,7 +13,7 @@ No vendor specific driver required for this.
 
 Located in CPU's node:
 
-- operating-points		: [See: ../power/opp.txt]
+- operating-points		: [See: ../power/opp-v1.yaml]
 
 Example [safe]
 --------------
@@ -37,7 +35,7 @@ This requires the ST CPUFreq driver to supply 'process' and 'version' info.
 
 Located in CPU's node:
 
-- operating-points-v2		: [See ../power/opp.txt]
+- operating-points-v2		: [See ../power/opp-v2.yaml]
 
 Example [unsafe]
 ----------------
diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
index 52a24b82fd86..bdbfd7c36101 100644
--- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
+++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
@@ -4,7 +4,7 @@ Binding for NVIDIA Tegra20 CPUFreq
 Required properties:
 - clocks: Must contain an entry for the CPU clock.
   See ../clocks/clock-bindings.txt for details.
-- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- operating-points-v2: See ../bindings/opp/opp-v2.yaml for details.
 - #cooling-cells: Should be 2. See ../thermal/thermal-cooling-devices.yaml for details.
 
 For each opp entry in 'operating-points-v2' table:
diff --git a/Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt b/Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt
index ac189dd82b08..3fbeb3733c48 100644
--- a/Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt
+++ b/Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt
@@ -8,7 +8,7 @@ Required properties:
 - clocks:		 Phandles for clock specified in "clock-names" property
 - clock-names :		 The name of clock used by the DFI, must be
 			 "pclk_ddr_mon";
-- operating-points-v2:	 Refer to Documentation/devicetree/bindings/opp/opp.txt
+- operating-points-v2:	 Refer to Documentation/devicetree/bindings/opp/opp-v2.yaml
 			 for details.
 - center-supply:	 DMC supply node.
 - status:		 Marks the node enabled/disabled.
diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index aeff2bd774dd..729ae97b63d9 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -18,6 +18,9 @@ description: |
   sun50i-cpufreq-nvmem driver reads the efuse value from the SoC to
   provide the OPP framework with required information.
 
+allOf:
+  - $ref: opp-v2-base.yaml#
+
 properties:
   compatible:
     const: allwinner,sun50i-h6-operating-points
@@ -43,6 +46,7 @@ patternProperties:
 
     properties:
       opp-hz: true
+      clock-latency-ns: true
 
     patternProperties:
       "opp-microvolt-.*": true
diff --git a/Documentation/devicetree/bindings/opp/opp-v1.yaml b/Documentation/devicetree/bindings/opp/opp-v1.yaml
new file mode 100644
index 000000000000..d585d536a3fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/opp-v1.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/opp/opp-v1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic OPP (Operating Performance Points) v1 Bindings
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+description: |+
+  Devices work at voltage-current-frequency combinations and some implementations
+  have the liberty of choosing these. These combinations are called Operating
+  Performance Points aka OPPs. This document defines bindings for these OPPs
+  applicable across wide range of devices. For illustration purpose, this document
+  uses CPU as a device.
+
+  This binding only supports voltage-frequency pairs.
+
+select: true
+
+properties:
+  operating-points:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Frequency in kHz
+        - description: Voltage for OPP in uV
+
+
+additionalProperties: true
+examples:
+  - |
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a9";
+            device_type = "cpu";
+            reg = <0>;
+            next-level-cache = <&L2>;
+            operating-points =
+                /* kHz    uV */
+                <792000 1100000>,
+                <396000 950000>,
+                <198000 850000>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
new file mode 100644
index 000000000000..ae3ae4d39843
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
@@ -0,0 +1,214 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic OPP (Operating Performance Points) Common Binding
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+description: |
+  Devices work at voltage-current-frequency combinations and some implementations
+  have the liberty of choosing these. These combinations are called Operating
+  Performance Points aka OPPs. This document defines bindings for these OPPs
+  applicable across wide range of devices. For illustration purpose, this document
+  uses CPU as a device.
+
+  This describes the OPPs belonging to a device.
+
+select: false
+
+properties:
+  $nodename:
+    pattern: '^opp-table(-[a-z0-9]+)?$'
+
+  opp-shared:
+    description:
+      Indicates that device nodes using this OPP Table Node's phandle switch
+      their DVFS state together, i.e. they share clock/voltage/current lines.
+      Missing property means devices have independent clock/voltage/current
+      lines, but they share OPP tables.
+    type: boolean
+
+patternProperties:
+  '^opp-?[0-9]+$':
+    type: object
+    description:
+      One or more OPP nodes describing voltage-current-frequency combinations.
+      Their name isn't significant but their phandle can be used to reference an
+      OPP. These are mandatory except for the case where the OPP table is
+      present only to indicate dependency between devices using the opp-shared
+      property.
+
+    properties:
+      opp-hz:
+        description:
+          Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
+          required property for all device nodes, unless another "required"
+          property to uniquely identify the OPP nodes exists. Devices like power
+          domains must have another (implementation dependent) property.
+
+      opp-microvolt:
+        description: |
+          Voltage for the OPP
+
+          A single regulator's voltage is specified with an array of size one or three.
+          Single entry is for target voltage and three entries are for <target min max>
+          voltages.
+
+          Entries for multiple regulators shall be provided in the same field separated
+          by angular brackets <>. The OPP binding doesn't provide any provisions to
+          relate the values to their power supplies or the order in which the supplies
+          need to be configured and that is left for the implementation specific
+          binding.
+
+          Entries for all regulators shall be of the same size, i.e. either all use a
+          single value or triplets.
+        minItems: 1
+        maxItems: 8   # Should be enough regulators
+        items:
+          minItems: 1
+          maxItems: 3
+
+      opp-microamp:
+        description: |
+          The maximum current drawn by the device in microamperes considering
+          system specific parameters (such as transients, process, aging,
+          maximum operating temperature range etc.) as necessary. This may be
+          used to set the most efficient regulator operating mode.
+
+          Should only be set if opp-microvolt or opp-microvolt-<name> is set for
+          the OPP.
+
+          Entries for multiple regulators shall be provided in the same field
+          separated by angular brackets <>. If current values aren't required
+          for a regulator, then it shall be filled with 0. If current values
+          aren't required for any of the regulators, then this field is not
+          required. The OPP binding doesn't provide any provisions to relate the
+          values to their power supplies or the order in which the supplies need
+          to be configured and that is left for the implementation specific
+          binding.
+        minItems: 1
+        maxItems: 8   # Should be enough regulators
+
+      opp-level:
+        description:
+          A value representing the performance level of the device.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      opp-peak-kBps:
+        description:
+          Peak bandwidth in kilobytes per second, expressed as an array of
+          32-bit big-endian integers. Each element of the array represents the
+          peak bandwidth value of each interconnect path. The number of elements
+          should match the number of interconnect paths.
+        minItems: 1
+        maxItems: 32  # Should be enough
+
+      opp-avg-kBps:
+        description:
+          Average bandwidth in kilobytes per second, expressed as an array
+          of 32-bit big-endian integers. Each element of the array represents the
+          average bandwidth value of each interconnect path. The number of elements
+          should match the number of interconnect paths. This property is only
+          meaningful in OPP tables where opp-peak-kBps is present.
+        minItems: 1
+        maxItems: 32  # Should be enough
+
+      clock-latency-ns:
+        description:
+          Specifies the maximum possible transition latency (in nanoseconds) for
+          switching to this OPP from any other OPP.
+
+      turbo-mode:
+        description:
+          Marks the OPP to be used only for turbo modes. Turbo mode is available
+          on some platforms, where the device can run over its operating
+          frequency for a short duration of time limited by the device's power,
+          current and thermal limits.
+        type: boolean
+
+      opp-suspend:
+        description:
+          Marks the OPP to be used during device suspend. If multiple OPPs in
+          the table have this, the OPP with highest opp-hz will be used.
+        type: boolean
+
+      opp-supported-hw:
+        description: |
+          This property allows a platform to enable only a subset of the OPPs
+          from the larger set present in the OPP table, based on the current
+          version of the hardware (already known to the operating system).
+
+          Each block present in the array of blocks in this property, represents
+          a sub-group of hardware versions supported by the OPP. i.e. <sub-group
+          A>, <sub-group B>, etc. The OPP will be enabled if _any_ of these
+          sub-groups match the hardware's version.
+
+          Each sub-group is a platform defined array representing the hierarchy
+          of hardware versions supported by the platform. For a platform with
+          three hierarchical levels of version (X.Y.Z), this field shall look
+          like
+
+          opp-supported-hw = <X1 Y1 Z1>, <X2 Y2 Z2>, <X3 Y3 Z3>.
+
+          Each level (eg. X1) in version hierarchy is represented by a 32 bit
+          value, one bit per version and so there can be maximum 32 versions per
+          level. Logical AND (&) operation is performed for each level with the
+          hardware's level version and a non-zero output for _all_ the levels in
+          a sub-group means the OPP is supported by hardware. A value of
+          0xFFFFFFFF for each level in the sub-group will enable the OPP for all
+          versions for the hardware.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        maxItems: 32
+        items:
+          minItems: 1
+          maxItems: 4
+
+      required-opps:
+        description:
+          This contains phandle to an OPP node in another device's OPP table. It
+          may contain an array of phandles, where each phandle points to an OPP
+          of a different device. It should not contain multiple phandles to the
+          OPP nodes in the same OPP table. This specifies the minimum required
+          OPP of the device(s), whose OPP's phandle is present in this property,
+          for the functioning of the current device at the current OPP (where
+          this property is present).
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+    patternProperties:
+      '^opp-microvolt-':
+        description:
+          Named opp-microvolt property. This is exactly similar to the above
+          opp-microvolt property, but allows multiple voltage ranges to be
+          provided for the same OPP. At runtime, the platform can pick a <name>
+          and matching opp-microvolt-<name> property will be enabled for all
+          OPPs. If the platform doesn't pick a specific <name> or the <name>
+          doesn't match with any opp-microvolt-<name> properties, then
+          opp-microvolt property shall be used, if present.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        minItems: 1
+        maxItems: 8   # Should be enough regulators
+        items:
+          minItems: 1
+          maxItems: 3
+
+      '^opp-microamp-':
+        description:
+          Named opp-microamp property. Similar to opp-microvolt-<name> property,
+          but for microamp instead.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 8   # Should be enough regulators
+
+    dependencies:
+      opp-avg-kBps: [ opp-peak-kBps ]
+
+required:
+  - compatible
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/opp/opp-v2.yaml b/Documentation/devicetree/bindings/opp/opp-v2.yaml
new file mode 100644
index 000000000000..eaf8fba2c691
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/opp-v2.yaml
@@ -0,0 +1,475 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/opp/opp-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic OPP (Operating Performance Points) Bindings
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+allOf:
+  - $ref: opp-v2-base.yaml#
+
+properties:
+  compatible:
+    const: operating-points-v2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /*
+     * Example 1: Single cluster Dual-core ARM cortex A9, switch DVFS states
+     * together.
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a9";
+            device_type = "cpu";
+            reg = <0>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cpu0_opp_table0>;
+        };
+
+        cpu@1 {
+            compatible = "arm,cortex-a9";
+            device_type = "cpu";
+            reg = <1>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cpu0_opp_table0>;
+        };
+    };
+
+    cpu0_opp_table0: opp-table {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt = <975000 970000 985000>;
+            opp-microamp = <70000>;
+            clock-latency-ns = <300000>;
+            opp-suspend;
+        };
+        opp-1100000000 {
+            opp-hz = /bits/ 64 <1100000000>;
+            opp-microvolt = <1000000 980000 1010000>;
+            opp-microamp = <80000>;
+            clock-latency-ns = <310000>;
+        };
+        opp-1200000000 {
+            opp-hz = /bits/ 64 <1200000000>;
+            opp-microvolt = <1025000>;
+            clock-latency-ns = <290000>;
+            turbo-mode;
+        };
+    };
+
+  - |
+    /*
+     * Example 2: Single cluster, Quad-core Qualcom-krait, switches DVFS states
+     * independently.
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "qcom,krait";
+            device_type = "cpu";
+            reg = <0>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cpu_opp_table>;
+        };
+
+        cpu@1 {
+            compatible = "qcom,krait";
+            device_type = "cpu";
+            reg = <1>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 1>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply1>;
+            operating-points-v2 = <&cpu_opp_table>;
+        };
+
+        cpu@2 {
+            compatible = "qcom,krait";
+            device_type = "cpu";
+            reg = <2>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 2>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply2>;
+            operating-points-v2 = <&cpu_opp_table>;
+        };
+
+        cpu@3 {
+            compatible = "qcom,krait";
+            device_type = "cpu";
+            reg = <3>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 3>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply3>;
+            operating-points-v2 = <&cpu_opp_table>;
+        };
+    };
+
+    cpu_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        /*
+         * Missing opp-shared property means CPUs switch DVFS states
+         * independently.
+         */
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt = <975000 970000 985000>;
+            opp-microamp = <70000>;
+            clock-latency-ns = <300000>;
+            opp-suspend;
+        };
+        opp-1100000000 {
+            opp-hz = /bits/ 64 <1100000000>;
+            opp-microvolt = <1000000 980000 1010000>;
+            opp-microamp = <80000>;
+            clock-latency-ns = <310000>;
+        };
+        opp-1200000000 {
+            opp-hz = /bits/ 64 <1200000000>;
+            opp-microvolt = <1025000>;
+            opp-microamp = <90000>;
+            lock-latency-ns = <290000>;
+            turbo-mode;
+        };
+    };
+
+  - |
+    /*
+     * Example 3: Dual-cluster, Dual-core per cluster. CPUs within a cluster switch
+     * DVFS state together.
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a7";
+            device_type = "cpu";
+            reg = <0>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cluster0_opp>;
+        };
+
+        cpu@1 {
+            compatible = "arm,cortex-a7";
+            device_type = "cpu";
+            reg = <1>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 0>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply0>;
+            operating-points-v2 = <&cluster0_opp>;
+        };
+
+        cpu@100 {
+            compatible = "arm,cortex-a15";
+            device_type = "cpu";
+            reg = <100>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 1>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply1>;
+            operating-points-v2 = <&cluster1_opp>;
+        };
+
+        cpu@101 {
+            compatible = "arm,cortex-a15";
+            device_type = "cpu";
+            reg = <101>;
+            next-level-cache = <&L2>;
+            clocks = <&clk_controller 1>;
+            clock-names = "cpu";
+            cpu-supply = <&cpu_supply1>;
+            operating-points-v2 = <&cluster1_opp>;
+        };
+    };
+
+    cluster0_opp: opp-table-0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt = <975000 970000 985000>;
+            opp-microamp = <70000>;
+            clock-latency-ns = <300000>;
+            opp-suspend;
+        };
+        opp-1100000000 {
+            opp-hz = /bits/ 64 <1100000000>;
+            opp-microvolt = <1000000 980000 1010000>;
+            opp-microamp = <80000>;
+            clock-latency-ns = <310000>;
+        };
+        opp-1200000000 {
+            opp-hz = /bits/ 64 <1200000000>;
+            opp-microvolt = <1025000>;
+            opp-microamp = <90000>;
+            clock-latency-ns = <290000>;
+            turbo-mode;
+        };
+    };
+
+    cluster1_opp: opp-table-1 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1300000000 {
+            opp-hz = /bits/ 64 <1300000000>;
+            opp-microvolt = <1050000 1045000 1055000>;
+            opp-microamp = <95000>;
+            clock-latency-ns = <400000>;
+            opp-suspend;
+        };
+        opp-1400000000 {
+            opp-hz = /bits/ 64 <1400000000>;
+            opp-microvolt = <1075000>;
+            opp-microamp = <100000>;
+            clock-latency-ns = <400000>;
+        };
+        opp-1500000000 {
+            opp-hz = /bits/ 64 <1500000000>;
+            opp-microvolt = <1100000 1010000 1110000>;
+            opp-microamp = <95000>;
+            clock-latency-ns = <400000>;
+            turbo-mode;
+        };
+    };
+
+  - |
+    /* Example 4: Handling multiple regulators */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "foo,cpu-type";
+            device_type = "cpu";
+            reg = <0>;
+
+            vcc0-supply = <&cpu_supply0>;
+            vcc1-supply = <&cpu_supply1>;
+            vcc2-supply = <&cpu_supply2>;
+            operating-points-v2 = <&cpu0_opp_table4>;
+        };
+    };
+
+    cpu0_opp_table4: opp-table-0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt = <970000>, /* Supply 0 */
+                            <960000>, /* Supply 1 */
+                            <960000>; /* Supply 2 */
+            opp-microamp =  <70000>,  /* Supply 0 */
+                            <70000>,  /* Supply 1 */
+                            <70000>;  /* Supply 2 */
+            clock-latency-ns = <300000>;
+        };
+
+        /* OR */
+
+        opp-1000000001 {
+            opp-hz = /bits/ 64 <1000000001>;
+            opp-microvolt = <975000 970000 985000>, /* Supply 0 */
+                            <965000 960000 975000>, /* Supply 1 */
+                            <965000 960000 975000>; /* Supply 2 */
+            opp-microamp =  <70000>,    /* Supply 0 */
+                <70000>,    /* Supply 1 */
+                <70000>;    /* Supply 2 */
+            clock-latency-ns = <300000>;
+        };
+
+        /* OR */
+
+        opp-1000000002 {
+            opp-hz = /bits/ 64 <1000000002>;
+            opp-microvolt = <975000 970000 985000>, /* Supply 0 */
+                <965000 960000 975000>, /* Supply 1 */
+                <965000 960000 975000>; /* Supply 2 */
+            opp-microamp =  <70000>,    /* Supply 0 */
+                <0>,      /* Supply 1 doesn't need this */
+                <70000>;    /* Supply 2 */
+            clock-latency-ns = <300000>;
+        };
+    };
+
+  - |
+    /*
+     * Example 5: opp-supported-hw
+     * (example: three level hierarchy of versions: cuts, substrate and process)
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a7";
+            device_type = "cpu";
+            reg = <0>;
+            cpu-supply = <&cpu_supply>;
+            operating-points-v2 = <&cpu0_opp_table_slow>;
+        };
+    };
+
+    cpu0_opp_table_slow: opp-table {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-600000000 {
+            /*
+             * Supports all substrate and process versions for 0xF
+             * cuts, i.e. only first four cuts.
+             */
+            opp-supported-hw = <0xF 0xFFFFFFFF 0xFFFFFFFF>;
+            opp-hz = /bits/ 64 <600000000>;
+        };
+
+        opp-800000000 {
+            /*
+             * Supports:
+             * - cuts: only one, 6th cut (represented by 6th bit).
+             * - substrate: supports 16 different substrate versions
+             * - process: supports 9 different process versions
+             */
+            opp-supported-hw = <0x20 0xff0000ff 0x0000f4f0>;
+            opp-hz = /bits/ 64 <800000000>;
+        };
+
+        opp-900000000 {
+            /*
+             * Supports:
+             * - All cuts and substrate where process version is 0x2.
+             * - All cuts and process where substrate version is 0x2.
+             */
+            opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0x02>,
+                               <0xFFFFFFFF 0x01 0xFFFFFFFF>;
+            opp-hz = /bits/ 64 <900000000>;
+        };
+    };
+
+  - |
+    /*
+     * Example 6: opp-microvolt-<name>, opp-microamp-<name>:
+     * (example: device with two possible microvolt ranges: slow and fast)
+     */
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a7";
+            device_type = "cpu";
+            reg = <0>;
+            operating-points-v2 = <&cpu0_opp_table6>;
+        };
+    };
+
+    cpu0_opp_table6: opp-table-0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+
+        opp-1000000000 {
+            opp-hz = /bits/ 64 <1000000000>;
+            opp-microvolt-slow = <915000 900000 925000>;
+            opp-microvolt-fast = <975000 970000 985000>;
+            opp-microamp-slow =  <70000>;
+            opp-microamp-fast =  <71000>;
+        };
+
+        opp-1200000000 {
+            opp-hz = /bits/ 64 <1200000000>;
+            opp-microvolt-slow = <915000 900000 925000>, /* Supply vcc0 */
+                                 <925000 910000 935000>; /* Supply vcc1 */
+            opp-microvolt-fast = <975000 970000 985000>, /* Supply vcc0 */
+                                 <965000 960000 975000>; /* Supply vcc1 */
+            opp-microamp =  <70000>; /* Will be used for both slow/fast */
+        };
+    };
+
+  - |
+    /*
+     * Example 7: Single cluster Quad-core ARM cortex A53, OPP points from firmware,
+     * distinct clock controls but two sets of clock/voltage/current lines.
+     */
+    cpus {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        cpu@0 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x0 0x100>;
+            next-level-cache = <&A53_L2>;
+            clocks = <&dvfs_controller 0>;
+            operating-points-v2 = <&cpu_opp0_table>;
+        };
+        cpu@1 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x0 0x101>;
+            next-level-cache = <&A53_L2>;
+            clocks = <&dvfs_controller 1>;
+            operating-points-v2 = <&cpu_opp0_table>;
+        };
+        cpu@2 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x0 0x102>;
+            next-level-cache = <&A53_L2>;
+            clocks = <&dvfs_controller 2>;
+            operating-points-v2 = <&cpu_opp1_table>;
+        };
+        cpu@3 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x0 0x103>;
+            next-level-cache = <&A53_L2>;
+            clocks = <&dvfs_controller 3>;
+            operating-points-v2 = <&cpu_opp1_table>;
+        };
+
+    };
+
+    cpu_opp0_table: opp-table-0 {
+        compatible = "operating-points-v2";
+        opp-shared;
+    };
+
+    cpu_opp1_table: opp-table-1 {
+        compatible = "operating-points-v2";
+        opp-shared;
+    };
+...
diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
deleted file mode 100644
index 08b3da4736cf..000000000000
--- a/Documentation/devicetree/bindings/opp/opp.txt
+++ /dev/null
@@ -1,622 +0,0 @@
-Generic OPP (Operating Performance Points) Bindings
-----------------------------------------------------
-
-Devices work at voltage-current-frequency combinations and some implementations
-have the liberty of choosing these. These combinations are called Operating
-Performance Points aka OPPs. This document defines bindings for these OPPs
-applicable across wide range of devices. For illustration purpose, this document
-uses CPU as a device.
-
-This document contain multiple versions of OPP binding and only one of them
-should be used per device.
-
-Binding 1: operating-points
-============================
-
-This binding only supports voltage-frequency pairs.
-
-Properties:
-- operating-points: An array of 2-tuples items, and each item consists
-  of frequency and voltage like <freq-kHz vol-uV>.
-	freq: clock frequency in kHz
-	vol: voltage in microvolt
-
-Examples:
-
-cpu@0 {
-	compatible = "arm,cortex-a9";
-	reg = <0>;
-	next-level-cache = <&L2>;
-	operating-points = <
-		/* kHz    uV */
-		792000  1100000
-		396000  950000
-		198000  850000
-	>;
-};
-
-
-Binding 2: operating-points-v2
-============================
-
-* Property: operating-points-v2
-
-Devices supporting OPPs must set their "operating-points-v2" property with
-phandle to a OPP table in their DT node. The OPP core will use this phandle to
-find the operating points for the device.
-
-This can contain more than one phandle for power domain providers that provide
-multiple power domains. That is, one phandle for each power domain. If only one
-phandle is available, then the same OPP table will be used for all power domains
-provided by the power domain provider.
-
-If required, this can be extended for SoC vendor specific bindings. Such bindings
-should be documented as Documentation/devicetree/bindings/power/<vendor>-opp.txt
-and should have a compatible description like: "operating-points-v2-<vendor>".
-
-* OPP Table Node
-
-This describes the OPPs belonging to a device. This node can have following
-properties:
-
-Required properties:
-- compatible: Allow OPPs to express their compatibility. It should be:
-  "operating-points-v2".
-
-- OPP nodes: One or more OPP nodes describing voltage-current-frequency
-  combinations. Their name isn't significant but their phandle can be used to
-  reference an OPP. These are mandatory except for the case where the OPP table
-  is present only to indicate dependency between devices using the opp-shared
-  property.
-
-Optional properties:
-- opp-shared: Indicates that device nodes using this OPP Table Node's phandle
-  switch their DVFS state together, i.e. they share clock/voltage/current lines.
-  Missing property means devices have independent clock/voltage/current lines,
-  but they share OPP tables.
-
-- status: Marks the OPP table enabled/disabled.
-
-
-* OPP Node
-
-This defines voltage-current-frequency combinations along with other related
-properties.
-
-Required properties:
-- opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
-  required property for all device nodes, unless another "required" property to
-  uniquely identify the OPP nodes exists. Devices like power domains must have
-  another (implementation dependent) property.
-
-- opp-peak-kBps: Peak bandwidth in kilobytes per second, expressed as an array
-  of 32-bit big-endian integers. Each element of the array represents the
-  peak bandwidth value of each interconnect path. The number of elements should
-  match the number of interconnect paths.
-
-Optional properties:
-- opp-microvolt: voltage in micro Volts.
-
-  A single regulator's voltage is specified with an array of size one or three.
-  Single entry is for target voltage and three entries are for <target min max>
-  voltages.
-
-  Entries for multiple regulators shall be provided in the same field separated
-  by angular brackets <>. The OPP binding doesn't provide any provisions to
-  relate the values to their power supplies or the order in which the supplies
-  need to be configured and that is left for the implementation specific
-  binding.
-
-  Entries for all regulators shall be of the same size, i.e. either all use a
-  single value or triplets.
-
-- opp-microvolt-<name>: Named opp-microvolt property. This is exactly similar to
-  the above opp-microvolt property, but allows multiple voltage ranges to be
-  provided for the same OPP. At runtime, the platform can pick a <name> and
-  matching opp-microvolt-<name> property will be enabled for all OPPs. If the
-  platform doesn't pick a specific <name> or the <name> doesn't match with any
-  opp-microvolt-<name> properties, then opp-microvolt property shall be used, if
-  present.
-
-- opp-microamp: The maximum current drawn by the device in microamperes
-  considering system specific parameters (such as transients, process, aging,
-  maximum operating temperature range etc.) as necessary. This may be used to
-  set the most efficient regulator operating mode.
-
-  Should only be set if opp-microvolt is set for the OPP.
-
-  Entries for multiple regulators shall be provided in the same field separated
-  by angular brackets <>. If current values aren't required for a regulator,
-  then it shall be filled with 0. If current values aren't required for any of
-  the regulators, then this field is not required. The OPP binding doesn't
-  provide any provisions to relate the values to their power supplies or the
-  order in which the supplies need to be configured and that is left for the
-  implementation specific binding.
-
-- opp-microamp-<name>: Named opp-microamp property. Similar to
-  opp-microvolt-<name> property, but for microamp instead.
-
-- opp-level: A value representing the performance level of the device,
-  expressed as a 32-bit integer.
-
-- opp-avg-kBps: Average bandwidth in kilobytes per second, expressed as an array
-  of 32-bit big-endian integers. Each element of the array represents the
-  average bandwidth value of each interconnect path. The number of elements
-  should match the number of interconnect paths. This property is only
-  meaningful in OPP tables where opp-peak-kBps is present.
-
-- clock-latency-ns: Specifies the maximum possible transition latency (in
-  nanoseconds) for switching to this OPP from any other OPP.
-
-- turbo-mode: Marks the OPP to be used only for turbo modes. Turbo mode is
-  available on some platforms, where the device can run over its operating
-  frequency for a short duration of time limited by the device's power, current
-  and thermal limits.
-
-- opp-suspend: Marks the OPP to be used during device suspend. If multiple OPPs
-  in the table have this, the OPP with highest opp-hz will be used.
-
-- opp-supported-hw: This property allows a platform to enable only a subset of
-  the OPPs from the larger set present in the OPP table, based on the current
-  version of the hardware (already known to the operating system).
-
-  Each block present in the array of blocks in this property, represents a
-  sub-group of hardware versions supported by the OPP. i.e. <sub-group A>,
-  <sub-group B>, etc. The OPP will be enabled if _any_ of these sub-groups match
-  the hardware's version.
-
-  Each sub-group is a platform defined array representing the hierarchy of
-  hardware versions supported by the platform. For a platform with three
-  hierarchical levels of version (X.Y.Z), this field shall look like
-
-  opp-supported-hw = <X1 Y1 Z1>, <X2 Y2 Z2>, <X3 Y3 Z3>.
-
-  Each level (eg. X1) in version hierarchy is represented by a 32 bit value, one
-  bit per version and so there can be maximum 32 versions per level. Logical AND
-  (&) operation is performed for each level with the hardware's level version
-  and a non-zero output for _all_ the levels in a sub-group means the OPP is
-  supported by hardware. A value of 0xFFFFFFFF for each level in the sub-group
-  will enable the OPP for all versions for the hardware.
-
-- status: Marks the node enabled/disabled.
-
-- required-opps: This contains phandle to an OPP node in another device's OPP
-  table. It may contain an array of phandles, where each phandle points to an
-  OPP of a different device. It should not contain multiple phandles to the OPP
-  nodes in the same OPP table. This specifies the minimum required OPP of the
-  device(s), whose OPP's phandle is present in this property, for the
-  functioning of the current device at the current OPP (where this property is
-  present).
-
-Example 1: Single cluster Dual-core ARM cortex A9, switch DVFS states together.
-
-/ {
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			compatible = "arm,cortex-a9";
-			reg = <0>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-
-		cpu@1 {
-			compatible = "arm,cortex-a9";
-			reg = <1>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
-
-	cpu0_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>;
-			opp-microamp = <70000>;
-			clock-latency-ns = <300000>;
-			opp-suspend;
-		};
-		opp-1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1000000 980000 1010000>;
-			opp-microamp = <80000>;
-			clock-latency-ns = <310000>;
-		};
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1025000>;
-			clock-latency-ns = <290000>;
-			turbo-mode;
-		};
-	};
-};
-
-Example 2: Single cluster, Quad-core Qualcom-krait, switches DVFS states
-independently.
-
-/ {
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			compatible = "qcom,krait";
-			reg = <0>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cpu_opp_table>;
-		};
-
-		cpu@1 {
-			compatible = "qcom,krait";
-			reg = <1>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 1>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply1>;
-			operating-points-v2 = <&cpu_opp_table>;
-		};
-
-		cpu@2 {
-			compatible = "qcom,krait";
-			reg = <2>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 2>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply2>;
-			operating-points-v2 = <&cpu_opp_table>;
-		};
-
-		cpu@3 {
-			compatible = "qcom,krait";
-			reg = <3>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 3>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply3>;
-			operating-points-v2 = <&cpu_opp_table>;
-		};
-	};
-
-	cpu_opp_table: opp_table {
-		compatible = "operating-points-v2";
-
-		/*
-		 * Missing opp-shared property means CPUs switch DVFS states
-		 * independently.
-		 */
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>;
-			opp-microamp = <70000>;
-			clock-latency-ns = <300000>;
-			opp-suspend;
-		};
-		opp-1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1000000 980000 1010000>;
-			opp-microamp = <80000>;
-			clock-latency-ns = <310000>;
-		};
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1025000>;
-			opp-microamp = <90000;
-			lock-latency-ns = <290000>;
-			turbo-mode;
-		};
-	};
-};
-
-Example 3: Dual-cluster, Dual-core per cluster. CPUs within a cluster switch
-DVFS state together.
-
-/ {
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			compatible = "arm,cortex-a7";
-			reg = <0>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cluster0_opp>;
-		};
-
-		cpu@1 {
-			compatible = "arm,cortex-a7";
-			reg = <1>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 0>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply0>;
-			operating-points-v2 = <&cluster0_opp>;
-		};
-
-		cpu@100 {
-			compatible = "arm,cortex-a15";
-			reg = <100>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 1>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply1>;
-			operating-points-v2 = <&cluster1_opp>;
-		};
-
-		cpu@101 {
-			compatible = "arm,cortex-a15";
-			reg = <101>;
-			next-level-cache = <&L2>;
-			clocks = <&clk_controller 1>;
-			clock-names = "cpu";
-			cpu-supply = <&cpu_supply1>;
-			operating-points-v2 = <&cluster1_opp>;
-		};
-	};
-
-	cluster0_opp: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>;
-			opp-microamp = <70000>;
-			clock-latency-ns = <300000>;
-			opp-suspend;
-		};
-		opp-1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1000000 980000 1010000>;
-			opp-microamp = <80000>;
-			clock-latency-ns = <310000>;
-		};
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1025000>;
-			opp-microamp = <90000>;
-			clock-latency-ns = <290000>;
-			turbo-mode;
-		};
-	};
-
-	cluster1_opp: opp_table1 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1300000000 {
-			opp-hz = /bits/ 64 <1300000000>;
-			opp-microvolt = <1050000 1045000 1055000>;
-			opp-microamp = <95000>;
-			clock-latency-ns = <400000>;
-			opp-suspend;
-		};
-		opp-1400000000 {
-			opp-hz = /bits/ 64 <1400000000>;
-			opp-microvolt = <1075000>;
-			opp-microamp = <100000>;
-			clock-latency-ns = <400000>;
-		};
-		opp-1500000000 {
-			opp-hz = /bits/ 64 <1500000000>;
-			opp-microvolt = <1100000 1010000 1110000>;
-			opp-microamp = <95000>;
-			clock-latency-ns = <400000>;
-			turbo-mode;
-		};
-	};
-};
-
-Example 4: Handling multiple regulators
-
-/ {
-	cpus {
-		cpu@0 {
-			compatible = "vendor,cpu-type";
-			...
-
-			vcc0-supply = <&cpu_supply0>;
-			vcc1-supply = <&cpu_supply1>;
-			vcc2-supply = <&cpu_supply2>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
-
-	cpu0_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <970000>, /* Supply 0 */
-					<960000>, /* Supply 1 */
-					<960000>; /* Supply 2 */
-			opp-microamp =  <70000>,  /* Supply 0 */
-					<70000>,  /* Supply 1 */
-					<70000>;  /* Supply 2 */
-			clock-latency-ns = <300000>;
-		};
-
-		/* OR */
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>, /* Supply 0 */
-					<965000 960000 975000>, /* Supply 1 */
-					<965000 960000 975000>; /* Supply 2 */
-			opp-microamp =  <70000>,		/* Supply 0 */
-					<70000>,		/* Supply 1 */
-					<70000>;		/* Supply 2 */
-			clock-latency-ns = <300000>;
-		};
-
-		/* OR */
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <975000 970000 985000>, /* Supply 0 */
-					<965000 960000 975000>, /* Supply 1 */
-					<965000 960000 975000>; /* Supply 2 */
-			opp-microamp =  <70000>,		/* Supply 0 */
-					<0>,			/* Supply 1 doesn't need this */
-					<70000>;		/* Supply 2 */
-			clock-latency-ns = <300000>;
-		};
-	};
-};
-
-Example 5: opp-supported-hw
-(example: three level hierarchy of versions: cuts, substrate and process)
-
-/ {
-	cpus {
-		cpu@0 {
-			compatible = "arm,cortex-a7";
-			...
-
-			cpu-supply = <&cpu_supply>
-			operating-points-v2 = <&cpu0_opp_table_slow>;
-		};
-	};
-
-	opp_table {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-600000000 {
-			/*
-			 * Supports all substrate and process versions for 0xF
-			 * cuts, i.e. only first four cuts.
-			 */
-			opp-supported-hw = <0xF 0xFFFFFFFF 0xFFFFFFFF>
-			opp-hz = /bits/ 64 <600000000>;
-			...
-		};
-
-		opp-800000000 {
-			/*
-			 * Supports:
-			 * - cuts: only one, 6th cut (represented by 6th bit).
-			 * - substrate: supports 16 different substrate versions
-			 * - process: supports 9 different process versions
-			 */
-			opp-supported-hw = <0x20 0xff0000ff 0x0000f4f0>
-			opp-hz = /bits/ 64 <800000000>;
-			...
-		};
-
-		opp-900000000 {
-			/*
-			 * Supports:
-			 * - All cuts and substrate where process version is 0x2.
-			 * - All cuts and process where substrate version is 0x2.
-			 */
-			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0x02>, <0xFFFFFFFF 0x01 0xFFFFFFFF>
-			opp-hz = /bits/ 64 <900000000>;
-			...
-		};
-	};
-};
-
-Example 6: opp-microvolt-<name>, opp-microamp-<name>:
-(example: device with two possible microvolt ranges: slow and fast)
-
-/ {
-	cpus {
-		cpu@0 {
-			compatible = "arm,cortex-a7";
-			...
-
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
-
-	cpu0_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt-slow = <915000 900000 925000>;
-			opp-microvolt-fast = <975000 970000 985000>;
-			opp-microamp-slow =  <70000>;
-			opp-microamp-fast =  <71000>;
-		};
-
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt-slow = <915000 900000 925000>, /* Supply vcc0 */
-					      <925000 910000 935000>; /* Supply vcc1 */
-			opp-microvolt-fast = <975000 970000 985000>, /* Supply vcc0 */
-					     <965000 960000 975000>; /* Supply vcc1 */
-			opp-microamp =  <70000>; /* Will be used for both slow/fast */
-		};
-	};
-};
-
-Example 7: Single cluster Quad-core ARM cortex A53, OPP points from firmware,
-distinct clock controls but two sets of clock/voltage/current lines.
-
-/ {
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x100>;
-			next-level-cache = <&A53_L2>;
-			clocks = <&dvfs_controller 0>;
-			operating-points-v2 = <&cpu_opp0_table>;
-		};
-		cpu@1 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x101>;
-			next-level-cache = <&A53_L2>;
-			clocks = <&dvfs_controller 1>;
-			operating-points-v2 = <&cpu_opp0_table>;
-		};
-		cpu@2 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x102>;
-			next-level-cache = <&A53_L2>;
-			clocks = <&dvfs_controller 2>;
-			operating-points-v2 = <&cpu_opp1_table>;
-		};
-		cpu@3 {
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x103>;
-			next-level-cache = <&A53_L2>;
-			clocks = <&dvfs_controller 3>;
-			operating-points-v2 = <&cpu_opp1_table>;
-		};
-
-	};
-
-	cpu_opp0_table: opp0_table {
-		compatible = "operating-points-v2";
-		opp-shared;
-	};
-
-	cpu_opp1_table: opp1_table {
-		compatible = "operating-points-v2";
-		opp-shared;
-	};
-};
diff --git a/Documentation/devicetree/bindings/opp/qcom-opp.txt b/Documentation/devicetree/bindings/opp/qcom-opp.txt
index 32eb0793c7e6..41d3e4ff2dc3 100644
--- a/Documentation/devicetree/bindings/opp/qcom-opp.txt
+++ b/Documentation/devicetree/bindings/opp/qcom-opp.txt
@@ -1,7 +1,7 @@
 Qualcomm OPP bindings to describe OPP nodes
 
 The bindings are based on top of the operating-points-v2 bindings
-described in Documentation/devicetree/bindings/opp/opp.txt
+described in Documentation/devicetree/bindings/opp/opp-v2-base.yaml
 Additional properties are described below.
 
 * OPP Table Node
diff --git a/Documentation/devicetree/bindings/opp/ti-omap5-opp-supply.txt b/Documentation/devicetree/bindings/opp/ti-omap5-opp-supply.txt
index 832346e489a3..b70d326117cd 100644
--- a/Documentation/devicetree/bindings/opp/ti-omap5-opp-supply.txt
+++ b/Documentation/devicetree/bindings/opp/ti-omap5-opp-supply.txt
@@ -13,7 +13,7 @@ regulators to the device that will undergo OPP transitions we can make use
 of the multi regulator binding that is part of the OPP core described here [1]
 to describe both regulators needed by the platform.
 
-[1] Documentation/devicetree/bindings/opp/opp.txt
+[1] Documentation/devicetree/bindings/opp/opp-v2.yaml
 
 Required Properties for Device Node:
 - vdd-supply: phandle to regulator controlling VDD supply
diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index aed51e9dcb11..3143ed9a3313 100644
--- a/Documentation/devicetree/bindings/power/power-domain.yaml
+++ b/Documentation/devicetree/bindings/power/power-domain.yaml
@@ -46,7 +46,7 @@ properties:
       Phandles to the OPP tables of power domains provided by a power domain
       provider. If the provider provides a single power domain only or all
       the power domains provided by the provider have identical OPP tables,
-      then this shall contain a single phandle. Refer to ../opp/opp.txt
+      then this shall contain a single phandle. Refer to ../opp/opp-v2-base.yaml
       for more information.
 
   "#power-domain-cells":
-- 
2.27.0

