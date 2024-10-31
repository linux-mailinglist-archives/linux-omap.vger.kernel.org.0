Return-Path: <linux-omap+bounces-2551-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FF19B778B
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 10:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D98D11C22364
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 09:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D055194C65;
	Thu, 31 Oct 2024 09:31:10 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7B1940BC;
	Thu, 31 Oct 2024 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367070; cv=none; b=Q5oMo9Q+Tt6BrC1+6sXJUaD9swyFlEo+HR3r2As4dZYihup5m5vcEC2qexvQiPJz8iEWmjmRKWlv2X1TsjIjm/7AqAhhg689DOfSBzw8vficZZGXS6nOA5BXDmK/onxVzo8Y58kKn8jtOFZK1ZUOg59p36gejD5Niz7sQ7i0SeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367070; c=relaxed/simple;
	bh=TuMVZsz+UKv7UO7ZBvM6lqL/hr/CbH5V2Fs4zW30yFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jO0tuX9DY2QChrbBQq37TwtYoGRw/AfEfSbgmu6sRcFjraW0wHD8ym2OGrOqyBvXwAAxFZwgGidNPP+9WlTkaSasq8q4rIJsNRIWWWrPxlprDdRPvgz+y3VbD8MWK6HsYC5LG/qsy1Ve5TwuJ/ybqe63G5OKabutyNIg83iPsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ea339a41f1so6062557b3.2;
        Thu, 31 Oct 2024 02:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367066; x=1730971866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxr4uhJhkKujIbCmn/2BlmBZDzUgZQRQwOInIgaY+OM=;
        b=UrdXOwFqsyKCJ1a7+HXpYAOeJlNFbggdRwNeNcePpRYva7zzY5slCjMOXxwyEgjWAt
         j6cqRpOJ5jsO6lfJnFHSYrwY1LCq67IJB+JUnre4/5R3E8cQA287zlwHAxmgFGopO/fN
         QUJg1zcHnrCorkszYa9TNW3twa9gPYs+MJROeUrj5s+TV3GxObREbCqOZlc7OdYesKbl
         5lybAUBfZbX+TWwG/SN+ivTIwIGAgEURqpND4vuV3jS/CE86Jbhgzkvyie0o6m9sU7u5
         43K8C8Z+PrOa8XTqwydqSJdRvwq1GCoLVgW8qg2aPUApv8CHpOgbMxDdfy++x+181FDZ
         b82w==
X-Forwarded-Encrypted: i=1; AJvYcCViMt9mGXj2Pucw8ZInvjltR0qqHZBdUATp8k60KyiJb92vhfHHKbTiLx0Ai308xoTvVfggTV8KuG7J@vger.kernel.org, AJvYcCVu8zadOVVAZEWVKxDVl4wUjA2WtUCPQM+pV6DDNvYTfXt33l6xCzwxklQQTld+pabCkQunbmCl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw18ogbV5SujY8wscHwwdVtFLLXUSqwEezEBYMYgjNdsdrlhpx6
	eA2+MXaeJS/G6yIO97RBvzM79BCq0VpawglHIVusIrcN0M1urIsLteAOIQFJ
X-Google-Smtp-Source: AGHT+IEWvt7dWOsqzeJ34w3BsxdbNRkVAhZRN+JhfqZf1d7VjLGHieehFQvAQSstdgaffR3GU/IbYg==
X-Received: by 2002:a05:690c:25c8:b0:6e5:e571:108b with SMTP id 00721157ae682-6ea523216f0mr28178407b3.8.1730367065580;
        Thu, 31 Oct 2024 02:31:05 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55b24804sm1814887b3.51.2024.10.31.02.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 02:31:05 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea15a72087so5649627b3.1;
        Thu, 31 Oct 2024 02:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmSMM7xNH2g5z2YxLSwf2Jk5H4UEtKezirYmN2PWxUWasZ7ujvg3RNDVDYS8+NHOih0O2xbP9fNNMp@vger.kernel.org, AJvYcCVMTuvxIKY99rI60qvsYdpvieVe9DHaMmpJtZbb92U3v+djoPj/DQtubdezjn6H17uCG3K+VaSa@vger.kernel.org
