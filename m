Return-Path: <linux-omap+bounces-864-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B687677E
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 16:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE2E51F22B62
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 15:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74A21EEFC;
	Fri,  8 Mar 2024 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2pkQGtk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1471EB36
	for <linux-omap@vger.kernel.org>; Fri,  8 Mar 2024 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709912523; cv=none; b=JehEAmuLq84ALM4zv0Jwr/iaTLxSUoOVh6s9ENzm3toB8lDN4NU2S4awP8vJNYITJhRkj4UbgdCzR0a8tCDKFBYlFFZtgnkli6VpisKDCNw4FdEGhYXNONUSGodgwwkMwZF+NKreFOd3dpa/CKupzO4z4GSqH8iiSqu2mJZzrZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709912523; c=relaxed/simple;
	bh=pXVvuNILKZReAbM3I8kEMP26IkXYf/iPQwN4/EuEhXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YViMeCzjp6/OOlKmE9AtGMcMqcIe4VvumQPA1aiddej2LZntsXrRS6eY1zmPPFe+Aq0pAb6XfORlSlKqKOKbhXZ+/xtv8xZdPri7BVCt8Psvpky7KjrlxIJbI3DEzHaE/Xip9BargPegrV8mvlWvtIybK7XtnUt0ocBdDfKjB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2pkQGtk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5682f48532eso1102912a12.1
        for <linux-omap@vger.kernel.org>; Fri, 08 Mar 2024 07:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709912520; x=1710517320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MuJCFhvqT3ZKlqVaY9a/O3yhRkZaw9B/8BBmGsdaLfI=;
        b=u2pkQGtkKPi9ZtRXm4TIprKrpE3Dgc/IIenPk6X7Cc8VvDzVXZfwo8SvzGt1Hdpa6/
         OK2W2+nAX546CF8ueh0exT0XlkleO2VXzJA9FtfcNzIiXgf3yAaOJhanjGRmJGNvUxSz
         HHtcCIJcFRLLXV90PBPMojTEPF/5ysYZmuJ19gGQo/QufLwmSQye4728i66OeomopK+L
         8bZn+BA9rctlyrGxZRtuZ7SoA1u3naQCNvgsgIid/FoKcQJvvTrr+cY7DnFLQKAk6W/8
         wwCcPc9NykUTuR3NEwlAiqgEHPSBeo/qf75XwRgPVdlhvTqzWlAscEbz58i0GeacwKJu
         Tmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709912520; x=1710517320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuJCFhvqT3ZKlqVaY9a/O3yhRkZaw9B/8BBmGsdaLfI=;
        b=N4DqG6YvxUmT3eGfk5KQF0/i7tlqmX8vyX8SLuHcoFZ0C4yJJX91BVG3qFbVU4qzJC
         is4bP9SYzpTugA3PHTvf5MvBMrPAY7Ssa0wmXf6+efN8iAqh7cAFmyGOgsTpfBHTNtMV
         +DqDYv/m15OYOgtaSbzXaVEjG+Uvdn06afMfgQlAYEP+GExivAAEhI3AgATgPvmPfDw2
         nlzJMQmyCJbrfqJPPdvkKgJ/KpXijnrmmpU2rPQ4lcLepvh5+FODlY/O1xg5yCXy4iuc
         9R1XH/AUCFQwVaBo/L0pmQBEapxClKHkbWxR1J7bhhbm81IDmKd6A46JFF+F7sjawn5t
         9clw==
X-Forwarded-Encrypted: i=1; AJvYcCXowFnsZMe/sqqBr60DWeTkXZxrEeJjrdq5A6Qhn339LkRKX3ca2TNJQ0nSzpazYySP5bcmxfqrdHacAHBv/S1xPcnvvKivmm1THA==
X-Gm-Message-State: AOJu0Yy1a/WUBJ5ztRxnZ3oBaK4Nz6ytX7hs9cr55N2PjRKseFz5lOLR
	JaeL+HJ70EgK3KjcyLjyt9qHrM2/ZDq7NuZ9wU8dlmHX77wiPrXCudGdsBEzrD3P+kAkhesM8li
	XyCSoeDYCFTtyUGrh4DhDi8BwRY5fvJKVhvwfEQ==
X-Google-Smtp-Source: AGHT+IG2TebH+X8C70I+HEzlziFQiuRt9TuV9e/9a5ltxwwODUeTQlbvCO2831bYkGno2KtggkHpVeDVEgX+AX5HQ+s=
X-Received: by 2002:a50:9550:0:b0:565:9f59:b3b6 with SMTP id
 v16-20020a509550000000b005659f59b3b6mr674446eda.3.1709912519417; Fri, 08 Mar
 2024 07:41:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
In-Reply-To: <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Mar 2024 15:41:48 +0000
Message-ID: <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Guenter Roeck <linux@roeck-us.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Feb 2024 at 15:36, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
> > On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 2/12/24 04:32, Peter Maydell wrote:
> > > > The machines I have in mind are:
> > > >
> > > > PXA2xx machines:
> > > >
> > > > akita                Sharp SL-C1000 (Akita) PDA (PXA270)
> > > > borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
> > > > connex               Gumstix Connex (PXA255)
> > > > mainstone            Mainstone II (PXA27x)
> > > > spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
> > > > terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
> > > > tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
> > > > verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
> > > > z2                   Zipit Z2 (PXA27x)

> > > > OMAP1 machines:
> > > >
> > > > cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
> > > > sx1                  Siemens SX1 (OMAP310) V2
> > > > sx1-v1               Siemens SX1 (OMAP310) V1

> > > > OMAP2 machines:
> > > >
> > > > n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> > > > n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)

> > > > The one SA1110 machine:
> > > >
> > > > collie               Sharp SL-5500 (Collie) PDA (SA-1110)

> I am copying Arnd, the OMAP1 Linux kernel maintainers, PXA2 maintainers,
> and the Linux omap mailing list for input. Sorry for the noise for those
> who don't care, but I think it is useful to have your voices heard.

Thanks to everybody for your input on this thread. My
proposal is to drop from QEMU:
 * all the PXA2xx machines
 * all the OMAP2 machines
 * the cheetah OMAP1 machine

leaving (at least for now) sx1, sx1-v1, collie.

Rationale:
 * for QEMU dropping individual machines is much less beneficial
   than if we can drop support for an entire SoC
 * the OMAP2 QEMU code in particular is large, old and unmaintained,
   and none of the OMAP2 kernel maintainers said they were using
   QEMU in any of their testing/development
 * although Guenter is currently booting test kernels on some
   of the PXA2xx machines, nobody seemed to be using them as part
   of their active kernel development and my impression from the
   thread is that PXA is the closest of all these SoC families to
   being dropped from the kernel soon
 * nobody said they were using cheetah, so it's entirely
   untested and quite probably broken
 * on the other hand the OMAP1 sx1 model does seem to be being
   used as part of kernel development, and there was interest
   in keeping collie around

I'm going to mark these as deprecated for the QEMU 9.0 release,
which by our deprecate-and-drop policy means they will be
still present in 9.0 (due out in April) and 9.1 (August-ish),
and removed in 9.2 (December).

I'm potentially open to persuasion if anybody thinks I'm
being too drastic here; persuasion that came attached to
a desire to help modernise the QEMU code for the relevant
machines would be the most effective :-)

thanks
-- PMM

