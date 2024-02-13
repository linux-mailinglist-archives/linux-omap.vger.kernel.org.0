Return-Path: <linux-omap+bounces-578-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D8F853D1C
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 22:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA6528E3A3
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 21:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADB164AB0;
	Tue, 13 Feb 2024 21:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kS5eAX/6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A664AA5
	for <linux-omap@vger.kernel.org>; Tue, 13 Feb 2024 21:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707859324; cv=none; b=cwe2+FvPUME7UxBn0RqaI+pWMBYfrC0A4hAu6ptqHSyKIW3NFjylYUIq9tYG9lgTchJp3pasy2wQjod9kBlqU6vHUBx8j6ZMOHhbflsR32yiFcVWLdBR+fuV5gJiPnPAMvyr+cYF98juzC8138kP/kAUSWVyM8hN/usyNeH67Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707859324; c=relaxed/simple;
	bh=wnV/gdaaHn/A9Q4c5o2KJzgadVs46MzIcms/Q6KJ8oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzLZZ7GT1UsvnyXAIVfN4sLvX2/uNpRfr9EqyKpdQRSMs32ZPecgwrqrsjEydF1rbWaY2kl0nJl+WOTRkokVyDDcOxqeVbtuPCrKp7lDvGmLs33cI71BTFlwemS6PAN824/pJafqEdp/zgJTct8uGKnI3v2FvjX/T66aDu7bhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kS5eAX/6; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc236729a2bso1267268276.0
        for <linux-omap@vger.kernel.org>; Tue, 13 Feb 2024 13:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707859321; x=1708464121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlHB/C070gQJYtZKeDqoDoUjH6sfS2fU7WC1adPgbS0=;
        b=kS5eAX/6ykZdAsiHFKKVIpBXo6LOpx02abddAvi06IXRobel16qX9UShvWNgfT9zFk
         es5x461LKjYmMVeRIXRdFxiLWYA0YjMCBdHDwhQHsZu9xRJSDUZeIUHjhcUCbMyk/S2Z
         vwE65KTHd7m2PqoYcbeeEWhs4pty+gr13svoSwhVHixYQAZTdbOQ14IpRIICRFl8pAMt
         2QRhRFEokoHWKK3sy0rPA+PtHyWV/KAiCDSLRFneM49vq1A+tCcfXkqJmG+ygxFq+BSA
         /EAw/rWTNqQ+PvtI+6yfz3osXll0O7cm07fDTJyH+bz/SaYDH/JjDG9G85XpuVTrvpQ9
         roqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707859321; x=1708464121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlHB/C070gQJYtZKeDqoDoUjH6sfS2fU7WC1adPgbS0=;
        b=hQBp2He4xyUVQoRxqM57oEFYuI+yWXRgUIyCfcoC9xwZxz2WR5Ay4nIOQCL0QVWXy9
         sS4bU62JYwci4B9g8Y3hXt1vQN9HZWEXwRUAPtckW4gmzT0xTNiwEvwdxRS2orsUGXK/
         dORit1YPMqfPmwNxJDvtFg/NuPWZHmD+fnOdCFlJEuohM70BdwSA8CYnzNqOSruZVSRl
         BOhT8NkgrQI97oa2o2PoG0S4QOzDt469a5JboxiutE4uXw0ZUrD9R8dGrCxh+VMsZnhv
         EHQ3V+0c1qbmo1VVU7F0IeooxC7mZAzjIDP49i2k6tJ099bJV571ymBqcBtWehrjJUgL
         j0HA==
X-Forwarded-Encrypted: i=1; AJvYcCWxjCZ9u1dMObDDqWzHXL4hxbgBNRfuxYbR49PxMP6fW07PoGoDok2in9LRJk/Yr1FmQyf09sBVNROSLdiuOyYaM0NXkccsRtEpog==
X-Gm-Message-State: AOJu0YxQmFXWavmBnmNVcVxh79p4MzwHKEB0IkE66zlruuQzjD2qBcnU
	dBkni+fublGHfFTjoWnKxiWukwynUYVS+up/PtB+OOgUlYXXB48hlmUSi+YvZVmsN8UovkDU6Ds
	pfqaxZ4SsTa8hx3W0TlcnyvJnoQ6v7H+tB34e0Q==
X-Google-Smtp-Source: AGHT+IH8ZG9tqZjTbdsy3Wqrys0PBwBznAy2Pz0Y2bk6bYZ1+os+eqaytoO7CwQNH6qFjH86PnfRQiXqoe3DvRCfVb0=
X-Received: by 2002:a5b:54a:0:b0:dc6:cd76:5ddf with SMTP id
 r10-20020a5b054a000000b00dc6cd765ddfmr468191ybp.39.1707859321685; Tue, 13 Feb
 2024 13:22:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net> <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
In-Reply-To: <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:21:50 +0100
Message-ID: <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Arnd Bergmann <arnd@arndb.de>, paul.eggleton@linux.intel.com, 
	Andrea Adami <andrea.adami@gmail.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Stefan Lehner <stefan-lehner@aon.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
> > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
> >> On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wrote=
:
> >> > On 2/12/24 04:32, Peter Maydell wrote:

> >> > > The one SA1110 machine:
> >> > >
> >> > > collie               Sharp SL-5500 (Collie) PDA (SA-1110)
> >> > >
> >> > I do test collie.
>
> Adding Linus Walleij and Stefan Lehner to Cc, as they were
> interested in modernizing sa1100 back in 2022. If they
> are still interested in that, they might want to keep collie
> support.

I'm not personally interested in the Collie, I have a SA1100 hardware
but not that one.

> Surprisingly, at the time I removed unused old board files,
> there was a lot more interest in sa1100 than in the newer
> pxa platform, which I guess wasn't as appealing for
> retrocomputing yet.

Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
modernize it a bit, and Russell helped out. I was under the impression
that they only used real hardware though!

The Collie is popular because it is/was easy to get hold of and
easy to hack. PXA was in candybar phones (right?) which
are just veritable fortresses and really hard to hack so that is why
there is no interest (except for the occasional hyperfocused Harald
Welte), so those are a bit like the iPhones: you *can* boot something
custom on them, but it won't be easy or quick, and not as fun and
rewarding.

The thriving world of PostmarketOS only exist because Google was
clever to realize devices should have a developer mode.

Yours,
Linus Walleij

