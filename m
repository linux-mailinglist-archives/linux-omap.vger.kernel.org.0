Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBC3389A58
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 02:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhETAP5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 May 2021 20:15:57 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:35569 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhETAP4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 May 2021 20:15:56 -0400
Received: by mail-oi1-f180.google.com with SMTP id v22so14803240oic.2;
        Wed, 19 May 2021 17:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q2WQF+hVLFuEq1iGBZa8Zmiz6hHU0N25h2MWIuUWr88=;
        b=IKdVTSTmBnmJE3kaE4lq+mmafR0F2FgH9cjCBjlgcIPlv9NMBQCFILj2JqGvDWHBqB
         /PRnjPESpvULkSYGkT0brFAQD754msRTjGgyAgvl0LEMFID28kGDJe6z3Q0UcCMSNG+u
         ko3SF/BY8NTgtrBughauNvG7L70eTr+FJwJIubbwqlTPsJEt2ewPtRrpB/3GhA05q3AM
         evSsPPqkqfVnjGzCFZ+FIpPwSmlXs666pJKjycBZAJk8ZaFvnS1/jArGdHqf1lDGEZqR
         VWqCzRcCDmNKymoH8RH9UKF3UGC80yuzJJ6swF3RIGSSkLqVlXDghTvbim8+86wwgAm1
         0hmg==
X-Gm-Message-State: AOAM532WvGwKAapNIKbPOVh/dan8AuvetADZNwlF2SIPzxia3sDL+71Q
        iaQwe78XIj8ZXuXXN1XcDQ==
X-Google-Smtp-Source: ABdhPJzEz5u6COC0GEbmA2g1tE7y9U/NoEBEUSj6I5D6Imp59lrR9bjN/4XZTU19y9YWFhULEE3TGw==
X-Received: by 2002:a05:6808:8c4:: with SMTP id k4mr1392069oij.40.1621469675152;
        Wed, 19 May 2021 17:14:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a12sm290548oti.12.2021.05.19.17.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:14:34 -0700 (PDT)
Received: (nullmailer pid 3940615 invoked by uid 1000);
        Thu, 20 May 2021 00:14:33 -0000
Date:   Wed, 19 May 2021 19:14:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Jassi Brar <jaswinder.singh@linaro.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mailbox: Convert omap-mailbox.txt binding
 to YAML
Message-ID: <20210520001433.GB3927464@robh.at.kernel.org>
References: <20210518172022.10562-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518172022.10562-1-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 18, 2021 at 12:20:22PM -0500, Suman Anna wrote:
> Convert the current OMAP Mailbox binding from text format to YAML
> format/DT schema, and delete the legacy text binding file.
> 
> The new YAML binding conversion is an updated version compared to
> the original. The descriptions for certain properties have been
> improved to provide more clarity. Constraints are added to the
> properties 'ti,mbox-num-users', 'ti,mbox-num-fifos' and 'interrupts'.
> The 'ti,hwmods' is a legacy property and is retained only to reflect
> the existing usage on some older OMAP2 and OMAP3 platforms.
> 
> All the existing examples have also been updated to reflect the
> latest dts nodes (ti,hwmods removed from OMAP4 and AM33xx examples,
> and interrupts value updated for AM65x SoCs).
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi,
> 
> This patch does fix a number of dtbs_check warnings seen around OMAP Mailbox
> nodes with the latest kernel. There are few left-over warnings when just
> this patch is used on v5.13-rc1 or next-20210518. I have posted a separate
> fix for a warning on TI K3 SoCs [1], and will be posting a separate cleanup
> series for OMAP2+ SoCs. The dts patches can be picked up independently
> of this patch.
> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210514212016.3153-1-s-anna@ti.com/
> 
>  .../bindings/mailbox/omap-mailbox.txt         | 184 -----------
>  .../bindings/mailbox/ti,omap-mailbox.yaml     | 309 ++++++++++++++++++
>  2 files changed, 309 insertions(+), 184 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml


> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> @@ -0,0 +1,309 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/ti,omap-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI OMAP2+ and K3 Mailbox devices
> +
> +maintainers:
> +  - Suman Anna <s-anna@ti.com>
> +
> +description: |
> +  The OMAP Mailbox hardware facilitates communication between different
> +  processors using a queued mailbox interrupt mechanism. The IP block is
> +  external to the various processor subsystems and is connected on an
> +  interconnect bus. The communication is achieved through a set of registers
> +  for message storage and interrupt configuration registers.
> +
> +  Each mailbox IP block/cluster has a certain number of h/w fifo queues and
> +  output interrupt lines. An output interrupt line is routed to an interrupt
> +  controller within a processor subsystem, and there can be more than one line
> +  going to a specific processor's interrupt controller. The interrupt line
> +  connections are fixed for an instance and are dictated by the IP integration
> +  into the SoC (excluding the SoCs that have an Interrupt Crossbar or an
> +  Interrupt Router IP). Each interrupt line is programmable through a set of
> +  interrupt configuration registers, and have a rx and tx interrupt source per
> +  h/w fifo. Communication between different processors is achieved through the
> +  appropriate programming of the rx and tx interrupt sources on the appropriate
> +  interrupt lines.
> +
> +  The number of h/w fifo queues and interrupt lines dictate the usable
> +  registers. All the current OMAP SoCs except for the newest DRA7xx SoC has a
> +  single IP instance. DRA7xx has multiple instances with different number of
> +  h/w fifo queues and interrupt lines between different instances. The interrupt
> +  lines can also be routed to different processor sub-systems on DRA7xx as they
> +  are routed through the Crossbar, a kind of interrupt router/multiplexer. The
> +  K3 AM65x, J721E and J7200 SoCs has each of these instances form a cluster and
> +  combine multiple clusters into a single IP block present within the Main
> +  NavSS. The interrupt lines from all these clusters are multiplexed and routed
> +  to different processor subsystems over a limited number of common interrupt
> +  output lines of an Interrupt Router. The AM64x SoCS also uses a single IP
> +  block comprising of multiple clusters, but the number of clusters are
> +  smaller, and the interrupt output lines are connected directly to various
> +  processors.
> +
> +  Mailbox Controller Nodes
> +  =========================
> +  A Mailbox device node is used to represent a Mailbox IP instance/cluster
> +  within a SoC. The sub-mailboxes (actual communication channels) are
> +  represented as child nodes of this parent node.
> +
> +  Mailbox Users
> +  ==============
> +  A device needing to communicate with a target processor device should specify
> +  them using the common mailbox binding properties, "mboxes" and the optional
> +  "mbox-names" (please see Documentation/devicetree/bindings/mailbox/mailbox.txt
> +  for details). Each value of the mboxes property should contain a phandle to
> +  the mailbox controller device node and an args specifier that will be the
> +  phandle to the intended sub-mailbox child node to be used for communication.
> +  The equivalent "mbox-names" property value can be used to give a name to the
> +  communication channel to be used by the client user.
> +
> +definitions:

$defs is preferred (as that's what newer json-schema spec versions 
defined).

> +  omap-mbox-descriptor:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      The omap-mbox-descriptor is made of up of 3 cells and represents a single
> +      uni-directional communication channel. A typical sub-mailbox device uses
> +      two such channels - one for transmitting (Tx) and one for receiving (Rx).
> +    items:
> +      - description: |
> +          mailbox fifo id used either for transmitting on ti,mbox-tx channel or
> +          for receiving on ti,mbox-rx channel (fifo_id). This is the hardware
> +          fifo number within a mailbox cluster.
> +      - description: |
> +          irq identifier index number to use from the parent's interrupts data.
> +          Should be 0 for most of the cases, a positive index value is seen only
> +          on mailboxes that have multiple interrupt lines connected to the MPU
> +          processor (irq_id). This is an index number in the listed interrupts
> +          property in the DT nodes.
> +      - description: |
> +          mailbox user id for identifying the interrupt line associated with
> +          generating a tx/rx fifo interrupt (usr_id). This is the hardware
> +          user id number within a mailbox cluster.
> +
> +  omap-sub-mailbox:
> +    type: object
> +    description: |
> +      The omap-sub-mailbox is a child node within a Mailbox controller device
> +      node and represents the actual communication channel used to send and
> +      receive messages between the host processor and a remote processor. Each
> +      child node should have a unique node name across all the different mailbox
> +      device nodes.
> +
> +    properties:
> +      ti,mbox-tx:
> +        $ref: "#/definitions/omap-mbox-descriptor"
> +        description: sub-mailbox descriptor property defining a Tx fifo.
> +
> +      ti,mbox-rx:
> +        $ref: "#/definitions/omap-mbox-descriptor"
> +        description: sub-mailbox descriptor property defining a Rx fifo.
> +
> +      ti,mbox-send-noirq:
> +        type: boolean
> +        description: |

Drop '|' if formatting is not important.

> +          Quirk flag to allow the client user of this sub-mailbox to send
> +          messages without triggering a Tx ready interrupt, and to control
> +          the Tx ticker. Should be used only on sub-mailboxes used to
> +          communicate with WkupM3 remote processor on AM33xx/AM43xx SoCs.
> +
> +    required:
> +      - ti,mbox-tx
> +      - ti,mbox-rx
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,omap2-mailbox # for OMAP2420, OMAP2430 SoCs
> +      - ti,omap3-mailbox # for OMAP3430, OMAP3630 SoCs
> +      - ti,omap4-mailbox # for OMAP44xx, OMAP54xx, AM33xx, AM43xx and DRA7xx SoCs
> +      - ti,am654-mailbox # for K3 AM65x, J721E and J7200 SoCs
> +      - ti,am64-mailbox  # for K3 AM64x SoCs
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      Contains the interrupt information for the mailbox device. The format is
> +      dependent on which interrupt controller the Mailbox device uses. The
> +      number of interrupts listed will at most be the value specified in
> +      ti,mbox-num-users property, but is usually limited by the number of
> +      interrupts reaching the main processor. An interrupt-parent property
> +      is required on SoCs where the interrupt lines are connected through a
> +      Interrupt Router before reaching the main processor's GIC.
> +
> +  "#mbox-cells":
> +    const: 1
> +    description: |
> +      Common mailbox binding property to identify the number of cells required
> +      for the mailbox specifier in a consumer node. The specifier is a phandle
> +      to a omap-sub-mailbox device.

