Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07978427268
	for <lists+linux-omap@lfdr.de>; Fri,  8 Oct 2021 22:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbhJHUlO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Oct 2021 16:41:14 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:44004 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhJHUlO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Oct 2021 16:41:14 -0400
Received: by mail-oi1-f178.google.com with SMTP id o4so15232911oia.10;
        Fri, 08 Oct 2021 13:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YwqJzn+wxrN26HJW0OMW2SzzsY8Wa5uyVVfnaK+wcAo=;
        b=VHf/bccPmIzCKvyCcXtu40LIrIFB9B7jYpiGEbvDvJ6bFeSSLdNwdj5bdlh9NxzeUl
         9kn7z6XhuBXp0hXsv30xXjiPImMe6Pc93GEgsIOz7olv3C2tjRDDSURBjfUtGwtquxd+
         IQBgkqjOWLTJf5AVis8Ctp5w7Bg7twp7NA/ai1+aSE1JIKl56NeAuIOpAydRbAnlgxKd
         WEBBE1K9C9/CRyElzXl1Vr329csqAMjbgmbJc8JpY/9dlW7V1Pr2tOqrPRGO/HHKNV0Q
         8qmu7K+GHOFkvPy40gZKtoxHzT3JDKbzkQIWL9NQWbgObv/oH6PAqHHkahjqniJJSWo7
         cngg==
X-Gm-Message-State: AOAM533Lu0ZgcEFV5BhbhJZEQPiTgkLBNNEdOTtob7CCH+Mw87kzrYo7
        y7zqmuKVLm50ixh4m6TCsVAn3tWbGw==
X-Google-Smtp-Source: ABdhPJzTsasU3Gsx5AOfjsTwlrtpgS6oDk8MaCZanG1cjAGDO1dahdsN4IfizL5DVpsay8MIuAqzlw==
X-Received: by 2002:a05:6808:187:: with SMTP id w7mr9511930oic.140.1633725558240;
        Fri, 08 Oct 2021 13:39:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v14sm69904ook.2.2021.10.08.13.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:39:17 -0700 (PDT)
Received: (nullmailer pid 3279811 invoked by uid 1000);
        Fri, 08 Oct 2021 20:39:16 -0000
Date:   Fri, 8 Oct 2021 15:39:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        Suman Anna <s-anna@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH 3/3] dt-bindings: bus: ti-sysc: Update to use yaml binding
Message-ID: <YWCsdFWzXEpPyYAI@robh.at.kernel.org>
References: <20211007124858.44011-1-tony@atomide.com>
 <20211007124858.44011-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007124858.44011-4-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 07, 2021 at 03:48:58PM +0300, Tony Lindgren wrote:
