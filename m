Return-Path: <linux-omap+bounces-4650-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77CBB19A4
	for <lists+linux-omap@lfdr.de>; Wed, 01 Oct 2025 21:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4CB619289A0
	for <lists+linux-omap@lfdr.de>; Wed,  1 Oct 2025 19:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AB0283C93;
	Wed,  1 Oct 2025 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIeckES8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE49253F05
	for <linux-omap@vger.kernel.org>; Wed,  1 Oct 2025 19:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347020; cv=none; b=O2AgoTKZRC4AfLkZ9K9i5pmYCrSoyipvAHQY4d/VUpQbNt14f4G2lAYUBDl5gtousisFAGp5FBMOXT5D61ijWOXiB/x9eGj0jLd8CQskpEqqIdUFCRvWDvn13J0HqWLCnTmhvCRTD5BrsnAUu13MI9r+NeEH7Ghlw+x4dw0jTIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347020; c=relaxed/simple;
	bh=nD8DBEQU9cqf5yCHDG1G84O1k+1ZUALQddEqvQQlqpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZcqZJOybOwP7MklaL57kf5rK1pwoqVZxtQpgjL3A+vhaxzErAWllOwD2ZZ2o6UCw1XMTC2hU8iWKNb4zcLnIAnlCnCMsudyXKg6x2op2l9NJar1oLiBJnKe9SQuRHHbwTbYoKjmKXLaqAFdMkkfIG6VnCEgpKnO95sKLF6F5NRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIeckES8; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d603acc23so3204307b3.1
        for <linux-omap@vger.kernel.org>; Wed, 01 Oct 2025 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759347017; x=1759951817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+utnhbHa52CPK3LFvm9YScaso4DbVTgb4xvZs3BIA=;
        b=WIeckES8KCNMEENWNvMjer7Hzdg8lgRCfk7e0ScvqHy7lfe1N0MckcccIe1kpbJexk
         Qsq5OoC0Iyq8IjVEYd/Zs54koo9I3Dn3MLlIUVCbZ5VGPflbm+EBKIJSyOmQ/qiyyTsP
         ppiD1qswCzhmyevW50fQaR0lAP0kY7giPOGKU7fHmW6nE/oES5cPwBeq3a5ZIMWx7sbd
         0RCMspYWa5BfYcHIsWrbHKmCogvLkwtTALY8rxzkort28MP655JUX/CDqIE0FDYMjKmk
         mmchrJHUv/0RM/T5tloHX2uUlqR4p9N5Nb0tN1XRaz/rWk4XU742VxGqbuXkvZ/SHEli
         io7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347017; x=1759951817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi+utnhbHa52CPK3LFvm9YScaso4DbVTgb4xvZs3BIA=;
        b=XInSiNo7DTnpSmDfGFZYk0qNZE10dREvoJmlyFYineflwQ0jpXerUYc7qG1hHA+kxF
         wQJf7LG2GTLchEabpeC42qizy3IwENlwDbQBrFClsuAvrnhleC2RvLDJZ8o9Ka8X+PRg
         /ZHvV3kavJrPpKqUGANhslwRhda820uSQ646nU3JKH4gOtC6pOm8QVzm+WgagrY7NyA/
         W6oDZy6cG7l8L7Szr7AT6D7HjtQNcFGSAw+H5cR6+aFjbVZMiUHMflHZ2V5Q+eZ1rya6
         fHNk3qC37XHDGxkaxNPjEFEn6+cyXX15t2aMDb/3L/olnioUvFy6ubOo+YwDUJgdYobi
         KzQw==
X-Gm-Message-State: AOJu0YztuS4Mja6auMSpLmPz2Opscl4fz8zxKy1ClYBUe9PhTVFDAVjH
	HYxpxRQhIfCS6+/dF0VXbtWaCbXIMz5VwZnwH4A9DqUT5zBCDAMaHUUdCyJ6XsiPFD2YWj6R55S
	IyNI4TicxBxmfPa/U3jfaz4WewgiSjOSIIYLeqZ8=
X-Gm-Gg: ASbGncsX8Z+Ial0Rsn+lYX6gLWQ6DlOZc5QnJjS6TFa8PyV74JThvD2BqUZc+lC3Xm6
	f0/qG4opx7ByqRUKiy2HuL0qBp0mrGdss1s5gFRd7xk5RWUSKNTlskFGipeUsETVqoEVvkbZiFm
	KAsz4flubqJs5RZGNKPj1a0uteDvv1LXAezc95y1Oyu8VOu0wnONYYn7MVhtTAWv7goDSmtUg1G
	P8CGBv+6wCc/u6CbQoZmRzPvxnLkW9ftK1why8SOw==
