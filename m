Return-Path: <linux-omap+bounces-2445-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF19A24FE
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 16:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BA9A28385D
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 14:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947AF1DE4C5;
	Thu, 17 Oct 2024 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBCQrxYW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F611DD540
	for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729175361; cv=none; b=XlUyXVbHLUWp5MlPk01iOrcCyxBrFL9X+jCRu4sZKgjVwpFp616+L75oZwCXp2eXQhJKg/mFZb1FGGRXJ0evEbeP28v+XK55jnA9WzFqhUoKy8jPs2MzF+LHXL5kN1wdzPM6Z8sGfqhKPCbBm4XLkG+m4ttj4fiigyE33Jb//OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729175361; c=relaxed/simple;
	bh=eFOX/syYZtwFsFH68uKcljYWd2x+NpIGFddXxltWQT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNkdukoqeka5YxK0vhOUk1t5Det4YtsjaYXPR5QeWSquerhQ9ykrAYBNmseMnMArFGEEypUZoMY194IuPSfwbprstSt5Q43QkHBJ3PmycwI5o3tSDX1HH4Sjx4VJjRu0umldVdmXoXLaWf2IseaVHbmzQeYBsE3szEQYy75EggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBCQrxYW; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso1630111a12.1
        for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729175354; x=1729780154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eFOX/syYZtwFsFH68uKcljYWd2x+NpIGFddXxltWQT4=;
        b=xBCQrxYWzAxmk1AHe4j2G1XAi+1gGQ1+VAv+qbPvCah75uiIkE4Ez+kwD5FnM+Y1AK
         npVvKadMfTpRY8DxCAdRo59dKVJEyIZRJlvi8LumqxaOaXLcmyllHpXZs9J39NPKqK/9
         iJeAiBAp3YlQmZvAmWacimYV0U5QAzxy0Pl0pNEYrfVQl9WLCJlbn3PDJCf4TTWdy9Yp
         6E08RnD8I6vRhYJQHMjOZpYsKioaEAjAkB4AXj2eRGDI+vLdbyaJJxS3YHIBufGodeN8
         Gj8RhTfaFiiM6aUR7gQYd7IN4V6/Paqei7Ji/a361xXR/tj0lkumYXifiG4yP8zUR3W1
         7tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729175354; x=1729780154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFOX/syYZtwFsFH68uKcljYWd2x+NpIGFddXxltWQT4=;
        b=g359w+Ns+tUehZQW8hlnlmwUuTgUpZxWegc8NUUZLqXz6rDgzJ41fQjSG1fkulbdjU
         1GAG9HwnFMiLCnEkwP4x4RDJvsuYfWDUeZnJRdk5bj1JyScfkjCPdYu5ZR4mzGXzWYno
         2/TYOm05ltsptKvOZ8X1fqMFtrCfCmB8EIxUIknKQ8DNjKNSgsmkXbJ/5eWEkJ40ZCnx
         NZ9BBIm+VbNS5F7cWo/i1kLWV9X4oGErCDhUpDADsjuBkamy6xEWPLEMdHjohzEDWfvm
         Ec7Ky7S9I9yiBsjiCaog5FbXkbzGCvjSDWEgFGeZkqajV/ip9KUkowsv15y5hVFKX8oe
         BvCg==
X-Forwarded-Encrypted: i=1; AJvYcCX2xruAYlrOsAlpycqeGqWACIIq8iGr3L/GRdvCvVJ2b4Dd6LHI5iNwputyED/pDHBG7/MSeDccY/JZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxX3ksjtr/FNDLo4UexrIQ6NsBWdn5hHgxX/4kVBhAwCpknTPzT
	uUl52ab+MC9PCcpQCmOS3UZAMpYvWuQtTR/lfJpt495YcyQRTJ4aen4xdr4jH9zPFmO2PVblu4L
	oEIvh965IU80g4A+UxK+UfXDpzh3hQbXQZB1ZEg==
X-Google-Smtp-Source: AGHT+IFqQu5BsSjDaJ/Qq2jP0g37QIiFZ+q2FqbzPIoawFDWDK8RWGYsqGRH1uGeI2eeHFRw4RA6TDGSNtdAqvaKfg0=
X-Received: by 2002:a05:6402:4404:b0:5c8:d9b8:9325 with SMTP id
 4fb4d7f45d1cf-5c9a5a1c1aamr4631517a12.5.1729175354260; Thu, 17 Oct 2024
 07:29:14 -0700 (PDT)
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
 <c354e331-39c4-4520-9a69-b62a8ecdddbc@roeck-us.net>
In-Reply-To: <c354e331-39c4-4520-9a69-b62a8ecdddbc@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2024 15:29:02 +0100
Message-ID: <CAFEAcA-NreDmpCoFgrTJ5dEto5jQbjRg1eCfqg9Ns8VwQ9-Qzw@mail.gmail.com>
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

On Thu, 17 Oct 2024 at 15:12, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/17/24 05:42, Peter Maydell wrote:
> > On Tue, 15 Oct 2024 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >> Please let me know if https://github.com/groeck/linux-test-downloads.git
> >> meets your needs. For now I added 'collie'. I'll add more after it is
> >> in a state that is useful for you.
> >
> > Yes, that's great, exactly what we need. I've put together a QEMU
> > 'functional test' case that downloads the collie rootfs and image
> > and checks that they boot. (I'll send the patches for that out
> > in a bit.)
> >
> > (I've coded the test case to pull the binaries for a specific
> > git revision of that repo rather than always-from-head, so
> > we're testing always the same thing against head-of-QEMU.)
> >
>
> Sounds good. I now also added information for sx1, so you should
> be able to use that as well. Please let me know if you need any
> others.

I think sx1 and collie are all we need currently.

By the way, it looks to me like QEMU has a regression
somewhere where we can't boot that sx1 test for the SD
card version -- it hangs during kernel boot waiting for
the MMC card. (An elderly QEMU binary I have boots OK.)
I'm looking into what's happened there.

-- PMM