> Update the binding for ti-sysc interconnect target module driver to yaml
> format.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/bus/ti-sysc.txt       | 139 ----------------
>  .../devicetree/bindings/bus/ti-sysc.yaml      | 150 ++++++++++++++++++
>  2 files changed, 150 insertions(+), 139 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> deleted file mode 100644
> --- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
> +++ /dev/null
> @@ -1,139 +0,0 @@
> -Texas Instruments sysc interconnect target module wrapper binding
> -
> -Texas Instruments SoCs can have a generic interconnect target module
> -hardware for devices connected to various interconnects such as L3
> -interconnect (Arteris NoC) and L4 interconnect (Sonics s3220). The sysc
> -is mostly used for interaction between module and PRCM. It participates
> -in the OCP Disconnect Protocol but other than that is mostly independent
> -of the interconnect.
> -
> -Each interconnect target module can have one or more devices connected to
> -it. There is a set of control registers for managing interconnect target
> -module clocks, idle modes and interconnect level resets for the module.
> -
> -These control registers are sprinkled into the unused register address
> -space of the first child device IP block managed by the interconnect
> -target module and typically are named REVISION, SYSCONFIG and SYSSTATUS.
> -
> -Required standard properties:
> -
> -- compatible	shall be one of the following generic types:
> -
> -		"ti,sysc"
> -		"ti,sysc-omap2"
> -		"ti,sysc-omap4"
> -		"ti,sysc-omap4-simple"
> -
> -		or one of the following derivative types for hardware
> -		needing special workarounds:
> -
> -		"ti,sysc-omap2-timer"
> -		"ti,sysc-omap4-timer"
> -		"ti,sysc-omap3430-sr"
> -		"ti,sysc-omap3630-sr"
> -		"ti,sysc-omap4-sr"
> -		"ti,sysc-omap3-sham"
> -		"ti,sysc-omap-aes"
> -		"ti,sysc-mcasp"
> -		"ti,sysc-dra7-mcasp"
> -		"ti,sysc-usb-host-fs"
> -		"ti,sysc-dra7-mcan"
> -		"ti,sysc-pruss"
> -
> -- reg		shall have register areas implemented for the interconnect
> -		target module in question such as revision, sysc and syss
> -
> -- reg-names	shall contain the register names implemented for the
> -		interconnect target module in question such as
> -		"rev, "sysc", and "syss"
> -
> -- ranges	shall contain the interconnect target module IO range
> -		available for one or more child device IP blocks managed
> -		by the interconnect target module, the ranges may include
> -		multiple ranges such as device L4 range for control and
> -		parent L3 range for DMA access
> -
> -Optional properties:
> -
> -- ti,sysc-mask	shall contain mask of supported register bits for the
> -		SYSCONFIG register as documented in the Technical Reference
> -		Manual (TRM) for the interconnect target module
> -
> -- ti,sysc-midle	list of master idle modes supported by the interconnect
> -		target module as documented in the TRM for SYSCONFIG
> -		register MIDLEMODE bits
> -
> -- ti,sysc-sidle	list of slave idle modes supported by the interconnect
> -		target module as documented in the TRM for SYSCONFIG
> -		register SIDLEMODE bits
> -
> -- ti,sysc-delay-us	delay needed after OCP softreset before accssing
> -			SYSCONFIG register again
> -
> -- ti,syss-mask	optional mask of reset done status bits as described in the
> -		TRM for SYSSTATUS registers, typically 1 with some devices
> -		having separate reset done bits for children like OHCI and
> -		EHCI
> -
> -- clocks	clock specifier for each name in the clock-names as
> -		specified in the binding documentation for ti-clkctrl,
> -		typically available for all interconnect targets on TI SoCs
> -		based on omap4 except if it's read-only register in hwauto
> -		mode as for example omap4 L4_CFG_CLKCTRL
> -
> -- clock-names	should contain at least "fck", and optionally also "ick"
> -		depending on the SoC and the interconnect target module,
> -		some interconnect target modules also need additional
> -		optional clocks that can be specified as listed in TRM
> -		for the related CLKCTRL register bits 8 to 15 such as
> -		"dbclk" or "clk32k" depending on their role
> -
> -- ti,hwmods	optional TI interconnect module name to use legacy
> -		hwmod platform data
> -
> -- ti,no-reset-on-init	interconnect target module should not be reset at init
> -
> -- ti,no-idle-on-init	interconnect target module should not be idled at init
> -
> -- ti,no-idle		interconnect target module should not be idled
> -
> -Example: Single instance of MUSB controller on omap4 using interconnect ranges
> -using offsets from l4_cfg second segment (0x4a000000 + 0x80000 = 0x4a0ab000):
> -
> -	target-module@2b000 {		/* 0x4a0ab000, ap 84 12.0 */
> -		compatible = "ti,sysc-omap2";
> -		ti,hwmods = "usb_otg_hs";
> -		reg = <0x2b400 0x4>,
> -		      <0x2b404 0x4>,
> -		      <0x2b408 0x4>;
> -		reg-names = "rev", "sysc", "syss";
> -		clocks = <&l3_init_clkctrl OMAP4_USB_OTG_HS_CLKCTRL 0>;
> -		clock-names = "fck";
> -		ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> -				 SYSC_OMAP2_SOFTRESET |
> -				 SYSC_OMAP2_AUTOIDLE)>;
> -		ti,sysc-midle = <SYSC_IDLE_FORCE>,
> -				<SYSC_IDLE_NO>,
> -				<SYSC_IDLE_SMART>;
> -		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> -				<SYSC_IDLE_NO>,
> -				<SYSC_IDLE_SMART>,
> -				<SYSC_IDLE_SMART_WKUP>;
> -		ti,syss-mask = <1>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0 0x2b000 0x1000>;
> -
> -		usb_otg_hs: otg@0 {
> -			compatible = "ti,omap4-musb";
> -			reg = <0x0 0x7ff>;
> -			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> -			usb-phy = <&usb2_phy>;
> -			...
> -		};
> -	};
> -
> -Note that other SoCs, such as am335x can have multiple child devices. On am335x
> -there are two MUSB instances, two USB PHY instances, and a single CPPI41 DMA
> -instance as children of a single interconnect target module.
> diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.yaml b/Documentation/devicetree/bindings/bus/ti-sysc.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/ti-sysc.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/ti-sysc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments interconnect target module binding
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +description: |
> +  Texas Instruments SoCs can have a generic interconnect target module
> +  for devices connected to various interconnects such as L3 interconnect
> +  using Arteris NoC, and L4 interconnect using Sonics s3220. This module
> +  is mostly used for interaction between module and Power, Reset and Clock
> +  Manager PRCM. It participates in the OCP Disconnect Protocol, but other
> +  than that it is mostly independent of the interconnect.
> +
> +  Each interconnect target module can have one or more devices connected to
> +  it. There is a set of control registers for managing the interconnect target
> +  module clocks, idle modes and interconnect level resets.
> +
> +  The interconnect target module control registers are sprinkled into the
> +  unused register address space of the first child device IP block managed by
> +  the interconnect target module. Typically the register names are REVISION,
> +  SYSCONFIG and SYSSTATUS.
> +
> +properties:
> +  $nodename:
> +    pattern: "^target-module(@[0-9a-f]+)?$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +            - ti,sysc-omap2
> +            - ti,sysc-omap2
> +            - ti,sysc-omap4
> +            - ti,sysc-omap4-simple
> +            - ti,sysc-omap2-timer
> +            - ti,sysc-omap4-timer
> +            - ti,sysc-omap3430-sr
> +            - ti,sysc-omap3630-sr
> +            - ti,sysc-omap4-sr
> +            - ti,sysc-omap3-sham
> +            - ti,sysc-omap-aes
> +            - ti,sysc-mcasp
> +            - ti,sysc-dra7-mcasp
> +            - ti,sysc-usb-host-fs
> +            - ti,sysc-dra7-mcan
> +            - ti,sysc-pruss
> +        - const: ti,sysc
> +      - items:
> +        - const: ti,sysc

