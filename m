Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90D0AF0A05
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 00:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbfKEXFz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 18:05:55 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34017 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbfKEXFz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 18:05:55 -0500
Received: by mail-oi1-f195.google.com with SMTP id l202so19217135oig.1;
        Tue, 05 Nov 2019 15:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LAi+qZUkuhq1d2wVLpPVPcbuNd2aQs6HwzUUOf0K5n0=;
        b=CITCjdO58m2RvUsHCB9tbmJshOx0/BRDvJFf38Gyd69/OuIzbSUZNl15CaYPYq0LPC
         7gPxdWWFk3O/QKnQA1rHAXKhFWiJT5zxUN6MYOM90GLGjvjoX76SS/OxJe2EDauxRTuR
         QZOd8IbwUSG2lXrqy2zlIteAjCnbmvEX9ckD7NyxEao2nLNfJraEbgiN3XC3tHOXuHy7
         oA3+EZxJkaTW/baq7Nmqi8zZcuLmWIAFPpkqM595GB8p6ur1wU5YjbyXtfa56DGvnbqe
         R8rxRgPO69PfW2gTX0Zufd5by2POmde6g3dfiSyybxa1rhC2wBlGMmK+NZhttl3dtF+m
         U2lg==
X-Gm-Message-State: APjAAAVoJqpHYJ3XdDMYy4to7GdELWp8azZYfbkdlCf9R25sAJb9rfeN
        /c1LDNegT+49u7adR9Do2tkYhgs=
X-Google-Smtp-Source: APXvYqxhGYoDJXdpfnXNnhPdoaao9UI1xI0qHKyHXJT6+QFjo/BppkWuai5Qa9e9sgoNmpyOlN7Oew==
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr1189182oif.119.1572995153554;
        Tue, 05 Nov 2019 15:05:53 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q82sm1372503oif.11.2019.11.05.15.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 15:05:52 -0800 (PST)
Date:   Tue, 5 Nov 2019 17:05:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 1/5] dt-bindings: media: ti-vpe: Document VPE driver
Message-ID: <20191105230552.GA25817@bogus>
References: <20191104203841.3628-1-bparrot@ti.com>
 <20191104203841.3628-2-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104203841.3628-2-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Nov 04, 2019 at 02:38:37PM -0600, Benoit Parrot wrote:
> Device Tree bindings for the Video Processing Engine (VPE).
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  .../devicetree/bindings/media/ti,vpe.yaml     | 64 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,vpe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/ti,vpe.yaml b/Documentation/devicetree/bindings/media/ti,vpe.yaml
> new file mode 100644
> index 000000000000..eb9f3e1b7f5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/ti,vpe.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0)

For new bindings:

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/ti,vpe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DRA7x Video Processing Engine (VPE) Device Tree Bindings
> +
> +maintainers:
> +  - Benoit Parrot <bparrot@ti.com>
> +
> +description: |-
> +  The Video Processing Engine (VPE) is a key component for image post
> +  processing applications. VPE consist of a single memory to memory
> +  path which can perform chroma up/down sampling, deinterlacing,
> +  scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +      const: ti,dra7-vpe
> +
> +  reg:
> +    items:
> +      - description: The VPE main register region
> +      - description: Scaler (SC) register region
> +      - description: Color Space Conversion (CSC) register region
> +      - description: Video Port Direct Memory Access (VPDMA) register region
> +
> +  reg-names:
> +    items:
> +      - const: vpe_top
> +      - const: sc
> +      - const: csc
> +      - const: vpdma
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vpe: vpe@489d0000 {
> +        compatible = "ti,dra7-vpe";
> +        reg = <0x489d0000 0x120>,
> +              <0x489d0700 0x80>,
> +              <0x489d5700 0x18>,
> +              <0x489dd000 0x400>;
> +        reg-names = "vpe_top",
> +                    "sc",
> +                    "csc",
> +                    "vpdma";
> +        interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d360df48f9f2..baf3aac1ab7c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16316,6 +16316,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>  S:	Maintained
>  F:	drivers/media/platform/ti-vpe/
>  F:	Documentation/devicetree/bindings/media/ti,cal.yaml
> +F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
>  
>  TI WILINK WIRELESS DRIVERS
>  L:	linux-wireless@vger.kernel.org
> -- 
> 2.17.1
> 
