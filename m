Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDE754B0FD
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jun 2022 14:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243308AbiFNMgq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jun 2022 08:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244992AbiFNMfm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jun 2022 08:35:42 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B434DF4A
        for <linux-omap@vger.kernel.org>; Tue, 14 Jun 2022 05:33:00 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id w2so14896360ybi.7
        for <linux-omap@vger.kernel.org>; Tue, 14 Jun 2022 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hT2JQMlaZc59miZ+XRXQw6fq2XUX3VeltgyAMsSMKwo=;
        b=iELMhcBck05tLdFPsk80NYlhSbvpWf1ZVnktIH2m81Tj1jCXkUv9NdzoitVPt2sSRI
         iz1M8biAeldxEKk8GQzN10nQ0kzQBBf80hih1al2wncVw4jdZu+/1TkLhFvz3tGscIFY
         aWMiqWTB/eXglLT0FrIJiiuJFNEJN3ccX2ICNU50HuGCrCShaQofGjEm0STbscGspWo4
         Ggqf7D0zWsezOjtHuPdtADsJVVqILAWiWzkWoYA20hAVxClSWE/KPnsPLZw23Dm57ld/
         eXn46/pcidjqyLg9RsxoKMjDTvGsee6RdMCd5MY6s3624gpashgUkKljTwQ7j9duOEem
         GeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hT2JQMlaZc59miZ+XRXQw6fq2XUX3VeltgyAMsSMKwo=;
        b=Rh0C0z+UPkWbCDb+kQ8iLO3bVRBvWabktKxbKlDkISyNLcqfiLG1CESKKdZPVuA5Ma
         0LkgXFtpuNqXtD5OqjsxIsCeECLM5E+fOiNCq1smG+ChqiYvI4A1ZqTlcRRoU9QE11OO
         GxrhFMQis0eduiNgIrRQwjRxosydeovB1V29kmbTuCYMG2uqaD501nnpOgWNF533ouVk
         JJDNQdE4nDDAqSujbymesld5SHo6+ayqR5PsgZ90rJzTwmOZ7/nmDhn0nN/m5odS7nCr
         xIBW2axeq6nlTALegeLk8w1jrqHrLDuAlippw6ubUi+zNu7LQg/dxFXV2tKGJoXi5lvG
         nzGw==
X-Gm-Message-State: AJIora/lDcOpLH84I+50kHE6ng5Xej8gJMFdc+qEQz/SgpFZjb7WjdnL
        F110YpJI+uBLn8TaaikmkbiDsvc7gKy6nOdXQgcydZ+0
X-Google-Smtp-Source: AGRyM1tKcHkkSUpkkdpLFndC/oRTwvvjCxj3nmeTfqhTLT1LE9izMv5dzVxKtyxRDNvBPS+7uHJpV5v6RO7F7lV84z8=
X-Received: by 2002:a25:cec6:0:b0:65c:98f5:a06a with SMTP id
 x189-20020a25cec6000000b0065c98f5a06amr4659823ybe.355.1655209979188; Tue, 14
 Jun 2022 05:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ku2O3Z7OegxKpq4SnaycvzmgFR7SO1PoZJ3h4P7OHvQYg@mail.gmail.com>
 <CAPgEAj7wNtgf9sUrL1E14LgrPwiLv=bGcAyhdzns3ZnkH-Qqww@mail.gmail.com> <CAGm1_ksRcRBG+Ns+XJ4YvXyZmnMPXLqBiurhqkphSRR8orZbaw@mail.gmail.com>
In-Reply-To: <CAGm1_ksRcRBG+Ns+XJ4YvXyZmnMPXLqBiurhqkphSRR8orZbaw@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 14 Jun 2022 14:32:48 +0200
Message-ID: <CAGm1_kscjH-hQA+K6OcVJUiwCOrrfgjW5PHRw=Zdci788h9j1A@mail.gmail.com>
Subject: Re: am335x: GPIOs in userspace
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Drew,

On Mon, May 30, 2022 at 12:04 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hello Drew,
>
> On Mon, May 30, 2022 at 12:55 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > On Fri, May 27, 2022 at 1:01 PM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > >
> > > I have the following problem. The latest kernel version I am using for
> > > my devices is 5.4.x. In my DTS I don't explicitly expose the GPIOs to
> > > the usespace but I can read input both via sysfs as also libgpiod API.
> > >
> > > With the newest kernel like 5.17 or 5.18, I can read the same input
> > > pin but I always read 0. I have also tried to add my GPIOs as
> > > "default" into the am33xx_pinmux section (the way it is done in [1]) but
> > > it didn't help.
> > >
> > > [1] https://patchwork.kernel.org/project/linux-omap/patch/20200712103717.1219765-1-drew@beagleboard.org/
> > >
> > > Regards,
> > > Yegor
> >
> > Hello Yegor,
> >
> > Which am335x board are you using?  Is it the PocketBeagle?
> >
> > Have you tried reverting abe4e4675dfc ("ARM: dts: am335x-pocketbeagle:
> > set default mux for gpio pins") to see if the results change?
> >
> > Please post the dts files you created or modified so I can better
> > familiarize myself with your environment.
> >
> > Unfortunately, I'm currently traveling with only a BeagleBone Black,
> > but it might be useful for testing depending on what the issue is.
>
> This is a diff to the DTS of our board Baltos ir5221:
>
> diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
> b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
> index 2f3872dbf4f4..f596cc60e9c0 100644
> --- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
> +++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
> @@ -18,6 +18,19 @@
>  };
>
>  &am33xx_pinmux {
> +       compatible = "pinconf-single";
> +       pinctrl-names = "default";
> +
> +       pinctrl-0 =   < &wifi_switch>;
> +
> +       wifi_switch: pinmux_wifi_switch {
> +               pinctrl-single,pins = <
> +                       AM33XX_PADCONF(AM335X_PIN_SPI0_CS1,
> PIN_INPUT_PULLUP, MUX_MODE7)      /* spi0_cs1.gpio0[6] wifi switch */
> +               >;
> +               pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
> +               pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
> +       };
> +
>         tca6416_pins: pinmux_tca6416_pins {
>                 pinctrl-single,pins = <
>                         AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR1,
> PIN_INPUT_PULLUP, MUX_MODE7)      /* xdma_event_intr1.gpio0[20]
> tca6416 stuff */
>
> This is my related kernel configuration:
>
> # zcat /proc/config.gz | grep "PINCTRL\|PINCONF"
> CONFIG_PINCTRL=y
> CONFIG_GENERIC_PINCTRL_GROUPS=y
> CONFIG_PINCONF=y
> CONFIG_GENERIC_PINCONF=y
> CONFIG_DEBUG_PINCTRL=y
> # CONFIG_PINCTRL_MCP23S08 is not set
> # CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
> # CONFIG_PINCTRL_OCELOT is not set
> # CONFIG_PINCTRL_PALMAS is not set
> CONFIG_PINCTRL_SINGLE=y
> # CONFIG_PINCTRL_STMFX is not set
> # CONFIG_PINCTRL_SX150X is not set
> CONFIG_PINCTRL_TI_IODELAY=y
>
> This command should deliver "1":
>
> # gpioget gpiochip0 6
> [   55.371155] gpio gpiochip0: Persistence not supported for GPIO 6
> [   55.377503] gpio gpiochip0: registered chardev handle for line 6
> [   55.383611] gpio gpiochip0: registered chardev handle for 1 lines
> 0

I found the problem. Between 5.10 and 5.11 gpiochip assignment has
changed: gpiochip1 -> gpiochip4. Hence, I'll have to work with gpio
labels.

Regards,
Yegor
