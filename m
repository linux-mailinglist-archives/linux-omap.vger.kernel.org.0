Return-Path: <linux-omap+bounces-2447-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4D19A281F
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 18:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F07DDB21CA8
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 16:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D971DC739;
	Thu, 17 Oct 2024 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fW9F76Wl"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E459A1DE2DD
	for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729181282; cv=none; b=WLg8jV+I1nOMPtDIESi4H1061aM9ztKE7PpkcxXwxmOpTrbQDe4acYgSv01EtXWPyleTa4kv3aVEB+ux/j8pV4brWgsMA4twwwGYVlelwKCbdNnP7NCFolzqN5dwamY6B8itnoAQeOD9QIi3i7/UydEQXOe5HTrmjHp8VvpNwEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729181282; c=relaxed/simple;
	bh=dRuk12QHv6ps7aNLPKYR+/znjdtbp5GFRMiK+/8rOSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NW2f2AzYi5kC4N2aqpiWD4M720mZS8v7ROUXKgXTNNW6qzi2ZbH58zv5xXYwhvrFtCp2CJDGkVKlZxkVywWzL1qUiXmSLcPiiKERgClNUfCrwa/UCTJqRBsv80X7yzZbimDUqVfJkbCNcrTAXZxYhi52d80Ij0ontDOzmkP76/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fW9F76Wl; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso1304542a12.3
        for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729181275; x=1729786075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dRuk12QHv6ps7aNLPKYR+/znjdtbp5GFRMiK+/8rOSc=;
        b=fW9F76Wl/5I4gaFa92un21m/KochcHCCGLcjqoT1a8+F5t/jCJkbP3tvnPUcC4VPNG
         upHySZ5ege+9aFDvWl71XtsWhMzCOnh6K+tiZ+/Cnb6ctWpnQTBq2d3wd0a/yaNv8KWP
         POhPvPTCTFPB8nWYQ+FR8+ezY8PPBoTaPOGJXb8rBVGowPzjItN3yKrOTbqH20Vqr6qM
         sDzXUZ3BfkBHsBdnDQ3G4MovgOm5hinhAX9wL+OiQEuupO3G2YC+AlSCMYt1wedU37Zp
         WJkbo/lk2Y3UfvOaK/7Plhul04FM8/wQRQ4njy97vBRyQfR8DPoAkmmU9ASfX2ZM0twI
         66OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729181275; x=1729786075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRuk12QHv6ps7aNLPKYR+/znjdtbp5GFRMiK+/8rOSc=;
        b=NGbmZ+ycZaqhRbzABGp8E8jhcAlKtnAELGKmEUk/TsWG5FSTJnP6Q8vI0Hhl8meihz
         rcRZtLljWSBRpkDmKcY7r/BWuEneZDcWpKi2h9FgBoh0QF4gL56NY4vPFQFFAUlc8DdM
         Qrw+x4gbD6FR2bVUOCIrMw2yVevc3Ne38u1On81s1QlWLtZZhanCvmaxYQdc/f0acl3r
         9Ckl1YJ0LAxIjLkB31W96WIG2xc3ixWIIxqGNBHNSsTX+8lvYzO9q7LTyWqfnkmcMKNk
         021REp/4uKWjwFvtM1Emay7ujkir7pgxwD+kpgIH/XkwhwJ4iQ8l66AsSTQ3YvjnLfHh
         QFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDmMmEXvVZ9SUAQynvDFAquyGUGCS6TCpR/HAFmWi2EJ6nsiA0QrYQnop+mPagxq+UFCrv88gcUz9t@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xXgOsimISBsB47itKkFVDNAa4Yr1ZcaVptpG+lrVIOPV71wD
	tKNhERekSEuQFKWmSkFdC/JuhgHa2Io7qjoQPD/R95mN0TdvS76EhYeXvph079A+FSsmE4QMgN9
	efrN68c/3pIHdAx7dVrlgVSPCg+onN03sewwDmA==
X-Google-Smtp-Source: AGHT+IHnqRPUFxMsxpUc6xNTucKBv1HPPKb9a15BqgxeA4o/UszURdq9L6szLULYtYWcPRZOXLQhdJp9uUm/wjBx530=
X-Received: by 2002:a05:6402:350e:b0:5c9:5bcf:db95 with SMTP id
 4fb4d7f45d1cf-5c9950618a8mr6873634a12.16.1729181275258; Thu, 17 Oct 2024
 09:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net> <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
 <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com>
 <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net> <CAFEAcA9AZS1dGaLG85zZE8U0d7AcrLgKXNbhxkCoP+PLmbFn2g@mail.gmail.com>
 <cf7c8f57-22d5-4a40-bd87-0f15f5457d48@roeck-us.net> <CAFEAcA98=2OdT9ykg5ibDuVLtSXuq4g0PLmSbxkYmt1SyKe9iQ@mail.gmail.com>
 <c354e331-39c4-4520-9a69-b62a8ecdddbc@roeck-us.net> <CAFEAcA-NreDmpCoFgrTJ5dEto5jQbjRg1eCfqg9Ns8VwQ9-Qzw@mail.gmail.com>
 <2e8046a2-c229-4ed5-add1-d31f437325b9@roeck-us.net>
In-Reply-To: <2e8046a2-c229-4ed5-add1-d31f437325b9@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2024 17:07:43 +0100
Message-ID: <CAFEAcA9AfH7cTO8TYSh9E+FnYN8SbTLDkXW8W5Jwi9Kfcddr6g@mail.gmail.com>
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

On Thu, 17 Oct 2024 at 16:29, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/17/24 07:29, Peter Maydell wrote:
> > On Thu, 17 Oct 2024 at 15:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 10/17/24 05:42, Peter Maydell wrote:
> >>> On Tue, 15 Oct 2024 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>> Please let me know if https://github.com/groeck/linux-test-downloads.git
> >>>> meets your needs. For now I added 'collie'. I'll add more after it is
> >>>> in a state that is useful for you.
> >>>
> >>> Yes, that's great, exactly what we need. I've put together a QEMU
> >>> 'functional test' case that downloads the collie rootfs and image
> >>> and checks that they boot. (I'll send the patches for that out
> >>> in a bit.)
> >>>
> >>> (I've coded the test case to pull the binaries for a specific
> >>> git revision of that repo rather than always-from-head, so
> >>> we're testing always the same thing against head-of-QEMU.)
> >>>
> >>
> >> Sounds good. I now also added information for sx1, so you should
> >> be able to use that as well. Please let me know if you need any
> >> others.
> >
> > I think sx1 and collie are all we need currently.
> >
> > By the way, it looks to me like QEMU has a regression
> > somewhere where we can't boot that sx1 test for the SD
> > card version -- it hangs during kernel boot waiting for
> > the MMC card. (An elderly QEMU binary I have boots OK.)
> > I'm looking into what's happened there.
> >
>
> Yes, you are correct. I did a quick check; the problem started with v9.1.
> v9.0 boots fine.

It's an issue with commit 1ab08790bb75e4 -- when we did a refactor
of the SD card emulation we didn't notice that the omap mmc
controller was also using the sd_cmd_type_t enum and relied
on the values of that enum matching the meanings of the
different values of the controller's MMC_CMD register Type field.
I'm just testing a patch.

thanks
-- PMM

