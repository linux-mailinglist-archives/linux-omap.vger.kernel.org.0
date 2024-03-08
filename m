Return-Path: <linux-omap+bounces-865-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2268767B5
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 16:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E91181F217E1
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 15:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D80B25761;
	Fri,  8 Mar 2024 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB5zhnXE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E1B25753
	for <linux-omap@vger.kernel.org>; Fri,  8 Mar 2024 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709913028; cv=none; b=krVtwuCH/f40QvtIhdKsPD+dO23SPkj9pBGGQIqFN8IruvS8p9gak6UamapRC4EYqZU/mx1N15sfGOMqJyKZKUWE3IwoCQmmAIjOGz2A+JXJys0Rj1bew6EVxDfYTOYQlCDYBd5xwTd1PakAKlT7IHAoNiMJe7BYsaSW3+Gzko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709913028; c=relaxed/simple;
	bh=t2NeElMB2knOQL5W1WEhswEKVnzrLqFueHwpFIq4xcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lai5jB4X71M0Dl7Lr7kpRTMPshT6nhgOsa9Wyxj3jRCnnvV2WSxRDHAb/+RL+Roc1djhzCOYr3xm8o4RAo4phhBCtBPASK17iyxCB1K1ygSX5NOsiY3GovLJxpmjRY4K5cGNAYFZjhDdcAM/sT7gu7tE87d+D/HYMlTB7o8LOTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB5zhnXE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dd4bc7a87aso4704805ad.2
        for <linux-omap@vger.kernel.org>; Fri, 08 Mar 2024 07:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709913026; x=1710517826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23oOzcuTB1Gfk7Qn6xARYHnZuwpEyvIMScPizHFsYdE=;
        b=UB5zhnXEKh/Z4vHOr6BW8j5UAHPDrxnM5vtrYUiJB4DbJhSd/+H9f0R2CZ8D+7B8RI
         sj7Nme8H7Tz7mel7pfQkLcNLqK0xjwi6VkDlsu5ZQi70FhjWb/wUxFOGUfxQLKWDWvJL
         3+mARkysI3gS6NuW+InFbB6fXegN1wke0iDwcAe6RYEvBR/5rd76vZz+IGAP85qsPr1+
         RQem/WQCCovDDExYc3BRDSH3yV/HB+qMf3QOjCXQgf3S6kzvDP1a5Y3aTurFvCP+GpIf
         0qSlpS/WkJGPBWcQ/AP5jzIJVNOv8tPhYi9Rih0S395dys41b+m1B+pAZZKzT3VSLoSY
         hQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709913026; x=1710517826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23oOzcuTB1Gfk7Qn6xARYHnZuwpEyvIMScPizHFsYdE=;
        b=XQWs9UhAsNd+RjLGyBJzsgWN4i2pKvio2ULdsGOYjyC2UYSKAwSU3H5apIdEzZioga
         SBYSfZF+zMiu4YUVYH9GjH1hxhRbuWnFxcyJWcuGyoJZz6Lj0uDdC5gZB5wbWpJYUdAK
         1GdXX3zb16mTF91paIEFWN4B97c0FmTlK0lh7TOazjpTHV3KP+mkogQ0Q8klXr6FHQ63
         k0PUQQfmeACH+Sx8qlWwfxrLmVgWOige4zU3Lp05xs0Njgv8DR4zX6j4nCnw5IdNs3f3
         1rpDJqMS3XUktqQW5V11Lc6Uqd2f7GhHdhgbevbhlelhCK1lvvyAxHg9rEqsFh/Uc8Yy
         x5lA==
X-Forwarded-Encrypted: i=1; AJvYcCV3mxQiteZWHi4o9c/K7LC8y7OgI6GUN7LLTNThNDQeADjcDKrvSj15LhiFktyTlC29VxO6kcDkpl8MZgvCLVtKmQE3FzE0RRSRRg==
X-Gm-Message-State: AOJu0YxDah9DIt8+Q6KHILrZA5f5z7c/69zq3vUJERujNyZ8as54UdRv
	eCKw/0FENi/k4Fsxnii+I4/BoLcWBfcfpxqNb7ctnjcDrJ2AvcpC
