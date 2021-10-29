Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9872243F43C
	for <lists+linux-omap@lfdr.de>; Fri, 29 Oct 2021 03:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhJ2BHS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 21:07:18 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:41856 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhJ2BHS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 21:07:18 -0400
Received: by mail-oi1-f177.google.com with SMTP id y128so10950157oie.8;
        Thu, 28 Oct 2021 18:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MBThxz376ZwKQ2CgIvx7+SMMvDix0ZYUqM2XlMvadr4=;
        b=4GduFkWIY6QYIrndJ+XSf0fllX/W6FRy3jWnjPXcZLsDrtC+fCGxh3Ww2vEjZzHptN
         7FIxuFZgTmV3PdXSYadSEMVJ0e7HSfIzH98a8yob+3+DR4ZHYhgN9JFvCs4cHOPa5LC1
         ix0KEpA2z416lbPSiSunYC3k8X8cXJKAjmvfmvsuv5Pm3U0T5iZm+YeJxOx+L5nWQHbd
         doQtVOXCgBWI0r5ueIQzc32lL+Mukpdz3FolQLyVi1h029HTcANvqWtr6LLbV7KbzrwG
         IxMm2Bnpo2Q8uvDguyMba7W4A79J5Q+mC5H+dN/Wvhaij6v4ZcKezQOMZMmsvroay3p7
         JBxw==
X-Gm-Message-State: AOAM531pbnJ4R3+XpSD7PdiomW2RELJRCI5VpqmZDN13GqtJH0KTB/BD
        i1q8qQ231u07tu1lxHvqgg==
X-Google-Smtp-Source: ABdhPJzeaNxZQbYoKleC+9X4I4grVU2VleGQ5z3Y2B0SgItQOsHtBytVFlMJYjvHXWFwZquRHenZ2g==
X-Received: by 2002:a05:6808:1789:: with SMTP id bg9mr5825185oib.171.1635469490331;
        Thu, 28 Oct 2021 18:04:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s5sm1679987ois.55.2021.10.28.18.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:04:49 -0700 (PDT)
Received: (nullmailer pid 923293 invoked by uid 1000);
        Fri, 29 Oct 2021 01:04:48 -0000
Date:   Thu, 28 Oct 2021 20:04:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <YXtIsCnJ+L5zqCVk@robh.at.kernel.org>
References: <cover.1634822085.git.geert+renesas@glider.be>
 <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 21, 2021 at 03:18:53PM +0200, Geert Uytterhoeven wrote:
> Convert the NXP TDA998x HDMI transmitter Device Tree binding
> documentation to json-schema.
> 
> Add missing "#sound-dai-cells" property.
> Add ports hierarchy, as an alternative to port.
> Drop pinctrl properties, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> RFC as I do not know:
>   1. The correct value(s) for '#sound-dai-cells' (the example used 2,
>      which was IMHO wrong, while all actual users use 0),
>   2. The meaning of the various ports subnodes.
> ---
>  .../bindings/display/bridge/nxp,tda998x.yaml  | 108 ++++++++++++++++++
>  .../bindings/display/bridge/tda998x.txt       |  54 ---------
>  2 files changed, 108 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> new file mode 100644
> index 0000000000000000..87c64edcf5d5617d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP TDA998x HDMI transmitter
> +
> +maintainers:
> +  - Russell King <linux@armlinux.org.uk>
> +
> +properties:
> +  compatible:
> +    const: nxp,tda998x
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  video-ports:
> +    default: 0x230145
> +    description:
> +      24 bits value which defines how the video controller output is wired to
> +      the TDA998x input.

maximum: 0xffffff

(at least...)

> +
> +  audio-ports:
> +    description:
> +      Array of 8-bit values, 2 values per DAI (Documentation/sound/soc/dai.rst).
> +      The implementation allows one or two DAIs.
> +      If two DAIs are defined, they must be of different type.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      minItems: 1
> +      maxItems: 2
> +      items:
> +        - description: |
> +            The first value defines the DAI type: TDA998x_SPDIF or TDA998x_I2S
> +            (see include/dt-bindings/display/tda998x.h).
> +        - description:
> +            The second value defines the tda998x AP_ENA reg content when the
> +            DAI in question is used.
> +
> +  '#sound-dai-cells':
> +    enum: [ 0, 1 ]
> +
> +  nxp,calib-gpios:
> +    maxItems: 1
> +    description:
> +      Calibration GPIO, which must correspond with the gpio used for the
> +      TDA998x interrupt pin.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: FIXME

Looks like the input from the example

> +
> +      port@1:
> +        type: object
> +        description: FIXME

Presumably the output to connector or another bridge.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +oneOf:
> +  - required:
> +      - port
> +  - required:
> +      - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/display/tda998x.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        tda998x: hdmi-encoder@70 {
> +            compatible = "nxp,tda998x";
> +            reg = <0x70>;
> +            interrupt-parent = <&gpio0>;
> +            interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +            video-ports = <0x230145>;
> +
> +            #sound-dai-cells = <1>;
> +                         /* DAI-format / AP_ENA reg value */
> +            audio-ports = <TDA998x_SPDIF 0x04>,
> +                          <TDA998x_I2S 0x03>;
> +
> +            port {
> +                tda998x_in: endpoint {
> +                    remote-endpoint = <&lcdc_0>;
> +                };
> +            };
> +        };
> +    };
