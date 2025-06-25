Return-Path: <linux-omap+bounces-3975-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09706AE7F42
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 12:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A6B57AB607
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 10:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FBC29E0EB;
	Wed, 25 Jun 2025 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I3NaFcSK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE926E6EF
	for <linux-omap@vger.kernel.org>; Wed, 25 Jun 2025 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847352; cv=none; b=VoHWq7oumttPj4cZdgdXIIFk/vfmU2wOxg4GrOXhFCRklJfxu9saGxuXMxOBSrvgyVBJgUdv9gGm5LPtMhKIne5j3ueCjoKtGTLgntbeYu2eURajP/ntylnI7snFVtcP6Y2IaQxt5FTq//PmobDBymoFHu3my8odGRTLf8wfS3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847352; c=relaxed/simple;
	bh=u1FZ9sKjGBQmPcnWwNmy+m7HReciKhzXM/5uOouRfEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cozm5EGywnuAE9zVuH6yERNRWEG0zjHgiYejQGVcsZlhlfEBYfp5d/Z7Swgvd+2HGRp6Sl5oPgyXbY3If/emsjrJ2b9yFKJGPlOHLKJQ+cfEAGAE1GiVPKBzSd4StdUmtHEAdLhUeZvySgSDyQj79JtRQoLWPdrqFN96xU97JGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I3NaFcSK; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54d98aa5981so8570873e87.0
        for <linux-omap@vger.kernel.org>; Wed, 25 Jun 2025 03:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847349; x=1751452149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1FZ9sKjGBQmPcnWwNmy+m7HReciKhzXM/5uOouRfEU=;
        b=I3NaFcSKs3ENXH7B6k93+HJ7IyG0OeA4wkTNm+efTbpCqxJyfA6M6cykV5lT1leRYG
         C7q4sMJG/2BwcvRYC8+zj/vAFOKdblP5AS+W5M3g3eAFvdvdG8zPdB2E0iSRDAiIFHmH
         +tGSyTZ7k5cSZBx3QTuxAdplKrK5w+S4tofjumZFRA53N6NQnvpl444ErPN2otIX0hPX
         P4y+N0nTiSB2qNEJZFWyzzJdTrF+fctF0HoLMwL5Ff+hg6N4N5jYR74xND58I0LTNoxl
         arj5iE+jwkOjRw/au5vrVb08MZcww7jnDNNgDVOTjTGYghs/rjIUEOCW/uO75et28N5U
         j/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847349; x=1751452149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1FZ9sKjGBQmPcnWwNmy+m7HReciKhzXM/5uOouRfEU=;
        b=nSbEDnk8j9P320EbYQF0w0xQU5pB4Qj/7166eEAEoEseD0cIxCwvpxOmHmYmKFW/Fu
         V2mt3Zajo/XFaB1Rl8QwzmYaVlGWjr0an9pXddvzcp29Husy+Gi+BNK5XOeGb+ma5Z3m
         r5Fyxl+tmmqFFaHPD3oSiFbXkJinDykOpOXnKtlEAmCKAjohuOgJe9H9jAJbuhle/g79
         BX77nJRDh66tUY/2f0glU/U2l1fHQThMnJApo30M5e0ip4OOYs1NgDamPaRJNlkJK6SQ
         pUY14f08Vc9CyGidSPSyGUeEfFvTVhN5mOEmF+/k64ax3QzXyaAoqmT01Zbxs0xmXgPp
         ZcQw==
X-Forwarded-Encrypted: i=1; AJvYcCVcBhp37b4UNCF4XuWyK11MpyoW3+sRm/HaJymYDJzHElk/Qv5nQof3w8d1Bds4Cgw3HrwjcSoas+/W@vger.kernel.org
X-Gm-Message-State: AOJu0YxisrepUOjdoyQBnjpJdx0D6WLEP6pCj5xkBdHDGEjtfVOTS6F1
	tKKnxkMc53523pdhlaUPKQPM7K34uMixSn64l/71NEBj35NztvKz1VqHJTU/RNQIkf1Ds3aLP03
	+YX3UYWvUqMhZWnExoY4mNVN00d2YGF/DtI8QhSO3PPf9Vu22gJUGGuuOGg==
X-Gm-Gg: ASbGncuZAdTDm6Z7ED7IysTyk1Ejy/cXofM6g24FZhn654cQei9bq5CXENJpKJIgdsG
	vwtmRwaccOMzievv9dbYuA24xYNXmE8hzjTvxNSjh9Q87qaIIk7IudfW5RhUAu0ed4aRJ3PO4Na
	EVilBnarW6UMTgR9kIBTWCLBuEktcpjKvD1dvGDLYTScfe1Aap8Oxp4FcrKfggdYi0GReaPql9K
	tA=
X-Google-Smtp-Source: AGHT+IEkX13bQ28turRcuObCkfo4NVlXNRfNs11ryLaB3cUvZvJYNYOL/9JsCJbedp2nhQty0KHggcVYo7rajlWmaTg=
X-Received: by 2002:a05:6512:1153:b0:553:2ef3:f731 with SMTP id
 2adb3069b0e04-554fdd1b6a9mr686994e87.29.1750847349350; Wed, 25 Jun 2025
 03:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org> <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
 <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com>
 <6c64751d-67f6-4c30-a312-af289d9f432e@kernel.org> <CAMRc=MdEZkjoDR83JFg5OPP07_DkAfeZixN9C+uxhkqkxaKypg@mail.gmail.com>
 <b9c6f5bf-ac43-497a-9354-6448cfb2839c@kernel.org>
In-Reply-To: <b9c6f5bf-ac43-497a-9354-6448cfb2839c@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:28:58 +0200
X-Gm-Features: AX0GCFu-paz-Z_NsdxNyvXdu5K3BHS4b3n8YPIt0hLxqGr7Teq3_mQG0oOp06mE
Message-ID: <CAMRc=MdEWmgj8hTY3fQrXnDDv6pmK9XPvT9gE=5oGEs8R7GOVA@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:26=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> >>>> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base=
"
> >>>> property all of a sudden just because it now exists as a device
> >>>> property though... I kind of wish we had a way to opt out of exposin=
g
> >>>> this to all the sub-property paths. But it seems tiresome, so:
> >>>>
> >>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>
> >>>> Yours,
> >>>> Linus Walleij
> >>>
> >>> That's not a problem - this property is not in any DT bindings and as
> >>> such is not an allowed property in DT sources. For out-of-tree DTs? W=
e
> >>> don't care about those.
> >> That's not true, we do care about implied ABI. Try changing/breaking
> >> this later, when users complain their out of tree DTS is affected, and
> >> explaining this all to Greg.
> >>
> >
> > Wait, seriously? I thought that the upstream bindings are the source
> > of truth for device-tree sources...
>
>
> They are, until they are not... ok, we don't really care that much about
> out of tree DTS, but in-tree DTS still could use these and don't care
> about bindings check, right?
>

Could they though? I can imagine this happening by accident but in
general: you'd expect new sources to follow the bindings and be
verifiable against them? Otherwise, what's the point of the schema?

Bart

