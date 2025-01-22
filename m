Return-Path: <linux-omap+bounces-3181-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B342A19A8A
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 22:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6532188D70D
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 21:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CD81C5F38;
	Wed, 22 Jan 2025 21:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzcg/eW/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B651C5D66;
	Wed, 22 Jan 2025 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737582797; cv=none; b=lJvZHNM1rjABwwAw6Pw9yqcgyygkuHtvVibJCuLZbMH5aRpG8vGDaRujJTbV8Jl3W3UPkihz8XQQmN6Fnkj+sRfolxsl7/sJaQy77j8ekdM0FzSzNwy3rOO1nljUdXQRKOnE/77SoVdQ7dlZVBGU8F7XZ23ycCA0vtSg6PvS7ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737582797; c=relaxed/simple;
	bh=YmENzvCRLuWDa72C8XNZzZbw69LdKFJkx9VJC4IGhlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ndd8caR1nB2wKr4aY9rBeawvcrI1l6hXhZn5SlN0v8pYkUgbtOHQca88wpHa5a3jmVIuFVUmoi3i+4fTo7F0xvuTCVImizmlM6xW/AGnV6ZorFEnlCbF8pmFan0zgy9VuY09c61d9bnS6iwiKnj7c7y4UTvwlc5TQOuFbF45QNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzcg/eW/; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3c9ec344efso356976276.2;
        Wed, 22 Jan 2025 13:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737582795; x=1738187595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmjlKCUlPW1SCG/jEMrMDYHS0ywkj2fdx8H5wjgc8NY=;
        b=lzcg/eW/uJapCK3ZmyllpXhxjc7iposNzGhMuesgJj2wDSNns+CnV8tJOJng+IGeQG
         l5kIGne5NCyA71i5DAk6jffYef5jv1WnoWPUn/zpEXCNGQfrKFkBdEEQZ4xWriGqf5wD
         aRnkmGECyAdyS+HLCILStPOm/2vWTUm7fw6UHQKNOB+pzuQR8RPc5m9KM4fvcj6xRNMd
         YCT4/5cKckibHBPzXC+RMl1tv8JYPJJsybLv06DssVTddwgfJ492fw6wfkRL9Wnwk2sH
         D3FkWVkotJi0cx6/EtGTN9YRhTInGChXTgy8qg8CNLOQSeO+ZQuqx4CaoIdz7pdY0wHb
         3hUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737582795; x=1738187595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmjlKCUlPW1SCG/jEMrMDYHS0ywkj2fdx8H5wjgc8NY=;
        b=Rh0UlAsyvmj4pBVcEoU/aNHqOlJGggODmKQtKWSKFUp3XmTEVIHQQisznQzwg3GM7A
         52h5RsNnOm/kcYwl54Jbo2ZI4kiuzjJxO5ELE7NOwKr0qGrzF02ScM3vmLh3Ajab9g4e
         7PiboBXoGF97/C0Jj0aa1aypmfHbCWvB7kvSp+GYL79ECpj+Br37VMtRKKekCj0t4vSr
         Pc8GPssbf40UuL7mEG4hTCzTuU7H3+4eO9VJp8nvm/ltfiCMEujcvgQjqrUb9LdrPeG1
         P58Puba1xvaxqaahBe0F47zAOcWQVBz07WLt8Tox0aBqTnj5ChM422Y0UQNVm97K6qGR
         p/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPSf2e9KhS2NBFWR/H75/tdn0nDgI29x9/Mz7P5gc1jguV6yCB8c1Gmu8v4tLalB2pzUhaOkkXT/bGfZUm@vger.kernel.org, AJvYcCWOgxjp4nGxaoNDXWNXrKauVzWhEW5PRAzfpp3vS6IIRjC2IGVpLHB8MVyXvom//ICEJu8clnufycpj@vger.kernel.org, AJvYcCXsQ615tLNmngUGksC9QZC9rPkpJ2fqJXL4SRB9DOqootuRwrvIOr4RRQOw/2cYwnGaDe2UEKw1FuXzIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/N01zjB86HIlgYSnTpjRJxuv5VN5CFGgmIkXPATA36f1mTUmw
	XCb4nDozNG7Ro/mR/TpfNcfBQVF7o09LNi7M4lfMKAnHW1sK3MsHULpgef5uNvHQtj3UKOg5Ygs
	OdNgu25/okp3PdJrqexDccMauZ9c=
