Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15279DF0E2
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 17:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbfJUPIG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 11:08:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbfJUPIG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 11:08:06 -0400
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com [209.85.161.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 786C221872;
        Mon, 21 Oct 2019 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571670484;
        bh=uOOHIkxfhvis0C/Go5PYneNloCdkzG4Y0N0DZM+N+/A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MPG7ILQ4e6be5KuAsiCnX1NmDuX6hHYkUG3FY++76EvtLs8mWZgamXGWV9An86R4q
         GXjJHkKJFFxLGnnO0hSxGhM8zigbrkvwJHA++tx7aKVHA71hZTI/+yojzkMyfAlG+f
         Lzp/gPdUt6216tBHK+sUHd5Xj8YUs4dXflVIV6hg=
Received: by mail-yw1-f52.google.com with SMTP id w140so5028314ywd.0;
        Mon, 21 Oct 2019 08:08:04 -0700 (PDT)
X-Gm-Message-State: APjAAAUdzAS9O8P4qEswUGrXGhEQ4EgrNMG0xJPJzcXmeC1rk0UprjVU
        4kBMpNX5zT2up4I7XQ1+zhJpIOzY6x8l2uNpyw==
X-Google-Smtp-Source: APXvYqzM/HACTdPRONivWDLf+Xt0qQcSVJ0ofJX0zbPQQ2RaSyY7sqAVya8zdW6qm7MUHKRoyN92+rIluy5rmGOrrYc=
X-Received: by 2002:a0d:d307:: with SMTP id v7mr5750789ywd.507.1571670483603;
 Mon, 21 Oct 2019 08:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571424390.git.hns@goldelico.com> <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
In-Reply-To: <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 21 Oct 2019 10:07:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
Message-ID: <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 18, 2019 at 1:46 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo
> and others.
>
> Here we describe how the SGX processor is interfaced to
> the SoC (registers, interrupt etc.).
>
> Clock, Reset and power management should be handled
> by the parent node.

That's TI specific.

>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/gpu/img,pvrsgx.txt    | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.txt

Please make this DT schema format.

> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.txt b/Documentation/devicetree/bindings/gpu/img,pvrsgx.txt
> new file mode 100644
> index 000000000000..4ad87c075791
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.txt
> @@ -0,0 +1,76 @@
> +Imagination PVR/SGX GPU
> +
> +Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by this binding.
> +
> +Required properties:
> +- compatible:  Should be one of
> +               "img,sgx530-121", "img,sgx530", "ti,omap-omap3-sgx530-121";
> +                 - BeagleBoard ABC, OpenPandora 600MHz
> +               "img,sgx530-125", "img,sgx530", "ti,omap-omap3-sgx530-125";
> +                 - BeagleBoard XM, GTA04, OpenPandora 1GHz
> +               "img,sgx530-125", "img,sgx530", "ti,omap-am3517-sgx530-125";
> +               "img,sgx530-125", "img,sgx530", "ti,omap-am335x-sgx530-125";
> +                 - BeagleBone Black
> +               "img,sgx540-120", "img,sgx540", "ti,omap-omap4-sgx540-120";
> +                 - Pandaboard (ES)
> +               "img,sgx544-112", "img,sgx544", "ti,omap-omap4-sgx544-112";
> +               "img,sgx544-116", "img,sgx544", "ti,omap-omap5-sgx544-116";
> +                 - OMAP5 UEVM, Pyra Handheld
> +               "img,sgx544-116", "img,sgx544", "ti,omap-dra7-sgx544-116";

The order here is wrong. Should be most specific first.

Drop 'omap-' from the compatible.

> +
> +               For further study:
> +                       "ti,omap-am3517-sgx530-?"
> +                       "ti,omap-am43xx-sgx530-?"
> +                       "ti,ti43xx-sgx"
> +                       "ti,ti81xx-sgx"
> +                       "img,jz4780-sgx5??-?"
> +                       "intel,poulsbo-sgx?"
> +                       "intel,cedarview-sgx?"
> +                       "sunxi,sgx-544-?" - Banana-Pi-M3 (Allwinner A83T)

Just drop these.

> +
> +               The "ti,omap..." entries are needed temporarily to handle SoC
> +               specific builds of the kernel module.
> +
> +               In the long run, only the "img,sgx..." entry should suffice
> +               to match a generic driver for all architectures and driver
> +               code can dynamically find out on which SoC it is running.

Drop this. Which compatible an OS matches on is not relevant to the
binding. And 'temporarily' is wrong as the SoC specific compatible
strings are what are used for handling errata or other integration
specific things.

> +
> +
> +- reg:         Physical base addresses and lengths of the register areas.

How many?

> +- reg-names:   Names for the register areas.

If only 1 as the example suggests, then you don't need this.

> +- interrupts:  The interrupt numbers.
> +
> +Optional properties:
> +- timer:       the timer to be used by the driver.

Needs a better description and vendor prefix at least.

Why is this needed rather than using the OS's timers?

> +- img,cores:   number of cores. Defaults to <1>.

Not discoverable?

> +
> +/ {
> +       ocp {
> +               sgx_module: target-module@56000000 {

This is TI specific and this binding covers other chips in theory at
least. This part is outside the scope

> +                       compatible = "ti,sysc-omap4", "ti,sysc";
> +                       reg = <0x5600fe00 0x4>,
> +                             <0x5600fe10 0x4>;

How does it work that these registers overlap the GPU registers?

> +                       reg-names = "rev", "sysc";
> +                       ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>,
> +                                       <SYSC_IDLE_SMART>;
> +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>,
> +                                       <SYSC_IDLE_SMART>;
> +                       clocks = <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
> +                       clock-names = "fck";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x56000000 0x2000000>;
> +
> +                       sgx@fe00 {

gpu@...



> +                               compatible = "img,sgx544-116", "img,sgx544", "ti,omap-omap5-sgx544-116";
> +                               reg = <0xfe00 0x200>;
> +                               reg-names = "sgx";
> +                               interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +                               timer = <&timer11>;
> +                               img,cores = <2>;
> +                       };
> +               };
> +       };
> +};
> --
> 2.19.1
>
