Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D712FD655D
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2019 16:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732362AbfJNOkm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Oct 2019 10:40:42 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46991 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731121AbfJNOkl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Oct 2019 10:40:41 -0400
Received: by mail-io1-f66.google.com with SMTP id c6so38305420ioo.13
        for <linux-omap@vger.kernel.org>; Mon, 14 Oct 2019 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+mO+1yjRlM34VxXhdfP5rqzSbKNxdRiApk3w4vhWCIs=;
        b=LkDNjHsNa4gihW8Laoxe3QX6ONyvF+Pq07SyzAicyof6t7tmyN8UtiXf+YJeTxCQb9
         QwBgPcyg5N3vC1rd6eOZrFUiK8SZcZczgHYXoTCOIuHC6jLbPsuZX+SPH5nZ4TRGA0tj
         jdvI7rakGmw6DthTXFsxjhETHIAmgVsqqTC0vPxMdUxAy9XYihUyNIAN7yw+OwBFX2gC
         Y5Y9QylSsyXxmZxMYi34rgat5cZEQLfQJO24cRMWzi0OawkCCXQn4GcVebAH7+T/33tt
         lvXidsnQYDh8yPwVIfgqBMt+d/6VB0h6LDqLru+hpymqeSUxqGI51BBzPOjS5Mb1674C
         2Fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+mO+1yjRlM34VxXhdfP5rqzSbKNxdRiApk3w4vhWCIs=;
        b=NyVhxql09Tu8rzOXEYxb9AebP8IB5o3z7qOEwJ3JiuUR6zv/2JLWGI9+8PYysI9FOZ
         jh00bO41fileINbNUHj9GLBZXY59Tk01xqat3U+6lr9Yef+BRXR4uIDxocNNpzDU3u30
         pJPTRuYFEreLAo9FYTe23cHfqlJu5W1KOGXOfFo3EiO14nDjBwZlTAUxFs+6YHUHMeLs
         5WEPZ4ohNPn7u9JnLekApvIu9ucs14iZOEPj13pJ+/+E7u61i6OwmtatbieAVF7gYPHr
         qGCa6p5JuDB4thTOB8YeQwVbBmapakAK+DhyJ4T1jwGQ3gok3oFeTL6OZwd35eCKQJqm
         DJpw==
X-Gm-Message-State: APjAAAXKVHsif6V2i5qmHNluFC+v81xrbyIM0QumDLOlBTgtZYxCP9OF
        JrFV13VT2m56OzHVog/AurDOGPSEFOUUqt19v2AXKw==
X-Google-Smtp-Source: APXvYqyAE/MV2kH0LzHJvh6uJi061guBb62KwD++3EEb/q/bu9V12Z2AvoDE9+dLsA8gAVAXTbfiIIvQChROD6bsArU=
X-Received: by 2002:a92:6a04:: with SMTP id f4mr819544ilc.205.1571064040355;
 Mon, 14 Oct 2019 07:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190925171444.9904-1-aford173@gmail.com>
In-Reply-To: <20190925171444.9904-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 14 Oct 2019 09:40:28 -0500
Message-ID: <CAHCN7xKMJanamQAAa-nyoTYJdNu9eWG4zFMAhcBgPGPd6BJ6dw@mail.gmail.com>
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

This can be dropped.  I am not sure what I did wrong, but the hwmods
are working on 5.4-RC3.

adam

> Signed-off-by: Adam Ford <aford173@gmail.com>
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
