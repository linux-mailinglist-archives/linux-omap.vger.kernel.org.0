Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36181FB287
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 15:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbfKMOZz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 09:25:55 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38144 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfKMOZz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Nov 2019 09:25:55 -0500
Received: by mail-oi1-f196.google.com with SMTP id a14so1923515oid.5;
        Wed, 13 Nov 2019 06:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jDJS2QwW824o4pXXrVKxP32CoVmCkySjlsbMtby2uJc=;
        b=sLodDYfULso+RreZEDUXroi2FY8Znp/1E8vmcJEjCoyaxYQ8JtydIkYsUjdehOydrr
         wPbtpHuq6f0v6ftIWGtlUCvlXxN19DOTHw6pVmcMGLsKxEVvpGpBw/biQwCMqgPHnMSR
         c17dnXmuqlJD2X1sKBdYXjcB1Ndq2x0J4mhZ82yQi4Bit/svRcU/tF9Ddjdp8P61S9aF
         2Kq602nxPb7C1s3sH2L85UsT3EHC6EvaC3p+BNRD7wcZk/GJDJm2eDMxpTM6agy1t3wr
         O9jH2X2sNvk1w/F+usT3SI54HYyFJLBFpAOMnVcwxGT9/pA/gupco+qH3pQf8qB664bk
         soag==
X-Gm-Message-State: APjAAAXlDDCPsKXKL22QrtWAOrX8esubEOQz3xv1sV9kICOEls9yIEuK
        RSOXf3tFxKVsYThsazR2vA==
X-Google-Smtp-Source: APXvYqxkE+uraiaOTq4tn+4msrku074A8VfsKTiB2p+l5G43F/WkbKYaudVkufFeo16PZhRzZjabwA==
X-Received: by 2002:aca:4b82:: with SMTP id y124mr3370192oia.63.1573655153987;
        Wed, 13 Nov 2019 06:25:53 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w9sm697717oiw.48.2019.11.13.06.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 06:25:53 -0800 (PST)
Date:   Wed, 13 Nov 2019 08:25:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, s-anna@ti.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv2 01/17] dt-bindings: remoteproc: Add OMAP remoteproc
 bindings
Message-ID: <20191113142552.GA12429@bogus>
References: <20191028124238.19224-2-t-kristo@ti.com>
 <20191107140508.32298-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107140508.32298-1-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Nov 07, 2019 at 04:05:08PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add the device tree bindings document for the IPU and DSP
> remote processor devices on OMAP4+ SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo@ti.com: converted to schema]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  .../remoteproc/ti,omap-remoteproc.yaml        | 250 ++++++++++++++++++
>  1 file changed, 250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> new file mode 100644
> index 000000000000..901ccf1024c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> @@ -0,0 +1,249 @@
> +# SPDX-License-Identifier: GPL-2.0

For new bindings:

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

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
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

The type is already defined. You just need to say how many (with 
min/maxItems).

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
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Same here.

> +    description: |
> +      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
> +      communication with the remote processor. The specifier format is
> +      as per the bindings,
> +      Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
> +      This property should match with the sub-mailbox node used in
> +      the firmware image.
> +
> +# Optional properties:
> +# --------------------
> +# Some of these properties are mandatory on some SoCs, and some are optional
> +# depending on the configuration of the firmware image to be executed on the
> +# remote processor. The conditions are mentioned for each property.

if/then schema can define which ones are required for specific 
compatibles.

> +#
> +# The following are the optional properties:
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
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
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the reserved memory node to be associated
> +      with the remoteproc device. The reserved memory node
> +      can be a CMA memory node, and should be defined as
> +      per the bindings,
> +      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
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
> +required:
> +  - compatible
> +  - iommus
> +  - mboxes
> +
> +examples:
> +  - |
> +
> +    //Example 1: OMAP4 DSP
> +
> +    /* DSP Reserved Memory node */
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
> +        };
> +    };
> +
> +  - |+
> +
> +    //Example 2: OMAP5 IPU
> +
> +    /* IPU Reserved Memory node */
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
> +        };
> +    };
> +
> +  - |+
> +
> +    //Example 3: DRA7xx/AM57xx DSP
> +
> +    /* DSP1 Reserved Memory node */
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
> +        };
> +    };
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
