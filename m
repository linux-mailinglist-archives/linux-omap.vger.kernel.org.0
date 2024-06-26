Return-Path: <linux-omap+bounces-1604-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C881B918DB0
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 19:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6C221C2329F
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 17:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283EA190467;
	Wed, 26 Jun 2024 17:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vpSmLHgW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D0418FC6C
	for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719424677; cv=none; b=VF014wonlv+/1PlPjLvPYm9JChi/TUDEvvXUfvR8egCtpvx+razZCDF9kHy1kIhwzB0/kkrfAu8gHpoGJfxqUwH9qk44J5Kk8MBcBq2UaQ9MfNSWYZL29/4gBHJgB0tENiY3sMNx75/5j6kENWyBcNvtBhomCDFY8HahpqFgztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719424677; c=relaxed/simple;
	bh=GRLet1qjrsvDiaV72VUTVaZ6eScvIFbXauwCQRj1Y68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJQ+R31c7VHfSLiEdYESLkOq65qSdpIrzYrJdUdt4o3crDcP8dbsO0b4wgRCYWjZwZ+R+8KzAisFubHejoavQ4LQNrorQa4bkSzZivuReUYcq/C97LLjqWVaaQTJivH+vCR0lNNotcqR1bmFQIkZnnEy5Ya5T+RKy2ZjahDGW8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vpSmLHgW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57d00a51b71so1453a12.0
        for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719424673; x=1720029473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSFQ2ozCArK1ziItdEkmdcayjgVf9KTRCGgo8jhFr/k=;
        b=vpSmLHgWGq9zrvndGzPlMa+CS8f33b7seVnYxMba8auxE1voZzUu8mq5Xr/yKulDkF
         ElZ1XkNZPOxQmUtBnK+iJe5qYggYCZQCiSPSkcs3tayAXrfzSrzKGV8bNr7ubGTToBaU
         KFXKcDhUQQc2hpkQZ0FkhVFkEtOvpNf2smJ8XfABfNkjTgkpqvUMYOoVRIu1tEaiLT1r
         2BmhMk7Kb0VcUtaQMzltGQnl3TR3KqATfxPqwg6PXCFpuQJJk76L+cY+lrK/bWoAYqbD
         0yLy48ZLGRY0tfgiuduPCOvpM7UMkWz14L77jlE2VvN8kPL3GLZng3nsFo1l5sTk7kB0
         PiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719424673; x=1720029473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSFQ2ozCArK1ziItdEkmdcayjgVf9KTRCGgo8jhFr/k=;
        b=sL19MsEReD1YPpm77vxKRdlatCEjtPIRadQ7uiSJuZpohzu7dfrQZS/J4cz64m0ZR5
         ovfuPuQEwyDap93woeUcuePk1uZoHD1g+oUXQdMhQOvJ1sjhvJ7F4TiNGOwqhN3PoVXg
         d/x1YFlsdapY2VPNAeuvOWtV5XxvUefOQt7o2apXQMgogWkYk+Y5SjIidxeBu+/DhkHk
         Z2nBPLaNjVBbuUG4jALRovUFHmfXVGJxDtFZgsNrC+Qj+le+bPtr+/5+26SY1xVL948H
         Si0G3+wNWniEnzbgSkbbFTvoYTMwfCmkOMaDo0ANFJ+WNC80TwX1JoE+GB8rLudYjEOh
         uaWw==
X-Forwarded-Encrypted: i=1; AJvYcCXsj8BoQsA5WYN5wF8lXA44jjAIGxpeTli5s1RAuwc/fYDtqFNLpNZR6Pi0xintuEYtyF7S3KFVdF5dikhXlQugZ2BLadgHlNDbWw==
X-Gm-Message-State: AOJu0YwWLrEWyGk6NX28aC0CFNYY/3+1D8QYgoeqxXXX4AB9KUMU4Lz0
	wJiuuIZKAJ3yyhlNi6A9zKAG3Gpx0lv3d7fbLJ5KQgMMjZZsQo1m1YoeAiHtIYwmj0tfv18rP/Z
	x2AdbWaA7rOmAgvH0yU3wr7JmIoxVYOsZadyv
X-Google-Smtp-Source: AGHT+IFWQnamYHefze2gwXZm3NQ8xOadIGfCiBlU7f/NM5b4HVS6E8Z/ZHPCaXaMHlsKP1NM4gKiCHmuRGzW40kqlMI=
X-Received: by 2002:a05:6402:26d4:b0:57c:b3c3:32bb with SMTP id
 4fb4d7f45d1cf-5848cd67ad5mr21382a12.1.1719424672957; Wed, 26 Jun 2024
 10:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com> <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>
In-Reply-To: <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 26 Jun 2024 19:57:16 +0200
Message-ID: <CAG48ez0KCkoTm=0sDQJveG7nujA=CQApXFy2chwjizt8L02B+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: omap-usb-tll: use struct_size to allocate tll
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Markus Elfring <Markus.Elfring@web.de>, 
	Ladislav Michl <ladis@linux-mips.org>, Roger Quadros <rogerq@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:23=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Use the struct_size macro to calculate the size of the tll, which
> includes a trailing flexible array.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> ---
> The memory allocation used to be carried out in two steps:
>
> tll =3D devm_kzalloc(dev, sizeof(struct usbtll_omap), GFP_KERNEL);
> tll->ch_clk =3D devm_kzalloc(dev, sizeof(struct clk *) * tll->nch,
>                            GFP_KERNEL);
>
> Until commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at on=
ce")
> turned that into the current allocation:
>
> tll =3D devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
>                    GFP_KERNEL);
>
> That has surprised me at first glance because I would have expected
> sizeof(tll->ch_clk[nch]) to return the size of a single pointer, not
> being equivalent to 'sizeof(struct clk *) * nch'.
>
> I might be missing/misunderstanding something here because the commit
> is not new, and the error should be noticeable. Moreover, I don't have
> real hardware to test it. Hence why I didn't mark this patch as a fix.
>
> I would be pleased to get feedback about this (why it is right as it is,
> or if that is actually a bug).

I might be a good idea to ask the people who wrote / accepted the
patch that seems to have introduced the bug? I've CC'ed them.

The kernel slab allocator enforces a minimum alignment of
KMALLOC_MIN_SIZE, which on MIPS seems to be based on the size of L1
cache lines or something like that? This allocator alignment might be
enough to prevent the bug from actually causing an observable effect
in many configurations - that could explain why it went undetected,
assuming that nobody tested this in a KASAN build.



> ---
>  drivers/mfd/omap-usb-tll.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> index a091e5b0f21d..5f25ac514ff2 100644
> --- a/drivers/mfd/omap-usb-tll.c
> +++ b/drivers/mfd/omap-usb-tll.c
> @@ -230,8 +230,7 @@ static int usbtll_omap_probe(struct platform_device *=
pdev)
>                 break;
>         }
>
> -       tll =3D devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch])=
,
> -                          GFP_KERNEL);
> +       tll =3D devm_kzalloc(dev, struct_size(tll, ch_clk, nch), GFP_KERN=
EL);
>         if (!tll) {
>                 pm_runtime_put_sync(dev);
>                 pm_runtime_disable(dev);
>
> --
> 2.40.1
>
>

