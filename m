Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7B524788A
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 23:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgHQVPD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 17:15:03 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36843 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbgHQVPB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 17:15:01 -0400
Received: by mail-io1-f66.google.com with SMTP id t15so19159130iob.3;
        Mon, 17 Aug 2020 14:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=snsAzHkz839n6S18IlngyBCJFhAf16b1/bvGIJjk2O8=;
        b=nlqd8vimUqKyso+74VXNsn4NN6xgPF5GP4GuVCibWTmqefFSTcQkmpRasWGxAa++HO
         JukcKszScl5bIVScut9/kgtXMMz7eKzXB/hmrC5fvLzgaG7niKgFdZmdRwl9RZ8xgF4h
         qiWrm/PhEncMr83VNQWEiH0iOVQJXHR7px8xihCP4giFOUOPySwqPXpz/07udT5cJJgc
         O0F6sIdbMnDhTwGgYQBuPa85zhR/M/Z/+HRGpk4kU6uh7lPhJev9xyhFwZiuf/hlFwg5
         VbFRj2SHo76XvBiHfXrl0RZp72szcZF90t+dksqPKqexRvLNukWZKIPKb9Sgq/tHEp3c
         Nskg==
X-Gm-Message-State: AOAM5302sZiqDHnmE1IGWjn/vy3GaW3OYTlnjR74JDrgprx+h28uHaJC
        rIteKXGhxlt8PYa4X5lpVg==
X-Google-Smtp-Source: ABdhPJzbIVIdFk3GH9MgMyDqdnPxo5fNv4MYtgKxaGBChDLBjnBhO4Z1aReaDwqOB0llWn4KuUSU/Q==
X-Received: by 2002:a5e:9247:: with SMTP id z7mr13890736iop.1.1597698899075;
        Mon, 17 Aug 2020 14:14:59 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id n15sm9590095ioc.15.2020.08.17.14.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 14:14:58 -0700 (PDT)
Received: (nullmailer pid 1574245 invoked by uid 1000);
        Mon, 17 Aug 2020 21:14:56 -0000
Date:   Mon, 17 Aug 2020 15:14:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     ssantosh@kernel.org, s-anna@ti.com, santosh.shilimkar@oracle.com,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wmills@ti.com,
        praneeth@ti.com, Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 1/6] dt-bindings: soc: ti: Add TI PRUSS bindings
