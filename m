Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5220FD316D
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 21:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfJJTd7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 15:33:59 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46639 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfJJTd7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 15:33:59 -0400
Received: by mail-oi1-f193.google.com with SMTP id k25so5928668oiw.13;
        Thu, 10 Oct 2019 12:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7ET4N4h1mz+QXnjZEYhffwJ+S0rSM6M0DCW5sXhGLr4=;
        b=q27Wk4WXPi8qpC5UNFYVxQ294oPik1VDg4Q+UG2rdvWy81v8wv6VAgwbHa9zTCv8Cp
         9U0K6oDCJy06/Laa4NdgTahqPQ8qcW1th0UQrsfuqXFBi/GeikSKYMuxCUNvb6p9MqAv
         o8h1XrrtkdGsH9kvhHWDmOunE+qeqLbCCey2Zd1xp0r4Bk5LZX8fLE9J6KXmUfqEvHHz
         6Xo19KpDOMblQeHv/S8wgnbugcYaO4gwU6Ih95JplnYH8oR0DmfgwJR4Zdau5u+isfWF
         ELIPxpGnUWff9p3MeZhRgEkxWNyV9LRKCf94BNBhCHpABBYsO+k59WGBc0g7FbjDZaks
         +fRg==
X-Gm-Message-State: APjAAAUE2H+aiOqSID4/0QzXOpUJoBu4yWBR1GTVS/harTRIVtK/Czq/
        rES1gWF/ID1C0AWZJL7Csg==
X-Google-Smtp-Source: APXvYqyuT5yi9lOX+HY+jMDUqyMXIegTNgwLUO2uJeseCSix9lpmMgQ5/3duA7qI2l/FDDlVpw2grA==
X-Received: by 2002:aca:36d5:: with SMTP id d204mr8794400oia.51.1570736038102;
        Thu, 10 Oct 2019 12:33:58 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n186sm2042419oih.58.2019.10.10.12.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 12:33:57 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:33:56 -0500
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
Subject: Re: [PATCH v3 02/10] dt-bindings: sram: Convert Samsung Exynos
 SYSRAM bindings to json-schema
Message-ID: <20191010193356.GA9975@bogus>
References: <20191002164316.14905-1-krzk@kernel.org>
 <20191002164316.14905-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002164316.14905-2-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 02, 2019 at 06:43:08PM +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos SYSRAM bindings to DT schema format using
> json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Use sram as name of node in example.
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable).
> ---
>  .../devicetree/bindings/sram/samsung-sram.txt | 38 ------------
>  .../bindings/sram/samsung-sram.yaml           | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 59 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sram/samsung-sram.txt
>  create mode 100644 Documentation/devicetree/bindings/sram/samsung-sram.yaml


> diff --git a/Documentation/devicetree/bindings/sram/samsung-sram.yaml b/Documentation/devicetree/bindings/sram/samsung-sram.yaml
> new file mode 100644
> index 000000000000..3e77c434ecca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sram/samsung-sram.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sram/samsung-sram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC SYSRAM for SMP bringup
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +description: |+
> +  Samsung SMP-capable Exynos SoCs use part of the SYSRAM for the bringup
> +  of the secondary cores. Once the core gets powered up it executes the
> +  code that is residing at some specific location of the SYSRAM.
> +
> +  Therefore reserved section sub-nodes have to be added to the mmio-sram
> +  declaration. These nodes are of two types depending upon secure or
> +  non-secure execution environment.
> +
> +allOf:
> +  - $ref: "sram.yaml#"
> +
> +properties:
> +  $nodename:
> +    pattern: "^sysram(@.*)?"

As you are renaming all the node names, this will no longer work. If you 
change it to 'sram', that's going to match others, but would still work 
as long as the child node names are unique to Samsung. If you change 
them to '*-sram' then, you'd have to come up with something else. That 
probably means using 'compatible' strings. At that point, it's kind of 
silly to just be validating what your are using to select the schema. It 
may be better to just add the compatible strings into sram.yaml if 
that's the only difference.

> +
> +patternProperties:
> +  "^([a-z]*-)?sysram@[a-f0-9]$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        description:
> +          Depending upon boot mode
> +        enum:
> +          - samsung,exynos4210-sysram                 # for Secure SYSRAM
> +          - samsung,exynos4210-sysram-ns              # for Non-secure SYSRAM
> +
