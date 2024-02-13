Return-Path: <linux-omap+bounces-566-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 539C78534D6
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 16:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6B511F2A4F0
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 15:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB145F46A;
	Tue, 13 Feb 2024 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JW6BxYZi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14975F462
	for <linux-omap@vger.kernel.org>; Tue, 13 Feb 2024 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707838619; cv=none; b=oLZXQk3PCpK1WGTxOYTBGoftSW1W9p767wSXlgCwJUXGPwFqiqIIehQp3lOa8AAcL+DWweJx436KN0zGYpo8cxBvMnCKJQZzOPnsHZKQeGvCJSBAOgG/deIJoFTW4gfvPY43m7JOMwH6lkBPrJ6qaiKaS4ji/oUsxqgt/r4u9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707838619; c=relaxed/simple;
	bh=aX40FuEDocdvd+3rCTHkuFqSf5KjruPP4Rv0BaTjy/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1sFg5+MJqwJjGHaXac6bnGFoFakgogxWcp6NzcrrcfGaAs4JzKUR2/YxyIgvbgcMSsSDOflVg+TuiNwFZOgGx/I02FJFvS9iSCimiuQXGcHszWqMmU14YkPgJC/pYTQ29sk0O77l39kk3vJap69yGwauN+OFHVTMUlULJxxr1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JW6BxYZi; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2046b2cd2d3so3546886fac.0
        for <linux-omap@vger.kernel.org>; Tue, 13 Feb 2024 07:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707838616; x=1708443416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIY5JGQ893Swhqnl00DbijJIsjOgVQf2gvslS8q3HrA=;
        b=JW6BxYZi1d67MAU+ppklwIUFKkJRDBLlmeZN+exe6OFQnQZqTd8TZtnjATjhqbTUda
         tg2CuXnDeqt8oj4wOmYsTyd3/2eW++mxGakLFRscGSgDlBtAOn8fn21ddHmDWgb5NS4x
         2rS+Tne+Ev3X6OmqSH95fbSwdJgK3hwvCDlizaZbShIoXdu8EzMw2UXERlYUl0g9AMgy
         get9QbZTfVV4a1HH3X0P3Pn4lLZWu5HpRh37FfwMcD3MVgzj3Rq+UiGBOXy4t50KX9eB
         ch9T+koTRaiOuVSAwbN7jEhjmPWvKd5BO8bQ2Hn+KELrMYxRe9TD8RZ2+FyWtL/7NdXB
         WcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707838616; x=1708443416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIY5JGQ893Swhqnl00DbijJIsjOgVQf2gvslS8q3HrA=;
        b=Cf75trvCWfrJKg9po1WwKsqpUpRuMIsGdkB+8j2UugFMyXQ1XP2yOknbKPSduz7LnQ
         au0T1dnJszTdFJcu7cKTp9h0KZF8WtykTM2e6RYOFSWCU8Km+KVKfab1319/xAqsltsZ
         HaHKcXZULUbRcyydZDS2hGXGKNhxTNdkKY5m7ADvRBfBRmb5fyjv5AAd0Yz9Idx58Bq5
         4JEyWTwmn2qS1oWgT7SZ3mP8r4AsJ6f2AW5Wt9dby2ovl6T1Jl9ikuvVx2Cls++fbjuk
         /AdGCbujXZHTyCGO0htYaO6UP7605uQ6au7sfYOiZXVt8jKhtGPk83YK/DltCg1nQ/Zx
         acnw==
X-Forwarded-Encrypted: i=1; AJvYcCVE1vEfYNeaTDz9MHVx9Y1XLXcDFwbL3KnJIxN52cg/xEn29NjhkIS4dGjJ2sWN2QVx9ZyuH83i8s9YAN46N1+9ouhqlU3zw+DXKg==
X-Gm-Message-State: AOJu0YzuLvxk5QNK+Ch951bdEcG8M6OpkqqGmSGZgWsoXOnqdTic9hw3
	VXgnumaXLcEoXjffyEKoOJRcNi9q7eORPEhNZr/OvFveBXDb3lSI
