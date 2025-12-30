Return-Path: <linux-omap+bounces-5301-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88214CEACBB
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 23:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED7FC301BEBD
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 22:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403A82DC763;
	Tue, 30 Dec 2025 22:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAg5++er"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA82701C4
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 22:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767134598; cv=none; b=U3t8o+ucLYrjVN/6la5VBUR3E6QHqB4ywzw5s4MpY8mVZV27n1iEIpBhDS/HEY/+HrWqOdqG7D0HlOTm/REzJ0LHkBlBD4A2pefvygGR8a1AtoTzOLuVvhanyz434j1+9gCo5NjFkEvRShVxQ6RGGUamweQCsO1z2vleW2edTM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767134598; c=relaxed/simple;
	bh=9mEi6OrHM82M1e0Eu4BKfGlCSswhhgbyi6wTYu1Esdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pv4C9HkjjlsY+tbvPXOlmgdeJ+Sozub+ISfMzw6ZCRY5hW9UncC5G5vbWwdm2KWq/xuBh2WjeHqb93gV6BqieFHSlgdSTXild2lKU2NyIF2oMMRm/Gf7kVxsSy6hAYflzwEkSaZkqC8ALySxGayeqthQ81DVMarJgyipuSCiX5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAg5++er; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b832c65124cso621130166b.0
        for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 14:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767134596; x=1767739396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mEi6OrHM82M1e0Eu4BKfGlCSswhhgbyi6wTYu1Esdo=;
        b=PAg5++er65WS9XxvwSqI8vU5Ei9DZ2ee4hp1LUGGnmc2jZNXAPLR7coXt0b/G3L3yV
         nyV8UJzcGetCTEKtLWahDfzGtaLZNKn869cJf5jbkfZncAIannxQpy3IK0wFiXzkN6Fa
         aqUJz6DxavxE4PcCXu168uImohUIhai8eAttJ3Q2bdlcEbrowqaqcCLB/PGiYnJ3gGME
         ZraCnBDCDShBa5uLsuQL/Vr2cBv8cTSQkNhJbDxKK/FiNo7xu/qWmcg2QUXtkzdsegeZ
         yIR+5tegggkV1fjv2waDstCN5xgArYM4Op6vtTSX9DPtUVi+cs96n6JZ47k6TLyeWRxx
         uLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767134596; x=1767739396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9mEi6OrHM82M1e0Eu4BKfGlCSswhhgbyi6wTYu1Esdo=;
        b=Pz7eoOA2uvCPSu5Yb7Tt0BbJ5+8wouTxOHHmcteUdXKAXdop+aFfSRzNVTIWMoSJrg
         D6Gf7LqpZohIhO3n0nrXjLsYRjJ40gX/97Inw8tcocn1jeufxRWyNUB0fRaIo7ZjlpkA
         IIYeFok6QEgszvGGm7iYkXzBGIiZ22B1renUd9GsICjVbzRfl++wrwo2iCRvrDuGPCMg
         da6nAS+JxRGENuVQBM+ugPlXT+rmK+WpQ34CTw0spqTsZjMjWF3jOSWBw1tk5Pi1V9V1
         TGqCefotk9zxXhyIF6Njlgs9rEp0l1XoZ+yCeVGLul5KwyeB94QN/flkbU6HHf3f711R
         EOmw==
X-Forwarded-Encrypted: i=1; AJvYcCVzYH7eP6OcNh3Mn5ahNr8M/QfBScz9wSfjRAovEpmbWaxtVPluwEjZXSgwYjAeUjCDVlmYgQ2Nt5cB@vger.kernel.org
X-Gm-Message-State: AOJu0YxkdR6nvLVkwHc9QxEoFOF3jc1Xz8/RN9MkpGJTaoueEkL3Tm+O
	IBvWTGnh8RqgpZa1hBfNnNEH2u8XkYa/gTJlAcX8hz8/X8zLyjvDwUTHIv3Ec4DatfOIwWyGp6Q
	ROkDlxl1YpVzPh8U5Kwd3HvDQj7wi7Gg=
X-Gm-Gg: AY/fxX4n3Y0iavr7nNh9phU0mD2zpadAtH6FH2WnVIggZREVf5K8IHSNw7zvcduN/4n
	CPF77Oj8rVSiOw70zxIeBWs5HOqLq5NQaFXbdHqf09mZT0VEjQAQjTFx1LZ+ExO5MRzC3ORgCz/
	Ar2AacfQCUnAQKebUjHUmKptgpu3vED+LLFqumEepkyYqUQOx1PUDRhhlH2Ttpy9LQYeobJAEsB
	X4rOyzdaKp0gWgR9j82RkEIpvb6eUDNl4VZoodSGI5WaN9uWxnr82cRTC25PcNb+o2d5F4JvDJp
	JPmUZ29OfcDqlVUtb01APY7cTvR9cRMJN6xyYbOekCagGCZL4WNd/IlyPUf09hmwv+jjyRgtwHX
	uqStDfeg=
X-Google-Smtp-Source: AGHT+IFQWfQKkPBeY8y1lW4UgnrOAAMI40g1X5cdWEdu84v+wi5zQgy4ZIJWy0xewaTSwh16p/etDzIVCFjsFTSA5bA=
X-Received: by 2002:a17:907:9408:b0:b73:6998:7bce with SMTP id
 a640c23a62f3a-b8037152a19mr3578554666b.33.1767134595488; Tue, 30 Dec 2025
 14:43:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230052827.4676-1-chintanlike@gmail.com> <20251230052827.4676-4-chintanlike@gmail.com>
 <aVO5X0NKSdkH6Ab5@smile.fi.intel.com> <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
In-Reply-To: <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 00:42:39 +0200
X-Gm-Features: AQt7F2qWtePPexAYMwq8dRDWvuDOrmxY5lQaE1jMdbfoOaWp8Hbs7ajPSCcSepQ
Message-ID: <CAHp75Vf0n2wQAEt_kfvZKKyjS7VqU3_SvF0vYbYBGikP=7dQmg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	tzimmermann@suse.de, andy@kernel.org, deller@gmx.de, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 8:01=E2=80=AFPM Chintan Patel <chintanlike@gmail.co=
m> wrote:
> On 12/30/25 03:37, Andy Shevchenko wrote:
> > On Mon, Dec 29, 2025 at 09:28:21PM -0800, Chintan Patel wrote:

...

> > Still the same issue I pointed out in v2 review.

> Sorry about that. I had actually made your suggested changes but somehow
> I mistakenly send old patches instead of updated one. I will send
> updated one. Should I send v4 or v3 is fine?

v4 needs to be sent.

--=20
With Best Regards,
Andy Shevchenko

