Return-Path: <linux-omap+bounces-5264-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67573CDFD3C
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 15:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B570A30022CF
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 14:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8E931A55A;
	Sat, 27 Dec 2025 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvTeVO6M"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C868222B8C5
	for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845205; cv=none; b=P/u/qHsX2FCcFxp2+axG4QaaUUqZP8JYuYipHBtWmcPfWP3L4x0zoeHcdhfB20Dzl6MVpgBxJnrdngFyIog/ewJZ5qzCywY4e3nlhwPA5EhAB9wxnQ9t1ftwDnS0haBp8BLM8nXhrf6MUq5BfRS8J9ts03B4/sqkwCRw0VKKcEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845205; c=relaxed/simple;
	bh=qVm/WbD0OkOzktJs0xypVZ5JiX+A86nrc1r124G+N4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LX/6beJpmnoQcZCFEdfKgie/5c0F7qj6vlIHJOR3SSFcH7jfF3ItcjgU4BOUPA4QiVIQTZ9GfjIVDTuvYbOxUn17Es1kqSUXCNX1wXzGJMOhiF0nLFRbXE/8IBqjdLQ8rD82KLdMF0AhDkG1YxhmAoK1rAOjyFovwyGRvR4B/Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvTeVO6M; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b8e5d1611so9785543a12.3
        for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766845202; x=1767450002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3rVAXM2uA2BUpYCLCItwXy4Hyvoocs+aIR9WcWlcsk=;
        b=SvTeVO6MVVqVbmfPn9szsF8EJxBfd59gZuOicA+iNEUHNhC5bLFbAqHttptJ6dGh9q
         XJXsP0PPOZpxdqdjvweHlyG5i2RdppyifgnYYM08jSLGaVIHvuQ6r0Y3sCJcVJA1VHbP
         BQJKV4ByFq3RSP7qtfSCBeJZoma1BAMkm8GN/ew8M7t47+XHqWr9p+FSFStI2XXQqKem
         ggLbNznjCEMcS17lubNgoXu0ZsGh9Y4cXLh4fAH8cMm5/S6jO/mGKWTOSpEZWgHIT0sT
         pUNoyTT0kBF7e4E6/qRLB3rG0MXvLafApzb7OLxazzrDwoe1523gOxJFSfS+/hiCtf1Q
         hGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845202; x=1767450002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3rVAXM2uA2BUpYCLCItwXy4Hyvoocs+aIR9WcWlcsk=;
        b=C7tMLsUJNf9PYHMTfd1GJUvdPfpLPcNlg8Hav1S4oHnNOUD545rTyy/75hRGYarxR0
         3mAZMrkkEbKnntJIaY4XIaOb/sD2tPj9egSEzxdKb7eAtwGl6gpZk6zZCZny0cp9Fv1S
         JYumT/HPFKES2uXANrSTAW+IQd87+qzgzRXcvgMcGqsyXhSGrm/RUZ4ThqQa3NYHsh9C
         yCP/gh3Pzg6ZACj4OOKIH7Oe09dzwE9da4qO/V4xSHZTdMteeSTotvoVqGQOL8Aaj3Gz
         FI1cXCfjYvalrtdxb5Dc44DG7AovfArQcF0FKkUD04VSKIBKAK0qM4ECpXab5c7kt2oz
         xUIA==
X-Forwarded-Encrypted: i=1; AJvYcCX8W4yFUZ+kngRPR5vZ+TCw5NbHLWDdqYn3VUzw8sVtdy7iFMYrz14Is4HqlpUaqngVKVNq/NBoCcEs@vger.kernel.org
X-Gm-Message-State: AOJu0YzU7yd+FCD4U+geq+yqXGGbK6fr1w9IJzzcUK5oqsMdiNCnv9Lv
	QXiERRoxjcHQ81pKInDc9T9HZMjLOZ7lfeU53iLbSfqrvftx1rm0N2fEWTi2Es773Re6mGnu28n
	quGHMYjKK8UDuqtJLQN9nQ7TUyATgSd4=
X-Gm-Gg: AY/fxX7uJn4JgVBj5czeM71LsmBatV6OG64dLNrRfv5k44f13FOey/YjmxO1fj24zBt
	/Ea88xsZQhnBtgC5DmXi3hLw606U/cdHhS6YswjX9dXUVHVS5e3e7dnpLSNOnl35kL82JNrCExg
	Ionfib+/2JAK/RndVmj2s8uyifN6UZnhEkWZAAnxe7CW0m0J+qDM7h+9FPr6UF0ZzsUkh0Kku0q
	LccDYyxCdfqHJz397oa/7v3phtTCWIq6Hgjg4J6OzQ42y15PUNfdLn72MtdhWK8RZAB/lY0Lnm7
	UOlX9GXR5aw2R4xGIg75LZ6DIl4J/krbw/HSsnU7M2KNftoNQbdatJNG4MoFlschLOEuP9A=
X-Google-Smtp-Source: AGHT+IF8S2vZ7+R+gmMHpDxIPniiRhAY4GhOubuUewd59zPB/hHlKmS5S1gCB4cVMV+kZ1atbDLTB1f1Uuy9kvPPTQ4=
X-Received: by 2002:a17:906:7315:b0:b73:398c:c5a7 with SMTP id
 a640c23a62f3a-b80371a7253mr2621691866b.41.1766845201824; Sat, 27 Dec 2025
 06:20:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com> <20251219054320.447281-3-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-3-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:19:25 +0200
X-Gm-Features: AQt7F2qzW7hXhSkhTQqqZrlX5yqv6kNuSTsnbNk-OS8FE2UIntKjLzVunWTLcHw
Message-ID: <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
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
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
>
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.

> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
> - Use dev_of_fbinfo() to guard sysfs creation and removal

The place for the change log is either a cover letter, or...

> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---

...a comment block here. It's not so important to be in the Git
history since we have a lore.kernel.org archive.

>  drivers/staging/fbtft/Kconfig       |  5 ++++-
>  drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----

...

>  void fbtft_sysfs_init(struct fbtft_par *par)
>  {
> -       device_create_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;


The better way is to decouple the definition and the assignment in the
cases when it's followed by a conditional (validation check). In this
case any new code added in between doesn't affect readability and
maintenance efforts.

       struct device *dev;

       dev =3D dev_of_fbinfo(par->info);
       if (!dev)
               return;

> +       device_create_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_create_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_create_file(dev, &gamma_device_attrs[0]);
>  }

Ditto for the rest.

--=20
With Best Regards,
Andy Shevchenko