X-Google-Smtp-Source: AGHT+IHalrECY7UAyk7uokIYRcz2OQHqxIaVOP9fz0RsWjLNZUEH8o1YKMfXdxMizt4wEV472nWRdg==
X-Received: by 2002:a17:902:d503:b0:1dd:1c6f:af57 with SMTP id b3-20020a170902d50300b001dd1c6faf57mr12971152plg.42.1709913026233;
        Fri, 08 Mar 2024 07:50:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n7-20020a170903110700b001dc9893b03bsm16356588plh.272.2024.03.08.07.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 07:50:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 8 Mar 2024 07:50:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Message-ID: <d5dd9334-e25a-44f5-afc4-c01ea59c02be@roeck-us.net>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>

On Fri, Mar 08, 2024 at 03:41:48PM +0000, Peter Maydell wrote:
> On Tue, 13 Feb 2024 at 15:36, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
> > > On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wrote:
> > > > On 2/12/24 04:32, Peter Maydell wrote:
> > > > > The machines I have in mind are:
> > > > >
> > > > > PXA2xx machines:
> > > > >
> > > > > akita                Sharp SL-C1000 (Akita) PDA (PXA270)
> > > > > borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
> > > > > connex               Gumstix Connex (PXA255)
> > > > > mainstone            Mainstone II (PXA27x)
> > > > > spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
> > > > > terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
> > > > > tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
> > > > > verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
> > > > > z2                   Zipit Z2 (PXA27x)
> 
> > > > > OMAP1 machines:
> > > > >
> > > > > cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
> > > > > sx1                  Siemens SX1 (OMAP310) V2
> > > > > sx1-v1               Siemens SX1 (OMAP310) V1
> 
> > > > > OMAP2 machines:
> > > > >
> > > > > n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> > > > > n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
> 
> > > > > The one SA1110 machine:
> > > > >
> > > > > collie               Sharp SL-5500 (Collie) PDA (SA-1110)
> 
> > I am copying Arnd, the OMAP1 Linux kernel maintainers, PXA2 maintainers,
> > and the Linux omap mailing list for input. Sorry for the noise for those
> > who don't care, but I think it is useful to have your voices heard.
> 
> Thanks to everybody for your input on this thread. My
> proposal is to drop from QEMU:
>  * all the PXA2xx machines
>  * all the OMAP2 machines
>  * the cheetah OMAP1 machine
> 
> leaving (at least for now) sx1, sx1-v1, collie.
> 
> Rationale:
>  * for QEMU dropping individual machines is much less beneficial
>    than if we can drop support for an entire SoC
>  * the OMAP2 QEMU code in particular is large, old and unmaintained,
>    and none of the OMAP2 kernel maintainers said they were using
>    QEMU in any of their testing/development
>  * although Guenter is currently booting test kernels on some
>    of the PXA2xx machines, nobody seemed to be using them as part
>    of their active kernel development and my impression from the
>    thread is that PXA is the closest of all these SoC families to
>    being dropped from the kernel soon
>  * nobody said they were using cheetah, so it's entirely
>    untested and quite probably broken
>  * on the other hand the OMAP1 sx1 model does seem to be being
>    used as part of kernel development, and there was interest
>    in keeping collie around
> 
> I'm going to mark these as deprecated for the QEMU 9.0 release,
> which by our deprecate-and-drop policy means they will be
> still present in 9.0 (due out in April) and 9.1 (August-ish),
> and removed in 9.2 (December).
> 
> I'm potentially open to persuasion if anybody thinks I'm
> being too drastic here; persuasion that came attached to
> a desire to help modernise the QEMU code for the relevant
> machines would be the most effective :-)
> 

sgtm

Guenter

