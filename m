Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DD5413BA9
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 22:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234385AbhIUUqq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 16:46:46 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:38811 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhIUUqq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 16:46:46 -0400
Received: by mail-oi1-f175.google.com with SMTP id u22so1058699oie.5;
        Tue, 21 Sep 2021 13:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zpy6wlQMyxZRii14nKzfROrLUS3Znsn0Gu8ZUDhspq8=;
        b=uox2kCvC6tIfFhz6VoWWBi1O6QKh+ld5JsUzLJNAq172X9YEZ1WzefG0GrVLOVejo3
         NlQRTr12qj6y9IDusoV80R5z7DkAk9O2DhqisFL5Nq9n3/7xIgYFjoq3IUnZu47vcFfg
         lf3f4XmEAbFiGUvgInKJXZD9N8pRjQwnraV+sg87QSbsoDinIm3H7hMkaxL9EcOFf29e
         ZEohyD8Ev0Z73HSE/iNpyXqe3wL6t9e2l6vBqjBo/aQKCONQQP5FCg0OGJNT6jTzcrJq
         /mrTX0pDtbLpB5nv1X9UIEnGZAWnU6PWsBIelnOAD1kZ0fzMysiJunfAJHSmScJZMLd3
         iNtg==
X-Gm-Message-State: AOAM531rRh28GqPPs64yJpqN5P7ZR1z8MoUZN6pp4WyUBV5GtySuvw8f
        psJxlhWop6VIiooZRvgfQw==
X-Google-Smtp-Source: ABdhPJyMoya3BEsqcEIje9TIzlBPUkeGKtV/fbfz2dCjpCa1tMJ0e7mFAl7SQ6FLcs/Qdl5gaTf2iQ==
X-Received: by 2002:a05:6808:bcb:: with SMTP id o11mr5243912oik.168.1632257117121;
        Tue, 21 Sep 2021 13:45:17 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id 10sm19774otw.53.2021.09.21.13.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:45:16 -0700 (PDT)
Received: (nullmailer pid 3297343 invoked by uid 1000);
        Tue, 21 Sep 2021 20:45:14 -0000
Date:   Tue, 21 Sep 2021 15:45:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     tony@atomide.com, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/8] dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
Message-ID: <YUpEWslQSEbppnBk@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-7-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-7-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 14, 2021 at 03:27:03PM +0300, Roger Quadros wrote:
> Convert gpmc-onenand.txt to ti,gpmc-onenand.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/gpmc-onenand.txt  | 48 -----------
>  .../bindings/mtd/ti,gpmc-onenand.yaml         | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> deleted file mode 100644
> index e9f01a963a0a..000000000000
> --- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Device tree bindings for GPMC connected OneNANDs
> -
> -GPMC connected OneNAND (found on OMAP boards) are represented as child nodes of
> -the GPMC controller with a name of "onenand".
> -
> -All timing relevant properties as well as generic gpmc child properties are
> -explained in a separate documents - please refer to
> -Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> -
> -Required properties:
> -
> - - compatible:		"ti,omap2-onenand"
> - - reg:			The CS line the peripheral is connected to
> - - gpmc,device-width:	Width of the ONENAND device connected to the GPMC
> -			in bytes. Must be 1 or 2.
> -
> -Optional properties:
> -
> - - int-gpios:		GPIO specifier for the INT pin.
> -
> -For inline partition table parsing (optional):
> -
> - - #address-cells: should be set to 1
> - - #size-cells: should be set to 1
> -
> -Example for an OMAP3430 board:
> -
> -	gpmc: gpmc@6e000000 {
> -		compatible = "ti,omap3430-gpmc";
> -		ti,hwmods = "gpmc";
> -		reg = <0x6e000000 0x1000000>;
> -		interrupts = <20>;
> -		gpmc,num-cs = <8>;
> -		gpmc,num-waitpins = <4>;
> -		#address-cells = <2>;
> -		#size-cells = <1>;
> -
> -		onenand@0 {
> -			compatible = "ti,omap2-onenand";
> -			reg = <0 0 0>; /* CS0, offset 0 */
> -			gpmc,device-width = <2>;
> -
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -
> -			/* partitions go here */
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> new file mode 100644
> index 000000000000..42149a9c3a8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/ti,gpmc-onenand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OneNAND over Texas Instruments GPMC bus.
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +  - Roger Quadros <rogerq@kernel.org>
> +
> +description:
> +  GPMC connected OneNAND (found on OMAP boards) are represented
> +  as child nodes of the GPMC controller.
> +
> +properties:
> +  compatible:
> +    const: ti,omap2-onenand
> +
> +  reg:
> +    items:
> +      - description: |
> +          Chip Select number, register offset and size of
> +          OneNAND register window.
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  int-gpios:
> +    description: GPIO specifier for the INT pin.
> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: "/schemas/mtd/partitions/partition.yaml"
> +
> +allOf:
> +  - $ref: "/schemas/memory-controllers/ti,gpmc-child.yaml"
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    gpmc: memory-controller@6e000000 {
> +      compatible = "ti,omap3430-gpmc";
> +      reg = <0x6e000000 0x02d0>;
> +      interrupts = <20>;
> +      gpmc,num-cs = <8>;
> +      gpmc,num-waitpins = <4>;
> +      clocks = <&l3s_clkctrl>;
> +      clock-names = "fck";
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +
> +      ranges = <0 0 0x01000000 0x01000000>,   /* 16 MB for OneNAND */
> +               <1 0 0x02000000 0x01000000>;   /* 16 MB for smc91c96 */
> +
> +      onenand@0,0 {
> +        compatible = "ti,omap2-onenand";
> +        reg = <0 0 0x20000>;    /* CS0, offset 0, IO size 128K */
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        partition@0 {
> +          label = "bootloader";
> +          reg = <0x00000000 0x00100000>;
> +        };
> +
> +        partition@1 {

partition@100000

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          label = "config";
> +          reg = <0x00100000 0x002c0000>;
> +        };
> +      };
> +    };
> -- 
> 2.17.1
> 
> 
