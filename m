Return-Path: <linux-omap+bounces-5420-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EFCD10CF6
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 08:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CF9E308625B
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 07:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C2A322B89;
	Mon, 12 Jan 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8XogKCc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF0E325729
	for <linux-omap@vger.kernel.org>; Mon, 12 Jan 2026 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768201702; cv=none; b=grJmSdqEWDNW0r7dzDB3XRUF4dI2/bYKujCQYdPsiY4VOz/DtaAa4+J5khDDEfRDciYqT5sui4op8dMNfo53JBDQzPNkE8RE6BrEZRLpsGTVoh2m3DK41DiHi9HwGvzo/7hPoZuEqjTYw9WVDtOEMtPKnzaChGH2KJH/KqzwkXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768201702; c=relaxed/simple;
	bh=mBAm1uaioaQGqHopFkT/acZ01rHlHsqYy9cqOpr62vY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+3Zx7VBVUG9RSwzauby3zSzROU1xYOIzhl8myGStckcQBnexFVV95AcyJioZgR2his6Y25OwTP6WogMkUBRLPipUJVouqKqVQHHOnsXrNvUfl6OsBxm3yy79PCqU3qaGrBjVDlHVzTt7pPpeLPDJIu/cPT+k5MYwFkCk2xT2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8XogKCc; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso12216552a12.0
        for <linux-omap@vger.kernel.org>; Sun, 11 Jan 2026 23:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768201700; x=1768806500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDtobSm2s3UkTYNtP162SerczReKzDGTa8FA9CeAFBg=;
        b=k8XogKCctV2jX3XXlri8DrHTexvNJzhuFHLi5GJ2e7TtJbYBpMT372m284C7YFdBJI
         TkgJ1prGzqsMduZrAmHr1vjIrXFvncJv/YpwSv7TWLxQATGYSLZBQkxNR3AoNdKGf1eD
         LIe7S5jvUFb6g6nZdknFcbMkKbdNMu4W3lWJtQ5PRkVUdcsX9dvBVjctBpMk9rhDMa+s
         xmibjr/EHyflCoAYr4zYOtyEafegfWqNN5wyRGXzySeXNCBPdXRVog+QnynvT60SXKU5
         E2HMbZA3bMtpq4JJos0298xG5dwVMXQ91xgy1mGvLRbLNGka5pzPlkvmQfJRKpx0CiAK
         qfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768201700; x=1768806500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDtobSm2s3UkTYNtP162SerczReKzDGTa8FA9CeAFBg=;
        b=iQztQw7PtCoHOxISdTUMPQgyLiWHTIo35PnxgU9nfSb3lOqHtXmd+cf0CKrKMsPpgS
         1DjpoavW4HwV9/KI6lqAKDBWbJL5x9KpMuES+cQ+HsD600QU0P4SheAqgEeDtxCsSeK8
         u+8WEw3h3zjET6im4NOtMAfxLJRG2CM2UJKgcnKxgcVSZAL7DKN2mOu1Aot6MqFhVZtP
         y9RwIbG7K71oZfSWc60PrSlXwjBlYeTbBKvSkjRE8KiDWN6/VOiqu8uciyfM6NEjXrCV
         rGS52NK6Lha0H4omHaKpmzd2zdcNiJaQe8chIMm4DHAkYJp+J96isv9+wwQmzTxTh1qU
         QZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQnDHM2lddnFVH1DqQ4rdIWZutQZKnNFI6rfPP9VcJIatKLHpYFdOXQZj1J1ARZu+B8BdQgcDvnLW9@vger.kernel.org
X-Gm-Message-State: AOJu0YxE4u/IWmsua9QkicgbU5iyTCn427B0QBj6Au62tcH4gNlA0/4R
	IZDYyz3e68LMjcUSXC1Wui2JKtlhkXVIP/ZQq00bE6vKrMBg01laFurtXCXsq0mUo1fvjqQMGJF
	jiUowpxHFbsUVJb/2YoVuC1RVIj6ibxs=
X-Gm-Gg: AY/fxX6RWys+wg/Lc8sfrbCv90UFQc5Fg4FQ/Je9n04U6xgXVWSJOzpXTdvEhAKs9Zn
	bqM60XNMxB3TV9KxUImmZO9ieMAS2qj22APT6ohT27SrpvdHZuCa9CqRlEQCJE4fE/KBGWWJeKA
	YT7qMnzOwgg5oxBv+wuKHvRmwlzSbXZCSlL+2bvcywEIkcY7uuCQmIF0nqwnjws2/wmxIJBv+VH
	2FzXDVRGw81ovQEL+CAirq1psbCpYEScGvm97NzSnTzFQ3MbjF3sjjep0gYpoZ9zewBYdF7b9Kq
	pkFpELwbMXly4vLK0CEaJGSdMRyEytKnvjGhqKFDuidAeRoUyBii6uG63lJKsQmEPx+XFJg=
X-Google-Smtp-Source: AGHT+IGpYjqq+pg/XnsC/5GM0k5nhevTAfoh1OMUUjQOBvSBPsf/kZ7p8LloN/33VrzRKiJwU/cvplIIHQUOpkB6aIk=
X-Received: by 2002:a17:907:e106:b0:b84:5927:6ed1 with SMTP id
 a640c23a62f3a-b8459276eefmr841165266b.30.1768201699516; Sun, 11 Jan 2026
 23:08:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112010740.186248-1-chintanlike@gmail.com>
In-Reply-To: <20260112010740.186248-1-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jan 2026 09:07:42 +0200
X-Gm-Features: AZwV_QhOYCW6xjV6nzt8R01WACOin2n1BWUyz1yiKwXq9XWTu9UtzwIoiSzFyuU
Message-ID: <CAHp75VeF+Sj=dxA4RZAvVddGSG3brUsy8kz7mvtst2YpqNm99w@mail.gmail.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of info->dev
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 3:07=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:

> This fixes commit
> a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")

Convert to be as Fixes tag instead.

> from my previous v4 series:
> https://patchwork.kernel.org/project/dri-devel/cover/20260107044258.52862=
4-1-chintanlike@gmail.com/

This is unneeded churn in the commit message, also this patch wrongly
marked as v5 that triggered Greg's bot response. You had to number it
as v1, but now please, address the above and below comments and make
it v6 with a Changelog added (explaining changes in v5 and in v6).

> All direct accesses to info->dev or fb_info->dev are replaced with
> dev_of_fbinfo() helper, improving readability and ensuring
> compilation succeeds when CONFIG_FB_DEVICE=3Dn.

...

> @@ -364,8 +364,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, uns=
igned int red,
>  {
>         unsigned int val;
>         int ret =3D 1;
> +       struct device *dev =3D dev_of_fbinfo(info);

Try to keep it in reversed xmas tree order.

...

>  static int fbtft_fb_blank(int blank, struct fb_info *info)
>  {
>         struct fbtft_par *par =3D info->par;
> +       struct device *dev =3D dev_of_fbinfo(info);
>         int ret =3D -EINVAL;

Ditto.

> -       dev_dbg(info->dev, "%s(blank=3D%d)\n",
> +       dev_dbg(dev, "%s(blank=3D%d)\n",
>                 __func__, blank);

Since you are changing it anyway, make it one line.

...

> @@ -739,6 +741,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_inf=
o)
>         char text2[50] =3D "";
>         struct fbtft_par *par =3D fb_info->par;
>         struct spi_device *spi =3D par->spi;
> +       struct device *dev =3D dev_of_fbinfo(fb_info);

Reversed xmas tree order (as much as it's possible with this added line).

--=20
With Best Regards,
Andy Shevchenko