X-Received: by 2002:a05:690c:6ac2:b0:6e7:d974:8cee with SMTP id
 00721157ae682-6ea52323519mr32131157b3.7.1730367064809; Thu, 31 Oct 2024
 02:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
 <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org> <CAMuHMdVN_xNLTvy9u6FvK=agSAUzSHxEuyBS37sOA7jpGLwddw@mail.gmail.com>
 <cd120c6b-e469-46d9-95b5-71a8cc6513cf@kernel.org>
In-Reply-To: <cd120c6b-e469-46d9-95b5-71a8cc6513cf@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Oct 2024 10:30:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfq4+gZcq6PzU=n0d2tTGEG3MV5c2tTQKLDysmj-g=kg@mail.gmail.com>
Message-ID: <CAMuHMdWfq4+gZcq6PzU=n0d2tTGEG3MV5c2tTQKLDysmj-g=kg@mail.gmail.com>
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Roger Quadros <rogerq@kernel.org>
Cc: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 10:06=E2=80=AFAM Roger Quadros <rogerq@kernel.org> =
wrote:
> On 30/10/2024 17:08, Geert Uytterhoeven wrote:
> > On Wed, Oct 30, 2024 at 1:58=E2=80=AFPM Roger Quadros <rogerq@kernel.or=
g> wrote:
> >> On 29/10/2024 19:18, Geert Uytterhoeven wrote:
> >>> During the last few months, booting kernels on BeagleBone Black
> >>> sometimes fails with:
> >>>
> >>>     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> >>> LAN8710/LAN8720 failed with error -5
> >
> > [...]
> >
> >> Just wondering if the Reset is happening correctly and it has settled
> >> before PHY access.
> >>
> >> From arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
> >>
> >> &davinci_mdio_sw {
> >>         pinctrl-names =3D "default", "sleep";
> >>         pinctrl-0 =3D <&davinci_mdio_default>;
> >>         pinctrl-1 =3D <&davinci_mdio_sleep>;
> >>
> >>         ethphy0: ethernet-phy@0 {
> >>                 reg =3D <0>;
> >>                 /* Support GPIO reset on revision C3 boards */
> >>                 reset-gpios =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
> >>                 reset-assert-us =3D <300>;
> >>                 reset-deassert-us =3D <13000>;
> >>         };
> >> };
> >>
> >> Do we need to increase reset-deassert-us for some reason?
> >
> > Thanks for the hint!
> >
> > This is indeed on Rev. C3 (my other boards are Rev. A5C or C, but
> > I don't test boot recent kernels on them, as they are in active use).
> >
> > Multiplying reset-deassert-us by 10 gives me a booting board.
> > More experiments reveal that I need a delay of 14 ms to boot
> > successfully, and 15 ms to avoid the early __mdiobus_read()
> > failure, too.
> >
> >> I couldn't find MII ready time after reset de-assert information form =
the
> >> PHY datasheet. except the following line [1].
> >> "For the first 16us after coming out of reset, the MII/RMII interface =
will run at 2.5 MHz. After this time, it will
> >> switch to 25 MHz if auto-negotiation is enabled"
> >>
> >> [1] 3.8.5 RESETS
> >> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Product=
Documents/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
> >
> > 3.8.5.1 Hardware Reset
> > "A Hardware reset is asserted by driving the nRST input pin low. When
> >  driven, nRST should be held low for the minimum time detailed in
> >  Section 5.6.3, "Power-On nRST & Configuration Strap Timing," on page
> >  60 to ensure a proper transceiver reset."
> >
> > 5.6.3 POWER-ON NRST & CONFIGURATION STRAP TIMING
> > "For proper operation, nRST must be asserted for no less than trstia."
> >
> > TABLE 5-8: POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES
> > "trstia nRST input assertion time min. 100 =C2=B5S"
> >
> > On Rev. C3, ETH_RESETn is controlled by an open-drain AND gate.
> > It is pulled high by a 10K resistor, and has a 4.7=C2=B5F capacitor to
> > ground.  That gives an RC constant of 47ms.  As you need 0.7RC to charg=
e
> > the capacitor above the threshold voltage of a CMOS input (VDD/2),
> > reset-deassert-us should be at least 33ms. Considering the typical
> > tolerance of 20% on capacitors, 40ms would be safer. Or perhaps
> > even 50ms?
>
> Super! Yes, I agree 50ms would be a good setting.

> > If you agree, I can send a patch.
> > Thanks!
>
> Much appreciated, thanks!

https://lore.kernel.org/9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936=
.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