This doesn't really match what the old doc said nor the old example. 
Fine to fix in the conversion if wrong, but just highlight that in the 
commit msg.

> +
> +  reg: true

Any number of register areas is valid?

> +
> +  reg-names: true

You've thrown out the names defined before.

> +
> +  clocks: true

Any number of clocks is valid? 

> +
> +  clock-names: true

You've thrown out the names defined before.

> +
> +  power-domains: true

How many?

> +
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  ti,sysc-mask:
> +    description: Mask of supported register bits for the SYSCONFIG register
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  ti,sysc-midle:
> +    description: List of hardware supported idle modes
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  ti,sysc-sidle:
> +    description: List of hardware supported idle modes
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  ti,syss-mask:
> +    description: Mask of supported register bits for the SYSSTATUS register
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  ti,sysc-delay-us:
> +    description: Delay needed after OCP softreset before accessing SYCONFIG
> +    default: 0
> +    minimum: 0
> +    maximum: 2
> +
> +  ti,no-reset-on-init:
> +    description: Interconnect target module shall not be reset at init
> +    type: boolean
> +
> +  ti,no-idle-on-init:
> +    description: Interconnect target module shall not be idled at init
> +    type: boolean
> +
> +  ti,no-idle:
> +    description: Interconnect target module shall not be idled
> +    type: boolean
> +
> +  ti,hwmods:
> +    description: Interconnect module name to use with legacy hwmod data
> +    $ref: /schemas/types.yaml#/definitions/string
> +    deprecated: true
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges
> +
> +additionalProperties: true

This can be restricted to child nodes only? If so:

additionalProperties:
  type: object

> +
> +examples:
> +  - |
> +    #include <dt-bindings/bus/ti-sysc.h>
> +    #include <dt-bindings/clock/omap4.h>
> +
> +    target-module@2b000 {
> +        compatible = "ti,sysc-omap2", "ti,sysc";
> +        ti,hwmods = "usb_otg_hs";
> +        reg = <0x2b400 0x4>,
> +              <0x2b404 0x4>,
> +              <0x2b408 0x4>;
> +        reg-names = "rev", "sysc", "syss";
> +        clocks = <&l3_init_clkctrl OMAP4_USB_OTG_HS_CLKCTRL 0>;
> +        clock-names = "fck";
> +        ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> +                         SYSC_OMAP2_SOFTRESET |
> +                         SYSC_OMAP2_AUTOIDLE)>;
> +        ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +                        <SYSC_IDLE_NO>,
> +                        <SYSC_IDLE_SMART>;
> +        ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +                        <SYSC_IDLE_NO>,
> +                        <SYSC_IDLE_SMART>,
> +                        <SYSC_IDLE_SMART_WKUP>;
> +        ti,syss-mask = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x2b000 0x1000>;
> +    };
> -- 
> 2.33.0
> 
