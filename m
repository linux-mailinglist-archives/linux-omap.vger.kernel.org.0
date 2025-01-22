Return-Path: <linux-omap+bounces-3185-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6049A19ADC
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 23:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17E83AA998
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 22:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15221C9B9B;
	Wed, 22 Jan 2025 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCayYKfS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8373149E17;
	Wed, 22 Jan 2025 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737584733; cv=none; b=LHIJydvLfZa1BiycER3jtLfoWzhR8FSys0FYbG4HXBopzV0qIut4g5ZvfsFV/3anmjfOKegHO6hh2ZtEJZPm8kzkpmfRBthHwRkx4M8Fl3n4FZeFk6QAN3l3R6zt0ZtVt0tP70I0+yYKJ3nWapiDnMSWr/GG9ijta4nu255EEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737584733; c=relaxed/simple;
	bh=GR2THKDwTfJ4gBArKaU6aNNMiLh/ATnjyTpsFnzEELc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TtZF3vT78qoUrj+/ohagcfH3IuNc/EQj1vEFMcTdhtLQ5/3peH/FzWUUg13lkOpSVvs28TpO3ITtK0z7bM34EAgZ6i1CRawGiWdX8B8QuEGi1/YDzrArAYdN2wztF2Eibyl/0/goJW5Uz2BFxaCJNvSZEw77vx0Foc3FcS+0YOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCayYKfS; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so450402276.1;
        Wed, 22 Jan 2025 14:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737584731; x=1738189531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMuRflUxJX+wACGngqPnQ6rKVLbXyG4uOiCV4CkUZ+s=;
        b=NCayYKfSzOKiwYs6bxQtKLYA948uvhTmPzOtvnRf2N4Pt3wuY4L+VtgAD8gRjqEovC
         qAdi0FVsUg688bQ9O4RoxERb2rOCQBxK61/KnOSf4fLn3yc3DiAQcW2pYL74nnT0rquX
         dYrrQmXrRPP7eUWlBAC7W07i7QrzrtNhGfrW79AegLLyntt+SWEN+L88F2xpYdi7VKAh
         nSScQ/xhKbPPvetZ2CvECgw2kNizdtbjCuenybLsljBMCDv0h9bzeiKGTGAqMXDNKQfW
         Bm2LPr8syDEvmz6xEZcuAmRnHNYVs6u5+qP74qNYwtkWH02+qcFxfm+Mr3dyvmch7uXk
         92FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737584731; x=1738189531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMuRflUxJX+wACGngqPnQ6rKVLbXyG4uOiCV4CkUZ+s=;
        b=mB39/lyB+OE14pOz9CAnqgWIzqhT+9ajaUOX9JDGAib4k3m/LdJ3FhHAwOVjimW4tv
         DtCXZqHXxhho/En1JjOFsk1T1Sa+qIlgLIy2stcQ5OPinjN5rbDsBFiacsmjg2Ai0oF+
         TkmIc8EJEKCFbhQm3EzUDiuFZ7JSbqqnmnKqY0dgyDGY9PUjQsg+ZhWj3T2gCU2dUKpO
         1sHGpIutyZpF791/F35/LpN73zhdOc4K4g6PuV6AHM7w5V5gkp60T9kIefdurJVrakER
         gwlaUlZvEdsYIzCtW62mVAeSGt17EN5HLMdL5ylF+0Iiq+uQLmVUT/YzcUfMPFoXQ0ag
         C3zg==
X-Forwarded-Encrypted: i=1; AJvYcCUpoOVSRcSwFUDmhxr1GZCK3k9MTpu8QHdO28IH8LD9kOkVzT665rCmaw0k5eyY+XA766LjHC0YzNvUeiZW@vger.kernel.org, AJvYcCVz/WOV2zzrgqiTFyBMaE/9kljXiL9nPfoda96odRe0juzEkKduOQHjmHf3ZDNAPINiszpP/63qYzMuaA==@vger.kernel.org, AJvYcCWMkh7xDBLaYUxpNtZpQKjxhOpbgpnsoWDo6jJnvmOSkTgyy6mkYZ7cT3mu8Ddu5n09Gyu9rHTi6cNY@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/67wPLOjrrdUObIBo/TbIlD2QB2XGSuwXEWpS0cUd63wnUzN
	8pojtNc0Kh6jPnL6w4NTf0gP2t7/40T7UT0WbKgwy89w7MXTGv4r43p2JzKlLNNOTaULcuseotA
	OoszsiU3ItgCscYc7xqku85qwmFw=
X-Gm-Gg: ASbGncs5RP1VikyQ4L//kQFiSsH5MUmtW9Iovbotq4wObxCREs+Hz/xzJ9AS2hGYj/F
	A5Y+Kte+7gkfeLEHN4yObifgnrGSOLNd2cZLuEXsQ0jpLCsOM+e/t