Message-ID: <20200817211456.GA1542592@bogus>
References: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1596020528-19510-2-git-send-email-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596020528-19510-2-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jul 29, 2020 at 01:02:03PM +0200, Grzegorz Jaszczyk wrote:
> This patch adds the bindings for the Programmable Real-Time Unit
> and Industrial Communication Subsystem (PRU-ICSS) present on various
> TI SoCs. The IP is present on multiple TI SoC architecture families
> including the OMAP architecture SoCs such as AM33xx, AM437x and
> AM57xx; and on a Keystone 2 architecture based 66AK2G SoC. It is
> also present on the Davinci based OMAPL138 SoCs and K3 architecture
> based AM65x and J721E SoCs as well.
> 
> The IP has a number of sub-modules some of which are represented as
> their own devices. This binding covers only the top-level sub-system
> devices, and some sub-modules like MDIO, MII_RT (Ethernet MII_RT module
> with MII ports) and IEP (Industrial Ethernet Peripheral). The remaining
> sub-modules bindings shall be defined in the respective driver
> subsystem bindings folders. Couple of full examples have also been
> added demonstrating the devices on AM335x and AM437x SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Reviewed-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml       | 383 +++++++++++++++++++++
>  1 file changed, 383 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> new file mode 100644
> index 0000000..4b7a098
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> @@ -0,0 +1,383 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: |+
> +  TI Programmable Real-Time Unit and Industrial Communication Subsystem
> +
> +maintainers:
> +  - Suman Anna <s-anna@ti.com>
> +
> +description: |+
> +
> +  The Programmable Real-Time Unit and Industrial Communication Subsystem
> +  (PRU-ICSS a.k.a. PRUSS) is present on various TI SoCs such as AM335x, AM437x,
> +  Keystone 66AK2G, OMAP-L138/DA850 etc. A PRUSS consists of dual 32-bit RISC
> +  cores (Programmable Real-Time Units, or PRUs), shared RAM, data and
> +  instruction RAMs, some internal peripheral modules to facilitate industrial
> +  communication, and an interrupt controller.
> +
> +  The programmable nature of the PRUs provide flexibility to implement custom
> +  peripheral interfaces, fast real-time responses, or specialized data handling.
> +  The common peripheral modules include the following,
> +    - an Ethernet MII_RT module with two MII ports
> +    - an MDIO port to control external Ethernet PHYs
> +    - an Industrial Ethernet Peripheral (IEP) to manage/generate Industrial
> +      Ethernet functions
> +    - an Enhanced Capture Module (eCAP)
> +    - an Industrial Ethernet Timer with 7/9 capture and 16 compare events
> +    - a 16550-compatible UART to support PROFIBUS
> +    - Enhanced GPIO with async capture and serial support
> +
> +  A PRU-ICSS subsystem can have up to three shared data memories. A PRU core
> +  acts on a primary Data RAM (there are usually 2 Data RAMs) at its address
> +  0x0, but also has access to a secondary Data RAM (primary to the other PRU
> +  core) at its address 0x2000. A shared Data RAM, if present, can be accessed
> +  by both the PRU cores. The Interrupt Controller (INTC) and a CFG module are
> +  common to both the PRU cores. Each PRU core also has a private instruction
> +  RAM, and specific register spaces for Control and Debug functionalities.
> +
> +  Various sub-modules within a PRU-ICSS subsystem are represented as individual
> +  nodes and are defined using a parent-child hierarchy depending on their
> +  integration within the IP and the SoC. These nodes are described in the
> +  following sections.
> +
> +
> +  PRU-ICSS Node
> +  ==============
> +  Each PRU-ICSS instance is represented as its own node with the individual PRU
> +  processor cores, the memories node, an INTC node and an MDIO node represented
> +  as child nodes within this PRUSS node. This node shall be a child of the
> +  corresponding interconnect bus nodes or target-module nodes.
> +
> +  See ../../mfd/syscon.yaml for generic SysCon binding details.
> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am3356-pruss  # for AM335x SoC family
> +      - ti,am4376-pruss0 # for AM437x SoC family and PRUSS unit 0
> +      - ti,am4376-pruss1 # for AM437x SoC family and PRUSS unit 1
> +      - ti,am5728-pruss  # for AM57xx SoC family
> +      - ti,k2g-pruss     # for 66AK2G SoC family
> +      - ti,am654-icssg   # for K3 AM65x SoC family
> +      - ti,j721e-icssg   # for K3 J721E SoC family
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges:
> +    maxItems: 1
> +    description: |
> +      Standard ranges definition using addresses from 0 for child nodes.

Don't need a description on standard properties.

> +
> +  power-domains:
> +    description: |
> +      This property is as per sci-pm-domain.txt.
> +
> +  memories:

Missing unit-address pattern.

> +    description: |
> +      The various Data RAMs within a single PRU-ICSS unit are represented as a
> +      single node with the name 'memories'.
> +
> +    type: object
> +
> +    properties:
> +      reg:
> +        minItems: 2 # On AM437x one of two PRUSS units don't contain Shared RAM.
> +        maxItems: 3
> +        items:
> +          - description: Address and size of the Data RAM0.
> +          - description: Address and size of the Data RAM1.
> +          - description: |
> +              Address and size of the Shared Data RAM. Note that on AM437x one
> +              of two PRUSS units don't contain Shared RAM, while the second one
> +              has it.
> +
> +      reg-names:
> +        minItems: 2
> +        maxItems: 3
> +        items:
> +          - const: dram0
> +          - const: dram1
> +          - const: shrdram2
> +
> +    required:
> +      - reg
> +      - reg-names

       additionalProperties: false


(And throughout for other child nodes).

