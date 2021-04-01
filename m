Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2060D351FC0
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 21:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbhDAT1i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 15:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234689AbhDAT1W (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Apr 2021 15:27:22 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C784CC00F7F5
        for <linux-omap@vger.kernel.org>; Thu,  1 Apr 2021 11:56:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g8so4302707lfv.12
        for <linux-omap@vger.kernel.org>; Thu, 01 Apr 2021 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C6RnQY5m7m3ncSxYtoqki2XanY7LHf9+m0qLfxHwJv8=;
        b=n6CdqStVJIHXrG1K2XEgTZs5XJtVlF4KxqJ/2p5uH8S49o6LC3QEXBEYwB7egMRYND
         vTfn1naYORnX8ZPNCeyVseCkaEwQMNn/B7bFnxQ1fvF3VPhWVYhhJdtWVL+JSL8bZeOx
         ilJVORp5HL/C8LgOdpHsaG45249b9QL0E0LMQvOmqcgLSEmonpNtyJpei6lK1I1NE/KY
         nNmMK+gzLZ1rFTqEByDv0HHhkdKkpFUm7y9eM81DQZTFMtaj6wmfxmEBHvwMfyVWb/Hz
         olec1ZXzDkr1i/gaduOnxYSd3X+/tHx0XBk8PHkkdzWmp9IAlnatubmw0ZlNXpxBk738
         m9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6RnQY5m7m3ncSxYtoqki2XanY7LHf9+m0qLfxHwJv8=;
        b=g5yNqhPH5jgwT5wnVadNl3GNk5f0VIQY4rx9FcgVkLEf3eLu8DJ4iPsU3JtOcQI6d+
         Y2pnkl1CVmq+bOOtAkW65z/2VAzQync6ir0nuPnVPROY/t6CRunTHaiFnlp6qSIbgRwn
         KQRyimzXy5RJFd0Ez0orvv2W7U0BSu19XNio7s29MauYitrIAEr5o/U2c/nkDp4fJ5YF
         xWqgGHiZonGQX0U8yzFXebuaa8EpqoGKmt3XuMvLC02pxFaGtYT0rMKUz7nx427bsdm3
         VX5WzdPCwL1b613ziHbSJkt1vo2OlpfilMLIjbsNqF1Jh5/VTv5lmvoBVvR31dI5Y8ht
         0IDg==
X-Gm-Message-State: AOAM5330RtzFALSFUKjh99d9fA4byVH+MwY9QIt0ttuSZGYGhQYLi2TC
        N8Ot57DQSDViMJfZIHHm8/plaCVyYG6h4ZK7NKAcaA==
X-Google-Smtp-Source: ABdhPJyYCJgriopjHXug9mhzm3srWjL1GEuqin+19LcZQ/zBxqJQuLESsIXP0n2PRb5JlWQi3tLvN5cZJPesy1Vx6NM=
X-Received: by 2002:a19:430e:: with SMTP id q14mr6743083lfa.374.1617303360081;
 Thu, 01 Apr 2021 11:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210401160434.7655-1-maciej.falkowski9@gmail.com>
In-Reply-To: <20210401160434.7655-1-maciej.falkowski9@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 1 Apr 2021 11:55:49 -0700
Message-ID: <CAKwvOdmSCz7awnjuDWKSd8n+x1E2ziN9F4xLOX0RG5F1yYOFQg@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     aaro.koskinen@iki.fi, tony@atomide.com,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 1, 2021 at 9:05 AM Maciej Falkowski
<maciej.falkowski9@gmail.com> wrote:
>
> The ams_delta_camera_power() function is unused as reports
> Clang compilation with omap1_defconfig on linux-next:
>
> arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: unused function 'ams_delta_camera_power' [-Wunused-function]
> static int ams_delta_camera_power(struct device *dev, int power)
>            ^
> 1 warning generated.
>
> The soc_camera support was dropped without removing
> ams_delta_camera_power() function, making it unused.
>
> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Fixes: ce548396a433 ("media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1326
> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index 2ee527c00284..1026a816dcc0 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -458,20 +458,6 @@ static struct gpiod_lookup_table leds_gpio_table = {
>
>  #ifdef CONFIG_LEDS_TRIGGERS
>  DEFINE_LED_TRIGGER(ams_delta_camera_led_trigger);
> -
> -static int ams_delta_camera_power(struct device *dev, int power)
> -{
> -       /*
> -        * turn on camera LED
> -        */
> -       if (power)
> -               led_trigger_event(ams_delta_camera_led_trigger, LED_FULL);
> -       else
> -               led_trigger_event(ams_delta_camera_led_trigger, LED_OFF);
> -       return 0;
> -}
> -#else
> -#define ams_delta_camera_power NULL
>  #endif
>
>  static struct platform_device ams_delta_audio_device = {
> --
> 2.26.3
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210401160434.7655-1-maciej.falkowski9%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