X-Gm-Gg: ASbGncs4GEa6Q/Zq7KB17N1jvBZ7J+kocee30GkNN+Jl73RVmLkIHTVVwJPuWCrwTcT
	CY65IYWzrrKeyQqQtPH3fm/UkWrfALnatk82+tcrEOQZ5Q+UfWsay
X-Google-Smtp-Source: AGHT+IHlfiV8rXkJ/SMKpE3ZIyYs3d9P07umOzGx+MBGx4TLsbbCgxqa19aE6wMJBkP5GgWTyqXAvYNRR34nYlEtAp8=
X-Received: by 2002:a05:690c:6e03:b0:6ef:8dd0:fff9 with SMTP id
 00721157ae682-6f6eb658933mr174492527b3.8.1737582794738; Wed, 22 Jan 2025
 13:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121200749.4131923-1-trini@konsulko.com> <7hmsfjn5mm.fsf@baylibre.com>
 <20250122000824.GJ3476@bill-the-cat> <20250122214604.79e1e829@akair>
 <CAOCHtYj3LumO4pViSOyTwjNxvG1E-DX=JA0-m4Usi1qL+jw21g@mail.gmail.com> <20250122211014.GB60249@bill-the-cat>
In-Reply-To: <20250122211014.GB60249@bill-the-cat>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 22 Jan 2025 15:52:47 -0600
X-Gm-Features: AWEUYZnRNG5FdxlPIIVoDee1WTQmnYsKXL4bBGU1_07SKtrl6gOLhtD8xVzsjYQ
Message-ID: <CAOCHtYjQtPvun-YTf6KT3Pw+jn3PS0tKM5uz1to3C6+Usjcq5Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties
To: Tom Rini <trini@konsulko.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@kernel.org>, 
	linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 3:10=E2=80=AFPM Tom Rini <trini@konsulko.com> wrote=
:
>
> On Wed, Jan 22, 2025 at 02:56:19PM -0600, Robert Nelson wrote:
> > On Wed, Jan 22, 2025 at 2:46=E2=80=AFPM Andreas Kemnade <andreas@kemnad=
e.info> wrote:
> > >
> > > Hi,
> > >
> > > Am Tue, 21 Jan 2025 18:08:24 -0600
> > > schrieb Tom Rini <trini@konsulko.com>:
> > >
> > > > > If keeping it is just this binding update, then I'd say we keep i=
t, but
> > > > > if it gets any more paninful to maintain, I'm also not going to a=
rgue
> > > > > very hard to keep it.
> > > >
> > > > I'm not in the position to see if any of the Pandaboards work at th=
is
> > > > point, so I don't know if they're otherwise functional or a huge pi=
le of
> > > > problems.
> > >
> > > I am still testing stuff with pandaboards. But I do not have the a4
> > > one. So yes they are functional. Compared with other devices still in
> > > use using the same SoC, here you can play around with everything, kno=
w
> > > the device. so it is a reference for keeping the really interesting
> > > devices working.
> > >
> > > Regarding the a4: I think it is better to keep that one in, just that
> > > nobody gets confused if he/she digs out his panda board for some
> > > comparison test and uses a wrong board revision.
> >
> > Do you want an a4? I could dig one or two out! ;)
>
> Unless I'm missing something, the a4 hasn't been bootable by upstream in
> about 10 years now... There's no top-level compatible, so there's no
> match in the generic board code. I can't recall if the A4 versions were
> available to anyone other than maintainers and beagleboard.org folks
> themselves as part of bring-up/testing. I know I had one and ewasted it
> a while ago.

PandaBoard EA1->A3  =3D omap4-panda.dtb
PandaBoard A4->+ (non ES) =3D omap4-panda-a4.dtb

A4 was the final production version of the non ES Panda..

Sadly we still have stock! ... From Circuitco before they went out of
Business (10 years ago)...
https://www.digikey.com/en/products/detail/circuitco-electronics-llc/UEVM44=
30G-01-00-00/2349866

However there are two versions of the A4, with different memory:
ELPIDA and Micron..

ELPIDA works fine (well last i really cared/tested it was u-boot v2019.04).=
.

Where as Micron.. Which has the same bug as PandaBoard ES Rev B3, with
a new memory (only one Chip Select vs 2 (or reversed)).. I could get
it boot via nuking the CONFIG_SYS_EMIF_PRECALCULATED_TIMING_REGS
define

in include/configs/ti_omap4_common.h v2019.04

Things we learned from `that` OEM... When you run out of memory chips,
don't randomly swap parts without at least changing the ID...
Otherwise customers will be pissed, when old software doesn't work..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

