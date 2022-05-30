Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380F7537835
	for <lists+linux-omap@lfdr.de>; Mon, 30 May 2022 12:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbiE3KEZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 May 2022 06:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbiE3KEY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 May 2022 06:04:24 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D420D7980B
        for <linux-omap@vger.kernel.org>; Mon, 30 May 2022 03:04:23 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id p13so6671394ybm.1
        for <linux-omap@vger.kernel.org>; Mon, 30 May 2022 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wI/q7uzH4f96Hbcz4HS+cwvBR/A4UeaSODWtwItwDKI=;
        b=MYT5uEUVAEsQNc4NQlbTo+WEZ5ESznrd4s8GtsXiKdtzNage7bCdZGprkkzE0g9OsW
         3fw7tJ8rlC51lnDO2GcB0N3qxpGW29JmTS4UdsRKJyUc4AHqnt8U+YmAgbY2kgDtU2XN
         D00jqvwLmPp/Q5rSCW53gpN1AC/nWB+ekjEtOt0+OwcREU+6xpSmq9RdRs5VEVh2guLg
         OkeF9DmVqM0qoZ+gxH3oPnWYy4RmtefxA1Zl108Sg+uRrsADCsecwV3qwm4TwlsmGb+J
         AYdVJHJXkl6YAJZUJ2tbaEah2pFDnMaSxwpqk3wa76THNal7EsDStnyKCHL1C2wCnUDG
         9j8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wI/q7uzH4f96Hbcz4HS+cwvBR/A4UeaSODWtwItwDKI=;
        b=sfY6jKlvIpn+8wSU+aR5pNdVbigO2dfVJMQBT6IJoviK0M8ZifqOIn3d0AxlG2wON6
         FHEnEjaF2IAu7Fv46TJIJHUEeSIt3hRxDwINU0MBFJmXd1jYS1LTuwC5FTuM4Motj4H4
         29DgBjiFYLSAeImrgL1aP6DfCF/4BumBCNhq9LVnh+Dh28n6hdTS5DlBspbfbshHVOcY
         3EbuxS0IGOLYCTIwemnKX+V98iAmJTx/ZJosfJLxqEyvFDGFj4oh1TZtlt09F/0m9Swk
         b7xVvQ6Ea/byKYk0zLRPuONpAFhoum2bY8qftrv7r4JDxfZw4a2PRwGxBc0d44m2zlYk
         UhdA==
X-Gm-Message-State: AOAM532X17hqFKune8QTtW6b/gCSrWGaspYID60oPPcEvU84L6Kfr9eB
        bstQ1zeoIC+KqCJv5KelwOUjLG5d0PKHU9RGL5epTMrCZYw=
X-Google-Smtp-Source: ABdhPJx1FvpJGv7srrFJZkfegKrV75ad0NxEul7MZh61mV7f/g3RX9NUqTlFa9Xo1VhQL+5xKpvrcraUKgoZ+uPpM/g=
X-Received: by 2002:a25:af02:0:b0:64f:72b8:ce50 with SMTP id
 a2-20020a25af02000000b0064f72b8ce50mr41370253ybh.528.1653905062966; Mon, 30
 May 2022 03:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ku2O3Z7OegxKpq4SnaycvzmgFR7SO1PoZJ3h4P7OHvQYg@mail.gmail.com>
 <CAPgEAj7wNtgf9sUrL1E14LgrPwiLv=bGcAyhdzns3ZnkH-Qqww@mail.gmail.com>
In-Reply-To: <CAPgEAj7wNtgf9sUrL1E14LgrPwiLv=bGcAyhdzns3ZnkH-Qqww@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon, 30 May 2022 12:04:12 +0200
Message-ID: <CAGm1_ksRcRBG+Ns+XJ4YvXyZmnMPXLqBiurhqkphSRR8orZbaw@mail.gmail.com>
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

Hello Drew,

On Mon, May 30, 2022 at 12:55 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> On Fri, May 27, 2022 at 1:01 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > I have the following problem. The latest kernel version I am using for
> > my devices is 5.4.x. In my DTS I don't explicitly expose the GPIOs to
> > the usespace but I can read input both via sysfs as also libgpiod API.
> >
> > With the newest kernel like 5.17 or 5.18, I can read the same input
> > pin but I always read 0. I have also tried to add my GPIOs as
> > "default" into the am33xx_pinmux section (the way it is done in [1]) but
> > it didn't help.
> >
> > [1] https://patchwork.kernel.org/project/linux-omap/patch/20200712103717.1219765-1-drew@beagleboard.org/
> >
> > Regards,
> > Yegor
>
> Hello Yegor,
>
> Which am335x board are you using?  Is it the PocketBeagle?
>
> Have you tried reverting abe4e4675dfc ("ARM: dts: am335x-pocketbeagle:
> set default mux for gpio pins") to see if the results change?
>
> Please post the dts files you created or modified so I can better
> familiarize myself with your environment.
>
> Unfortunately, I'm currently traveling with only a BeagleBone Black,
> but it might be useful for testing depending on what the issue is.

This is a diff to the DTS of our board Baltos ir5221:

diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
index 2f3872dbf4f4..f596cc60e9c0 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
@@ -18,6 +18,19 @@
 };

 &am33xx_pinmux {
+       compatible = "pinconf-single";
+       pinctrl-names = "default";
+
+       pinctrl-0 =   < &wifi_switch>;
+
+       wifi_switch: pinmux_wifi_switch {
+               pinctrl-single,pins = <
+                       AM33XX_PADCONF(AM335X_PIN_SPI0_CS1,
PIN_INPUT_PULLUP, MUX_MODE7)      /* spi0_cs1.gpio0[6] wifi switch */
+               >;
+               pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+               pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+       };
+
        tca6416_pins: pinmux_tca6416_pins {
                pinctrl-single,pins = <
                        AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR1,
PIN_INPUT_PULLUP, MUX_MODE7)      /* xdma_event_intr1.gpio0[20]
tca6416 stuff */

This is my related kernel configuration:

# zcat /proc/config.gz | grep "PINCTRL\|PINCONF"
CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
# CONFIG_PINCTRL_OCELOT is not set
# CONFIG_PINCTRL_PALMAS is not set
CONFIG_PINCTRL_SINGLE=y
# CONFIG_PINCTRL_STMFX is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_TI_IODELAY=y

This command should deliver "1":

# gpioget gpiochip0 6
[   55.371155] gpio gpiochip0: Persistence not supported for GPIO 6
[   55.377503] gpio gpiochip0: registered chardev handle for line 6
[   55.383611] gpio gpiochip0: registered chardev handle for 1 lines
0

Regards,
Yegor
