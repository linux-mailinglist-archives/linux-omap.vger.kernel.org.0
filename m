Return-Path: <linux-omap+bounces-5263-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A3CDFD22
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 15:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B2A13013EC0
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83ED224AEF;
	Sat, 27 Dec 2025 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lg89G9Rd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEB51A275
	for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766844962; cv=none; b=NNdf4cVksnqswAp7q+D41sXZMHw4m6OZZSn9anRSvWZeObmYgB/7DtLl3GWtpUr2H/uSVhe5iN9W7/yQPKRpcuQVaYf6y1KZUWVXxyJLbe2c5gLVE3GVHbvEkdqIplpHUeiS+SyqhdA8f/16Xl9sbtvCEUs8VyKYeRjaJQ5tNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766844962; c=relaxed/simple;
	bh=hiQNhsW0O2LINJmqDsutnCu2EMiEeW/p3tCBUzseyS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo6PZND9oU/lLLR/E+m6vQZgzScRdUUGZv8tlnwR8uUE6PbqkmDkVkivYl19n1MFq9hbhCDK5CKyUKj3IxaQCs+TRj+jk1OGwdPIXzEGd+7uH5xwSYQ7Bzg9IKfH4b4mwJDTEpVaXc1jj+688VUQGsuHJlq+dS5lmR331sOs6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lg89G9Rd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8018eba13cso1164367266b.1
        for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766844959; x=1767449759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qeew5kbRgKn77uDh8eaOpRmb++U6/kEJVcuYh9HUj70=;
        b=lg89G9RdVWysHdI/ayrnnZDK13cIhZxfLKVgRjsVEQ89YMEF1WwJ+kwikPsBRCZaU3
         sGnQuRoiYJTjt4Sx4/qAOmIWkR1QbE2Ddl8VFG+t5N96B+ZFMvPJ2wvKO5YULtY34nn6
         vGors48o7PaV7/udPChZPIJcQgFWzDhhCcOHYN2JlDlmugh/lqElXDqBA9/rdGYJ0T0V
         FnaJXd6aYYyvKIwQZzVE9A723pfDoquz24TN6w0UCA0PbXJHwHLPdAWVcgqtrjLScZQp
         7Kb+plMkf4i81hq/pUrlTv8UvGqxhlr2Rm6J1CdSPrupOTAVWA9kprshdJ06xM8pukA+
         71Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766844959; x=1767449759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qeew5kbRgKn77uDh8eaOpRmb++U6/kEJVcuYh9HUj70=;
        b=MyY96CKxThAKB6PBfrGRG3IsME3m2rYIjrmKOY7dRP6hr9EtZIFP/WGSZ9qufPPjVk
         rVJtTfVvMnwuZR7flAaftt1FFU2ENDVjlCSmuGSzuuPgdrON/OmR6PAUsvx0fXxHYCzH
         oYVroT4T9SsdazGNPlIpIAo88p/KlITtTJF/HfXhhcH7MaN/WKToT2ZHNzHfkrXP+uuV
         e520NV398IkpAguozYwIsVhyY83DzFHg3BmyiQISe/Qrj+icstFOo02FSMvyW/8FacBd
         ktI7fx3C61lSwgP/hFG4EWD1UYyImDK2I3RNzsPEDLWXHdo4krldt1UALqEhS/WV8mHF
         v66Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzyQ1TGYKDA2MwetcxIv5iotmOft49/6q6hWUo9ZJfsXKsh3NQVHdX+NLudLLKx0wAfmemgxtuo+J3@vger.kernel.org
X-Gm-Message-State: AOJu0YzylCbWUPVCKTqTqgZjl8sS47DYNRDFODQc70RFypwwS7SITbE0
	U4/AAduOHMR8IFWvd7PQ+SanNYrqQYOh6krTuErT87ePPXo2csD/c9fly9sAVpIzfwI8VZavK2E
	DCmj/j/ZSEw9MwPwI5tw2HaiSRXqFygg=
X-Gm-Gg: AY/fxX4abn1qzPSnLJ27BzT78YOvbtPiBcZJvRZSiTONgHGgVEK/ileojh6Kizyr4Ri
	azspOs4LiQRBNc7uhn/ZDx3llWbnUzqgxWy0saVaD9h7VjWy+X+i77z5+ChQnGv/qeKm99376Lw
	AZPeno5saZ5ekStQDCCaVPwNXcarczlnqicdbZJS3B2KwuXGgxCRq/tn86Tv+EnAVYszhBHFnFd
	E3cZtbcHuVmNRtmeh3wYtI0XUFkDAbPLLuxNKWCVL1PJSFEXBR281apoCoStGVDvxrFGu7mpqPV
	cvp2iFpXG+S7FHlF8aioAjRSCwzsk4lvzMoTpgZ89wl75BT6spct307UYMcJLIb3Pezbbg4=
X-Google-Smtp-Source: AGHT+IE5XjXyiX8e5+y2/EJWJkUx9mNmIJWTZRQHZ+11Rz7xT9i6UD39yeJWDYfoSFEzyyea9QAld86n3jERGsExmoA=
X-Received: by 2002:a17:907:7f25:b0:b80:614:b72a with SMTP id
 a640c23a62f3a-b80371756d1mr2980300466b.31.1766844958759; Sat, 27 Dec 2025
 06:15:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com> <20251219054320.447281-3-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-3-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:15:22 +0200
X-Gm-Features: AQt7F2r_BktXpE7AknVIdZhLL9UU8kDl403QzVGaeIdoMKWSeHXNJeJhHMAVJRQ
Message-ID: <CAHp75VeroxzYs7GScKMv-gOFqJz_U=561b5FH6ifdo2WQNYNyQ@mail.gmail.com>
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
>
> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
> - Use dev_of_fbinfo() to guard sysfs creation and removal
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>  drivers/staging/fbtft/Kconfig       |  5 ++++-
>  drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
>  2 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfi=
g
> index c2655768209a..578412a2f379 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -2,11 +2,14 @@
>  menuconfig FB_TFT
>         tristate "Support for small TFT LCD display modules"
>         depends on FB && SPI
> -       depends on FB_DEVICE
>         depends on BACKLIGHT_CLASS_DEVICE
>         depends on GPIOLIB || COMPILE_TEST
>         select FB_BACKLIGHT
>         select FB_SYSMEM_HELPERS_DEFERRED
> +       help
> +         Support for small TFT LCD display modules over SPI bus. FB_DEVI=
CE
> +         is not required, but if enabled, provides sysfs interface for d=
ebugging
> +         and gamma curve configuration.
>
>  if FB_TFT
>
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/=
fbtft-sysfs.c
> index e45c90a03a90..848702fc871a 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -203,14 +203,24 @@ static struct device_attribute debug_device_attr =
=3D
>
>  void fbtft_sysfs_init(struct fbtft_par *par)
>  {
> -       device_create_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;
> +
> +       device_create_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_create_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_create_file(dev, &gamma_device_attrs[0]);
>  }
>
>  void fbtft_sysfs_exit(struct fbtft_par *par)
>  {
> -       device_remove_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;
> +
> +       device_remove_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_remove_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_remove_file(dev, &gamma_device_attrs[0]);
>  }
> --
> 2.43.0
>


--=20
With Best Regards,
Andy Shevchenko

