Return-Path: <linux-omap+bounces-4957-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6400C6F43C
	for <lists+linux-omap@lfdr.de>; Wed, 19 Nov 2025 15:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97BBF4F7A4A
	for <lists+linux-omap@lfdr.de>; Wed, 19 Nov 2025 13:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2953612C0;
	Wed, 19 Nov 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhdH4gPH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA034844F
	for <linux-omap@vger.kernel.org>; Wed, 19 Nov 2025 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560765; cv=none; b=lXiUSxLHralZyuvUnRjXCveoWUmmSmV6ZQbo7aOitsAs+XlJOYfXu9vMtAivTb4kBLOExJChQfIHQG4LFi442es+13NvmMQ/RVYOHF7mazk1IilZRUIwXYVPdjKcWmybB9GPErfKUg3ybN9EJAUKpkCoYeIbDQyShzsJxkiVlw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560765; c=relaxed/simple;
	bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpzD93N3mWRsifcyMUPWcr+6YpjeiVWQyvm741izcTiiV4A268IzRADIJJPz5AA7noDEmM/3o6A8vhIQx1y5SNGITtcX80771zRZbu53Nae/RdiAieNIZXX6ZC112ACoN4OnydZ/itiUhmA/cQlaPYKU3antmkjW5iTq5mZdAOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhdH4gPH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso1374221a12.0
        for <linux-omap@vger.kernel.org>; Wed, 19 Nov 2025 05:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763560762; x=1764165562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=;
        b=PhdH4gPH0+6EzH6occOmGLbJy09FqCoD4YcjmumwxyunZSd0m7UH2f1bVcbKS4JDXR
         qwYh/SyyXCHS/GZXAXJVxdXi3GM5YUjjgmHXXm73N2tQgnsyWDlrF066XiYMb8b+Vgr6
         L7p95ee+4nLiaqjnUorCPcpyMJR9akOv8Ilny7QYdNIPFEorj/XeEoM/MzNrgN9SugEb
         isILYvpV/Ix8fN95FvKHdNXGOfYYxUkkab3oGb3fYLy2HmtfteirWgSXQKrYj93bBUbf
         JrKrN5GmRbyG6mj2CDRvzUFbbdtk7L8l5ZaBO1sGcQ8S5Qa63qWJDfNzn6uZAM3HM7+X
         YXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560762; x=1764165562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=;
        b=c7LrPjJPO92glAubrZfuDDJFCWzqVzAz6kpr/O3a6FWF1Hg3ummoQpokq+u/CimMD2
         1gIKtPJA0yIRlxQ9RElwgd8DV2Cx0sdDs0JW7W1KD1Lk10ldiztYo7tuTX/rvHq4+lyX
         VBFO7QY6pCK7EFTe6FT0AsuElGxMlW5bKR0PRo7zDQ+6hZixej6pDTV/B9F3RH6M5XjL
         Cit9iGMZYyhpUYk/xpVL18MMS2vKP3icBPEZ0eT2EuMukXoobpo0I89xUIKf11dj+n4H
         VolOXi53onv93PAXsvAE8drAm+Iwlpo0tmgyAPLz/P1lGFTn7208zBQNEJDhlcCXJam9
         8qGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR3Z5Eo8ukAltHSDbaa3QbJBt8j4j0f0QW5hGj8bTX6BOo8EYrZERvkBe/4NVmvOX/Vg7bTQC+tU0k@vger.kernel.org
X-Gm-Message-State: AOJu0YzzmECN4HLZnsIa2xhRcUVPO37+w56WhZRMkYVuRoo7Ag0jVLR8
	AmZ1lgT6yEAqIkypZcJuyf44CYXF3WVjzLIeanu581LCu/xFex/PhXjz5eNpuyjIxjXwVkqbjeo
	8wMrLOtxX8jdmoWCDwBoXaYl6ofWA5M8=
X-Gm-Gg: ASbGnctxmpvh2Z/qN1JsMgpsrCQkCYHK/Ul+asCuBfZlXavmnN0ySQWRMaCfVL6E+gN
	M0ZaQyxlkquvsNDvE9wSdJ66SP84q28/UGlr1txC8OSN66v3JAgSdc8rTW78llz9egGpDGYb1Fk
	vwI+YMP/VjlL3NQkxwmzIxQ2aOPxYM8jIyH9S4ZVW2KvHbz30mpHxTJARsXwwkmGZCU8PCsQmlT
	R3gBf/hZzMV1f3VN2UNVLeWhBqrPS2PkVODooC1JlXnzvumvepXxsVZI+iZwMgv7naTK2yOQt+Z
	nSI15lmLA33RqivFjm/LAeI4d4ql2MGQdDAIA4siN2hulGiit2cDcZzlxNxOewNu+oVj6gY=
X-Google-Smtp-Source: AGHT+IG8ULbZ2gakwAe+AEo25vXjOIbyjJHqtq9Z7iOt7eHBk90Bam96Us9dXGPQT1lyjruKv6oC+ZwWggEZWRjTk/E=
X-Received: by 2002:a17:906:7952:b0:b72:d577:11cc with SMTP id
 a640c23a62f3a-b7638d97082mr264614266b.12.1763560761898; Wed, 19 Nov 2025
 05:59:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr> <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>
 <aR28aq0xHQOOISYq@xhacker>
In-Reply-To: <aR28aq0xHQOOISYq@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 15:58:44 +0200
X-Gm-Features: AWmQ_bmVZ5aFiHmgx4Eep-EcRGLL1HO2Ewhh8OL2t0SuZRjUtbzyv0Nheh72k40
Message-ID: <CAHp75VfA-N70QY4o=GbB0s0+L_o=+YKgCwdLUK56ggc-tKO+-g@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 3:05=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 09:56:12AM +0200, Andy Shevchenko wrote:

...

> I have explained the reason of embedding within the cleanup/modernize
> patch. Could you plz check?

I already proposed a compromise. I like the new PM macros and less
ifdeffery in the code, but let's decouple that one from the
refactoring of the data types. You may send them separately with the
cover letter describing the reasoning.

--=20
With Best Regards,
Andy Shevchenko

