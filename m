Return-Path: <linux-omap+bounces-698-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6A285EAF8
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 22:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14EFB1F26228
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 21:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849FD1272A9;
	Wed, 21 Feb 2024 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYtTh/tM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AF81272B3
	for <linux-omap@vger.kernel.org>; Wed, 21 Feb 2024 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550725; cv=none; b=Phkp08sWzGAVUwSKnTkvj47ZEwTVq3BNfk2TOPaYWj5n1Hl2MRLnoVkGHkMvswW9FhBPXccB+Zd4RobGBkoRSKJph2yzTkLJt0KquNRUUrEUBLGnR9YLcRAd3afJHLrE3YjXndi3JueAmDjxKbgaTDO1vR4/xDffFZcIsytt4YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550725; c=relaxed/simple;
	bh=vwcCEdPIttWiNnK38OUvrS0LIv8EPoiVoGqCGSZN+Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3/t/xHQE0KD3tAMXGPEaU91yl8zRFpVsT4k6kN3smh52mcUmE2MqdTp3mSaEBDQNfIdvYGhJENHoHUWVqgnEwgDig6F1kS3wAr9EdwzBa3PCzlGNb73yYzcSlgaKogJXanSBzgIAvNaWMjL5selnU25Y7IMgWYb3b2rkqHhBbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYtTh/tM; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so6396192276.0
        for <linux-omap@vger.kernel.org>; Wed, 21 Feb 2024 13:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708550722; x=1709155522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQcwsvUVgzwUHzVYq2OUwFRsg7S9zwWdnAGogtH5/+c=;
        b=KYtTh/tMfJTsTc1y6dP8tFA/q548E6QS1sFLhJInyi8VYfynZHFK8Nmr5B/8YTrVRp
         gRMX3VJjb8bT5xnFExOW7JYcyqaCPkg6llkwW5eLB4dMbmgpj01Vdc+TEi51KkBiuoDi
         fElxgHErKjwrUtdeM8OYUJD1u/c4s6PU2E4YYIc123pgMXVggCLhFxxkT3884vqEd2hW
         CUclIIQDBKJHc+rfYbfmZdyfGCgFBsZ/SFqy3RFrej0rGhlH1KZ8Otj+u32NIcev7G/i
         VjRu0jrbHJa6UdHvxahSeqXtYWlO6Vlj1ydMLsL1XLGPt5Ci1sK5BWBveSUgvR0vcRf3
         DOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550722; x=1709155522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQcwsvUVgzwUHzVYq2OUwFRsg7S9zwWdnAGogtH5/+c=;
        b=e9KumlF3VDTzCCE7MBRYxqfTvaRiTFWOgi8xzReOPpMWiqScmS9Ajw1rlIOEUH2y+Y
         uB/w8qHExUjVfbhZc2bT0bxFp/dKF5icgugq3mRhAlnCXIXOMpXSqXdwMwN81ZH8um2r
         SDE18fuBDQr7N1SxhHQ930Aku1nL3AnuEvCmadATOfeBIFzxkG53jKgEBw+Q77YR4NQz
         Pf3sELCJMhaMVrfHh8jfASbrxOLjQV3Cd55arrp0S5A0LO47SgoQwdHYPcZPEMT5a8yO
         Qy6v81q3qPBNOhQwAqw9i8MUSrXRCgNX9Ty2RLdrHKVlkZ0wvcXmcUJqJL+PtPEnewZb
         Cqrw==
X-Forwarded-Encrypted: i=1; AJvYcCVcHf8ubD9sI2Mx4hXcfesU250LdJBdb4jPVn6QIG0/Sl6eEWOR7XmlZ6Ljn0vjA251Du9U3eJnLP3X9YzS0YqBk1mfn5V/+60xzA==
X-Gm-Message-State: AOJu0YwgJivT/FS5HSt0/wH/epamv+PaP3sdy4/rSGOpcm3EpNqZ5XYd
	Ll03s3o3/ELGQQP8P9UvN2ciTeF+I6+7Y7W3oHvz5gHh24Zv6EnRyQ3V0ZdxJxGhwDEQPYnJt+Y
	ZO6peeG3tR63cyTuqz9xe4bt03n5dk/s3MNWkzA==
X-Google-Smtp-Source: AGHT+IH4UPI5wpOTg15rGTFngizg01v5P2orm8RiQzbgP6QMedeTpOkK8y3JHAR2cnL/aWUbEuMgAt7gdxYB8HxLYEo=
X-Received: by 2002:a81:b614:0:b0:607:f4b9:11aa with SMTP id
 u20-20020a81b614000000b00607f4b911aamr17260454ywh.21.1708550722698; Wed, 21
 Feb 2024 13:25:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org>
 <20240127-mmc-proper-kmap-v2-9-d8e732aa97d1@linaro.org> <7f40cb40-1a1-532-75fc-d3376ed27a@linux-m68k.org>
 <CACRpkdZpyefnTyKEJXru_HZG8xcJF66Eb2pZhbk+HVvfzdh4yw@mail.gmail.com> <CAMuHMdWwuH-mPm1TJTfvf3FXSd_zj+yP7OL6uB=-TrqNOT+W_Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWwuH-mPm1TJTfvf3FXSd_zj+yP7OL6uB=-TrqNOT+W_Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 22:25:11 +0100
Message-ID: <CACRpkdaks_7PWpXF=wssP2x+tZce5SFsGTCddgxjJQ9erHp-6Q@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] mmc: sh_mmcif: Use sg_miter for PIO
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Adrian Hunter <adrian.hunter@intel.com>, 
	Angelo Dureghello <angelo.dureghello@timesys.com>, linux-mmc@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 10:50=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> > I've sent a patch, can you test?
> > https://lore.kernel.org/linux-mmc/20240220-fix-sh-mmcif-v1-1-b9d08a787c=
1f@linaro.org/T/#u
>
> While that patch fixes the BUG, it does not make the eMMC work fully.
> It spews:
>
>     sh_mmcif ee200000.mmc: Timeout waiting for 2 on CMD18
>
> and no or limited data is read ("hd /dev/mmcblk..." blocks after no
> or two lines of output).
>
> I still need to revert 27b57277d9ba to restore proper operation.

Halfway there. I looked at the code again and now I think I found the
problem causing CMD18 to time out.

I've send a new 2-patch series:
https://lore.kernel.org/linux-mmc/20240221-fix-sh-mmcif-v2-0-5e521eb25ae4@l=
inaro.org/

Yours,
Linus Walleij

