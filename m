Return-Path: <linux-omap+bounces-4253-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6254B2974E
	for <lists+linux-omap@lfdr.de>; Mon, 18 Aug 2025 05:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59F121962DC0
	for <lists+linux-omap@lfdr.de>; Mon, 18 Aug 2025 03:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04EF25DB06;
	Mon, 18 Aug 2025 03:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/+RMqYz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359F01DED5B;
	Mon, 18 Aug 2025 03:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487447; cv=none; b=B19aip3HBEXc3IlmJL/ogUwYMMjSTb7BZNvQbUKAqQJp6Z/TO/UFDmYH47keHVENsg++EMD0exVkbE6aY7f4YksFgHfuUrYfeS3cKkfdNNAD+xaT++fqneYCaoXfF3WisUhtPQoCfC78JU3hlAPQB5+0Dfu7inADPlzMCqn/SAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487447; c=relaxed/simple;
	bh=E3Ai5ILoOty4T6mn8M1nv9TWwzp1uU+IW9xmQnuVPGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gm8z1g4HMm/Wx4Xt0ALVjO0OUZ9CtDHV8pRlTRX8mF9Nnp69FBrwFmO0AgtEkxqHYFhmPKNLuNjhbO+2Xo6SZXe34HbnZSCJtmOFcbZXbp7/DhB8f1Zereyt60XQ51IT8Fyf8ndw9OFX2LtGbxgCawE3Afn2uxPcQkVi8jXto+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/+RMqYz; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-61bc52fd7a4so2445238eaf.0;
        Sun, 17 Aug 2025 20:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755487445; x=1756092245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vedbfzqgsPM47NnN6QUjbAFGotL9BGIJKOvEnWoDGsA=;
        b=W/+RMqYzzXC28ZGFFC6ODSEGEAgvgPNTzMuur0Tz24UryTpq6gSyZf8WIVWZ8l8m5N
         lvb1sJstmJndOKVKC0zIWATiBYb50UfYTB2Rl9XuxUxWD0aA6+2NVvjT2W3ACyB1FQQ+
         hr4d5OaAezuXSb21qlEKm8p64opeDMnoCygp7RfohV16YyQ2rw38a8i+JcCfggMrDw+b
         qAgWfQYoRwNPa0rlEK5wFLO/7A5o5qA5EZXfrai2FDs/jaxsrbjRJt9RMc9OxIOiKDkn
         jrGZHA79XCH7apMo5vvD0HwOo2RzM8q7/WPOgO2zgWdIB9o/1nWHJEay/C4YlmO+5UkW
         iIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755487445; x=1756092245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vedbfzqgsPM47NnN6QUjbAFGotL9BGIJKOvEnWoDGsA=;
        b=sWXhHjVIgKQ3tGXHWgr1XpivaPmRtdio/D6XKpLI/E0Hdum6QyenEYOAwMAn94Foht
         xyjjx1sBF7AyVvDGCCShpOqbO7dwgiHsNLyRZWQNOuISUdYMuAH0kuqmkBIZ6K8diIAx
         m5vm09XZQ8FABmriXO0oALSCV+jLFsiPj8Zv5s/wHHx+MzuJdqCb/9U++FsSQrEOCy5x
         lUvOEC9vH1rMRrWm6Yg4iHx2qvq29dD1pzsQwkwVTmFQvFIuJgf6O834WQ8yXACv3JQD
         LAQQ+rqVzUPEcY8NMToaNYgD79j8pYiQfPIDnUS17R6wPrncrDGqA2ndgWsVM1J/sspL
         7jag==
X-Forwarded-Encrypted: i=1; AJvYcCUxjeaQJ9Wbm+4zjlexJiP4kg3wKH1nHDV815C1CC404fXgmko6p8PBzUmG/EPg6A+84SjMhNjq2FuDNA==@vger.kernel.org, AJvYcCVMEwjgtaB9fS0znbMPLRQPaTISWWF3N6t3BlZ46RwPesrLGC6ePbVWhVJ4B3APMtIa5PCMNaxfzgcrIk2G@vger.kernel.org, AJvYcCXVTagmwGfl0Y1ilhslmFZnvuUMva9XpH/Oz6Y4viY1rcGvpjplpgVKVMKmka63uj4ZqFUhOpM0YiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyunbJIzipYBgRYXUyH+teEKcojWS+1s51YhNV5r8/AFpMHcyhX
	6w6lxBYuVS4r+eARcfdDLO8sDQvCzG7AoJhjFk4RrS8alLBNi7urw2J99aMMvbYLeqJDHyClwmQ
	kRelXSF38bKmmFz20TVc/6jtvBYwIrlA=
