Return-Path: <linux-omap+bounces-2522-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7B59B6703
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 16:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A3981F2168A
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 15:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6901F213129;
	Wed, 30 Oct 2024 15:08:55 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE03212F1C;
	Wed, 30 Oct 2024 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730300935; cv=none; b=Xg1RI/ZfcoX/+jStD8Gc668Fgfkb7lz5KRW/nUSv4B6OTYA3+aUlc3I03a4k+yQUkzSGWkdBClx2SiX31F0WxeTgRblMpSAHVCfvyDjpvPtuWOeEvf44gRVN1mF0DZrcbL6mrN3sP4MUjPe6X6CJWVIULTltbtog/fe0oplSqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730300935; c=relaxed/simple;
	bh=ejF+LhbN4p+CJJaxM5KezRpQLarvwOeSL14GAdk+D4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJdUO3WhBG3lAA4boLO3vkbS8mY/i/CMWKHovaNmirxw+g112zWfRfKQkSieMcS0hNvzo6gmySP+kKFHnNZik+4PBKtbqjZCM4s/9Y1HpHr3yIONJ2rgfr8lkCz1HylUvkg55WRQWUP7fGE5rFfFvh6wh6Ty8b9HyZl9zgYGNno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e330b7752cso7381457b3.1;
        Wed, 30 Oct 2024 08:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730300931; x=1730905731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwJLsP/X3bIPlA750OvhbizLaCKZ63BQRtUHuQ3kd0c=;
        b=Az+XD+DaKbzOuR/cDLeubj55jfVuQDI9B6U4afvv7TLTSXAUOBUmk6UpD9SxQe0B39
         fMkc8eUG3PZGU8++FOxtAuViPxxbrH+iZYrrGKQjieaP/utObTjrbIxIpVXQNbMDjUyz
         gE66FJxJG/gv0ikID+BSCtodjuB+bK0VaoaRJ38+N7vOtO/db4kx4z8llIJB5AAXAdgX
         xp3Tr26fxThxzkwLSqTpy1/gPcBAROZZU4AACX1P7gO/DVWXkJupn7ZwsLxRGBU7tu3S
         +5Rvh7scI6M6+JQaxYSuPd7KyslGUcbV4btcath7A/z1x2DIgYZ5uL3EdnMaw+roRNmM
         iHuA==
X-Forwarded-Encrypted: i=1; AJvYcCWeom1GYRLN68rN4ZuztX2+2YDuHKl2e9d6MTICI3pqdlWMKJkdutDh324aSeyQBscsvUPoaccf@vger.kernel.org, AJvYcCX4lEyG3kCjA2UEuf16OPr7bMQzEdc3d34H3UguuMpZbgiB9xvC5cv5Vhb+GUULQ5WGqqFSgab9wh8f@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0SxeR2f9H8afyxqRKwM6ov/YDE23/1Vh2FC0qq10h53hrEjvP
	yK3jizbuBFzmP6t7uLjtjkW3Bh0r+lJEgV2Vu3ROf+w2blngROFi++iS+VtD
X-Google-Smtp-Source: AGHT+IGvsBSR45dD3zTrEdwBfs9mL619xmrp5Sbc5ZHexoObE/H4MOU6o2j0QChUTuLHMzPKQhQCHg==
X-Received: by 2002:a05:690c:380b:b0:6e3:7625:15f7 with SMTP id 00721157ae682-6ea3e8fb1bbmr23594627b3.10.1730300930577;
        Wed, 30 Oct 2024 08:08:50 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c193b6sm24370397b3.66.2024.10.30.08.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:08:50 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e39bf12830so8991267b3.1;
        Wed, 30 Oct 2024 08:08:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu8PPaRyFxgl04vSEuavOP45w+IzwuyrgtXgVcWDA3D3y3HwRJesbWLgcPz9RG9hXS3rkma5GYXNl6@vger.kernel.org, AJvYcCXl2FzjvN4Tk9nsemMdoclaaGVc6A7bawPz8enhiPul1fcdBGa1mnhus+F9O8W+d8uFDECVO8nj@vger.kernel.org
X-Received: by 2002:a05:690c:e07:b0:6db:dee9:f6fb with SMTP id
 00721157ae682-6ea3e8fbba7mr22563157b3.11.1730300929652; Wed, 30 Oct 2024
 08:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
 <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org>
In-Reply-To: <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:08:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVN_xNLTvy9u6FvK=agSAUzSHxEuyBS37sOA7jpGLwddw@mail.gmail.com>
Message-ID: <CAMuHMdVN_xNLTvy9u6FvK=agSAUzSHxEuyBS37sOA7jpGLwddw@mail.gmail.com>
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Roger Quadros <rogerq@kernel.org>
Cc: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roger,

On Wed, Oct 30, 2024 at 1:58=E2=80=AFPM Roger Quadros <rogerq@kernel.org> w=
rote:
> On 29/10/2024 19:18, Geert Uytterhoeven wrote:
> > During the last few months, booting kernels on BeagleBone Black
> > sometimes fails with:
> >
> >     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> > LAN8710/LAN8720 failed with error -5

[...]

> Just wondering if the Reset is happening correctly and it has settled
> before PHY access.
>
> From arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
>
> &davinci_mdio_sw {
>         pinctrl-names =3D "default", "sleep";
>         pinctrl-0 =3D <&davinci_mdio_default>;
>         pinctrl-1 =3D <&davinci_mdio_sleep>;
>
>         ethphy0: ethernet-phy@0 {
>                 reg =3D <0>;
>                 /* Support GPIO reset on revision C3 boards */
>                 reset-gpios =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
>                 reset-assert-us =3D <300>;
>                 reset-deassert-us =3D <13000>;
>         };
> };
>
> Do we need to increase reset-deassert-us for some reason?

Thanks for the hint!

This is indeed on Rev. C3 (my other boards are Rev. A5C or C, but
I don't test boot recent kernels on them, as they are in active use).

Multiplying reset-deassert-us by 10 gives me a booting board.
More experiments reveal that I need a delay of 14 ms to boot
successfully, and 15 ms to avoid the early __mdiobus_read()
failure, too.

> I couldn't find MII ready time after reset de-assert information form the
> PHY datasheet. except the following line [1].
> "For the first 16us after coming out of reset, the MII/RMII interface wil=
l run at 2.5 MHz. After this time, it will
> switch to 25 MHz if auto-negotiation is enabled"
>
> [1] 3.8.5 RESETS
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDoc=
uments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf

3.8.5.1 Hardware Reset
"A Hardware reset is asserted by driving the nRST input pin low. When
 driven, nRST should be held low for the minimum time detailed in
 Section 5.6.3, "Power-On nRST & Configuration Strap Timing," on page
 60 to ensure a proper transceiver reset."

5.6.3 POWER-ON NRST & CONFIGURATION STRAP TIMING
"For proper operation, nRST must be asserted for no less than trstia."

TABLE 5-8: POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES
"trstia nRST input assertion time min. 100 =C2=B5S"

On Rev. C3, ETH_RESETn is controlled by an open-drain AND gate.
It is pulled high by a 10K resistor, and has a 4.7=C2=B5F capacitor to
ground.  That gives an RC constant of 47ms.  As you need 0.7RC to charge
the capacitor above the threshold voltage of a CMOS input (VDD/2),
reset-deassert-us should be at least 33ms. Considering the typical
tolerance of 20% on capacitors, 40ms would be safer. Or perhaps
even 50ms?

If you agree, I can send a patch.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

