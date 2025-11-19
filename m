Return-Path: <linux-omap+bounces-4980-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EFC700F4
	for <lists+linux-omap@lfdr.de>; Wed, 19 Nov 2025 17:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52B2F36459A
	for <lists+linux-omap@lfdr.de>; Wed, 19 Nov 2025 16:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC5A2C3244;
	Wed, 19 Nov 2025 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5i8edWn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB48A1F463E
	for <linux-omap@vger.kernel.org>; Wed, 19 Nov 2025 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568756; cv=none; b=hqzBI6355GpzW5+eQzsl7XbgtNOMkO7d9oX6epAwbbmt6Ugp03Q4kftAounxsKMlN2z5pAQ2sO6NrPYEPnq9BEcAlPfJBeVqOGXciUiZSqVXfxGN33XzkXU7mcYbjvKM2wiDyu/UwT4G7LmirMyLEc8eW0rpj2mzX85xKodoqvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568756; c=relaxed/simple;
	bh=9Gr2VQ71su53ohKJqUPje0t7RDNtY+bRSBclS5p7Zgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rjk0hynzgxCzT76soTNSDUHQczEKEmTPodJHueYl0VxgP/gg0sJ5Lwxl6Wf1olrZ9++wX8XhJIuL1AUC0HihUDkF52dniKjFRyS9HUMAfwsJJ5INmdAkB4TmDb6HZZldgRt1mdojJmslUN0Xv6BPuoWmiM0V7OtFnj2cDl81FhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5i8edWn; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso12910157a12.2
        for <linux-omap@vger.kernel.org>; Wed, 19 Nov 2025 08:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763568750; x=1764173550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns4j4RIwbKPHEpeqvUPwTPGh7I+0wclJE3dPKxiT3aU=;
        b=F5i8edWnwtV7ObY8k/bavpj9AUFPJg8hjUAJSKXV1D7puh4Ae4MDEcIcY/SC+i/GMo
         ox2OuGe+Kbmd69y0/fBNoNlWmvarCEyToV8gzxFPghrKjI3q8kBq6ExvcfXYbK2BlFMT
         hFCCfKABpfQECfi0m9z8FRaDvZQQAnz8lRPxYN4521SXOJciCm8EZdCZk77kNmqiNxaM
         ujGrnKEDJHK+kIdP6zJFxy9Jpvv4xquYfTPYLe08tZNgxjiG9HRoJuwB5qixYqBYOqNc
         FfwjDwQ4AJtyz+fC8JH+pOU52UjT80OhgcTntRvvKV4jK5ISYG9q4VxIXaJI3s+hfJ7F
         lyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763568750; x=1764173550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ns4j4RIwbKPHEpeqvUPwTPGh7I+0wclJE3dPKxiT3aU=;
        b=QG9zHTyQYEiHvwKXGXSz1r4+WtZr5jDnB+2bBasXuUkGJGu5LQWJPRCOGX0xy3/smb
         +ffBMFM+86MeA9IRxSOpGYeNXyoa6iIjLwPbEKjYpjBo2GYjNDI6sKdfkSXpDMy1ofDK
         6e3eh/sONG4dG02jjMFQ3dGkgtpd/Nusoc6+DNpbZ6OHi/2GZKUkMevOhYD5vv4r27Ki
         tGcavERu70IHS/SfrjqPc8ln1gJkIqBV9jnaPjAkPkOUmgO3vggB1ayIXRWZeB5XGjff
         YIpEFH0YoP0nAI3I5il7MbT5PU36IG+JLTJbdvXSbD8u+rjxH8P7mW3W3UvF2dTXe+gJ
         EDbA==
X-Forwarded-Encrypted: i=1; AJvYcCX23X05/27E0wNkEuAswoBdCKPNf0m1l1Bi0QvoIuQvDbnRGOEAmOioM2CaaoDtOXcxzut9h1OBx4/d@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvzwGJM0GZ7iZXf0hfmLTjmLmQ0Pftin0oEqxuiRz+JPwOqNt
	c8NwbCyiqUnB7jYW0w11wRW9UeJ/CChG7f447X288rxlWctStSEqGIp6AcGDL0jeCR92JZUJiQu
	Ea/jpSoKSz/fJf1n6nfYK1IPedEq9u0s=
X-Gm-Gg: ASbGncuJX5l8NrYjJRpTj2ybu255mbHLXrvKMmNNMWy//gBEik99wEst+UAD7pjz6wq
	f4XMxwRjQdQyLYxI++BdOztT5sjbFzklW+1CB1nF6UlFT59T1cc/DGUOzF4/26v5Ycu1oIhXk49
	lRX8V+DmSjczoUciXXWn/50Zgdzuo21M87TFasmDS66YXwpoDvcN6YI6t4swd7Kds8iJ2UPxISD
	9j9wtKEscJ7CfmX576atrak314Ri/QISwmrt/LG4swjdSAwXfu0WqpxI2U1FBYbVfFuUALZqhy8
	Z7FcEX5oG1lbK8wWFvaujcoacnmxUJPBDRMOdwyPO/mVE85wwtzG9hN2JWBD2nMLAR2qgrLt7z1
	KENhoog==
X-Google-Smtp-Source: AGHT+IEXnOnIcDL+WQPyI15HzjNbUj9gMlbunsDk2m6BU1IUUvprig6gWCBeiXxf00hfMEvBu2U3Puz8te32xqRBXh4=
X-Received: by 2002:a17:907:97d5:b0:b73:b05b:1f9c with SMTP id
 a640c23a62f3a-b73b05b204dmr1059457366b.14.1763568750356; Wed, 19 Nov 2025
 08:12:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119144327.13345-1-jszhang@kernel.org> <20251119144327.13345-2-jszhang@kernel.org>
 <aR3lg0aNaoT-_7SM@smile.fi.intel.com> <aR3niy7_jwzQSJ33@xhacker>
In-Reply-To: <aR3niy7_jwzQSJ33@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 18:11:53 +0200
X-Gm-Features: AWmQ_bnLpUh6jMo81CBBtcjYva5xbsqWCBG913Ja6bqzpLYkudT9viHeiSVVbZs
Message-ID: <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:09=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 05:42:59PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:

...

> > > -#ifdef CONFIG_PM_SLEEP
> > >     struct dwapb_context    *ctx;
> > > -#endif
> >
> > But why this? For the PM_SLEEP=3Dn cases it will give an unrequested ov=
erhead.
>
> the pm_ptr() and pm_sleep_ptr() can optimize out the PM related
> functions, but those functions are still compiled, so if we keep the
> #ifdef, there will be build errors.

Is this an expectation or you can share the error, please?


--=20
With Best Regards,
Andy Shevchenko

