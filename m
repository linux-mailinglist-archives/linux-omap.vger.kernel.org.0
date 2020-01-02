Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF4EC12E6B4
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 14:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgABN0R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 08:26:17 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60158 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgABN0R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 08:26:17 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002DQF0f037555;
        Thu, 2 Jan 2020 07:26:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577971575;
        bh=JX8J46IZEd2ze4JQ0BH3nUb0SUlQF54gmWznPebZI9U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xtUY/A02j+WdUqiOAW+x8jOix/pt0J/nxi2F6t0tyzo7iEwVKlw3oMbOOtUtIcQD+
         VhNRvDwAQdYI/WbJTsB7hC1K64bUEhiMlnDAU9Q7yFqzmxiTjQIhSGyqai1CCvIoAN
         uGv8vmSHgBAdeew4g8e/Z8/EcHWtbX6Kae+OAkqg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 002DQFbV077966
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jan 2020 07:26:15 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 07:26:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 07:26:14 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002DQCsP067691;
        Thu, 2 Jan 2020 07:26:12 -0600
Subject: Re: [PATCHv4 01/14] dt-bindings: remoteproc: Add OMAP remoteproc
 bindings
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, <s-anna@ti.com>
References: <20200102131845.12992-1-t-kristo@ti.com>
 <20200102131845.12992-2-t-kristo@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <0b9c2a59-7e12-93ef-f0f0-16558c4581c2@ti.com>
Date:   Thu, 2 Jan 2020 15:26:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200102131845.12992-2-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/01/2020 15:18, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add the device tree bindings document for the IPU and DSP
> remote processor devices on OMAP4+ SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo@ti.com: converted to schema]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v4: added ti,bootreg-shift and ti,autosuspend-delay properties

Rob + devicetree list was missed out on this, so resending this patch only.

-Tero