Can drop the first sentence.

> +
> +  ti,mbox-num-users:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Number of targets (processor devices) that the mailbox device can
> +      interrupt.
> +
> +  ti,mbox-num-fifos:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of h/w fifo queues within the mailbox IP block.
> +
> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      Name of the hwmod associated with the mailbox. This should be defined
> +      in the mailbox node only if the node is not defined as a child node of
> +      a corresponding sysc interconnect node.
> +
> +      This property is only needed on some legacy OMAP SoCs which have not
> +      yet been converted to the ti,sysc interconnect hierarachy, but is
> +      otherwise considered obsolete.

deprecated: true

> +
> +patternProperties:
> +  "^mbox-[a-z0-9-]+$":
> +    $ref: "#/definitions/omap-sub-mailbox"
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +  - ti,mbox-num-users
> +  - ti,mbox-num-fifos
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - ti,am654-mailbox
> +    then:
> +      required:
> +        - interrupt-parent
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - ti,am654-mailbox
> +            - ti,am64-mailbox
> +    then:
> +      properties:
> +        ti,mbox-num-users:
> +          const: 4
> +        ti,mbox-num-fifos:
> +          const: 16
> +        interrupts:
> +          minItems: 1
> +          maxItems: 4
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - ti,omap4-mailbox
> +    then:
> +      properties:
> +        ti,mbox-num-users:
> +          enum: [3, 4]
> +        ti,mbox-num-fifos:
> +          enum: [8, 12]
> +        interrupts:
> +          minItems: 1
> +          maxItems: 4
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - ti,omap3-mailbox
> +    then:
> +      properties:
> +        ti,mbox-num-users:
> +          const: 2
> +        ti,mbox-num-fifos:
> +          const: 2
> +        interrupts:
> +          minItems: 1
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - ti,omap2-mailbox
> +    then:
> +      properties:
> +        ti,mbox-num-users:
> +          const: 4
> +        ti,mbox-num-fifos:
> +          const: 6
> +        interrupts:
> +          minItems: 1
> +          maxItems: 2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* OMAP4 */
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mailbox: mailbox@4a0f4000 {
> +        compatible = "ti,omap4-mailbox";
> +        reg = <0x4a0f4000 0x200>;
> +        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +        #mbox-cells = <1>;
> +        ti,mbox-num-users = <3>;
> +        ti,mbox-num-fifos = <8>;
> +
> +        mbox_ipu: mbox-ipu {
> +            ti,mbox-tx = <0 0 0>;
> +            ti,mbox-rx = <1 0 0>;
> +        };
> +        mbox_dsp: mbox-dsp {
> +            ti,mbox-tx = <3 0 0>;
> +            ti,mbox-rx = <2 0 0>;
> +        };
> +    };
> +
> +    dsp {
> +        mboxes = <&mailbox &mbox_dsp>;
> +    };
> +
> +  - |
> +    /* AM33xx */
> +    mailbox1: mailbox@480c8000 {
> +        compatible = "ti,omap4-mailbox";
> +        reg = <0x480c8000 0x200>;
> +        interrupts = <77>;
> +        #mbox-cells = <1>;
> +        ti,mbox-num-users = <4>;
> +        ti,mbox-num-fifos = <8>;
> +
> +        mbox_wkupm3: mbox-wkup-m3 {
> +            ti,mbox-tx = <0 0 0>;
> +            ti,mbox-rx = <0 0 3>;
> +            ti,mbox-send-noirq;
> +        };
> +    };
> +
> +  - |
> +    /* AM65x */
> +    mailbox0_cluster0: mailbox@31f80000 {
> +        compatible = "ti,am654-mailbox";
> +        reg = <0x31f80000 0x200>;
> +        #mbox-cells = <1>;
> +        ti,mbox-num-users = <4>;
> +        ti,mbox-num-fifos = <16>;
> +        interrupt-parent = <&intr_main_navss>;
> +        interrupts = <436>;
> +
> +        mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
> +            ti,mbox-tx = <1 0 0>;
> +            ti,mbox-rx = <0 0 0>;
> +        };
> +    };
> -- 
> 2.30.1
> 
