Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CC92B9420
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 15:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgKSOJC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 09:09:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbgKSOJB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Nov 2020 09:09:01 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2001BC0613CF
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 06:09:01 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f11so8433763lfs.3
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 06:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lEgF06r26Rcxa35r0APH5pRvcVW1Iw0xWvAo4CMMUy4=;
        b=zt4PA7FGZ/n/66SJI0xyxWUIqhYKC9i7I5QpC/gRFM0EGMWjCxwiHOmFr4tmVV3SuF
         2jrlV4mvT2me5RWuLgvLBvUQzwe89EG6O0RgJVYXNBkPAZ84YTvTOHjh2FDArHQQl6kv
         tG2c6fswGWDvkmyckHjQX6lVkUy4NfdyFabm0QQ/njOBxk6hURn6RiuXuT7tNAXVjmd0
         2Qo4RLHqmLPvwrzBkedysAVsn+6PhklqhvYcrWDRYUkCkY5x6nAay0XtzkDGQsJqr/SI
         h4n9FKpX0J9broTKAdiM5AQrXwxAWa1rgRzp67YLwHmzeipmOkFDdykmW02U4OtIBrra
         uoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lEgF06r26Rcxa35r0APH5pRvcVW1Iw0xWvAo4CMMUy4=;
        b=jswZPPwPZY0V0O3C0SWLeq3cGZHuv7iAxBxWA+JhLyj5a7hgKX3U4a5oUV+FDpbVHU
         zU3WPRVRsFWgRxyb18+TWwsBXUNHePkQ/mDjibgIZFkCh///USFcwaAtEu3fTjO9P/xp
         Y/MrJ4M+zTwGVTZu1Mmk30Rdr/98j7pTIW+cIf6a82vlE3Jb0W9lmE8ichzKsCmnHmDU
         iAzB0zPPyA5UppK2DkuzG74co83QAs9RhbzuWHyw/LIZ7kG4jlzKcJzr4y6PDzxCPCtA
         +P34vL+nVfo7680WOICh4VqKrZYs5DbH7k/tZxUblv9Kod6UvdN6TvNeHkthzTi/MG5K
         2gRA==
X-Gm-Message-State: AOAM531OSyosjpMAq1iXSkKlm9ZcnatuNwv52ilAiiL1KZD6PqRxFlul
        AI9krnB5UYJbfPqglwdF/zKVDw==
X-Google-Smtp-Source: ABdhPJxwB041b+gc0//i0TT066vYP1a7BkcSviQ6yguhzBXKfVwCvnyRGiZNGKrUSF17sFmSM8yx+A==
X-Received: by 2002:a19:84c5:: with SMTP id g188mr6645527lfd.270.1605794938293;
        Thu, 19 Nov 2020 06:08:58 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id h12sm4024706lfl.74.2020.11.19.06.08.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 06:08:57 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v2 1/6] dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
Date:   Thu, 19 Nov 2020 15:08:45 +0100
Message-Id: <20201119140850.12268-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
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

