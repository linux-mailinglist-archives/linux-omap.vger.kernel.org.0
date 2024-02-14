Return-Path: <linux-omap+bounces-588-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE7D85492E
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 13:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227AA290834
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 12:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055741CA87;
	Wed, 14 Feb 2024 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyxmodd3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D201CA84
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707913588; cv=none; b=GrLCeIvDJQC/tTkn6cFdkuAnkCLJFi+O1otrV7jyGWOE38Fz47678vjSONF2D9s+IDgX96R9bgRqlTV7h7pvo7xtTgy2KQ8RAUOARwUvfjoMAkdl8RIi4K20hsc3JZvyLoAW+BwqL8z2IpORlHP+YRqfvpjs6jx3W4zCKtwBgDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707913588; c=relaxed/simple;
	bh=ez/OWB72HunCGTjiG30PkO7iT0KCAHFzPThLMbzQKIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUcx2/BeEZmrTiLP/gFlv7SRCfMmJPR4/ydGBC22qOagb0OS3O4qJz9cZuCSwba4XPYxOdG7rNJp4SSjo1oJRrlFl44alys5ihhPxYxhld+bIHaXBpip9sIu3+MtvTJoRDysXL+83zfJaBNYCEiKQrMYQBJHrkvWjqGk3Oeb7EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyxmodd3; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-561587ce966so1329629a12.1
        for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 04:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707913585; x=1708518385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFA1a42wCiNZvvQNKbqvgbniuQocv8cVbeveUQsSW+Q=;
        b=iyxmodd31qbQv/qKCg/OraEJeB1ed+vLpL0TQRtUQkJPVq2IRleNKai+liFeb48kf0
         8YzT4+8CS29I8xxXyF4he8MZk7qqf2CYmFnZJXTGdUvPM1ZUA46sG6E+pLDPff4DVAtQ
         zq6l9wyR6jH4W5/7Vfi/2ek57xJhFKMqVMBRJfnFVf86hYjwPjKnJDRix/Jb0KCLnYdq
         szqACoQSqvkS1iAA98HIoEYffRfJwK9L1qE5FBG/A9yJl7sQaC0qvSfWkhM1yGJsKW/T
         gUFB8yeof0ZrammPq2diPF/EeQBFUYvcyT/WDFZi/uOTKYndEkwtAIeAAzNEbEUIrQQK
         AVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707913585; x=1708518385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFA1a42wCiNZvvQNKbqvgbniuQocv8cVbeveUQsSW+Q=;
        b=mHM3f63masVfSRkBm6uedyl/Vb9eUcv9u7iw1QQN/AriYxnU5PJ0mcJQuW50E5fryg
         NjLGbMMenHmVZYE/UmP985HWwPH7QVyyRLxLoHS47rNc130sgCfL0soGvzW3gILd5ibp
         RzC//+QfcPagUnUwuco5KTeJw3k8Xot4e+cAL1pymdMIvH1dSb9QfGXOXTcrIegJ2uVd
         dHQeveQU2TtXGG62IRaeGkgCA9m4zySS+2KHfL4Kr0zmluAYkPVY1d3S/Mlo2KOmQesX
         wVpJ0gvPLxMoUobOLwS5z3Qd2DQ2zTOKIl67rPz72Ag1eTkIKnjpeDvrrOMrOyvj7Po/
         M8qg==
X-Forwarded-Encrypted: i=1; AJvYcCUQEmqJQbgVUyf8rC4tq0fM/6e15YCF526qC33IuL0ogzJE+6h7CNjAOa6skFo3lC1v1q8wZPlOG8ac/WuAPlNYyx01K2D1PkaHtQ==
X-Gm-Message-State: AOJu0Yy3m+IMvJ98jgPEM4pb2kltrY3e7LJyU5fcFxGfH7BQUHieitz0
	LotksH0d0F8m8lW5zBCfjLaRgFvC0ZZY9rJlxTv+s5/74HAewuKAoUXIN+m5s04JeP+8b3M9DtM
	nPwA3KNLg5+JpsS7KXUGtj2gmaNc=
X-Google-Smtp-Source: AGHT+IEykwKT8cgqttzOlk+e39y8FoMiUCF/sFbMj4oPhkwkWz3C8nIuJBWl58yHIWtjQdnVurE0vG0XmAShoLUUESc=
X-Received: by 2002:aa7:c2cb:0:b0:561:f2c2:4dc8 with SMTP id
 m11-20020aa7c2cb000000b00561f2c24dc8mr1647564edp.9.1707913584936; Wed, 14 Feb
 2024 04:26:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net> <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
In-Reply-To: <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 14 Feb 2024 14:26:13 +0200
Message-ID: <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, paul.eggleton@linux.intel.com, 
	Andrea Adami <andrea.adami@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
	Peter Maydell <peter.maydell@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Stefan Lehner <stefan-lehner@aon.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Feb 2024 at 23:22, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> > On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
> > > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
> > >> On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wro=
te:
> > >> > On 2/12/24 04:32, Peter Maydell wrote:
>
> > >> > > The one SA1110 machine:
> > >> > >
> > >> > > collie               Sharp SL-5500 (Collie) PDA (SA-1110)
> > >> > >
> > >> > I do test collie.
> >
> > Adding Linus Walleij and Stefan Lehner to Cc, as they were
> > interested in modernizing sa1100 back in 2022. If they
> > are still interested in that, they might want to keep collie
> > support.
>
> I'm not personally interested in the Collie, I have a SA1100 hardware
> but not that one.
>
> > Surprisingly, at the time I removed unused old board files,
> > there was a lot more interest in sa1100 than in the newer
> > pxa platform, which I guess wasn't as appealing for
> > retrocomputing yet.
>
> Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
> modernize it a bit, and Russell helped out. I was under the impression
> that they only used real hardware though!

I used both Qemu and actual hardware (having collie, poodle, tosa and
c860 that was easy).

The biggest issue with Zaurus PDAs was that supporting interesting
parts of the platform (PCMCIA, companion chips) required almost
rebootstrapping of the corresponding drivers.
E.g. I had a separate driver for the LoCoMo chip which worked properly
with the DT systems.
PCMCIA was a huuuge trouble and it didn't play well at all. The driver
must be rewritten to use the component framework.

lf there is interest in modernising / updating StrongARM / PXA
devices, please count me in. I don't have time to lead the effort, but
I'd like to contribute.

> The Collie is popular because it is/was easy to get hold of and
> easy to hack. PXA was in candybar phones (right?) which
> are just veritable fortresses and really hard to hack so that is why
> there is no interest (except for the occasional hyperfocused Harald
> Welte), so those are a bit like the iPhones: you *can* boot something
> custom on them, but it won't be easy or quick, and not as fun and
> rewarding.
>
> The thriving world of PostmarketOS only exist because Google was
> clever to realize devices should have a developer mode.

There were two projects that worked on reenabling phones and PDAs from
that era, hack'n'dev and handhelds.org. I think both of them were dead
when the Zaurus was still alive and kicking.

--=20
With best wishes
Dmitry

