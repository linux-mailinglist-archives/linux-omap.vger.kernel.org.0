Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C838C2CF569
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 21:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbgLDUTS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 15:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728668AbgLDUTS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 15:19:18 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CABAC061A54
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 12:18:19 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id v14so9391240lfo.3
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 12:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qhly/U7wUKF7bqE61himMhH+kUAvTS+oTUyN7cuZEII=;
        b=xoEf20GHyh41YPle2yks4pfGyT6vcsRsmJQOK/IYN+lE+O4IuBQ51Bopsv8d+JesO0
         xt3UajUrdfdtogYHnm7TR9JpbGlKKM0PzRoqw0fIyvxfdLaewtG4IsHwKJv7SLRwHQiC
         vVkTpqv75WgnHt/OV+hBeQPkQ4xO3lf+WZV+JUk4PNrbNfKdzru8lEE9Ym0C1y0qBE66
         z8MM8faaOMU29hZCpbHvc5PUGeeAsNJCyhMUiA1d/U6ReDKKLNJnEpguFuQ1UEnYbw26
         pNcsavs3ZLXtN6uWZTFH558QMswZ9ru4cRgAFaeFc9eDkGJS5HCxxJNsToX2Va/8s8JI
         djyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qhly/U7wUKF7bqE61himMhH+kUAvTS+oTUyN7cuZEII=;
        b=ChzXKqGj9NMr0dYMO6FSEF67YiGehfxbUI6aPyboxZWNg691PyoZs4xBkQStNcyVZe
         CjUlWg4uxyl2cw2F3+gOLOArZpdPVMFB6/bzy3yHL632Qy6p2pOxgoIz40zOFldgsiMn
         ou94iDugmt3G8n2FMNp/+fy/pNBDSQtc3taESLEX6d/LY/srRvnKDmN3PGzZdJik3NRE
         5y8FDKH97OPF7niXqWbrzYhmfY+Pd6E7BDVX+7CrW5hkq/O2imcdZVeTwuGL2hJg/Hcb
         oWStPcl3eh7eca90Jvqc1X/9b0Ghq6vt2Wmtvi37HxPmUEnovNgAguz0yLROHEsXlUjb
         WkzQ==
X-Gm-Message-State: AOAM533C9MRPJbIKSfGmYs39XslBMBx/c3ZDv/tTyg1b/nqM/c9PF8sU
        2sT31VA14E4PNsFjz/NVFeZQbZwn6Oqybg==
X-Google-Smtp-Source: ABdhPJzRiRPPokQlXeW0VtVLTEQEDLVYmH7gfTMtAbJWq2Jvmn1/Me0fOcDOBnWhEhG00ZvRyX39aw==
X-Received: by 2002:a05:6512:3305:: with SMTP id k5mr568054lfe.35.1607113097750;
        Fri, 04 Dec 2020 12:18:17 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w21sm2036918lff.280.2020.12.04.12.18.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Dec 2020 12:18:17 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v3 1/6] dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