X-Gm-Gg: ASbGnctREP0d4zzO9uWjc5uolw0agClII9xDNLDJzt0pmKZTYOc8LP/c6LrSzMOjUEZ
	nzjwYOvbSsHdERMtaqkfIx1sXVbkuIsWJhN9IQr5MuP7jJRa03wTBug2B/ADOpABblIeZd5aNTt
	oNRMeBH69Yfnlj0KBl7fio9ebK3Jx5HI/Syp3jiNyhuSNpP8OObyGg9U0VGJOf2ZZmIb6zHotw6
	bjmLp4=
X-Google-Smtp-Source: AGHT+IFvclVpNwppcNM4TcZis4w/8oOAUaFynR0TA/ounR92wk6/y69lJ8OOFoMZsoZNGfepkK4wWaciPDqrJ8qiXKc=
X-Received: by 2002:a05:6808:2292:b0:404:dbf3:5b0d with SMTP id
 5614622812f47-435ebb2bc31mr6588195b6e.3.1755487445130; Sun, 17 Aug 2025
 20:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804120403.97959-1-linmq006@gmail.com> <20250811165358.79b3128c@akair>
In-Reply-To: <20250811165358.79b3128c@akair>
From: =?UTF-8?B?5p6X5aaZ5YCp?= <linmq006@gmail.com>
Date: Mon, 18 Aug 2025 11:23:53 +0800
X-Gm-Features: Ac12FXxBVf4kAq2vL3tEVAKCowa_AgAAwqlSI3I-2nW7WhasmRikVK9pocu3jTA
Message-ID: <CAH-r-ZG_m++B8u6qhV-pbG5s+YUVWUrKj4far+rOF6xDuHOcgw@mail.gmail.com>
Subject: Re: [PATCH] bus: ti-sysc: Fix potential double free in sysc_add_named_clock_from_child()
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andreas

Thanks for your reply.

Andreas Kemnade <andreas@kemnade.info> =E4=BA=8E2025=E5=B9=B48=E6=9C=8811=
=E6=97=A5=E5=91=A8=E4=B8=80 22:56=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> Am Mon,  4 Aug 2025 20:04:03 +0800
> schrieb Miaoqian Lin <linmq006@gmail.com>:
>
> > The devm_get_clk_from_child() function uses device-managed resources
> > that are automatically cleaned up. The clk_put() call after
> > devm_get_clk_from_child() is redundant and
> > may lead to double-free issues.
> >
> > Fixes: a54275f4ab20 ("bus: ti-sysc: Add quirk handling for external opt=
ional functional clock")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> >  drivers/bus/ti-sysc.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> > index 9f624e5da991..5441b0739faa 100644
> > --- a/drivers/bus/ti-sysc.c
> > +++ b/drivers/bus/ti-sysc.c
> > @@ -362,7 +362,6 @@ static int sysc_add_named_clock_from_child(struct s=
ysc *ddata,
> >       cl->clk =3D clock;
> >       clkdev_add(cl);
> >
> > -     clk_put(clock);
> >
> >       return 0;
> >  }
> I understand the double-free issue, but I have some questions to make
> sure I understand it correctly what we are doing here. So lets ask the
> possibly stupid questions and check assumptions:
>
> - clk_hw hardware still lives after clk_put(), so we do not have
>   problems normally here after that put when we do not remove the
>   device?
>

Yes, the main problem caused here is reference counting imbalance.
After the manual clk_put(clock), the devm framework calls clk_put()
again during device removal, causing issues.

> - With your patch the put is delayed, so things live longer. So why
> we do not use devm_clk_put() or avoid using devres at all here?
>

Since cl->clk =3D clock; passes the clock pointer to the lookup table,
I'm not sure if calling devm_clk_put() early here is appropriate.
So I just remove the clk_put(clock) and let the devm framework handle this.

If you think there's a better way, I can submit an updated patch.

> Regards,
> Andreas

