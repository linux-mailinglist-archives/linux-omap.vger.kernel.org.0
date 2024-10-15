Return-Path: <linux-omap+bounces-2427-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC999F430
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 19:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F5441C223C3
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 17:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDD01FC7D1;
	Tue, 15 Oct 2024 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viJ8u3cB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C4D1FAF19
	for <linux-omap@vger.kernel.org>; Tue, 15 Oct 2024 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729013754; cv=none; b=Z/DiLcvM16ZVGo6FKWLI8+yFkMCJJdL1t5eX12Z2tyvQ+L8Hz0ENQJBGOBVKTABsTpWWyubOmGrmRsIibnZjc7qbPpDyTW7EOwoXFd3mZIR2IzFzhIhLkngnzZxBVI0rNSexe+WJ+yPHdbwbbzJr4b4gdtS5er5bJXdHdYSGROU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729013754; c=relaxed/simple;
	bh=7fFDtqQeUn8FKjG1ypkXPcKNei+8XzO20QcPnpFqHfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTkP53eJM1hue31A5RVJs/APujhAJUfhqzLhm3x4nfmzCLHuEc8DvVVdAWmdHVZ+r+2u3TOJtbRgieBZpir2Wavk/Fxg0SGi5FWDaBq/LUZyJ/mBfFPb10/8ymyFo7QCkYwMjwpfZx7qNTX+oQZsp2zLgLe2/9HM2lw1PI5cC4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=viJ8u3cB; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so119077a12.1
        for <linux-omap@vger.kernel.org>; Tue, 15 Oct 2024 10:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729013751; x=1729618551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jWY7XzWZH9AEdLY2aHr1NP7a4yQuvuQNlf2nfUtAu00=;
        b=viJ8u3cBgUuju9fCFQjaU2wE8IZ/qi4n0F1itwwQU3og/z+/kgxw8Z9kyWdm3yZQqK
         O9QKwmVFSRh0JrXwoBnblvuki15GK29hq9fwIiKAaIvTvUVQv5HM+CynGOELtnRJOgoe
         fZrm526ADsWWwMvMm+0tq/5fnQAKpbE8oFMPJQ0NA2tQ8H6Oi8VyEfeLZZyPw9K459fo
         LhHfkf32TKdK8s89QH1Kme94DQDIjviEwZA0qjTa8ZcZRR6HalxdUQGyUH1waHNxHdTB
         1oCzlEzHooMAE3PTq9G87TSEZw9DuqxwzrvmIj7lwS5m/SuatvuS1yDGf05KEcKA8CWK
         9m+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729013751; x=1729618551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWY7XzWZH9AEdLY2aHr1NP7a4yQuvuQNlf2nfUtAu00=;
        b=EWgz3O+H0gr+N7ZvocrwaEXEpoAQwpcYaFVI3JwflQrYOpEchBCEkRRnCwITT1k09T
         ygZ9v6vN8KF3wDSTBpPr9thp6h3LoAF0nhf563skAc3XOIY9rsZMDc1dgcLPUTPC2+tM
         ACpdZA4XQx/GsYnsrNRtXZ1dA0+Mb3HQwXdm0cKm66uuWgtxd6cRRndGmQpdTwrx8vUU
         IEm0On0uQzCkyJ2BXcdg2cHIC8ch9lVdzWFWzb0l6XnONOGN3QSmbDh4B5Jg57DjMQpO
         T++BNuqzjiMDGB6MSmokPXeRzYIyPYFmhBxCXLB7Yu43dyHveYQbn8pDip91oyvZRZF6
         imTg==
X-Forwarded-Encrypted: i=1; AJvYcCUzxBL5HKG0NeZr9oMk8SwlpR/eGdaAFO/JnqUFZqLFlmSV0smJlPve3KjOK1sYaG7A78bLCGV4678d@vger.kernel.org
X-Gm-Message-State: AOJu0YwxieaidDKFQWYyvlCSoMlvkoMzgDzc82SdXLLHjQ3AxuMGJeow
	2nnLHX/1833yPM1DjaOjrhkgzHlZj0KYXI7yQzFNjkIv6EHO+Qv3uKUQClqeJG4+GZ/KUk4DOtz
	PZqJoWhJbTAFIVQM1erC+KHwvWv6FNfWqfTrqug==
X-Google-Smtp-Source: AGHT+IEwOscD4AxH6rXdp/SCilbhWkxkH8QjeLSkRYuXom/e1ACud+CjgcontHRzLvnUZ4SnfePVMISzzJwPKeQIf1g=
X-Received: by 2002:a05:6402:13c9:b0:5c9:46a7:527 with SMTP id
 4fb4d7f45d1cf-5c94759070dmr13772080a12.17.1729013750498; Tue, 15 Oct 2024
 10:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net> <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
 <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com> <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net>
In-Reply-To: <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Oct 2024 18:35:38 +0100
Message-ID: <CAFEAcA9AZS1dGaLG85zZE8U0d7AcrLgKXNbhxkCoP+PLmbFn2g@mail.gmail.com>
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

On Tue, 15 Oct 2024 at 18:30, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/15/24 10:13, Peter Maydell wrote:
> > On Fri, 8 Mar 2024 at 15:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> Thanks to everybody for your input on this thread. My
> >> proposal is to drop from QEMU:
> >>   * all the PXA2xx machines
> >>   * all the OMAP2 machines
> >>   * the cheetah OMAP1 machine
> >>
> >> leaving (at least for now) sx1, sx1-v1, collie.
> >
> > This has now gone through. I'm now looking for test images
> > for these remaining boards, so we can keep them from breaking
> > when we do refactoring and code cleanup/modernization.
> > Specifically, I'm looking for:
> >   * QEMU command line
> >   * all the binary blobs that go with it (hosted somewhere that
> >     doesn't mind when our CI downloads all the images to run
> >     its tests...)
> >   * ideally, exercising the SD card interface if present
> >
> > Could the people who are still using/testing these boards
> > help here ?
> >
>
> You'll find everything at https://github.com/groeck/linux-build-test.git,
> but give me a couple of days and I'll create explicit information.

Yeah, I had a look at that but could only find the rootfs
and got a bit lost trying to figure out what the QEMU
commandline would end up being :-)

> Is it ok if I create a github repository specifically for this purpose,
> or does it have to be direct file downloads ?

A github repo should be OK -- I'm pretty sure we can download
from there (e.g. we already download some rootfs images from
your linux-build-test github repo).

> Note that my tests only boot from sd card for sx1. I also don't have
> tests for sx1-v1, only for sx1. I don't recall if I ever tried sx1-v1.

Looking at the QEMU machine model code they don't differ
much -- sx1-v1 has a bit less flash, and that's about it.

thanks
-- PMM