X-Google-Smtp-Source: AGHT+IFa+472yvNq5+GsuFasZU+/8Xjw3xwsIsqaMKno0kfqU0uXpdB27vhvMQ8GxhAhSB0VSh8WFA==
X-Received: by 2002:a05:6870:b69f:b0:218:d3dc:67de with SMTP id cy31-20020a056870b69f00b00218d3dc67demr13812437oab.22.1707838616535;
        Tue, 13 Feb 2024 07:36:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9ryLT/C6nC6ffPkb6CJ6bWj8Rbc+ORhMU16wQBSF+23rZMNwXjnzmgdqkTdESikJ5AjwYG439ngcITIMu6aWxH8D8eRCiKfOeeEVFoYWQ0mtqaRu56mW6zJQdBcgH61gDyLeHq4bYqBL03BEpzd19jmlTjOJmnpSYLsT3WoLyDf3CSnK1q+bbCM5KpilpAZ6JHPoVvdBZ4kfknyi8IhPFk7rO3aDA6blEn75vxGY5IubWcZ8G//jyShPg4Qfgb9K4ALMH3sR6ww/SYN5gLH1K3j0mT2YnsvjrjTAFeZt9a6RjkRJ2jnsSYSNPnvsXc/JIae7k3FCHGRgFyILb6JKz3zlxZRSzlu2DpWF6dWG3
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n5-20020a632705000000b005dc36279d6dsm2560973pgn.73.2024.02.13.07.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 07:36:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 13 Feb 2024 07:36:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Message-ID: <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>

On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
> On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 2/12/24 04:32, Peter Maydell wrote:
> > > The machines I have in mind are:
> > >
> > > PXA2xx machines:
> > >
> > > akita                Sharp SL-C1000 (Akita) PDA (PXA270)
> > > borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
> > > connex               Gumstix Connex (PXA255)
> > > mainstone            Mainstone II (PXA27x)
> > > spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
> > > terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
> > > tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
> > > verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
> > > z2                   Zipit Z2 (PXA27x)
> > >
> > I test akita, borzoi, spitz, and terrier. Upstream Linux removed support
> > for mainstone, tosa, and z2 from the Linux kernel as of version 6.0, so
> > I am no longer testing those.
> >
> > I never managed to boot connex or verdex.
> >
> > > OMAP1 machines:
> > >
> > > cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
> > > sx1                  Siemens SX1 (OMAP310) V2
> > > sx1-v1               Siemens SX1 (OMAP310) V1
> > >
> > I test sx1. I don't think I ever tried cheetah, and I could not get sx1-v1
> > to work.
> >
> > > OMAP2 machines:
> > >
> > > n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> > > n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
> > >
> > I never managed to get those to boot the Linux kernel.
> >
> > > The one SA1110 machine:
> > >
> > > collie               Sharp SL-5500 (Collie) PDA (SA-1110)
> > >
> > I do test collie.
> >
> > All the ones I use still boot the latest Linux kernel.
> >
> > > Obviously if we can remove all the machines that used a given
> > > SoC, that's much more effective than if we just delete one or two.
> > >
> > > I don't have any test images for the SA1110 or OMAP1 machines,
> > > so those are the ones I am most keen to be able to drop.
> > > I do have test images for a few of the pxa2xx and the OMAP2 machines.
> > >
> > I don't mind dropping them, just listing what I use for testing the
> > Linux kernel. I suspect I may be the only "user" of those boards,
> > though, both in Linux and qemu.
> 
> Mmm; there's not much point in both QEMU and the kernel
> maintaining code that nobody's using. Are you considering
> dropping support for any of these SoC families from the kernel?
> 
Not me personally. Arnd is the one mostly involved in dropping
support of obsolete hardware from the kernel.

> It sounds like between the two of us we do have at least one
> test image per SoC type if we do keep any of these, but
> if it isn't going to inconvenience kernel testing I'm
> inclined to go ahead with deprecate-and-drop for the whole lot.
> (With QEMU's deprecate-and-drop policy, that would be "announce
> deprecation now for 9.0, keep in 9.1, remove before 9.2 release
> at the end of the year".) At a minimum I would like to drop
> the OMAP1 and OMAP2 boards, as that's the biggest code burden.
> 

I am copying Arnd, the OMAP1 Linux kernel maintainers, PXA2 maintainers,
and the Linux omap mailing list for input. Sorry for the noise for those
who don't care, but I think it is useful to have your voices heard.

Personally I think it very unlikely that anyone is using the latest Linux
kernel on any of the affected machines, but I may be wrong.

Thanks,
Guenter