X-Google-Smtp-Source: AGHT+IE+3vd7yN/JVDnIVchv1RPr40eGHsjZ9RmPfCUqyPhqwv76mHzSf2TUL2O1+qhW3Vhwq+3h08yC4Dxl3/NFziQ=
X-Received: by 2002:a53:b7ca:0:b0:635:4ed0:572b with SMTP id
 956f58d0204a3-63b700bf137mr5057163d50.47.1759347016679; Wed, 01 Oct 2025
 12:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721173741.6369-1-bruno.thomsen@gmail.com> <CAMuHMdUb7Jb2=GqK3=Rn+Gv5G9KogcQieqDvjDCkJA4zyX4VcA@mail.gmail.com>
In-Reply-To: <CAMuHMdUb7Jb2=GqK3=Rn+Gv5G9KogcQieqDvjDCkJA4zyX4VcA@mail.gmail.com>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Wed, 1 Oct 2025 21:30:00 +0200
X-Gm-Features: AS18NWDCWPZxEk5r0mGnA_gPPQrRacaeIKixw9qSib3pZk0rz-Y39gsckLrlNps
Message-ID: <CAH+2xPAKa6TWiEbS8Xk3UfSyNk9N1+C+Vy64vzduU450OdgSwA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am33xx-l4: fix UART compatible
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Judith Mendez <jm@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

Den tirs. 30. sep. 2025 kl. 19.08 skrev Geert Uytterhoeven
<geert@linux-m68k.org>:
>
> Hi Bruno,
>
> On Mon, 21 Jul 2025 at 19:38, Bruno Thomsen <bruno.thomsen@gmail.com> wrote:
> > Fixes the following dtschema check warning:
> >
> > serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
> >         ['ti,am3352-uart', 'ti,omap3-uart'] is too long
> >         'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
> >         'ti,am654-uart' was expected
> >         from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> >
> > Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
>
> Thanks for your patch, which is now commit ca8be8fc2c306efb ("ARM:
> dts: am33xx-l4: fix UART compatible") in soc/for-next.
>
> This commit broke the serial console on BeagleBone Black.
> Upon closer look, my .config had CONFIG_SERIAL_OMAP (for
> "ti,omap3-uart") enabled instead of CONFIG_SERIAL_8250_OMAP (for
> "ti,am3352-uart").  However, replacing CONFIG_SERIAL_OMAP by
> CONFIG_SERIAL_8250_OMAP does not help: the serial driver now probes,
> but I still get no output nor a login prompt.

You properly need to enable CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP
if using an existing console= kernel argument from the bootloader as UARTs
will change to ttyS from ttyO.

Switching the UART driver on am33xx based products fixed UART issues
we were seeing in our CD test pipelines.

> The same issue is present when using omap2plus_defconfig, which has
> both serial options enabled.

I did not check if any defconfigs needed to be updated.

The below kernel configuration snippet is known to work on a product
with similar design to the BeagleBone Black.

----------------------8<-------------------

CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
# CONFIG_SERIAL_8250_DMA is not set
CONFIG_SERIAL_8250_NR_UARTS=6
CONFIG_SERIAL_8250_RUNTIME_UARTS=6
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_FSL=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_OMAP=y
CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP=y
CONFIG_SERIAL_OF_PLATFORM=y

----------------------8<-------------------

/Bruno

>
> > --- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> > @@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
> >                         ranges = <0x0 0x9000 0x1000>;
> >
> >                         uart0: serial@0 {
> > -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                               compatible = "ti,am3352-uart";
> >                                 clock-frequency = <48000000>;
> >                                 reg = <0x0 0x1000>;
> >                                 interrupts = <72>;
> > @@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
> >                         ranges = <0x0 0x22000 0x1000>;
> >
> >                         uart1: serial@0 {
> > -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                               compatible = "ti,am3352-uart";
> >                                 clock-frequency = <48000000>;
> >                                 reg = <0x0 0x1000>;
> >                                 interrupts = <73>;
> > @@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
> >                         ranges = <0x0 0x24000 0x1000>;
> >
> >                         uart2: serial@0 {
> > -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                               compatible = "ti,am3352-uart";
> >                                 clock-frequency = <48000000>;
> >                                 reg = <0x0 0x1000>;
> >                                 interrupts = <74>;
> > @@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
> >                         ranges = <0x0 0xa6000 0x1000>;
> >
> >                         uart3: serial@0 {
> > -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                               compatible = "ti,am3352-uart";
> >                                 clock-frequency = <48000000>;
> >                                 reg = <0x0 0x1000>;
> >                                 interrupts = <44>;
> > @@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
> >                         ranges = <0x0 0xa8000 0x1000>;
> >
> >                         uart4: serial@0 {
> > -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                               compatible = "ti,am3352-uart";
> >                                 clock-frequency = <48000000>;
> >                                 reg = <0x0 0x1000>;
> >                                 interrupts = <45>;
> > @@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
> >                         ranges = <0x0 0xaa000 0x1000>;
> >
> >                         uart5: serial@0 {
> > -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                               compatible = "ti,am3352-uart";
> >                                 clock-frequency = <48000000>;
> >                                 reg = <0x0 0x1000>;
> >                                 interrupts = <46>;
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

