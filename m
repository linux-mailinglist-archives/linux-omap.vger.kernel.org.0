Return-Path: <linux-omap+bounces-5032-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C907C80F75
	for <lists+linux-omap@lfdr.de>; Mon, 24 Nov 2025 15:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B3EF83445F0
	for <lists+linux-omap@lfdr.de>; Mon, 24 Nov 2025 14:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9442E30EF9D;
	Mon, 24 Nov 2025 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKwMy0c+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6C32AD0C
	for <linux-omap@vger.kernel.org>; Mon, 24 Nov 2025 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994015; cv=none; b=qbgkLBsLGLetcAxa/9lS9Nd2baokhCCSfprZnza25HfExN2JHB+G5FFTm1OyxXL5IQdNPfICcEa96OS9M0gFzaz7hbPuZacGDqO5jeJ6W0kL0PpVZki3l/tcCUKJXKez45sOdHe2GbMLjqNkk62IzAWMutuswvjpo8eVR9Jw2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994015; c=relaxed/simple;
	bh=46kRvVWyQXGS9pUlZvBUnKc8mKLrg8La7QYi4qmVpWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNaHF4/fJoxWFRXlrlDnH4296d2ZLsydAA5HXl56UezEYLWWh9mq1Uhct0RQ+YB7hjHybR97Giwv0Vq+ny58OqqzJmzmKe2A8PCy8jVWaGQdVPUdmgKjam83itW0/imh9yCCr4isoFCscck5TmjRKvLbIfPe35+2AGgZWT8Ifm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKwMy0c+; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78a8bed470bso24183327b3.0
        for <linux-omap@vger.kernel.org>; Mon, 24 Nov 2025 06:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763994013; x=1764598813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTsU3/VBT7OkJy6nyHJhlew8G/sSBpilG7m0hm09+DI=;
        b=QKwMy0c+8Q0ASvsyO9VePV2vkdnZ84h+ZNZ2XqauHK5+1RnhdYasm/6/0t0a/VJ8QM
         f35tqCYcQzG0bM3j4ZgRLAaaDqhJy+TWPTggS/WplfcStCgO2A9VDOfqEBiYfeIRQCAR
         Xxm59qsc+gBHq6ptJ8boxaGA8dPDDnIL80GkaYG0wiKotKDKG2LRPcwVV5JTZfgbfQaG
         ET3xW0RP73aUyhWOB3RJLwUuLqN58vlFyhWtuUVo3sASfH16TTc/jV4F8Q2/VQpi0XLK
         2nMaGhH1Nhy1sHYu+kNATPL20USDIKFsNd+qBgNzaHpP56ktnbanmyuxnXPeqaYBL6dd
         t6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994013; x=1764598813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eTsU3/VBT7OkJy6nyHJhlew8G/sSBpilG7m0hm09+DI=;
        b=isWgcmTu+9Izq17jVlm8Ri+63l8IAGtzG6YfPgqmeXHJ5Y74sLvdr/UQn57cxRp8A6
         gao4QflDCGglIH7icorBiYFheLt9Y8zN1N05dnfHA2mCZX1f5hwvKpvyj5k65wfoE4wC
         /K+M7fU7q1NUD9HjE/NLziX82el1jeVocGjc1qckD8D5YeNlMtVKB98Ydod9NQzFQ+EZ
         UfOnRxTrjm5jjV4nJsAhXf6v73PE5Lio8ga5eYRPN70tg8WTWrolNvaWnBR1bsxSCeQm
         s1zp0y/s5aJ4uHU15B6Rj49wFmblIRnhDJwrdOAQtxLKFYqxUvGtxkDLY6P/DTopAT8/
         S8nA==
X-Forwarded-Encrypted: i=1; AJvYcCWulZl7yLrNmoH8cl7WKtjJ8FBgHj/LOJ37CN5ZX5OsgI4cKg7W5sPRXX8NObUdhz+k7bERu645SZKf@vger.kernel.org
X-Gm-Message-State: AOJu0YzK756YwZeNwJY8ie2VnrSU4twM5XzMBJmuS9zSj9epGLy/hpjx
	C0nx+vBWVo24AzrWBOHWg7cqDPnVNQKiRj0r/tgJlgIdSUnl+wLGRf+3e3kANexNVsAN7S6lw8w
	bNgJXdf3Z+z6BRZz6sA0+d3Jw8mv7wnI=
X-Gm-Gg: ASbGncu/3fN7J0qDrt69IwMfklAI7It+muVnCzzivooUW4HKQiabfmi0lWS2v10zGvX
	DIwltTG54eeHnwHD1xsgfnE0u6jg2ucIEoXgC8RawA5vjMcwCX8aIwKKAqZzGF7cHOrpDnRujov
	A6IJCNSVqW4fHlIVF0wHl9NTyh/bihZb5ZY2mFlz2SmyHrJGU5psnheMM3b8ihvE9tbKfs0Skoc
	rXN2O1I1dm3Bey9EAC2VHfaKHXkfO3qEkRo3PQPOljM5miTSkHhtMKX5pTWHOa1eK2vwg==
X-Google-Smtp-Source: AGHT+IGXDHAnoYqNvGl6qbUdw4DMm1fGVB/3Tpw1uJs9W3Glb48smmRl2MqryTURWd1WdtrIiMUU5XKD2nAkGvh+X6Q=
X-Received: by 2002:a05:690c:74c5:b0:786:5712:46b8 with SMTP id
 00721157ae682-78a8b47af0bmr176562577b3.5.1763994012509; Mon, 24 Nov 2025
 06:20:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com> <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
In-Reply-To: <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Nov 2025 15:20:00 +0100
X-Gm-Features: AWmQ_bmwAL8s4vZ9H815tlfRFg29LQmJQkA9Zmf12Y25EoI_zAX2FlKPyt9VVWc
Message-ID: <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
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

On Mon, Nov 24, 2025 at 2:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Nov 24, 2025 at 2:40=E2=80=AFPM Jonas Gorski <jonas.gorski@gmail.=
com> wrote:
> > On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kernel.o=
rg> wrote:
>
> ...
>
> > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > > -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> > > -       .resume_noirq =3D brcmstb_gpio_resume,
> > > +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > > +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> > >  };
>
> ...
>
> > > -               .pm =3D &brcmstb_gpio_pm_ops,
> > > +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> >
> > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> > !CONFIG_PM_SLEEP?
> >
> > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > all other *_DEV_PM_OPS() macros do).
>
> Shouldn't it be covered by the same trick as pm_sleep_ptr() does for func=
tions?

pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
reference then anymore to brcmstb_gpio_pm_ops. You would need a
wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
avoid the warning, or add __maybe_unused to it to silence it.

Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
with it (for that reason I assume).

Best regards,
Jonas

