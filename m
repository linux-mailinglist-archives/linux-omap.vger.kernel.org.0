Return-Path: <linux-omap+bounces-4648-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E473FBAE233
	for <lists+linux-omap@lfdr.de>; Tue, 30 Sep 2025 19:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B9C67AC26A
	for <lists+linux-omap@lfdr.de>; Tue, 30 Sep 2025 17:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B9D3081B2;
	Tue, 30 Sep 2025 17:08:02 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6DAFBF6
	for <linux-omap@vger.kernel.org>; Tue, 30 Sep 2025 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759252082; cv=none; b=p3vL65u61+14puZUUOjENofxdz1Jjm4TwEtkGt33D4RWxTnrLMd/lasNq0Gnl0KiYtJ8n+ZRj0FJjMJL7+wt3u4JvxG4qMBDCCtMREn0/ApbG+2zY7GcRFRjhi+9jLfjD6EHkjjbyFfOuhxkwtQYn6uJ5Kq00QhzKU2yJpWt92o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759252082; c=relaxed/simple;
	bh=mtP+NQ+ubBB2KD6NiDsu/L2uuOD0QdKYw0OQB1pbNmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzMOQVePCQzNnBV9CjM16JUuvA7Khc9reE6R+2V3akcjlksZMZVvdRL16P+pZodubBrr4deqG8hRydwDepk6dh3tuhW9gL6SOtm0oee43I17ET5gdrp9G0hL/IvJkmpKhyWWRD6dGmQJuJoBISCNVAJESaAR1pEmuCKlCpxrmYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-51d14932f27so3156034137.2
        for <linux-omap@vger.kernel.org>; Tue, 30 Sep 2025 10:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759252079; x=1759856879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UldwRtCYqtIMyzHUgGGSi2dCQvDGYWicTSQaZYgBsI=;
        b=jMJMuDfaI/BfihwMjJ2XZKoq3NtuJ5wIE7XMj8JuoCWp+QiN3SSP0aoxN2RqiN0LUF
         FlwdIvHQISJwxBwL+yrj4KnZOkyRBHymOrMPNu0LPNuQU0uZ8Wl3c3ZpzQQRfleMBkFW
         gzPcB2cHSrXnWCeIz3I8GifH2cRrGv48aUNGpMdkXGfoCPbNcIIyAD71xLjuuYFcrYyx
         /dkUlzcsHwjMIkp9zVHHONx0RlxvBQrr+0q+zXsilhNKlhuMuqvcJfBD2F1IRJmWq4zI
         RebM1Mq+f2t7rBnWH23bF20dmPgVxYuKcpS+7DQm0X3PBdcBjxQGCkQNnZcSEGhULTVR
         Kacg==
X-Gm-Message-State: AOJu0YzNtqiNgXMiWQvhoCu8JUeiMY1X5TqRe9vy7UjqzMVtFHCRazQK
	rU0HJeSvCecLR3X0XKhpBcVH8Ug2T+UKDcgPt3sYNMkGsvyo0dcXi/l1onwMmD9f
X-Gm-Gg: ASbGncsOH6rREGiii4b+Pagvd9HP1dX7846lSRlqPcAZx1Ob8gbOI4rHsHJwry3yu2h
	4EZKmw/N/1k8ArE8mSC8LZx9Lio5C099j9vTBntIIo61vDm7np6ZlFrBTFpH8JayxA9u/ilkcJ1
	IDTDl3ldkwt3T2cwLMBI9JdSMrEaJoUN8lUKGN6A5LN/9u9/c69LdbaUyNgCoYQcMxR/yoj4AAf
	Kt+/CfMZU4toyBM+NOypsuCi5XRgWKAAm45jHnaEgHPW4xqcJkBCsW1M18wehtOf/R6KXy7qqdO
	WfHrBc3rj8MS6ZZX3FYx4ISK2LGntqnchEkR2dALMpw4yk2ArBdwejBcbCygkGJus5LjpDnjcmJ
	TdubjRDQYeOP0bF7YTewcYNZ2GgJfve7uOVymrmv9QU/7+nC2F7L4r17XDrTSrvhzJ861Tx3tPH
	d2LKVkNBKgdlGVRLJaODA=
