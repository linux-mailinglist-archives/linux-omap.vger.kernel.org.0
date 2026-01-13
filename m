Return-Path: <linux-omap+bounces-5440-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1567D175A5
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jan 2026 09:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77C88300ACC3
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jan 2026 08:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD26F3803FC;
	Tue, 13 Jan 2026 08:43:42 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF43803C5
	for <linux-omap@vger.kernel.org>; Tue, 13 Jan 2026 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293822; cv=none; b=IjIdfzLSI/B+iJH0j94GGVFPiniB66PmsCZ7VGrpAY5iK1RptQ4PdRHQXvhzYjnDzDLlp9U+K61OgovzJduQBucKnJgkwOriqgtMc28sjD4abk1VfhIuGegHd1VuXbCZweokhl0cWJCyNCngdXOrw+LgqOYjEo5xg1PpCA3HIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293822; c=relaxed/simple;
	bh=Kw29Mu6HT2HxD5ti7IZmn4LO6W3EDHSFizK6jJGxelw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2+JJIJaPQdRK4DJ/l7axtHRnE/xtcyFyoPzQ0U4wu9hztFEFjMBAuYGNJVenOtkD/bs+qEtZzBABccCkbcl7a0PtL1pSnMsySIu9xZ0+PJ2HwrwGwHxq11coHLWqYOMbgZLuw3q6zCb1wyMLmh6TDCe1MlCItxuzHySjSdZC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-56352466d86so2246570e0c.0
        for <linux-omap@vger.kernel.org>; Tue, 13 Jan 2026 00:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768293820; x=1768898620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1oQ15jpRcmphl58tx08AUKGIdjS+7SOa3S3k4/U/kw=;
        b=g/Iun0IU+hqH2aIsa6pJJM4m1hUxRDpsMUDhX75wBg/eogyzDxzRTH59Qsv3aybfsU
         InEtUkw1pQDag4JBW5TVEXkLgiW6FekXx1s8zS4e2/xnvIL9WKb4ihzP5skQ6ApFBUVC
         zIM3sVwdzVhN3v/17XDh47dLW8npUhnc9m9FPdN6q1/V8tlugepCX/VCI2t/jCm1yKgJ
         LGyrDk88zeD8eRv+jzuM0RVYnboGI2d06/UyaaawUQc5FDYP+GXzw1UFCjUrP+yZ2GDS
         zfZgo7btL0dC6+pg0oJMC1SX4JZdHbp3e2I/N3XrjFKDafhera2d7K9sk78JPrnvWGLl
         +ang==
X-Forwarded-Encrypted: i=1; AJvYcCUTqF5WwZ0Ia4i2k2juUbbIhdhu78AqpLVTsEMhTVKGZQAmtZoU0QvNRUHpLvUVyGoq2Qc3qyckqytz@vger.kernel.org
X-Gm-Message-State: AOJu0YxGZKhEXESiuJtU5PcLtHuUIxuNZbiPf/ZKdh0oYW1SQvnbZaPx
	gmFju7XqYKnAumNQlWaL5yJtRKC0SA3sDNstdjDHaJhgYkN2/uX27w50geu/3Siw
X-Gm-Gg: AY/fxX4Fq//wgzCu9FKAfDmFwqimftFvtA+dZNMNHt7XcMroSGmg8x7KCKbP1JpzOKW
	oVQXcwc2J9nePDGjUDXsR55GWcq5O//gO+A3lBxAJaMsSKpEbuvbMld0EqvJ/mjn2McxgPGCTqW
	9jeiuLd9nEVm5g+mtfW1F0M/l5pzTfXq9cxUyCGuNavgTiOVo+uYP1Yxbp8vE9WOP0WocgjIdTv
	1M2AFi00CWoCdq2iEsqMhv0RGftEkoFAgMc8HJ+W3+9aru24haPe5fINcyce9yTCo4g5Fzu3cQ+
	v5vjyGim0MJVZaeYxFOmAaIm7uCAlvt+BQQZ980DyoHkmytSzY7zpyDlt9iZ0wuuWT1FFwUG/W/
	s6r+Nz5NMHQnHeF4pEcemlywYUKUJi4B9+L4wcL1mehfn5HzqxfG5gsEuzJEhDJDN/x+SIbUpQo
	bqv7XEzSp9UKE6JNf9M83WCZvuyKR2dF5a+c0cfVlxAT9d2Oam
