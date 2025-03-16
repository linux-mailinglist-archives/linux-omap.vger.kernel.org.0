Return-Path: <linux-omap+bounces-3398-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A4A6376D
	for <lists+linux-omap@lfdr.de>; Sun, 16 Mar 2025 21:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFB4B188D28F
	for <lists+linux-omap@lfdr.de>; Sun, 16 Mar 2025 20:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A291CAA9C;
	Sun, 16 Mar 2025 20:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ8DzLWi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF1918A6A8;
	Sun, 16 Mar 2025 20:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742158472; cv=none; b=VUeNj16/wKy4zhtwPSSi6hn2GLk7io/JHhtAlEDztd/jQaNO/woDUaK5PZYuPxZfjtmyuSrEn3U+2gQWAhF5+HLuS9qKHkD/84Ro9wcCopOTDnKF+teKGlUvK3vDwCIb3xZjywODnYJA5YXcFpWCdR9Szkee7FSeE65QZVYmja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742158472; c=relaxed/simple;
	bh=es5Aunb5wIZVgC4PxN0F8shzwnFw5ZYU0GFxkgF325c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAIG6BFCwRhHaatdW1s4higGfd9Gv7LBk1gK8zXmUY6UQj6Q8GVpipAirx808QMxgjxa23ueMS84BIpeIB40xwXZv+KYx/IgQCoDtAhQ9JkKVVAU1XvdEvOdhhkwmsMPyOzeNd2V9624VLfZVtzYhYl1JXNYbXFPT84BMWfK1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ8DzLWi; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e60b75f87aaso2861521276.2;
        Sun, 16 Mar 2025 13:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742158470; x=1742763270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+otTzr3TR+orm8vkPocyniFUBCMP9Xr/+NiYq2jrqpM=;
        b=LJ8DzLWine0/DC4vDwXa9i4jKGphXtemnZHhD1+DGvYdv8noxPKYIfRJFwaoquj1bR
         8u7Ekd9QIjmSiOtb+KIlZFMB6WnCTc6algB4T/pM2+qOLpTzvATNvfrJQjJPYD7aqSeH
         crxh4B2YxoDLZlQEvd6SFZ9tsj3W8VKyvOrXAxSlany4K6YnXOCQDDnMu4Nx++a9Dwzt
         v8dhA7moM72bKYaXADA+HgtFkT4HsXGG6wEc7rc1D0kC3HRjyQmNgV+Zid+omOeGWaAT
         s7su8IVOrb39wC4OpHNSe8l02vu5GdIO2X5XsJ2e2x0GqXzkQuxWDwa65D9GbRN4cfPw
         nuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742158470; x=1742763270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+otTzr3TR+orm8vkPocyniFUBCMP9Xr/+NiYq2jrqpM=;
        b=IUqsw/XzpEJ52+Db6LN7maPa5JR2Ff6B5Vy0Y9hdAzPJRzrQmVk0gs3uj+aLiNvA34
         Ig7GRgCNRkCqOJ7N67+mmqx43HOKIFGvqTUxenJWWieLn/crga3VtX1Zmn9ZSa+u35ii
         Iri8N+LQ9HhI6zLfNUI9/FNTeJjZNDZh0C76C0uJTiVNWy40GMO4o+abAB1iXxGSHhQV
         YSk9W1V6jn4LcfFjGS5bHViKaU4eQAQ5duF1F5dNKpwjzBjpoarjSucerRz4cpD3C76T
         +7RDY62opQ7IV3YSy6cZmHqvdBAhoCheVE6A6kNW83cEN0+4kQUj/VH+fLP52zIQ3Vv5
         ajgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHnbvmgwzJAOfjd/ls3BlMuwVVs/iLcc+C3RburwO8OR5N9BbVP0X48xTzf7Qki8JP1lrVzCeUt9IAMA==@vger.kernel.org, AJvYcCVoBNp7Z7tsixMvn8523BSZVaMMQvRyTe7JPsFsy8V+vnx4O+1G+Rkf781vo74sKUeV8LTazm8D@vger.kernel.org, AJvYcCWmuYH78Bv1xFo3nS8/yX6AmxKKZ3YgtIZBTroMFR22/4/zE2igmrn4F91YDJhjSshckwjCKyHJbXQELxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHAYheu/Zc76iSIi2zrhuGyWnhJe6dnOfe8VM/YMKZc2tTLZa+
	V1fUo0cqRp358/LDjvDiP0vqUWCvm9G+CBgExqmfyMq7rCYXNM5l3heviCJfEqF5eTQi4BbLrMs
	3LSkr9h4oflUsj22L3nZEcgOwchY=
