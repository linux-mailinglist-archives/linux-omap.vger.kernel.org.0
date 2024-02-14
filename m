Return-Path: <linux-omap+bounces-598-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6685559B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 23:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52CE61C20EF9
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 22:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1850B14198D;
	Wed, 14 Feb 2024 22:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmCeXFlm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6406712882A
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 22:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707948945; cv=none; b=BGphjFEzPUpmsybHWxD9Ijkx36gX3EJ+t5HWxvCqQQbCxZPVzCWApFRBNmiDBQ5sISe9Tdyz+UA19E0E7El6Tf7BRyMHX9oUwAjRcy7sm9DOOv88WG2r+6O5BN2hzMR8C1R/RtYWOBkshjukYbr7ea8k9ypXQg3JZRzuDy47CI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707948945; c=relaxed/simple;
	bh=wKyrozdZpKUAYYjUCslzqK5jqOXXWwotKTLp3TH3Ng8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gq/Ths6IroWct6LgtyVD9BaKoZgFFbhl2b/hJh2q3NAsmDtQ016Z9BVuW7ZivLMds79X+bFCaPQG61LB5dJJ5Ne6S8IKzA8jsViCB4uZBDGIc6Seb5lBplKjlS27AbCwQIc9sE9abMnxv4+0kh/GECnHdsmchEssj8OuvSw92dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmCeXFlm; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2970595c1aeso204293a91.3
        for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 14:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707948944; x=1708553744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKyrozdZpKUAYYjUCslzqK5jqOXXWwotKTLp3TH3Ng8=;
        b=PmCeXFlmh7dWQlNkeDPt3Q01iYs4k9h+uVRuDgkoDJxIvsjHnN1Gy45Rcot0+ASUle
         npammWQA5OrrrKjlpZ1e9NBRbLnytm0wdopTpqfNGrHy9BlZCVPALOBYbv5mCYMXz6TK
         8penXTatsB/9yuo7J4dIDmAEhDdXdbAPy3PCViTrrNPDQ9Q1Fdn0n4NFFGJkXXaowy39
         yfZbh/3KSlN+0Lb4Jbfr6zu4llkL1MXvnBdzDyEZudGcvohGZsEc8/BVaqRgpjfyY/IK
         u+4eEzXMFud5OxhQ5Lk0SrkIRdTvj9rsLgdfl6tXQFi+j8nGRRGuq0221G3eW0l4TU9o
         yQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707948944; x=1708553744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKyrozdZpKUAYYjUCslzqK5jqOXXWwotKTLp3TH3Ng8=;
        b=IxIJvL3K4k5LyOebKib/3dg4N3V843hsKjwG7bVo++RWE4Xh0zBkNIFkdheJfbzuZy
         lfGENGy+F8oIysBao1DV7rt6oHiVZKc3ESi9lmZIAX8qwBGxuw0sxTIudzCU/lPLPQF+
         KWy9XcqdWm1hvYmOcQ2u26y/g9Xs9vFjuXwD6f5yrpw5OiRVk33oann8JilW6+YiEnZf
         4hpr0VYA3pXZE5jHX6M2qKVIWUR2s/m4FoJGsonx4b+p86u/DxDghdRx4clnTPJI+Tge
         9C5oOoXdtsxuXH5zo3gSUrxz/FQq538lyUgD1YAylVqTStcGKurSlFb9m6JzrcyNqFyC
         9Miw==
X-Forwarded-Encrypted: i=1; AJvYcCVTmxbXckMdEQ9s9L7lkgvahpL4BxRUMK1kjkcrarIdR8Vr0PhMh3KTsRMzKHRz+m6fH90UmpB6Wt2f1v9YmNZKL3UWIpCNO3w/0g==
X-Gm-Message-State: AOJu0YxkNiBBFd00Ld6OTuABAeuwzI2f2h7pYTZJBAalhpLFONGQLyjN
	Z6SeQ9BpIid/SNCG3B94Im8e/cwRpvqdK5y1zK2ueqeXQ4cMFFoPRDbY2kRXt2HYpIXrtRZip03
	ZnF0cavCKhUUgg6I0KyqOvGmJDiw=
X-Google-Smtp-Source: AGHT+IF8XOaISlxWHzhOD+q/rFwcHP8bty1nhxQi1CoqlyUcyQ0/MQm7ZirVDOIcQLpXMU0xB1iPz2vCCGHKKnN/Wnw=
X-Received: by 2002:a17:90a:d318:b0:298:b2d7:77b5 with SMTP id
 p24-20020a17090ad31800b00298b2d777b5mr57226pju.19.1707948943387; Wed, 14 Feb
 2024 14:15:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net> <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com> <4781f6c5-4a0c-4b24-bf8f-5fdc17b074b2@linaro.org>
In-Reply-To: <4781f6c5-4a0c-4b24-bf8f-5fdc17b074b2@linaro.org>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 14 Feb 2024 23:15:32 +0100
Message-ID: <CAAQYJAuq03WcC49c6cecEvRzgkQQxB0H3w4RKUz7DsGZG=dXcQ@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, paul.eggleton@linux.intel.com, 
	Guenter Roeck <linux@roeck-us.net>, Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Stefan Lehner <stefan-lehner@aon.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 2:39=E2=80=AFPM Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Most of OpenZaurus/=C3=85ngstr=C3=B6m developers abandoned Zaurus devices=
 in 2008.
> Usually in favour of Nokia 770/n800/n810 tablets.
>
> Both OpenZaurus and =C3=85ngstr=C3=B6m used own hosting in handhelds.org =
era.

I joined OpenEmbedded in that years and it was the only reliable repository=
.
The most recent works for kernel have been committed there, in the
meta-handheld layer.
Due to my limited knowledge I could only contribute to finish MTD
support for Zaurus.

I don't have anymore the devices, in perspective I can only imagine
Qemu support if any.
It was fun, thanks to all for your support!

Cheers
Andrea Adami

