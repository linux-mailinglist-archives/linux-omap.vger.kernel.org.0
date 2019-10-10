Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46B6D3128
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 21:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfJJTMp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 15:12:45 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33712 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfJJTMp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 15:12:45 -0400
Received: by mail-oi1-f196.google.com with SMTP id a15so5927730oic.0;
        Thu, 10 Oct 2019 12:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TB0eH3ae3vSi2BTINdu4YWUfxkdAB53RghmO04INfwE=;
        b=ArSe95mAfCRXqkMIytaj6fYFOTlqU0iiet4ZBsvBJKCLbX5pFyegLfOk9Zw2XyKJt9
         Y37Izxrxg/OWZ4ju2R5WE+jmSIgLrm4VNKDsJGgcKTHlGELiPfsM3XjsE5OP4B2eESDv
         bt7nfZRXhFDGrY5t3SYUQ5RVp1UHlGsV7rBitwNGZgBvAQ3+oyfFIj3JgKY57MvsEHn3
         hyXisd3PjfV9QZE1OIT291GcqmLABdEFBrtmnQKVrYKaA1RkO4EX+RkbNAJwyXVH+1Ly
         +LLJtkkreadhM0twrcQuCNd5y/3cSTMCQWwlGIVZuF/x0nj0uIrqcIzDSLgTv2ap4KyA
         mlxg==
X-Gm-Message-State: APjAAAVbEGi6Dbyf/xPTaxNN2llK5495iT+JNKzN8whta/u34h3z7Jgm
        08hpgSg2MvVHf3Sku3WNKw==
X-Google-Smtp-Source: APXvYqzTNwu0JxpmueZM2zdBUYD25a/vLovCXlgQYNf1BmMTJANPQvgzTPJMPVKxRBQ9IHDbu1EaRw==
X-Received: by 2002:a54:4419:: with SMTP id k25mr8594181oiw.0.1570734762353;
        Thu, 10 Oct 2019 12:12:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s194sm1910974oie.19.2019.10.10.12.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 12:12:41 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:12:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: sram: Convert SRAM bindings to
 json-schema
Message-ID: <20191010191240.GA15006@bogus>
References: <20191002164316.14905-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 02, 2019 at 06:43:07PM +0200, Krzysztof Kozlowski wrote:
> Convert generic mmio-sram bindings to DT schema format using
> json-schema.  Require the address/size cells to be 1, not equal to root
> node.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Add Rob as maintainer,
> 2. Use "contains" for compatible,
> 3. Fix address and size cells to 1,
> 4. Add maxitems to reg under children,
> 5. Remove unneeded string type from label.
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable).
> ---
>  .../devicetree/bindings/sram/sram.txt         |  80 -----------
>  .../devicetree/bindings/sram/sram.yaml        | 134 ++++++++++++++++++
>  2 files changed, 134 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sram/sram.txt
>  create mode 100644 Documentation/devicetree/bindings/sram/sram.yaml


> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> new file mode 100644
> index 000000000000..a1c1ec2183f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sram/sram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic on-chip SRAM
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +description: |+
> +  Simple IO memory regions to be managed by the genalloc API.
> +
> +  Each child of the sram node specifies a region of reserved memory. Each
> +  child node should use a 'reg' property to specify a specific range of
> +  reserved memory.
> +
> +  Following the generic-names recommended practice, node names should
> +  reflect the purpose of the node. Unit address (@<address>) should be
> +  appended to the name.
> +
> +properties:
> +  $nodename:
> +    pattern: "^sram(@.*)?"
> +
> +  compatible:
> +    contains:
> +      enum:
> +        - mmio-sram
> +        - atmel,sama5d2-securam
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    description:
> +      Should translate from local addresses within the sram to bus addresses.
> +
> +  no-memory-wc:
> +    description:
> +      The flag indicating, that SRAM memory region has not to be remapped
> +      as write combining. WC is used by default.
> +    type: boolean
> +
> +patternProperties:
> +  "^([a-z]*-)?sram@[a-f0-9]$":
> +    type: object
> +    description:
> +      Each child of the sram node specifies a region of reserved memory.
> +    properties:
> +      reg:
> +        description:
> +          IO mem address range, relative to the SRAM range.
> +        maxItems: 1
> +
> +      compatible:
> +        $ref: /schemas/types.yaml#/definitions/string

No need to define the type again. We can say 'maxItems: 1' if we really 
want to force it to 1 entry.

> +        description:
> +          Should contain a vendor specific string in the form
> +          <vendor>,[<device>-]<usage>
> +
> +      pool:
> +        description:
> +          Indicates that the particular reserved SRAM area is addressable
> +          and in use by another device or devices.
> +        type: boolean
> +
> +      export:
> +        description:
> +          Indicates that the reserved SRAM area may be accessed outside
> +          of the kernel, e.g. by bootloader or userspace.
> +        type: boolean
> +
> +      protect-exec:
> +        description: |
> +          Same as 'pool' above but with the additional constraint that code
> +          will be run from the region and that the memory is maintained as
> +          read-only, executable during code execution. NOTE: This region must
> +          be page aligned on start and end in order to properly allow
> +          manipulation of the page attributes.
> +        type: boolean
> +
> +      label:
> +        description:
> +          The name for the reserved partition, if omitted, the label is taken
> +          from the node name excluding the unit address.
> +
> +      clocks:

Shouldn't this be up one level? Looks like this is the only case 
(Marvell and i.MX are the only ones I see with clocks).

> +        description:
> +          A list of phandle and clock specifier pair that controls the
> +          single SRAM clock.

maxItems: 1

> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges

Does 'additionalProperties' work here and/or in the child node? I guess 
not if we keep some node names.

> +
> +examples:
> +  - |
> +    sram: sram@5c000000 {
> +        compatible = "mmio-sram";
> +        reg = <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000 */
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x5c000000 0x40000>;
> +
> +        smp-sram@100 {
> +            compatible = "socvendor,smp-sram";
> +            reg = <0x100 0x50>;
> +        };
> +
> +        device-sram@1000 {
> +            reg = <0x1000 0x1000>;
> +            pool;
> +        };
> +
> +        exported@20000 {

This one doesn't match the pattern. That's fine I guess for dts files, 
but examples should be good examples.

> +            reg = <0x20000 0x20000>;
> +            export;
> +        };
> +    };
> -- 
> 2.17.1
> 