> +
> +  cfg:
> +    description: |
> +      PRU-ICSS configuration space. CFG sub-module represented as a SysCon.
> +
> +    type: object
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: ti,pruss-cfg
> +          - const: syscon
> +
> +      reg:
> +        maxItems: 1
> +
> +  iep:
> +    description: |
> +      Industrial Ethernet Peripheral to manage/generate Industrial Ethernet
> +      functions such as time stamping. Each PRUSS has either 1 IEP (on AM335x,
> +      AM437x, AM57xx & 66AK2G SoCs) or 2 IEPs (on K3 AM65x & J721E SoCs ). IEP
> +      is used for creating PTP clocks and generating PPS signals. The bindings
> +      for this shall be defined in ../../net/ti,icss-iep.yaml.
> +
> +    type: object
> +
> +  mii-rt:
> +    description: |
> +      Real-Time Ethernet to support multiple industrial communication protocols.
> +      MII-RT sub-module represented as a SysCon.
> +
> +    type: object
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: ti,pruss-mii
> +          - const: syscon
> +
> +      reg:
> +        maxItems: 1
> +
> +  mii-g-rt:
> +    description: |
> +      The Real-time Media Independent Interface to support multiple industrial
> +      communication protocols (G stands for Gigabit). MII-G-RT sub-module
> +      represented as a SysCon.
> +
> +    type: object
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: ti,pruss-mii-g
> +          - const: syscon
> +
> +      reg:
> +        maxItems: 1
> +
> +  interrupt-controller:
> +    description: |
> +      PRUSS INTC Node. Each PRUSS has a single interrupt controller instance
> +      that is common to all the PRU cores. This should be represented as an
> +      interrupt-controller node. The bindings for this shall be defined in
> +      ../../interrupt-controller/ti,pruss-intc.yaml.

Use $ref to reference the schema.

> +
> +    type: object
> +
> +  mdio:
> +    description: |
> +      MDIO Node. Each PRUSS has an MDIO module that can be used to control
> +      external PHYs. The MDIO module used within the PRU-ICSS is an instance of
> +      the MDIO Controller used in TI Davinci SoCs.
> +
> +    allOf:
> +      - $ref: /schemas/net/ti,davinci-mdio.yaml#
> +
> +    type: object
> +
> +patternProperties:
> +  "^(pru|rtu|txpru)@[0-9a-f]+$":
> +    description: |
> +      PRU Node. Each PRUSS has dual PRU cores, each represented as a RemoteProc
> +      device through a PRU child node each. Each node can optionally be rendered
> +      inactive by using the standard DT string property, "status". The ICSSG IP
> +      present on K3 SoCs have additional auxiliary PRU cores with slightly
> +      different IP integration. The bindings for this shall be defined in
> +      ../../remoteproc/ti,pru-rproc.yaml
> +
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +
> +# Due to inability of correctly verifying sub-nodes with an @address through
> +# the "required" list, the required sub-nodes below are commented out for now.
> +
> +#required:
> +# - memories
> +# - interrupt-controller
> +# - pru

Add:

additionalProperties: false

> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - ti,k2g-pruss
> +          - ti,am654-icssg
> +          - ti,j721e-icssg
> +then:
> +  required:
> +    - power-domains
> +
> +examples:
> +  - |
> +
> +    /* Example 1 AM33xx PRU-ICSS */
> +    pruss: pruss@0 {
> +        compatible = "ti,am3356-pruss";
> +        reg = <0x0 0x80000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;

I would have expected a warning on this since you defined it to have 1 
entry.

> +
> +        pruss_mem: memories@0 {
> +            reg = <0x0 0x2000>,
> +                  <0x2000 0x2000>,
> +                  <0x10000 0x3000>;
> +            reg-names = "dram0", "dram1", "shrdram2";
> +        };
> +
> +        pruss_cfg: cfg@26000 {
> +            compatible = "ti,pruss-cfg", "syscon";
> +            reg = <0x26000 0x2000>;
> +        };
> +
> +        pruss_iep: iep@2e000 {
> +            compatible = "ti,am3356-icss-iep";
> +            reg = <0x2e000 0x31c>;
> +            clocks = <&pruss_iepclk_mux>;
> +        };
> +
> +        pruss_mii_rt: mii-rt@32000 {
> +            compatible = "ti,pruss-mii", "syscon";
> +            reg = <0x32000 0x58>;
> +        };
> +
> +        pruss_intc: interrupt-controller@20000 {
> +            compatible = "ti,pruss-intc";
> +            reg = <0x20000 0x2000>;
> +            interrupts = <20 21 22 23 24 25 26 27>;
> +            interrupt-names = "host_intr0", "host_intr1",
> +                              "host_intr2", "host_intr3",
> +                              "host_intr4", "host_intr5",
> +                              "host_intr6", "host_intr7";
> +            interrupt-controller;
> +            #interrupt-cells = <3>;
> +        };
> +
> +        pru0: pru@34000 {
> +            compatible = "ti,am3356-pru";
> +            reg = <0x34000 0x2000>,
> +                  <0x22000 0x400>,
> +                  <0x22400 0x100>;
> +            reg-names = "iram", "control", "debug";
> +            firmware-name = "am335x-pru0-fw";
> +        };
> +
> +        pru1: pru@38000 {
> +            compatible = "ti,am3356-pru";
> +            reg = <0x38000 0x2000>,
> +                  <0x24000 0x400>,
> +                  <0x24400 0x100>;
> +            reg-names = "iram", "control", "debug";
> +            firmware-name = "am335x-pru1-fw";
> +        };
> +
> +        pruss_mdio: mdio@32400 {
> +            compatible = "ti,davinci_mdio";
> +            reg = <0x32400 0x90>;
> +            clocks = <&dpll_core_m4_ck>;
> +            clock-names = "fck";
> +            bus_freq = <1000000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +        };
> +    };
> +
> +  - |
> +
> +    /* Example 2 AM43xx PRU-ICSS with PRUSS1 node */
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pruss1: pruss@0 {
> +        compatible = "ti,am4376-pruss";
> +        reg = <0x0 0x40000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        pruss1_mem: memories@0 {
> +            reg = <0x0 0x2000>,
> +                  <0x2000 0x2000>,
> +                  <0x10000 0x8000>;
> +            reg-names = "dram0", "dram1", "shrdram2";
> +        };
> +
> +        pruss1_cfg: cfg@26000 {
> +            compatible = "ti,pruss-cfg", "syscon";
> +            reg = <0x26000 0x2000>;
> +        };
> +
> +        pruss1_iep: iep@2e000 {
> +            compatible = "ti,am3356-icss-iep";
> +            reg = <0x2e000 0x31c>;
> +            clocks = <&pruss_iepclk_mux>;
> +        };
> +
> +        pruss1_mii_rt: mii-rt@32000 {
> +            compatible = "ti,pruss-mii", "syscon";
> +            reg = <0x32000 0x58>;
> +        };
> +
> +        pruss1_intc: interrupt-controller@20000 {
> +            compatible = "ti,pruss-intc";
> +            reg = <0x20000 0x2000>;
> +            interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "host_intr0", "host_intr1",
> +                              "host_intr2", "host_intr3",
> +                              "host_intr4", "host_intr6",
> +                              "host_intr7";
> +            interrupt-controller;
> +            #interrupt-cells = <3>;
> +        };
> +
> +        pru1_0: pru@34000 {
> +            compatible = "ti,am4376-pru";
> +            reg = <0x34000 0x3000>,
> +                  <0x22000 0x400>,
> +                  <0x22400 0x100>;
> +            reg-names = "iram", "control", "debug";
> +            firmware-name = "am437x-pru1_0-fw";
> +        };
> +
> +        pru1_1: pru@38000 {
> +            compatible = "ti,am4376-pru";
> +            reg = <0x38000 0x3000>,
> +                  <0x24000 0x400>,
> +                  <0x24400 0x100>;
> +            reg-names = "iram", "control", "debug";
> +            firmware-name = "am437x-pru1_1-fw";
> +        };
> +
> +        pruss1_mdio: mdio@32400 {
> +            compatible = "ti,davinci_mdio";
> +            reg = <0x32400 0x90>;
> +            clocks = <&dpll_core_m4_ck>;
> +            clock-names = "fck";
> +            bus_freq = <1000000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +        };
> +    };
> +
> +...
> -- 
> 2.7.4
> 
