Return-Path: <linux-omap+bounces-5267-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4622ACDFD8D
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 15:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7E1A30022EB
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF2831AA93;
	Sat, 27 Dec 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5KDKziY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED8319871
	for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845515; cv=none; b=D0EaXH9bPG8oaKdf0/HIP2LD3FuoggjhxVecvy9Q7k+7qQtOyD/aAQZBa9asRPjUVlx4qP+Z1NRbNfVeBCaimntFoCTT/BdXQZmkXYbMHe+17CUHrfoK80VWV1wOjvWKh8zBJfX4nkd2b2olHNBUEpjrSNtRc3Aw495DQE7ra4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845515; c=relaxed/simple;
	bh=J3Wwr64QQ2SpOhKfSDoML0fOFqI1wTu0FLnX32HL/bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZL8Us70r5lUhpaXVaoxO7Yy6vdD4bExJk4EoWlY001JGxkcjwCbO968rYWhWqm9BKI2PDGwzP3yhaF+apJtQ4C1J0Mf3dNaR+T7MokUg0Gr2OduQlwQLQPCRw4U7bjGFglY7kgp0dQK7uSoobmYF+lWnwMsakhU5BkoDmodM5kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5KDKziY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b804646c718so783197066b.2
        for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766845512; x=1767450312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3Wwr64QQ2SpOhKfSDoML0fOFqI1wTu0FLnX32HL/bM=;
        b=S5KDKziYarQsEMA4FnGARVKa+hHaOjmlqfn3x3cQPpcxaRkdGDNQ26wZj1c1nu6nP+
         gSibASiBehu2FDSOyHkFzSuEJjMU6xLvESBhqrIQ9hb7ZbVDm5F11aMIppeLdCDV2zfk
         A/MFV9US5Skiz5LrUVJbT1xWbfU/mvAMSC9E6cu8r9nvKztEqtMesmTaUczmWlNEh6Bq
         EgffXEG5GyYQJicYSCPTjrQfXHMuzp6/ALj+D7MUkUKnQMLERdQkpaD+Lnc1ubiFXdLT
         JYH+1D/Fre/A5uqPNZpl8RxcCnJ/Uz2tcF2wD6zjcFLyzS8QRn0CaGtxbbciWelyEGnX
         Crmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845512; x=1767450312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J3Wwr64QQ2SpOhKfSDoML0fOFqI1wTu0FLnX32HL/bM=;
        b=lrGY3hd0Jfaj2uhJF+SEGB0EKDJjvNynzz3+LlNMyHi/0C7yolbUgMQxWJGkE2a+UR
         SDjb/62Sok1ZgBWGkM5FulE2igHC54SDFSknlsLsFffJmzWUBvfAeGUoV/fHO7z4o2u4
         5v4/5CG/WAD3F3STCUl/qarU9W0NOcmIIsho3I6K0M+BoUYIpTsSGdYedozwj31tXc6U
         5ZnlEKESc68XLQZCC4HjU2qAI+Vuv0aWKZr2YWo7l/mLRMpIL8dunrlYnnnfIbw+7tYl
         U2ZqwzhHuOFUtpdtMoR/6YZLNtquw1oI56/n6UiwsXYOfss/eIoWc9kBnrNrd/jI0Byg
         IqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1z9N2Z7RAv5+kAtdcZ+CdP8O2jxJtzU+CFuKgCLeelTEz8vG0v23tCFVSRpsaW/j+pElciSuZOFSc@vger.kernel.org
X-Gm-Message-State: AOJu0YxIFS88mXMf32sk8G+lCvS1xI7UVzYFxC5K0uVXfGXIHqA+tQrJ
	v84zH1Iog+scCIeo+RpyWXzQ9CSRFhGI9mqsE5WOEfz4U4ztPGGmcQhwr2JxU5n7LIvdtMCOStG
	v+sU7l1ElHCLJJyjus7mn0ZQRu4bdpXo=
X-Gm-Gg: AY/fxX7JvA13ov7fa/bvjOTAV7M2S/S10cc+F6r6a0sQ9MkM/Jx7j6kFNVSKr/7iGpd
	wGOPo92vg+m5wEeWF4YoaSeimCHlBpdVvoyaInfI/3uUmG3PX1J3gAF1YG2MQZkBrnA//DQwSY7
	WYUFZEhYVQX4f08t1QXQBunjhFIaMwvO/TZW/XhtwEioPcgHqSJ/G4aDPs6PJPCexPSw9CwXA9R
	ULVuDN7yMNvYkChOM26J1s/Kq9cvx5dMe4fsvKgRz62PbGFNTckeyoSvllhBAGFtKx25iHq/qrN
	IGwNR/vCcvQ/UxQHpGynt1NrRF0iCo3Qmix2KtLL38PLjX3b3UZmcwHWHIiSGDZLmVMyKyw=
X-Google-Smtp-Source: AGHT+IFX0lsgc4AotttgNOJdIQxVyJ6emc4QU5YPq31MHVjjCSjesmYFWIps47Gzc9uXozCoxrNAzwJrn4uIVEmnK7o=
X-Received: by 2002:a17:907:3faa:b0:b79:fcc9:b00d with SMTP id
 a640c23a62f3a-b80371f353bmr3038598866b.59.1766845511630; Sat, 27 Dec 2025
 06:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:24:35 +0200
X-Gm-Features: AQt7F2qk4lZCeAfQafLC_2U29jnpMMyMdVKvtqDPeHxqHBPfiIH3Qwz7nSdnytw
Message-ID: <CAHp75VeiD518W13KU+vn1yykfw1pXA8Z9Co7t5bXbB+KhCtqPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann=E2=80=99s TODO=
 to
> remove hard FB_DEVICE dependencies.
>
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=3Dn. This allows sysfs code paths to be skippe=
d
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.

Please, address my comments and I give a tag for v3. I pretty much
like the series, thanks!

--=20
With Best Regards,
Andy Shevchenko