X-Google-Smtp-Source: AGHT+IFS22b2QBWq3RTvCLzUvwJADnr41UxCF8172i6mNNTcXkSyUTCKifw1ZtazNhhXfzkdiku/IQ==
X-Received: by 2002:a05:6122:320d:b0:563:6e1c:12b with SMTP id 71dfb90a1353d-5636e1c021emr4209556e0c.21.1768293820309;
        Tue, 13 Jan 2026 00:43:40 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636dc36a20sm10532935e0c.13.2026.01.13.00.43.38
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:43:39 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f63d46f34so2242174241.2
        for <linux-omap@vger.kernel.org>; Tue, 13 Jan 2026 00:43:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2EA2sRQ+iXLkISTTICvx1gTU7HJa1lbTxJlzUp/X62Oj9ksgKWOBhvhhLzjGS54/cVXxxiqDPHAn/@vger.kernel.org
X-Received: by 2002:a05:6102:290d:b0:5ef:b3fa:c89a with SMTP id
 ada2fe7eead31-5efb3facb2bmr3596566137.32.1768293818629; Tue, 13 Jan 2026
 00:43:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
 <20260112174945.GC26365@pendragon.ideasonboard.com>
In-Reply-To: <20260112174945.GC26365@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 09:43:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVH9v_Yn4+UA8TAyPu3st55yWFEPFmA6-ZeGkkxs44O+g@mail.gmail.com>
X-Gm-Features: AZwV_QgQdMvlnOnaTNIaFzNr0xfqYvjdFzLdwf3uc17UQjijTlMqSdyHwcT5Hzk
Message-ID: <CAMuHMdVH9v_Yn4+UA8TAyPu3st55yWFEPFmA6-ZeGkkxs44O+g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: nxp,tda998x: Add missing clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 12 Jan 2026 at 18:50, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 12, 2026 at 05:02:40PM +0100, Geert Uytterhoeven wrote:
> > Some TDA998x variants (e.g. TDA19988) have an OSC_IN pin, to connect
> > an external oscillator circuit or clock source.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This fixes "make dtbs_check":
> >
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >
> > This patch can be considered v3 of "[PATCH v2 2/3] [RFC] arm64: dts:
> > renesas: cat874: Drop bogus clocks property"[1], as the pin is actually
> > connected to a clock source on that board.  On BeagleBone Black, it is
> > also connected to a clock source, but not described in DT.
> >
> > The linux driver does not use this clock directly, but I suspect[2] the
> > use of this pin is controlled through the AP_ENA register value, as
> > specified in the second cell of the the audio-ports property.
> >
> > [1] https://lore.kernel.org/97b949cddd7e30e9c05873800330dccd3483b12b.1663165552.git.geert+renesas@glider.be
> > [2] I do not have access to the programming manual.
> > ---
> >  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml        | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > index 3fce9e698ea1d2dd..1205c8e9de329bbc 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > @@ -19,6 +19,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  clocks:
> > +    maxItems: 1
> > +
>
> I wonder if we should add a compatible string for the variants with a
> clock pin, to let drivers manage the clock.

I am not sure if that is necessary, as the clock is optional, and thus
devm_clk_get_optional() can just be added to the driver.

> If the clock does not need to be controlled, an alternative would be to

I think the driver should control the clock. Currently it works by
accident, as on (at least) cat874 and boneblack the external clock is
a fixed clock that is always running.

A simple solution would be to use e.g. devm_clk_get_optional_enabled().
A more complex solution would probably involve using the AP_ENA
register value.  Anyone who has the programming manual for tda998x?

> drop the clocks property from
> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts.

Cfr. my RFC v2 linked above[1] ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

