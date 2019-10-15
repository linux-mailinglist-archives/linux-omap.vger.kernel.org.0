Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26E47D83A6
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 00:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389904AbfJOW3u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Oct 2019 18:29:50 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44469 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389902AbfJOW3u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Oct 2019 18:29:50 -0400
Received: by mail-ot1-f68.google.com with SMTP id 21so18396560otj.11;
        Tue, 15 Oct 2019 15:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vrE5B9TKEy0Ahf3PltGkrbQZJCBK9Th8CtGSMcMqVcE=;
        b=ZI1rJc8R2QV8iJi9ysmoEWo4n+d+ejAXqWCeBMQ99V5kHMH3bIBoHZTibTbRFFm0oZ
         5rpzxf+7xYfMDta56gaIblQ0KFMzch4NUqFO4tr96FGRnOLCAhPktrxdzAUOLrdjXahV
         m8rjBFHKo/4tX2LLdDJ+mMAkk1aIG5OvXICopudM2fiMktnfH5eNKcvCVmhC9WcyJpuC
         9O6Are37YlhndpFYxiCc5OE6zBzQdw3RkSWlfan8vzLiwnfK5WlLdepVMrfL8fmW4nKY
         PBXNmS0QnM+fnzepS/gAol5HnYAJJtrKitGVLYW4Q6cwCHFzJtrOxRZdzT3Bfqrl1Zc8
         yB8A==
X-Gm-Message-State: APjAAAUNdifjQtEwNaZpNFnK2/nLS3UGLuyoTvSO+Bmw3mYz6rC6GhCW
        vIwHB5kbXCLlAEAlQ+SmvGpYjL4=
X-Google-Smtp-Source: APXvYqwrJv+FLlYQeraNR8fsDqy1zId6Y5dKvTXqDqkfTJWxeP0UhxcGwuqnMSXi1bDmu4jRLcXUsg==
X-Received: by 2002:a05:6830:22d9:: with SMTP id q25mr29736448otc.87.1571178589083;
        Tue, 15 Oct 2019 15:29:49 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l19sm6459488oie.22.2019.10.15.15.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:29:48 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:29:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch 1/3] dt-bindings: media: ti-vpe: Document VPE driver
Message-ID: <20191015222947.GA13388@bogus>
References: <20191009175628.20570-1-bparrot@ti.com>
 <20191009175628.20570-2-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009175628.20570-2-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 09, 2019 at 12:56:26PM -0500, Benoit Parrot wrote:
> Device Tree bindings for the Video Processing Engine (VPE) driver.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  .../devicetree/bindings/media/ti-vpe.txt      | 48 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti-vpe.txt

Please convert to DT schema format.

> 
> diff --git a/Documentation/devicetree/bindings/media/ti-vpe.txt b/Documentation/devicetree/bindings/media/ti-vpe.txt
> new file mode 100644
> index 000000000000..b2942fa8c3ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/ti-vpe.txt
> @@ -0,0 +1,48 @@
> +Texas Instruments DRA7x VIDEO PROCESSING ENGINE (VPE)
> +------------------------------------------------------
> +
> +The Video Processing Engine (VPE) is a key component for image post
> +processing applications. VPE consist of a single memory to memory
> +path which can perform chroma up/down sampling, deinterlacing,
> +scaling and color space conversion.
> +
> +Required properties:
> +- compatible: must be "ti,vpe"

Needs to have SoC specific compatibles.

> +- reg:	physical base address and length of the registers set for the 4
> +	memory regions required;
> +- reg-names: name associated with the memory regions described is <reg>;

The names need to be documented.

> +- interrupts: should contain IRQ line for VPE;
> +
> +Example:
> +
> +	target-module@1d0010 {                  /* 0x489d0000, ap 27 30.0 */
> +		compatible = "ti,sysc-omap4", "ti,sysc";
> +		reg = <0x1d0010 0x4>;
> +		reg-names = "sysc";
> +		ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +				<SYSC_IDLE_NO>,
> +				<SYSC_IDLE_SMART>;
> +		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +				<SYSC_IDLE_NO>,
> +				<SYSC_IDLE_SMART>;
> +		clocks = <&vpe_clkctrl DRA7_VPE_VPE_CLKCTRL 0>;
> +		clock-names = "fck";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x1d0000 0x10000>;

All this is outside the scope of this binding.

> +
> +		vpe: vpe@0 {
> +			compatible = "ti,vpe";
> +			reg = <0x0000 0x120>,
> +			      <0x0700 0x80>,
> +			      <0x5700 0x18>,
> +			      <0xd000 0x400>;
> +			reg-names = "vpe_top",
> +				    "sc",
> +				    "csc",
> +				    "vpdma";
> +			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;

> +			#address-cells = <1>;
> +			#size-cells = <0>;

Not documented, nor needed as there are no child nodes.

> +		};
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8598f49fa2c8..63dcda51f8ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16299,6 +16299,7 @@ W:	http://linuxtv.org/
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>  S:	Maintained
>  F:	drivers/media/platform/ti-vpe/
> +F:	Documentation/devicetree/bindings/media/ti-vpe.txt
>  
>  TI WILINK WIRELESS DRIVERS
>  L:	linux-wireless@vger.kernel.org
> -- 
> 2.17.1
> 
