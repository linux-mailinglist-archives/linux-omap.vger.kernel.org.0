Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B913C2D2CC2
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 15:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbgLHOMG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 09:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729139AbgLHOMG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 09:12:06 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAC5C06138C
        for <linux-omap@vger.kernel.org>; Tue,  8 Dec 2020 06:10:41 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id m13so3439832ljo.11
        for <linux-omap@vger.kernel.org>; Tue, 08 Dec 2020 06:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E23eTr2Jxh27wQ1+0sxZOBBWYZDbcKVu8F0qLZ0IKIY=;
        b=w+EI6ugmrY3V1qVcvQiDjc626zqEFOAHVMhueu9h8zbQ7K0JTHdyZUPBIVwX4Lo135
         86QGht3BE+LF4s7El0Bw1ogw8ltcdsiy2YsmNKX3jXNBYjTfZyP0tX+i2xGFNT1TYLrC
         DvIsHotgNnJKCa8JDfn/9BOE/uQAsflhevb/Qnv6b1REwN2FxD+2G8TqKd7VDaXSrPxl
         vQWq3jN4vfDP2fqsuoYJDyFWMF8ABarbZoQndfVw2ZQgdfi+2GEAMWqw//342x2oC3PQ
         rZyhslbNS1eFuLjfz4+xg4ecrN45R/WnyZJ8wzfuQ1ETcMz4lBVPcFvuI4iH37rLUrZR
         wh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E23eTr2Jxh27wQ1+0sxZOBBWYZDbcKVu8F0qLZ0IKIY=;
        b=UcOlfGdwTc2f0S/C07pmzp1afBIqShN0fS6xZZ6+VaKtDtzFucd2o635hVauaTmdeu
         Q8NNgjfTkwWE3MPdC9vBA47ewP3XIVvWbEt41lBA/x46nCEPShQb/Wv8ILhhJPowNzYl
         u1MizvHXJ5FqnV10YggYnkeIgnepJuT+rOVd5jnVu+q3pp0c20Czb9KYlDSGWK2hpg21
         fmwxpucpZl7N1fOd6yfoxrVBLbZEyBIzf9Wv5cJf7EspEIdgGR813coGMeloUF1pLAPa
         o/Vo/wXTZn3zvERQjrIGsvJutBLG9u1dR3WYksxIuymivYD29C6TL+LuArq30ax6LYRC
         ZBxg==
X-Gm-Message-State: AOAM533UD88OwfDZXqVoQn+VsrQgP9DNzVs9a7KUWhgOwfqsOl2sSA56
        iLI/ArozSM6yTEL+9Va8OEiz9g==
X-Google-Smtp-Source: ABdhPJwaw2FMm9p6JzePhkJAHGc2fV6piYtiSOD+sI6oajUHrXa/+HqRvfMvjv6xb+ZMj1saUPhSTw==
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr10915676ljj.442.1607436639937;
        Tue, 08 Dec 2020 06:10:39 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id h23sm417017ljh.115.2020.12.08.06.10.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 06:10:39 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH v4 1/6] dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
Date:   Tue,  8 Dec 2020 15:09:57 +0100
Message-Id: <20201208141002.17777-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
References: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
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
v3->v4:
- no changes

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

