Return-Path: <linux-omap+bounces-688-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060785D4EE
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 10:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB6AA1F2257C
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EE73E498;
	Wed, 21 Feb 2024 09:50:37 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C1D627F3;
	Wed, 21 Feb 2024 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708509037; cv=none; b=YJVnFa+VjOjXrsaEogTsFWejDr+zGCHNm2qnda3OJ6zdFS60N3LjpF/A0ZiS+B39KJNEBYcNRoF5i2fBkS3qZMkLtLRCFsHNxhghzPFhqiFQwjomrya2IyWGv/KI9DPYk19f6CyadLYh6lZdmaYWsajQjbXjwbUHqfBTVqzo72U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708509037; c=relaxed/simple;
	bh=l0w5pmYRrOPkhcpKfMC4HaFIRK3kaxhmE3uyDOQg1uI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAr8Nzv6Ny9gWAtVL5UlLVES626P0YVf64oyUR4w+cLIquXNkwij/ctXhDTK+9db6btu+SdMYoXWrpMHYa4RMdBhVewMy76MA5539k22PNJYMoNwu9uCFCNrJWktpoWjsRo8gmXDa5sEJw/NabbLxq/UfZUm6QepunnR8S5QLPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-607f8482b88so48091567b3.0;
        Wed, 21 Feb 2024 01:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708509033; x=1709113833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6K6KfUK6UGxSBqRQLdjgANnoggkUhjVRWn4dxIyu/w0=;
        b=cSnqyXw2rB0j2/EwCFmXXbu7Bli3SzD57djaGnAubI94Bo418ryB519HPWJUeAwzhV
         GvcOR9Bcf9BC7BFHYdnHuewPY+OdYhBaEZAO97iMixDLa6S+u1PFq/S+cFpV1jKzKIZs
         X/cQ7Kt2i6GmDgEo+7wVnxY9MqspdjmT4I33zXmtIF6VDu89qfiJqS8kID1YkUP0WwHm
         A+R9IvBaFIgNHRt6/OfSDE60P88GJaRo9+W1KGR7LkzUTczJjzctn6BSi7bA2tX4TzlH
         V9wA3hTw6uDrPpRSDOcZ6nyBjbeuYrCE70dwVyjEUFxXBC/Z6NDC/t9UApnNaDUFgOMm
         jX5g==
X-Forwarded-Encrypted: i=1; AJvYcCXGgaH42fcvCZXhgGE+V5Zw0XiupXPyNUoirMDYt2UkzG9qCu8WinxLictTqmN1x12XeivBuGbk/Us5zVPBXG1XUK4WxRIS4iUv24/avAiqRWLP/btPgir6zu7VUau+EODcYM9V0ZbUI8d70KJeOKrm8+4quOWLPEg2xZRi9eoM++mjAbzUFwhNTaTdBVL/nAhb8inbG1YqYAnkW/Acvz27ebu0ATg=
X-Gm-Message-State: AOJu0YzkMtx4HHhxMTI2x3G+ZOJskB1l+tx7TTR1PxRlBI5t0nhLc7cH
	NW5SLxl8M9hOJ7/oL9wFGyPzC/E5bZyZDHKNWEgT//fmBUtC7MPNTACgy0dhd30=
X-Google-Smtp-Source: AGHT+IELfkHruk8SJrgkNQMURvLpsZm6/qQnoKWk3zsivCcBYeIsn95WbfIAKukImCcFhSIwu+bmlQ==
X-Received: by 2002:a81:494b:0:b0:608:6e94:9855 with SMTP id w72-20020a81494b000000b006086e949855mr3400171ywa.26.1708509032748;
        Wed, 21 Feb 2024 01:50:32 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id h11-20020a81b64b000000b00607f8df2097sm2451657ywk.104.2024.02.21.01.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:50:31 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60869c68926so16167047b3.3;
        Wed, 21 Feb 2024 01:50:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqfG7HunQ4lJjDOoGPmBE5VWnYy6sIoI2cKxuASkuPbQu2Bp6t1zHyEGRoJ4MkhrM1CAC1xwo1d6wzuj0rWKO0XexjnvaUBRwghLXiTYHJZS38h9UOzEWm2Q2LV4SavvPbFjIjOLoYXPUKzqcBm18A8oDaeBUqZRWCWSLHTeYe/zmA+cHfzbLiJaaXRvNmx/Sx2lWLC9dO4iQBznjLkXRZwXLKiFM=
X-Received: by 2002:a25:f903:0:b0:dc6:c617:7ca with SMTP id
 q3-20020a25f903000000b00dc6c61707camr16048280ybe.29.1708509031694; Wed, 21
 Feb 2024 01:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org>
 <20240127-mmc-proper-kmap-v2-9-d8e732aa97d1@linaro.org> <7f40cb40-1a1-532-75fc-d3376ed27a@linux-m68k.org>
 <CACRpkdZpyefnTyKEJXru_HZG8xcJF66Eb2pZhbk+HVvfzdh4yw@mail.gmail.com>
In-Reply-To: <CACRpkdZpyefnTyKEJXru_HZG8xcJF66Eb2pZhbk+HVvfzdh4yw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Feb 2024 10:50:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwuH-mPm1TJTfvf3FXSd_zj+yP7OL6uB=-TrqNOT+W_Q@mail.gmail.com>
Message-ID: <CAMuHMdWwuH-mPm1TJTfvf3FXSd_zj+yP7OL6uB=-TrqNOT+W_Q@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] mmc: sh_mmcif: Use sg_miter for PIO
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Adrian Hunter <adrian.hunter@intel.com>, 
	Angelo Dureghello <angelo.dureghello@timesys.com>, linux-mmc@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, Feb 21, 2024 at 12:01=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Tue, Feb 20, 2024 at 10:03=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>
> >      sh_mobile_sdhi ee120000.mmc: mmc1 base at 0xee120000, max clock ra=
te 12 MHz
> >      mmc2: new high speed MMC card at address 0001
> >      sh_mobile_sdhi ee100000.mmc: mmc0 base at 0xee100000, max clock ra=
te 88 MHz
> >      mmcblk2: mmc2:0001 MMC08G 7.33 GiB
>
> Hey it reads some blocks...
>
> >      BUG: sleeping function called from invalid context at kernel/workq=
ueue.c:3347
> >      in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 35, name: i=
rq/151-ee20000
> (...)
> >       __might_resched from __flush_work+0x20c/0x2e4
> >       __flush_work from __cancel_work_timer+0x118/0x198
> >       __cancel_work_timer from sh_mmcif_irqt+0x38/0x8f8
> >       sh_mmcif_irqt from irq_thread_fn+0x1c/0x58
>
> Actually that is the thread so the message is a bit confusing, the irq th=
read
> isn't atomic.
>
> I wonder if it is caused by this:
>
> > > +     sg_miter_start(&host->sg_miter, data->sg, data->sg_len,
> > > +                    SG_MITER_ATOMIC | SG_MITER_TO_SG);
>
> ...because I don't need to ask for atomic miter here, since the poll
> functions are actually called in process context.
>
> I've sent a patch, can you test?
> https://lore.kernel.org/linux-mmc/20240220-fix-sh-mmcif-v1-1-b9d08a787c1f=
@linaro.org/T/#u

While that patch fixes the BUG, it does not make the eMMC work fully.
It spews:

    sh_mmcif ee200000.mmc: Timeout waiting for 2 on CMD18

and no or limited data is read ("hd /dev/mmcblk..." blocks after no
or two lines of output).

I still need to revert 27b57277d9ba to restore proper operation.

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