> 
>   .../remoteproc/ti,omap-remoteproc.yaml        | 329 ++++++++++++++++++
>   1 file changed, 329 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> new file mode 100644
> index 000000000000..f53d58efaae3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> @@ -0,0 +1,329 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,omap-remoteproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OMAP4+ Remoteproc Devices
> +
> +maintainers:
> +  - Suman Anna <s-anna@ti.com>
> +
> +description:
> +  The OMAP family of SoCs usually have one or more slave processor sub-systems
> +  that are used to offload some of the processor-intensive tasks, or to manage
> +  other hardware accelerators, for achieving various system level goals.
> +
> +  The processor cores in the sub-system are usually behind an IOMMU, and may
> +  contain additional sub-modules like Internal RAM and/or ROMs, L1 and/or L2
> +  caches, an Interrupt Controller, a Cache Controller etc.
> +
> +  The OMAP SoCs usually have a DSP processor sub-system and/or an IPU processor
> +  sub-system. The DSP processor sub-system can contain any of the TI's C64x,
> +  C66x or C67x family of DSP cores as the main execution unit. The IPU processor
> +  sub-system usually contains either a Dual-Core Cortex-M3 or Dual-Core
> +  Cortex-M4 processors.
> +
> +  Each remote processor sub-system is represented as a single DT node. Each node
> +  has a number of required or optional properties that enable the OS running on
> +  the host processor (MPU) to perform the device management of the remote
> +  processor and to communicate with the remote processor. The various properties
> +  can be classified as constant or variable. The constant properties are
> +  dictated by the SoC and does not change from one board to another having the
> +  same SoC. Examples of constant properties include 'iommus', 'reg'. The
> +  variable properties are dictated by the system integration aspects such as
> +  memory on the board, or configuration used within the corresponding firmware
> +  image. Examples of variable properties include 'mboxes', 'memory-region',
> +  'timers', 'watchdog-timers' etc.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,omap4-dsp
> +      - ti,omap5-dsp
> +      - ti,dra7-dsp
> +      - ti,omap4-ipu
> +      - ti,omap5-ipu
> +      - ti,dra7-ipu
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      phandles to OMAP IOMMU nodes, that need to be programmed
> +      for this remote processor to access any external RAM memory or
> +      other peripheral device address spaces. This property usually
> +      has only a single phandle. Multiple phandles are used only in
> +      cases where the sub-system has different ports for different
> +      sub-modules within the processor sub-system (eg: DRA7 DSPs),
> +      and need the same programming in both the MMUs.
> +
> +  mboxes:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
> +      communication with the remote processor. The specifier format is
> +      as per the bindings,
> +      Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
> +      This property should match with the sub-mailbox node used in
> +      the firmware image.
> +
> +  clocks:
> +    description: |
> +      Main functional clock for the remote processor
> +
> +  resets:
> +    description: |
> +      Reset handles for the remote processor
> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the reserved memory node to be associated
> +      with the remoteproc device. The reserved memory node
> +      can be a CMA memory node, and should be defined as
> +      per the bindings,
> +      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +
> +  firmware-name:
> +    description: |
> +      Default name of the firmware to load to the remote processor.
> +
> +# Optional properties:
> +# --------------------
> +# Some of these properties are mandatory on some SoCs, and some are optional
> +# depending on the configuration of the firmware image to be executed on the
> +# remote processor. The conditions are mentioned for each property.
> +#
> +# The following are the optional properties:
> +
> +  reg:
> +    description: |
> +      Address space for any remoteproc memories present on
> +      the SoC. Should contain an entry for each value in
> +      'reg-names'. These are mandatory for all DSP and IPU
> +      processors that have them (OMAP4/OMAP5 DSPs do not have
> +      any RAMs)
> +
> +  reg-names:
> +    description: |
> +      Required names for each of the address spaces defined in
> +      the 'reg' property. Should contain a string from among
> +      the following names, each representing the corresponding
> +      internal RAM memory region.
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      - const: l2ram
> +      - const: l1pram
> +      - const: l1dram
> +
> +  ti,bootreg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      Should be a pair of the phandle to the System Control
> +      Configuration region that contains the boot address
> +      register, and the register offset of the boot address
> +      register within the System Control module. This property
> +      is required for all the DSP instances on OMAP4, OMAP5
> +      and DRA7xx SoCs.
> +
> +  ti,bootreg-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Describes the bit position of the boot address field within
> +      the ti,bootreg.
> +
> +  ti,autosuspend-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Custom autosuspend delay for the remoteproc in milliseconds.
> +
> +  ti,timers:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      One or more phandles to OMAP DMTimer nodes, that serve
> +      as System/Tick timers for the OS running on the remote
> +      processors. This will usually be a single timer if the
> +      processor sub-system is running in SMP mode, or one per
> +      core in the processor sub-system. This can also be used
> +      to reserve specific timers to be dedicated to the
> +      remote processors.
> +
> +      This property is mandatory on remote processors requiring
> +      external tick wakeup, and to support Power Management
> +      features. The timers to be used should match with the
> +      timers used in the firmware image.
> +
> +  ti,watchdog-timers:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      One or more phandles to OMAP DMTimer nodes, used to
> +      serve as Watchdog timers for the processor cores. This
> +      will usually be one per executing processor core, even
> +      if the processor sub-system is running a SMP OS.
> +
> +      The timers to be used should match with the watchdog
> +      timers used in the firmware image.
> +
> +if:
> +  properties:
> +    compatible:
> +      enum:
> +        - ti,dra7-dsp
> +then:
> +  properties:
> +    reg:
> +      minItems: 3
> +      maxItems: 3
> +    ti,bootreg:
> +      minItems: 1
> +      maxItems: 1
> +    ti,bootreg-shift:
> +      minItems: 1
> +      maxItems: 1
> +
> +else:
> +  if:
> +    properties:
> +      compatible:
> +        enum:
> +          - ti,omap4-ipu
> +          - ti,omap5-ipu
> +          - ti,dra7-ipu
> +  then:
> +    properties:
> +      reg:
> +        minItems: 1
> +        maxItems: 1
> +
> +  else:
> +    properties:
> +      reg:
> +        maxItems: 0
> +      ti,bootreg:
> +        minItems: 1
> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - iommus
> +  - mboxes
> +  - memory-region
> +  - clocks
> +  - resets
> +  - firmware-name
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    //Example 1: OMAP4 DSP
> +
> +    /* DSP Reserved Memory node */
> +    #include <dt-bindings/clock/omap4.h>
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        dsp_memory_region: dsp-memory@98000000 {
> +            compatible = "shared-dma-pool";
> +            reg = <0x98000000 0x800000>;
> +            reusable;
> +        };
> +    };
> +
> +    /* DSP node */
> +    ocp {
> +        dsp: dsp {
> +            compatible = "ti,omap4-dsp";
> +            ti,bootreg = <&scm_conf 0x304>;
> +            iommus = <&mmu_dsp>;
> +            mboxes = <&mailbox &mbox_dsp>;
> +            memory-region = <&dsp_memory_region>;
> +            ti,timers = <&timer5>;
> +            ti,watchdog-timers = <&timer6>;
> +            clocks = <&tesla_clkctrl OMAP4_DSP_CLKCTRL 0>;
> +            resets = <&prm_tesla 0>, <&prm_tesla 1>;
> +            firmware-name = "omap4-dsp-fw.xe64T";
> +        };
> +    };
> +
> +  - |+
> +
> +    //Example 2: OMAP5 IPU
> +
> +    /* IPU Reserved Memory node */
> +    #include <dt-bindings/clock/omap5.h>
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        ipu_memory_region: ipu-memory@95800000 {
> +            compatible = "shared-dma-pool";
> +            reg = <0 0x95800000 0 0x3800000>;
> +            reusable;
> +        };
> +    };
> +
> +    /* IPU node */
> +    ocp {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        ipu: ipu@55020000 {
> +            compatible = "ti,omap5-ipu";
> +            reg = <0x55020000 0x10000>;
> +            reg-names = "l2ram";
> +            iommus = <&mmu_ipu>;
> +            mboxes = <&mailbox &mbox_ipu>;
> +            memory-region = <&ipu_memory_region>;
> +            ti,timers = <&timer3>, <&timer4>;
> +            ti,watchdog-timers = <&timer9>, <&timer11>;
> +            clocks = <&ipu_clkctrl OMAP5_MMU_IPU_CLKCTRL 0>;
> +            resets = <&prm_core 2>;
> +            firmware-name = "omap5-ipu-fw.xem";
> +        };
> +    };
> +
> +  - |+
> +
> +    //Example 3: DRA7xx/AM57xx DSP
> +
> +    /* DSP1 Reserved Memory node */
> +    #include <dt-bindings/clock/dra7.h>
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dsp1_memory_region: dsp1-memory@99000000 {
> +            compatible = "shared-dma-pool";
> +            reg = <0x0 0x99000000 0x0 0x4000000>;
> +            reusable;
> +        };
> +    };
> +
> +    /* DSP1 node */
> +    ocp {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        dsp1: dsp@40800000 {
> +            compatible = "ti,dra7-dsp";
> +            reg = <0x40800000 0x48000>,
> +                  <0x40e00000 0x8000>,
> +                  <0x40f00000 0x8000>;
> +            reg-names = "l2ram", "l1pram", "l1dram";
> +            ti,bootreg = <&scm_conf 0x55c>;
> +            iommus = <&mmu0_dsp1>, <&mmu1_dsp1>;
> +            mboxes = <&mailbox5 &mbox_dsp1_ipc3x>;
> +            memory-region = <&dsp1_memory_region>;
> +            ti,timers = <&timer5>;
> +            ti,watchdog-timers = <&timer10>;
> +            resets = <&prm_dsp1 0>;
> +            clocks = <&dsp1_clkctrl DRA7_DSP1_MMU0_DSP1_CLKCTRL 0>;
> +            firmware-name = "dra7-dsp1-fw.xe66";
> +        };
> +    };
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
