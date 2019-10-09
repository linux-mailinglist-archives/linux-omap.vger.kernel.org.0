Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 799EFD17DE
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 20:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbfJISzb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 14:55:31 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38928 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfJISza (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 14:55:30 -0400
Received: by mail-io1-f67.google.com with SMTP id a1so7484583ioc.6
        for <linux-omap@vger.kernel.org>; Wed, 09 Oct 2019 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7NyPyE2mSFP9gN/i0NMVGDb+QkgReJiZjrAmitUif0=;
        b=o+mBo9kzOxJBMvYKkGlMYSxbUtvoOlRcdAu43Go+wKCDNN1QpVEOakOBT4bWx2Mguo
         QUmE+vWCQNffEpmYzwkhPsVjOK2YFd4L2TmqONbH9mq+6rpfCCu0pG+CH0FSmuojn29/
         cx0u+pyEhRpHd3wuGgr7LJG19Sc87ILVAWglQbSBNbOZJ5kICQdvUTvwBrfTp13tgNxV
         fcKgx8+v1msW+vpJxLAZzJk8vlFOiX3o5VXW7yZz+n86JSkT51w0uZuzWpZmgin2bQVM
         mpFZynVvdg8k0or0U29X+fb4Z997LQ02uRDZTbIR1LnMJ3cGbiat/3IbE+wS3zYpSaub
         A3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7NyPyE2mSFP9gN/i0NMVGDb+QkgReJiZjrAmitUif0=;
        b=YFoIZFwubslRDqVkevPIl69Vb+HszmmC2VVx/3f0o+otELOjenV8etj5luChzV4XFg
         iHRghEDjH+Ix0RBKVVeDEJ+ZuGOG9JAMUFjuOspMwD+XsjvNDu9L/kzCHNRKPWrqgTHi
         h1jn8Yqqu7WpPPURf/XvGEIw+Hi/IE4mECEh+GjIX0Cp9dJh06xWWKXK2+5BJgktWx0b
         MTQPNID+vOjLBGQW6x76XaaB37xxuphB6ppSPFeLlsXMhqMBuGGqJyLFAH58SJYCNMP3
         1aBcamH7m2x9De/th9jPplwLdqsezuHaFaBhzGFCMJpf8VQ3eI56xpwlv4PRRQ8Bb6pf
         PX5A==
X-Gm-Message-State: APjAAAWbgkVAErp/+VHzjio2LnlEkHOC3jOX8OefFkwkyPCG4JgYdPAN
        XwT1oVqHl77rFxGq5/l7GE3QWQzHaI3GVc1BEP6r7w==
X-Google-Smtp-Source: APXvYqx5UsZhXCsHoOMbrxLcBQ0eFbyVWBmyRdU2LMI7JleBfbRIRGEZLqKnt3KH/8FSdikbadAs+C4QAHVC6D2WAS0=
X-Received: by 2002:a02:40c6:: with SMTP id n189mr4868307jaa.52.1570647329254;
 Wed, 09 Oct 2019 11:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190925171444.9904-1-aford173@gmail.com>
In-Reply-To: <20190925171444.9904-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 9 Oct 2019 13:55:17 -0500
Message-ID: <CAHCN7xL6OXkWxY1r=ALhHpufDan6AsWkoRkv9JGST52qFJsNCQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap3.dtsi: Fix AES and SHA Engines
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 25, 2019 at 12:14 PM Adam Ford <aford173@gmail.com> wrote:
>
> The AES and SHA engines for the OMAP3 are currently not functional.
> When the stopped working is unknown, but we have a regression.
>
> This patch uses the ti,sysc-omap2 to address the issue and enables
> to the AES and SHA engines on the DM3730 and OMAP3530 to work once
> again.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Tony,

Any chance these could get review and/or pushed for 5.4 since they
used to work and now they don't.  I didn't do a bisect, so I didn't
add a 'fixes' note, but this patch seems to fix a regression.

adam
>
> diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
> index 4043ecb38016..5123dc80b694 100644
> --- a/arch/arm/boot/dts/omap3.dtsi
> +++ b/arch/arm/boot/dts/omap3.dtsi
> @@ -156,13 +156,28 @@
>                         };
>                 };
>
> -               aes: aes@480c5000 {
> -                       compatible = "ti,omap3-aes";
> -                       ti,hwmods = "aes";
> -                       reg = <0x480c5000 0x50>;
> -                       interrupts = <0>;
> -                       dmas = <&sdma 65 &sdma 66>;
> -                       dma-names = "tx", "rx";
> +               aes_target: target-module@480c5000 {
> +                       compatible = "ti,sysc-omap2", "ti,sysc";
> +                       reg = <0x480c5044 0x4>,
> +                            <0x480c5048 0x4>,
> +                            <0x480c504c 0x4>;
> +                       reg-names = "rev", "sysc", "syss";
> +                       ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
> +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +                                      <SYSC_IDLE_NO>;
> +                       ti,syss-mask = <1>;
> +                       clocks = <&aes2_ick>;
> +                       clock-names = "ick";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x480c5000 0x2000>;
> +                       aes: aes@0 {
> +                               compatible = "ti,omap3-aes";
> +                               reg = <0 0x50>;
> +                               interrupts = <0>;
> +                               dmas = <&sdma 65 &sdma 66>;
> +                               dma-names = "tx", "rx";
> +                       };
>                 };
>
>                 prm: prm@48306000 {
> @@ -579,13 +594,28 @@
>                         status = "disabled";
>                 };
>
> -               sham: sham@480c3000 {
> -                       compatible = "ti,omap3-sham";
> -                       ti,hwmods = "sham";
> -                       reg = <0x480c3000 0x64>;
> -                       interrupts = <49>;
> -                       dmas = <&sdma 69>;
> -                       dma-names = "rx";
> +               sham_target: target-module@480c3000 {
> +                       compatible = "ti,sysc-omap2", "ti,sysc";
> +                       reg = <0x480c3056 0x4>,
> +                            <0x480c3060 0x4>,
> +                            <0x480c3064 0x4>;
> +                       reg-names = "rev", "sysc", "syss";
> +                       ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
> +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +                                      <SYSC_IDLE_NO>;
> +                       ti,syss-mask = <1>;
> +                       clocks = <&sha12_ick>;
> +                       clock-names = "ick";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x480c3000 0x2000>;
> +                       sham: sham@0 {
> +                               compatible = "ti,omap3-sham";
> +                               reg = <0 0x64>;
> +                               interrupts = <49>;
> +                               dmas = <&sdma 69>;
> +                               dma-names = "rx";
> +                       };
>                 };
>
>                 timer1: timer@48318000 {
> --
> 2.17.1
>