X-Google-Smtp-Source: AGHT+IGGDjouaZXOA5LqaY2CyeoFQn/TVCVdMmh6feXN3NQbUzPJijsYc5rY7BtXHxj7/DtPMBtraQ==
X-Received: by 2002:a05:6102:cc8:b0:522:86ea:42c with SMTP id ada2fe7eead31-5d3fe4f8ea3mr219693137.11.1759252078619;
        Tue, 30 Sep 2025 10:07:58 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5cc4abefcc9sm1513375137.3.2025.09.30.10.07.58
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 10:07:58 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5c72dce3201so1130509137.3
        for <linux-omap@vger.kernel.org>; Tue, 30 Sep 2025 10:07:58 -0700 (PDT)
X-Received: by 2002:a05:6102:161e:b0:5b9:ee05:dfff with SMTP id
 ada2fe7eead31-5d3fe6af95dmr165339137.23.1759252077947; Tue, 30 Sep 2025
 10:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721173741.6369-1-bruno.thomsen@gmail.com>
In-Reply-To: <20250721173741.6369-1-bruno.thomsen@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 19:07:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUb7Jb2=GqK3=Rn+Gv5G9KogcQieqDvjDCkJA4zyX4VcA@mail.gmail.com>
X-Gm-Features: AS18NWDVvdSwN0uw_XPlk-OYICeK8kZm9oSwW7ZF3dGIkCYLyqPBpxL42XEEWf8
Message-ID: <CAMuHMdUb7Jb2=GqK3=Rn+Gv5G9KogcQieqDvjDCkJA4zyX4VcA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am33xx-l4: fix UART compatible
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Judith Mendez <jm@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bruno,

On Mon, 21 Jul 2025 at 19:38, Bruno Thomsen <bruno.thomsen@gmail.com> wrote:
> Fixes the following dtschema check warning:
>
> serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['ti,am3352-uart', 'ti,omap3-uart'] is too long
>         'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>         'ti,am654-uart' was expected
>         from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Thanks for your patch, which is now commit ca8be8fc2c306efb ("ARM:
dts: am33xx-l4: fix UART compatible") in soc/for-next.

This commit broke the serial console on BeagleBone Black.
Upon closer look, my .config had CONFIG_SERIAL_OMAP (for
"ti,omap3-uart") enabled instead of CONFIG_SERIAL_8250_OMAP (for
"ti,am3352-uart").  However, replacing CONFIG_SERIAL_OMAP by
CONFIG_SERIAL_8250_OMAP does not help: the serial driver now probes,
but I still get no output nor a login prompt.

The same issue is present when using omap2plus_defconfig, which has
both serial options enabled.

> --- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> @@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
>                         ranges = <0x0 0x9000 0x1000>;
>
>                         uart0: serial@0 {
> -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> +                               compatible = "ti,am3352-uart";
>                                 clock-frequency = <48000000>;
>                                 reg = <0x0 0x1000>;
>                                 interrupts = <72>;
> @@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
>                         ranges = <0x0 0x22000 0x1000>;
>
>                         uart1: serial@0 {
> -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> +                               compatible = "ti,am3352-uart";
>                                 clock-frequency = <48000000>;
>                                 reg = <0x0 0x1000>;
>                                 interrupts = <73>;
> @@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
>                         ranges = <0x0 0x24000 0x1000>;
>
>                         uart2: serial@0 {
> -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> +                               compatible = "ti,am3352-uart";
>                                 clock-frequency = <48000000>;
>                                 reg = <0x0 0x1000>;
>                                 interrupts = <74>;
> @@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
>                         ranges = <0x0 0xa6000 0x1000>;
>
>                         uart3: serial@0 {
> -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> +                               compatible = "ti,am3352-uart";
>                                 clock-frequency = <48000000>;
>                                 reg = <0x0 0x1000>;
>                                 interrupts = <44>;
> @@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
>                         ranges = <0x0 0xa8000 0x1000>;
>
>                         uart4: serial@0 {
> -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> +                               compatible = "ti,am3352-uart";
>                                 clock-frequency = <48000000>;
>                                 reg = <0x0 0x1000>;
>                                 interrupts = <45>;
> @@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
>                         ranges = <0x0 0xaa000 0x1000>;
>
>                         uart5: serial@0 {
> -                               compatible = "ti,am3352-uart", "ti,omap3-uart";
> +                               compatible = "ti,am3352-uart";
>                                 clock-frequency = <48000000>;
>                                 reg = <0x0 0x1000>;
>                                 interrupts = <46>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