X-Gm-Gg: ASbGncu9SeJYkIEC/cqiDexd3rVZmmkL8GHV6BHnDNaG3X/vvKpbxzvUpeo0o9q3Vcp
	sr0ThnfaVH9XVk6oEYhc2OD7YPeRIiI6TbEFr7o7qkCo5E6b4l+vfEVkd+r4X/0Haf7PlbaSpF5
	lFj6nh89ILYBBZcTi5um5ViX7B1Bo=
X-Google-Smtp-Source: AGHT+IHFoMlNyy93E9p8PLdKAPmBbY2OXvYrcgOhmgshugONB/leWstGjgJSgPisbLdUzj1QNxLfSMErqx6KuE60UC4=
X-Received: by 2002:a05:690c:4c06:b0:6ff:1cd7:18e6 with SMTP id
 00721157ae682-6ff460fc34dmr131266867b3.37.1742158469595; Sun, 16 Mar 2025
 13:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312121712.1168007-1-ulf.hansson@linaro.org>
In-Reply-To: <20250312121712.1168007-1-ulf.hansson@linaro.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Sun, 16 Mar 2025 15:54:03 -0500
X-Gm-Features: AQ5f1JrC9arSKQQ_w0K5E-UGcgYKsF8QY-ZaOf_sn7pbfBAYKIZT1xZPxn2TesI
Message-ID: <CAOCHtYjGuw9szeChihrDZ39_2+w5xOverbp6mAjjLjR=QkK1zg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-omap: Disable MMC_CAP_AGGRESSIVE_PM for eMMC/SD
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, David Owens <daowens01@gmail.com>, 
	Romain Naour <romain.naour@smile.fr>, Andrei Aldea <andrei@ti.com>, Judith Mendez <jm@ti.com>, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 7:17=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> We have received reports about cards can become corrupt related to the
> aggressive PM support. Let's make a partial revert of the change that
> enabled the feature.
>
> Reported-by: David Owens <daowens01@gmail.com>
> Reported-by: Romain Naour <romain.naour@smile.fr>
> Reported-by: Robert Nelson <robertcnelson@gmail.com>
> Tested-by: Robert Nelson <robertcnelson@gmail.com>
> Fixes: 3edf588e7fe0 ("mmc: sdhci-omap: Allow SDIO card power off and enab=
le aggressive PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/mmc/host/sdhci-omap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.=
c
> index 54d795205fb4..26a9a8b5682a 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1339,8 +1339,8 @@ static int sdhci_omap_probe(struct platform_device =
*pdev)
>         /* R1B responses is required to properly manage HW busy detection=
. */
>         mmc->caps |=3D MMC_CAP_NEED_RSP_BUSY;
>
> -       /* Allow card power off and runtime PM for eMMC/SD card devices *=
/
> -       mmc->caps |=3D MMC_CAP_POWER_OFF_CARD | MMC_CAP_AGGRESSIVE_PM;
> +       /*  Enable SDIO card power off. */
> +       mmc->caps |=3D MMC_CAP_POWER_OFF_CARD;
>
>         ret =3D sdhci_setup_host(host);
>         if (ret)
> --
> 2.43.0
>

Thanks Ulf, i also have this exact revert running on the target in our
ci farm, i think we should be good.  But I'll validate it in 4 weeks!

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

