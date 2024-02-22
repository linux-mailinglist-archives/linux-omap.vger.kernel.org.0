Return-Path: <linux-omap+bounces-702-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51285F42A
	for <lists+linux-omap@lfdr.de>; Thu, 22 Feb 2024 10:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E4081C20818
	for <lists+linux-omap@lfdr.de>; Thu, 22 Feb 2024 09:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C3438380;
	Thu, 22 Feb 2024 09:21:10 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1B3838C;
	Thu, 22 Feb 2024 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708593670; cv=none; b=P7E+ILjWjGzv6djuXoP10lmnGrcbbWCQo52V9FMcs4jxKzVQpkSxtvim50ft9GFyAOoatH1bHvaOb5rE2GrvYbwUihk+919p1JhRFkGPK1bUYw4mZqbXUbgSLNscZAO9jPlswjjd2DEhO7aGjtclpSeUu3o7Thg+V8nUENIYqKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708593670; c=relaxed/simple;
	bh=NKtzE7BIM06brClL6md3g/GK1JCKVFr64lTcGZ/YHVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcSC2ZlXqtAzSacMcRGdRxQRdhlnYnwPrpomo6XQQ8YNjJTFS8m8XAzuZ8Ve7qaYvPSjPSAzvpp841ckpfHv0iABkSSbntEp2J04wz1W0aLl1SXP/spGA4BrZRnZ7dY5qnxJ59c/IpZnthCbCTJsUn5m5tzC7pO/zXsuol3W3vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60884277a6dso16472737b3.1;
        Thu, 22 Feb 2024 01:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708593666; x=1709198466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYRdRsGICKVhHBscyhl69gwGxFN1Rh3mKKhBPHRcx2c=;
        b=jFR1LhkuVyTvsYmdaTSUWBpH1AeXNXXgHsR0sAEINv99K1PZWY4twTpqPlXEzvoxWF
         gm3UaLXPGS0lm8c5LjCAndKKsCXs5POLhWTamdr2pZzIx+BTdwqQQ7XGlrWj1n90liyc
         cOmghsHIZcm4+HYxjjXFm7RuXOH9ih2O7gKyns+hFPmo4e6/PJPs7zSGkDTflPaJJmfG
         Rm1oOLRftXZkGmL5XgNKVCdGJZIlxpVLInqG2ajzJCoCzfvT4/L23GSxQEUL6KwYIU+V
         KLiLOEDvVsoG6hb2mbWDU4h9OhiMyFRZ8KBFzv2X1oQzbOxkKkDU3LqmkRhAEoL7azeT
         RYOw==
X-Forwarded-Encrypted: i=1; AJvYcCVIdsA6ez/dq6syigZ81FwOI7BSgScnIWGXtUdBBKOPhS2W/D1ddcO6mbun2mRyq+viPsi3xsmRAfM58ofG1QUZZ15qa53g7MdmkaS4FjzvlYivgnL/cXB9Vi8YF+1R3+VYcW5un/IPmeeTupy8oiW37uaiMH/I7jxYpCi3m8OyAaoXPr59tfJgRQW7k9BDHYZ5Srm9Znp5xm/xQapk3GUBG8AOQMo=
X-Gm-Message-State: AOJu0YxGMkAzuj0lXUgrTPBzT2N33TEjD6eIwEyWzJ7thyhLZzVW7TX2
	TffhjZbz6KRFCkg/yWLapfpWmzKKgzMrBkVibdYvqhVH8iKy5xvFnsxU5vmzONI=
X-Google-Smtp-Source: AGHT+IFyNTz5D/3JTZfEGul+SQRNih7/F0SvBP3aTCgZL+AiwgAuRTIraMHcJ7gtOqT0GYGlzIyCGQ==
X-Received: by 2002:a05:690c:d:b0:608:af6:afa4 with SMTP id bc13-20020a05690c000d00b006080af6afa4mr17275422ywb.39.1708593666151;
        Thu, 22 Feb 2024 01:21:06 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id z144-20020a0dd796000000b006089c027c18sm150090ywd.94.2024.02.22.01.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 01:21:05 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607dec82853so72108057b3.3;
        Thu, 22 Feb 2024 01:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxbAF977hluj+q5uSfri2JcR6eF7d0iceqKWRThUvewtD6mhpTgh2J4K6wNmreph4XPKiSGJQ1PZyyL8c6+cdtqBL+rOpAJKRLN0D9CTMFiaSEBL+Xliumzk1UIpwxPkuioxCUum4+L/Lw1DdrqGOTDSHhOZDIvvZEvqAWwxsLWL/OxmxDE2tAEPX6HUEu9tHr4otZl8ZcblVab/G49x34qYLBvuI=
X-Received: by 2002:a81:9945:0:b0:607:d9fb:5144 with SMTP id
 q66-20020a819945000000b00607d9fb5144mr18717240ywg.13.1708593665557; Thu, 22
 Feb 2024 01:21:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org>
 <20240127-mmc-proper-kmap-v2-9-d8e732aa97d1@linaro.org> <7f40cb40-1a1-532-75fc-d3376ed27a@linux-m68k.org>
 <CACRpkdZpyefnTyKEJXru_HZG8xcJF66Eb2pZhbk+HVvfzdh4yw@mail.gmail.com>
 <CAMuHMdWwuH-mPm1TJTfvf3FXSd_zj+yP7OL6uB=-TrqNOT+W_Q@mail.gmail.com> <CACRpkdaks_7PWpXF=wssP2x+tZce5SFsGTCddgxjJQ9erHp-6Q@mail.gmail.com>
In-Reply-To: <CACRpkdaks_7PWpXF=wssP2x+tZce5SFsGTCddgxjJQ9erHp-6Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2024 10:20:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=GhAuh3fNBM_0_d+cGkcsK9FTVOVYHp1=PqMJigR4gQ@mail.gmail.com>
Message-ID: <CAMuHMdV=GhAuh3fNBM_0_d+cGkcsK9FTVOVYHp1=PqMJigR4gQ@mail.gmail.com>
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

On Wed, Feb 21, 2024 at 10:25=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Wed, Feb 21, 2024 at 10:50=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > > I've sent a patch, can you test?
> > > https://lore.kernel.org/linux-mmc/20240220-fix-sh-mmcif-v1-1-b9d08a78=
7c1f@linaro.org/T/#u
> >
> > While that patch fixes the BUG, it does not make the eMMC work fully.
> > It spews:
> >
> >     sh_mmcif ee200000.mmc: Timeout waiting for 2 on CMD18
> >
> > and no or limited data is read ("hd /dev/mmcblk..." blocks after no
> > or two lines of output).
> >
> > I still need to revert 27b57277d9ba to restore proper operation.
>
> Halfway there. I looked at the code again and now I think I found the
> problem causing CMD18 to time out.
>
> I've send a new 2-patch series:
> https://lore.kernel.org/linux-mmc/20240221-fix-sh-mmcif-v2-0-5e521eb25ae4=
@linaro.org/

Thanks, life's good again ;-)

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