Date:   Fri,  4 Dec 2020 21:18:02 +0100
Message-Id: <20201204201807.14716-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
References: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The Programmable Real-Time Unit and Industrial Communication Subsystem
(PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
RISC cores (Programmable Real-Time Units, or PRUs) for program execution.

The K3 AM65x amd J721E SoCs have the next generation of the PRU-ICSS IP,
commonly called ICSSG. The ICSSG IP on AM65x SoCs has two PRU cores,
two auxiliary custom PRU cores called Real Time Units (RTUs). The K3
AM65x SR2.0 and J721E SoCs have a revised version of the ICSSG IP, and
include two additional custom auxiliary PRU cores called Transmit PRUs
(Tx_PRUs).

This patch adds the bindings for these PRU cores. The binding covers the
OMAP architecture SoCs - AM33xx, AM437x and AM57xx; Keystone 2 architecture
based 66AK2G SoC; and the K3 architecture based SoCs - AM65x and J721E. The
Davinci based OMAPL138 SoCs will be covered in a future patch.

Co-developed-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v2->v3:
- no changes
v1->v2:
- fix below yamllint warnings:
./Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml:37:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
./Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml:92:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
---
 .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 ++++++++++++++++++
 1 file changed, 214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
new file mode 100644
index 000000000000..63071eef1632
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
@@ -0,0 +1,214 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,pru-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Programmable Realtime Unit (PRU) cores
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: |
+  Each Programmable Real-Time Unit and Industrial Communication Subsystem
+  (PRU-ICSS or PRUSS) has two 32-bit load/store RISC CPU cores called
+  Programmable Real-Time Units (PRUs), each represented by a node. Each PRU
+  core has a dedicated Instruction RAM, Control and Debug register sets, and
+  use the Data RAMs present within the PRU-ICSS for code execution.
+
+  The K3 SoCs containing ICSSG v1.0 (eg: AM65x SR1.0) also have two Auxiliary
+  PRU cores called RTUs with slightly different IP integration. The K3 SoCs
+  containing the revised ICSSG v1.1 (eg: J721E, AM65x SR2.0) have an extra two
+  auxiliary Transmit PRU cores called Tx_PRUs that augment the PRUs. Each RTU
+  or Tx_PRU core can also be used independently like a PRU, or alongside a
+  corresponding PRU core to provide/implement auxiliary functionality/support.
+
+  Each PRU, RTU or Tx_PRU core node should be defined as a child node of the
+  corresponding PRU-ICSS node. Each node can optionally be rendered inactive by
+  using the standard DT string property, "status".
+
+  Please see the overall PRU-ICSS bindings document for additional details
+  including a complete example,
+    Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+
+properties:
+  compatible:
+    enum:
+      - ti,am3356-pru   # for AM335x SoC family (AM3356+ SoCs only)
+      - ti,am4376-pru   # for AM437x SoC family (AM4376+ SoCs only)
+      - ti,am5728-pru   # for AM57xx SoC family
+      - ti,k2g-pru      # for 66AK2G SoC family
+      - ti,am654-pru    # for PRUs in K3 AM65x SoC family
+      - ti,am654-rtu    # for RTUs in K3 AM65x SoC family
+      - ti,am654-tx-pru # for Tx_PRUs in K3 AM65x SR2.0 SoCs
+      - ti,j721e-pru    # for PRUs in K3 J721E SoC family
+      - ti,j721e-rtu    # for RTUs in K3 J721E SoC family
+      - ti,j721e-tx-pru # for Tx_PRUs in K3 J721E SoC family
+
+  reg:
+    items:
+      - description: Address and Size of the PRU Instruction RAM
+      - description: Address and Size of the PRU CTRL sub-module registers
+      - description: Address and Size of the PRU Debug sub-module registers
+
+  reg-names:
+    items:
+      - const: iram
+      - const: control
+      - const: debug
+
+  firmware-name:
+    description: |
+      Should contain the name of the default firmware image
+      file located on the firmware search path.
+
+if:
+  properties:
+    compatible:
+      enum:
+        - ti,am654-rtu
+        - ti,j721e-rtu
+then:
+  properties:
+    $nodename:
+      pattern: "^rtu@[0-9a-f]+$"
+else:
+  if:
+    properties:
+      compatible:
+        enum:
+          - ti,am654-tx-pru
+          - ti,j721e-tx-pru
+  then:
+    properties:
+      $nodename:
+        pattern: "^txpru@[0-9a-f]+"
+  else:
+    properties:
+      $nodename:
+        pattern: "^pru@[0-9a-f]+$"
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - firmware-name
+
+additionalProperties: false
+
+examples:
+  - |
+    /* AM33xx PRU-ICSS */
+    pruss_tm: target-module@300000 {  /* 0x4a300000, ap 9 04.0 */
+      compatible = "ti,sysc-pruss", "ti,sysc";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0x0 0x300000 0x80000>;
+
+      pruss: pruss@0 {
+        compatible = "ti,am3356-pruss";
+        reg = <0x0 0x80000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        pruss_mem: memories@0 {
+          reg = <0x0 0x2000>,
+                <0x2000 0x2000>,
+                <0x10000 0x3000>;
+          reg-names = "dram0", "dram1", "shrdram2";
+        };
+
+        pru0: pru@34000 {
+          compatible = "ti,am3356-pru";
+          reg = <0x34000 0x2000>,
+                <0x22000 0x400>,
+                <0x22400 0x100>;
+          reg-names = "iram", "control", "debug";
+          firmware-name = "am335x-pru0-fw";
+        };
+
+        pru1: pru@38000 {
+          compatible = "ti,am3356-pru";
+          reg = <0x38000 0x2000>,
+                <0x24000 0x400>,
+                <0x24400 0x100>;
+          reg-names = "iram", "control", "debug";
+          firmware-name = "am335x-pru1-fw";
+        };
+      };
+    };
+
+  - |
+    /* AM65x SR2.0 ICSSG */
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    icssg0: icssg@b000000 {
+      compatible = "ti,am654-icssg";
+      reg = <0xb000000 0x80000>;
+      power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0x0 0xb000000 0x80000>;
+
+      icssg0_mem: memories@0 {
+        reg = <0x0 0x2000>,
+              <0x2000 0x2000>,
+              <0x10000 0x10000>;
+        reg-names = "dram0", "dram1", "shrdram2";
+      };
+
+      pru0_0: pru@34000 {
+        compatible = "ti,am654-pru";
+        reg = <0x34000 0x4000>,
+              <0x22000 0x100>,
+              <0x22400 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-pru0_0-fw";
+      };
+
+      rtu0_0: rtu@4000 {
+        compatible = "ti,am654-rtu";
+        reg = <0x4000 0x2000>,
+              <0x23000 0x100>,
+              <0x23400 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-rtu0_0-fw";
+      };
+
+      tx_pru0_0: txpru@a000 {
+        compatible = "ti,am654-tx-pru";
+        reg = <0xa000 0x1800>,
+              <0x25000 0x100>,
+              <0x25400 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-txpru0_0-fw";
+      };
+
+      pru0_1: pru@38000 {
+        compatible = "ti,am654-pru";
+        reg = <0x38000 0x4000>,
+              <0x24000 0x100>,
+              <0x24400 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-pru0_1-fw";
+      };
+
+      rtu0_1: rtu@6000 {
+        compatible = "ti,am654-rtu";
+        reg = <0x6000 0x2000>,
+              <0x23800 0x100>,
+              <0x23c00 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-rtu0_1-fw";
+      };
+
+      tx_pru0_1: txpru@c000 {
+        compatible = "ti,am654-tx-pru";
+        reg = <0xc000 0x1800>,
+              <0x25800 0x100>,
+              <0x25c00 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-txpru0_1-fw";
+      };
+    };
-- 
2.29.0

