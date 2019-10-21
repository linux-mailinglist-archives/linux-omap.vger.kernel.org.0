Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31CEFDED7D
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 15:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfJUNZn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 09:25:43 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35687 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfJUNZn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Oct 2019 09:25:43 -0400
Received: by mail-ed1-f65.google.com with SMTP id v8so10010957eds.2;
        Mon, 21 Oct 2019 06:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kbWYhDCDbV5qK8VclXFPP6NqeqAgLz5VFjeSpIHBB+s=;
        b=P0o5J7f463rPShMQQdGTGJS20mF2seoybaOTC4XO+XDKDg6l1fOsb8gqP8MipaHRJh
         LN00Ug1Tp4PXOAuJrrt/0xNLtrDBFjkRBQBeMHtbW80SsFwb246NudnxChuk8bEkGsC/
         9V+ZGM9ExrIynBsCe4sajVYLz1/iTrKT7ejfjCkjCCqnZG1qgoAdd9HX4QpZRLeP2C4U
         F4bNATd+6hI618giXSSP4BOhPgbsM1RxyQ6UpywxSZrrY9v3K2kL6N3WCrYjQLu6Zkel
         zEykbjdl9LWYPyA5do00IRljzOV3TYWB9tGjh2zKX33/POEBea7PH/G4P1EoJfIWxyI+
         9O9g==
X-Gm-Message-State: APjAAAUCQSezwd0rDBE1ZWv26CZXBtwRrPgkUe6m2nByt4w+vETmB3J4
        33ndeCeeTVIYWNdrwd0GOxI=
X-Google-Smtp-Source: APXvYqyDVwXcr52I2wsb+Z4RGg4WcltwXXlohYeZzvFP+OKWg5ZNU8oHr/O1UXzcE6xe2rgQ+TiKng==
X-Received: by 2002:a17:906:2584:: with SMTP id m4mr22390782ejb.287.1571664340356;
        Mon, 21 Oct 2019 06:25:40 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
        by smtp.googlemail.com with ESMTPSA id s4sm344795edt.34.2019.10.21.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 06:25:39 -0700 (PDT)
Date:   Mon, 21 Oct 2019 15:25:36 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
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
Message-ID: <20191021132536.GA2791@pi3>
References: <20191002164316.14905-1-krzk@kernel.org>
 <20191010191240.GA15006@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191010191240.GA15006@bogus>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 10, 2019 at 02:12:40PM -0500, Rob Herring wrote:
> On Wed, Oct 02, 2019 at 06:43:07PM +0200, Krzysztof Kozlowski wrote:
> > Convert generic mmio-sram bindings to DT schema format using
> > json-schema.  Require the address/size cells to be 1, not equal to root
> > node.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v2:
> > 1. Add Rob as maintainer,
> > 2. Use "contains" for compatible,
> > 3. Fix address and size cells to 1,
> > 4. Add maxitems to reg under children,
> > 5. Remove unneeded string type from label.
> > 
> > Changes since v1:
> > 1. Indent example with four spaces (more readable).
> > ---
> >  .../devicetree/bindings/sram/sram.txt         |  80 -----------
> >  .../devicetree/bindings/sram/sram.yaml        | 134 ++++++++++++++++++
> >  2 files changed, 134 insertions(+), 80 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/sram/sram.txt
> >  create mode 100644 Documentation/devicetree/bindings/sram/sram.yaml
> 
> 
> > diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> > new file mode 100644
> > index 000000000000..a1c1ec2183f2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> > @@ -0,0 +1,134 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sram/sram.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic on-chip SRAM
> > +
> > +maintainers:
> > +  - Rob Herring <robh@kernel.org>
> > +
> > +description: |+
> > +  Simple IO memory regions to be managed by the genalloc API.
> > +
> > +  Each child of the sram node specifies a region of reserved memory. Each
> > +  child node should use a 'reg' property to specify a specific range of
> > +  reserved memory.
> > +
> > +  Following the generic-names recommended practice, node names should
> > +  reflect the purpose of the node. Unit address (@<address>) should be
> > +  appended to the name.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^sram(@.*)?"
> > +
> > +  compatible:
> > +    contains:
> > +      enum:
> > +        - mmio-sram
> > +        - atmel,sama5d2-securam
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges:
> > +    description:
> > +      Should translate from local addresses within the sram to bus addresses.
> > +
> > +  no-memory-wc:
> > +    description:
> > +      The flag indicating, that SRAM memory region has not to be remapped
> > +      as write combining. WC is used by default.
> > +    type: boolean
> > +
> > +patternProperties:
> > +  "^([a-z]*-)?sram@[a-f0-9]$":
> > +    type: object
> > +    description:
> > +      Each child of the sram node specifies a region of reserved memory.
> > +    properties:
> > +      reg:
> > +        description:
> > +          IO mem address range, relative to the SRAM range.
> > +        maxItems: 1
> > +
> > +      compatible:
> > +        $ref: /schemas/types.yaml#/definitions/string
> 
> No need to define the type again. We can say 'maxItems: 1' if we really 
> want to force it to 1 entry.

I'll fix it and integrate Samsung compatibles here.

> 
> > +        description:
> > +          Should contain a vendor specific string in the form
> > +          <vendor>,[<device>-]<usage>
> > +
> > +      pool:
> > +        description:
> > +          Indicates that the particular reserved SRAM area is addressable
> > +          and in use by another device or devices.
> > +        type: boolean
> > +
> > +      export:
> > +        description:
> > +          Indicates that the reserved SRAM area may be accessed outside
> > +          of the kernel, e.g. by bootloader or userspace.
> > +        type: boolean
> > +
> > +      protect-exec:
> > +        description: |
> > +          Same as 'pool' above but with the additional constraint that code
> > +          will be run from the region and that the memory is maintained as
> > +          read-only, executable during code execution. NOTE: This region must
> > +          be page aligned on start and end in order to properly allow
> > +          manipulation of the page attributes.
> > +        type: boolean
> > +
> > +      label:
> > +        description:
> > +          The name for the reserved partition, if omitted, the label is taken
> > +          from the node name excluding the unit address.
> > +
> > +      clocks:
> 
> Shouldn't this be up one level? Looks like this is the only case 
> (Marvell and i.MX are the only ones I see with clocks).

Yes, that's a mistake in original bindings.

> 
> > +        description:
> > +          A list of phandle and clock specifier pair that controls the
> > +          single SRAM clock.
> 
> maxItems: 1

Yes.

> 
> > +
> > +    required:
> > +      - reg
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - ranges
> 
> Does 'additionalProperties' work here and/or in the child node? I guess 
> not if we keep some node names.

It seems that it works.

> 
> > +
> > +examples:
> > +  - |
> > +    sram: sram@5c000000 {
> > +        compatible = "mmio-sram";
> > +        reg = <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000 */
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges = <0 0x5c000000 0x40000>;
> > +
> > +        smp-sram@100 {
> > +            compatible = "socvendor,smp-sram";
> > +            reg = <0x100 0x50>;
> > +        };
> > +
> > +        device-sram@1000 {
> > +            reg = <0x1000 0x1000>;
> > +            pool;
> > +        };
> > +
> > +        exported@20000 {
> 
> This one doesn't match the pattern. That's fine I guess for dts files, 
> but examples should be good examples.

Sure.

Best regards,
Krzysztof

> 
> > +            reg = <0x20000 0x20000>;
> > +            export;
> > +        };
> > +    };
> > -- 
> > 2.17.1
> > 