X-Google-Smtp-Source: AGHT+IHwZQM+MfFTd7aBSHgxQ4+Ver/hLL8FMdPegBV//u5SryelVLsuydVDnMtEU1Sno+2WmpS7lHFuExqKneaC16M=
X-Received: by 2002:a05:690c:d94:b0:6ef:7312:d06c with SMTP id
 00721157ae682-6f6eb68b506mr170975957b3.21.1737584730724; Wed, 22 Jan 2025
 14:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121200749.4131923-1-trini@konsulko.com> <7hmsfjn5mm.fsf@baylibre.com>
 <20250122000824.GJ3476@bill-the-cat> <20250122214604.79e1e829@akair>
 <CAOCHtYj3LumO4pViSOyTwjNxvG1E-DX=JA0-m4Usi1qL+jw21g@mail.gmail.com>
 <20250122211014.GB60249@bill-the-cat> <CAOCHtYjQtPvun-YTf6KT3Pw+jn3PS0tKM5uz1to3C6+Usjcq5Q@mail.gmail.com>
 <20250122221843.GE60249@bill-the-cat>
In-Reply-To: <20250122221843.GE60249@bill-the-cat>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 22 Jan 2025 16:25:04 -0600
X-Gm-Features: AWEUYZn7CUSeWDwdPXOBkICWrNj84I-jQWAEoVfUugIlnDaUkvQIEIFR23RGa78
Message-ID: <CAOCHtYi_AKq3Y5BxzTs9GL8UuU6SkS6hpankGK60SVXzCGkDMw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties
To: Tom Rini <trini@konsulko.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@kernel.org>, 
	linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 4:18=E2=80=AFPM Tom Rini <trini@konsulko.com> wrote=
:
>
> On Wed, Jan 22, 2025 at 03:52:47PM -0600, Robert Nelson wrote:
> > On Wed, Jan 22, 2025 at 3:10=E2=80=AFPM Tom Rini <trini@konsulko.com> w=
rote:
> > >
> > > On Wed, Jan 22, 2025 at 02:56:19PM -0600, Robert Nelson wrote:
> > > > On Wed, Jan 22, 2025 at 2:46=E2=80=AFPM Andreas Kemnade <andreas@ke=
mnade.info> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Am Tue, 21 Jan 2025 18:08:24 -0600
> > > > > schrieb Tom Rini <trini@konsulko.com>:
> > > > >
> > > > > > > If keeping it is just this binding update, then I'd say we ke=
ep it, but
> > > > > > > if it gets any more paninful to maintain, I'm also not going =
to argue
> > > > > > > very hard to keep it.
> > > > > >
> > > > > > I'm not in the position to see if any of the Pandaboards work a=
t this
> > > > > > point, so I don't know if they're otherwise functional or a hug=
e pile of
> > > > > > problems.
> > > > >
> > > > > I am still testing stuff with pandaboards. But I do not have the =
a4
> > > > > one. So yes they are functional. Compared with other devices stil=
l in
> > > > > use using the same SoC, here you can play around with everything,=
 know
> > > > > the device. so it is a reference for keeping the really interesti=
ng
> > > > > devices working.
> > > > >
> > > > > Regarding the a4: I think it is better to keep that one in, just =
that
> > > > > nobody gets confused if he/she digs out his panda board for some
> > > > > comparison test and uses a wrong board revision.
> > > >
> > > > Do you want an a4? I could dig one or two out! ;)
> > >
> > > Unless I'm missing something, the a4 hasn't been bootable by upstream=
 in
> > > about 10 years now... There's no top-level compatible, so there's no
> > > match in the generic board code. I can't recall if the A4 versions we=
re
> > > available to anyone other than maintainers and beagleboard.org folks
> > > themselves as part of bring-up/testing. I know I had one and ewasted =
it
> > > a while ago.
> >
> > PandaBoard EA1->A3  =3D omap4-panda.dtb
> > PandaBoard A4->+ (non ES) =3D omap4-panda-a4.dtb
> >
> > A4 was the final production version of the non ES Panda..
>
> Oh! My memory sucks here, sorry for the confusion. But it's also still
> the case that omap4-panda-a4.dtb hasn't had a top-level compatible
> string, so can it even be functionally used?

Looking back, I moved from PandaBoard -> WandBoard for
BeagleBoard.org's build infacature..  Dual A9/USB vs Quad A9/SATA...
yeah.. sata was more stable then USB..  I think it was around v5.4 lts
I gave up on Panda's...  SO 5.4.x would have been the last time I
personally used the panda's on mainline..

Digging more, yay for omappedia! ;)
https://omappedia.com/wiki/PandaBoard_Revisions

I never personally saw the A5 or A6 rev's in my hand..

What's scary, teh A4's changed the hdmi pins:
https://git.ti.com/gitweb?p=3Dti-linux-kernel/ti-linux-kernel.git;a=3Dblob;=
f=3Darch/arm/boot/dts/omap4-panda-a4.dts;h=3Df1a6476af3716489007c12141d06f2=
08ec2ebc94;hb=3Drefs/heads/ti-linux-4.14.y

Yet no gpio id change..


Regards,

--
Robert Nelson
https://rcn-ee.com/

