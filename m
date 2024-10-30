Return-Path: <linux-omap+bounces-2523-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C419B679F
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 16:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 744D11C21675
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 15:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA3D21FD80;
	Wed, 30 Oct 2024 15:17:51 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4C121F4B1;
	Wed, 30 Oct 2024 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730301471; cv=none; b=mP3h2QacmaF0lBNuJ2tbrluwvjUsdo4NHnETyCnuIXUPSk6MlSZu97BRRE/U9qWjwo6NIm2fm18YUBz6ilcSSyrzcNBZfK0yUb/X6hPuwWDnWUE1FdTr5l5gsg6AqGbv2qj24l2YX6etRHU7B4lyA85ISFrHd2exYG/Z4Bp3UUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730301471; c=relaxed/simple;
	bh=PQIxLfHrlNXYMyFR08iVBDPyjUjt5fjiwBkeOt35M9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRrE73eGSeL4zxeUfb0MpyVrIzOaDI9R9qTB+sH2kSpcOb98BfuwYm5XEK5wgUni7C23qFyLPz5f/JSh8TE5fES5J+O8b0xUaqItz8lXJJhtf6GPRWyKG8Z8BA4hykh3NyMWdw523SXRRKNpguIxMA2xPT+uzhbljYg/AWUd/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2689e7a941fso3874993fac.3;
        Wed, 30 Oct 2024 08:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730301468; x=1730906268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3SORIHMVqx8TfNrC5y4XM03obScQJi2qO4kv74Sacw=;
        b=waKVCbRFbx12LRsWri2uEjePLzrmuPVvZxZ1tTGoAkZ6nfjMWu1Dou8qXbaIiyqIkM
         j6NUvjpUwri0mHwsLd/4TYKnbz6KPtfuuHPUfSnpNlF/VAtr+AxNPcKXbDN7tT9TW7pD
         ssJU3jM/CHUx1Bg3NwTgYixVPXYijRYT7ZbYJVMnVh59TVqBzAka1RadowUEG0IPDWf1
         VKBRGd0Kfcq7iBzTJf3Jc/Te1VT+z8Q1eh0RfpRd0+Dxeemz5cE9gnp9OYZ8T7Rw9ijD
         4plD56vS3PHHx7WH9c0tgio1ta0Oo4w/teHPTV+6GTox4SqG7M4MD8ZUnTfKEw8hrQm1
         WqLw==
X-Forwarded-Encrypted: i=1; AJvYcCVF/0TE0IQ/oZDoMIf5VBEpV3WtdUa/CRFKB2SboVeP6bOwVtBU8d8QzRmkSpXO6q6CrlBQ5lDO9a3G@vger.kernel.org, AJvYcCXbgJj9z6HzLAFo33F6DebSc4OhbnyLWtrgRVFBgAIU14h+6+7VWIm+OnwCo/EMQ8sOsZX0rpTe@vger.kernel.org
X-Gm-Message-State: AOJu0YzwwMJzwAmcSyq+0P6jSWceAWsrHejzApIi/5BKqDB6NMUwCFLl
	oOIP+r9oGkL41EfUJ9b5FuuCoNPFm0VD15hJCa2/uvPqSspBQfdawWBw57wg
X-Google-Smtp-Source: AGHT+IFihHGuVxPd3rJ+psGLmp8vPxVsDYHXx3KgPRr4Ni9bmcnX5ahkbpwMw0SPXuqlqrjLrZquSw==
X-Received: by 2002:a05:6871:208:b0:288:851a:d562 with SMTP id 586e51a60fabf-29051adb4a9mr14443669fac.5.1730301468022;
        Wed, 30 Oct 2024 08:17:48 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-290380f4bdasm3427843fac.46.2024.10.30.08.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:17:47 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e602994635so4143531b6e.0;
        Wed, 30 Oct 2024 08:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVotEpp8cdiKdg7UeDbsPNJdwfEJAbBJV/PtQqqBUUUsNJTFy5Ve1zgpgr6k+b5auHTW8K8Zx+R@vger.kernel.org, AJvYcCXswG85aKuCWbpvcF1RYVn5IiPtpI5/chCH9poLNt+VWU+bsM5EDyouiGLyTlUXZowJ6zKdtQTMISNd@vger.kernel.org
X-Received: by 2002:a05:6808:2391:b0:3e5:f4fa:5984 with SMTP id
 5614622812f47-3e63848f05emr14700373b6e.38.1730301467588; Wed, 30 Oct 2024
 08:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
 <CAOCHtYgRD_HTD1F-5+CQ3H1PK3Lbhb-ZdyqDYp3wN2wRK5vOUA@mail.gmail.com>
In-Reply-To: <CAOCHtYgRD_HTD1F-5+CQ3H1PK3Lbhb-ZdyqDYp3wN2wRK5vOUA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:17:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcJ=Bbm2JF_gWigWwvtPzf-g6VRYy-kd53CBd_0jt+7A@mail.gmail.com>
Message-ID: <CAMuHMdXcJ=Bbm2JF_gWigWwvtPzf-g6VRYy-kd53CBd_0jt+7A@mail.gmail.com>
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Robert Nelson <robertcnelson@gmail.com>
Cc: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robert,

On Wed, Oct 30, 2024 at 4:00=E2=80=AFPM Robert Nelson <robertcnelson@gmail.=
com> wrote:
> On Tue, Oct 29, 2024 at 12:18=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > During the last few months, booting kernels on BeagleBone Black
> > sometimes fails with:

> What revision of the board do you have, Bx, Cx, etc.

This particular one is a C3.

> Only C3 has the new PCB with the phy 'reset' gpio line.

Indeed.

> https://openbeagle.org/beagleboard/beaglebone-black/-/blob/master/BBB_SCH=
.pdf?ref_type=3Dheads
>
> For pre-C3 boards, removing "C24" has fixed a large percentage of my
> boards in my ci test farm, while it's not a perfect fix as some still
> fail..

Yeah, C24 affects reset delay, too. But Rev. C3 does not have it
mounted.  My Rev. C (no known issues) should have it, and Rev. A5C
(the one that sometimes needs a manual reset after power-up) has only
1=C2=B5F instead of 2.2=C2=B5F.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

