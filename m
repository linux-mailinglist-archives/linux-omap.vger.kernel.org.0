Return-Path: <linux-omap+bounces-5145-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC0ACB0458
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 15:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96D7730155A1
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 14:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCC52D3A86;
	Tue,  9 Dec 2025 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWLSqmpX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B326E6F2
	for <linux-omap@vger.kernel.org>; Tue,  9 Dec 2025 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765290349; cv=none; b=RBYfbjEidltKkeLdOZzmZt9mbENDbrRFzzJWZubmt4jYQTV2YOCW0JdnPzT3ELSVws9Evz3zaP8JbyLlULXa+492UkA2pR8LX4ZHGdWn3FFJ0ycwrLQad5G+gxLmXwQP5X8K7vhCnIm4pQhS5CIvMQciJIYHpZUKW+5TJrQC7qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765290349; c=relaxed/simple;
	bh=p/QNLZHkkEp+08g4pHXLslu5TUvKGyb9J5Qo1iBjVxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBwIzam5KBeoBjLwePOd27GwhUJrrHRQTEbMuXk8iItvViqqv67q3eUx2sNC0KUvGeGoX7EEFdm4r8eawg3SIs2ZU3cknDL1ZZxP2Z8RIvtu1zOOmoEnMHchCTR5+OsaHbpzoTUluPRvWivKjCxhDIsU6zabW8Y2W+a3rJXH/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWLSqmpX; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79ea617f55so1084757866b.3
        for <linux-omap@vger.kernel.org>; Tue, 09 Dec 2025 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765290346; x=1765895146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tczTAGf+NRaPH/lcY4iGZ+jG9JiJwZWejZNNrAcawA=;
        b=eWLSqmpXxVbLqSmhyOUffWE8c0E+TQ+ueWJOdRrtCyDuyeNgf1alcBFttZCOLhj55O
         H5wFcEHFyMNl9XAsoMtqOqkccrKEelJnsJ+vo70TAhGpW+ayJx5/GczJGRmBPwtBZwbW
         NW9QyI9kaUKqn33gM+43VcQ9LszLl3f/hsxPVQBoS6/poPn/3ZjNo5zL8H30LoQ4LhMz
         jhl3sWP7MVBuJUt1LiNvBf5Hcj816Bs+DnYMpEN0po2cihBhjrR7my3g42gdJbh+CO70
         1PGDRTf9azP7ZxndFubvWQN9GGTEi8KX07sKMH8bpf4J/blBfXfewSINKcWxyj13sam/
         MN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765290346; x=1765895146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tczTAGf+NRaPH/lcY4iGZ+jG9JiJwZWejZNNrAcawA=;
        b=sV2qLkzaz00UCrVOTUgPAm7XjLTlFkTA4gbgOLsRIlw2UfNhaIZwoLERppVo6j8PGW
         h/FqGlMRqErBUyNSavAUw8Jz4Xt63itPy4aboEP+5ghpAe0nwIxE0tEiLVEfX1/j4IvC
         l4W9Cou5+ZcnF2MCZhRTu6R/ltMAGDkBGJPXa2ubjsa6IApyZ7b8L4cIRo/z/jFK5kEn
         vdqO58ar44VO0S15go2pctoQWLFUuc8KaLQxr9B6sWzas3rakmzmxsQzp5p7Ifd9VWnU
         CDX1ejKS6w+OEdeGuEoE/RydI6zBnVf9CFco1xsDqSQr7fYnLB6S7ZQsv5OzjQQmsJqU
         MTMg==
X-Forwarded-Encrypted: i=1; AJvYcCW5OQVfS+d7Yhhky5gDk0xXf9YsVL8UuXYxZO/FYjxp45JUXBSOT2/M0Ft1aPSUnHrojPeqgNqmjbCe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3xpWPJ999Mb5ZUZZLLRVpHPGsIMv2IspSgg+Ec40jWRnyI7we
	TXpn0KPO01B2/3mxLdXx3Kmc71ed7kpLsR0uI6tA9bpLQR1zYYDmFj348GpZkmCFH1jxwF3orZR
	TV9GHxg9PN/j0VsDFy79Uqu6AlqIr8vo=
X-Gm-Gg: ASbGncsmsQrayLwMb78Eb1WxUa2pm6CEd1zRzFVYUVQZrFKo7VHmyGFfKxnen9Qr1Ax
	XR2RgRIDcsvRZsw723Fy7cbVeCjGdg9yRhQvvIOg66rOVBtUgzFF3cIKST4LwjsCC2xn8Mo6Er+
	BcYUa0tx2KcSQicRQArOt2x7yeW3O3zj0ThrlzCLWeBhKRuMoHjuOXlPWbwrq+ryxffkcIv8+UU
	iBhKeq7FJondNOGTYMa3IAb4IItNNz27ukd0v6Q4XFzMTvh8TVVt0yvkL65vR+nyqnDm8DQPrwR
	0M+fjhmSSrn+9ywiEzxc0aMBQ3t13TiypuOj7zyfVmBT+zt+aMt2+oLH0fJAdJ/6OgxSy3M=
X-Google-Smtp-Source: AGHT+IEUDyZqURELnRBTzjTZuETiToxli9ABhMGm4/e9CoRb3wfwUJvgUlRqDbyn79ps6rpZIghHoUYB7oNXT7FULvM=
X-Received: by 2002:a17:907:720b:b0:b7a:1b3:5e5d with SMTP id
 a640c23a62f3a-b7a242be82bmr1105272266b.8.1765290346242; Tue, 09 Dec 2025
 06:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209042744.7875-1-chintanlike@gmail.com> <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
 <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
In-Reply-To: <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:25:09 +0200
X-Gm-Features: AQt7F2oJ-HAqvTo7dPHCW2Uqr5UaQh_WR7_Bb48h-O510S-3IyA861WvQJm_2eQ
Message-ID: <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
Subject: Re: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Chintan Patel <chintanlike@gmail.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andy@kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 10:23=E2=80=AFAM Helge Deller <deller@gmx.de> wrote:
> On 12/9/25 08:27, Thomas Zimmermann wrote:

...

> This whole series adds a whole lot of ifdef'ery, which I think is the
> worst approach. It makes the code less readable and leads to two code
> paths, which may trigger different build errors depending on the config.
>
> I'm sure it must be possible to do the same without adding more #ifdefs,
> e.g. by introducing a function like   dev_of_fbinfo(fbinfo)  which
> simply returns NULL for the FB_DEVICE=3Dn case.  Then, that value can be =
tested
> like
>         if (dev_of_fbinfo(fbinfo))
>                 {...do-the-things...}
> For the FB_DEVICE=3Dn case this will then be optimized out by the compile=
r,
> while you still have full compiler syntax checking.
>
> Thoughts?

I second you. I am also not a fan of ifdeffery when it can be avoided.

--=20
With Best Regards,
Andy Shevchenko

