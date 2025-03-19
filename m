Return-Path: <linux-omap+bounces-3456-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36183A68C05
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 12:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E8B17A05E
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 11:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67FD255E23;
	Wed, 19 Mar 2025 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IqtzeUX/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA6254AF7
	for <linux-omap@vger.kernel.org>; Wed, 19 Mar 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742384443; cv=none; b=SenkT2P1spouhgKwHAPHaNXMbqOQO/nKK2JyqhNnGHt6JECqcrjiHFDTCm9Cz2LOMuU8j/a7IUbCWNFO05gHWJxVj1Xk0SmqY9JA3RYHIlnvS1xridA2aNEn5oKeSMfTmb4Vlc8JfIhcw0XMZUf0HwhHws0IiDfo4G6dp1QJx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742384443; c=relaxed/simple;
	bh=nqIrR5gsf+WAV1exZh0bkciSxO/FVA36+RLDOmghAPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8Dskin8I/L/+PHMB4sLoPlynVB9L6jkn8cf7Faug6DM152XqUACBqiqas2j0kmLKm+bbvJ76harcjwF3o6CSnz2Mw29ynkQW85eWIw0WphVon/xyMPWtB+ifREBnNZfC3psyEIHwb0ZOpnE9ZK08N8ggYu7bzTmyTwPgIPWtok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IqtzeUX/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so9611663a12.3
        for <linux-omap@vger.kernel.org>; Wed, 19 Mar 2025 04:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742384438; x=1742989238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mnFp/IlyQSmTN11coM6CacS2HH63qWF1P6HQesyvvvY=;
        b=IqtzeUX/xMCj0BV6NwRCRHv5/5FOdcGlFwp1s6bgmE2w4+wMDhmHTKw/fCS04x9wd9
         PEWFC2SQNq7CkoN7cl7DiToNOlTGJ4Bml3XpwNZzuRjZqBoo9+pyL7hDCX2oJPrfXLc/
         /3NX8TYi2yjyEO+5/7C1YhIpbJElQ3zUCmNho61/AezMtVgYXcXkRPWQb0Hfw6tqaJLn
         1hYA/Uju1QwF6A0Z/RIrHkByWzm+7SyveKW8Zoc1Hc6K/Wau7SZ2jflxl2Jd3bUAt8sI
         vUC++ikd5QQ55VNXxiWt4GKJIVLT6zNsxZuT48GBlPAI+plUXuG0hCWOlo1Muzs3Zh2Q
         g9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742384438; x=1742989238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnFp/IlyQSmTN11coM6CacS2HH63qWF1P6HQesyvvvY=;
        b=BIJAsJH9ZR5A+kaRp1wtp8uLoR/XSau/6AiHKu1RxTV5gzGwMgkfI5S/k9ukF1VR6J
         SOMSGsBCx84BjH9wu+fsWJLr7i4Wmdp8GfqcXwewj+kD/7uiCsgDOripLROlDWLmXqdv
         VlFNGu05T33NLZ4F1kz3vPLeESTQFVHd7PNiWhgMozqJUAX3Qw4BX1Fkns2ij4NX7mKd
         D9GnPirgwl5Y2DuU9o2Gdur3g1s/4a6eiwIXobKZKoDQi+qsQlcC8RlZxSUmtvuvYcU6
         uMP9pj7m9xjjOn5R3M5/Gp0vEaOt9W7xzSaIa8bYT3RJxtmW9E3dx8Jj5QwktY4UltwM
         sI/w==
X-Forwarded-Encrypted: i=1; AJvYcCVc07Rvc9rV+t8fpjn94zGFSdMBrOfLoDtSY3slyrMOxwE/P9PtNAglcLO8ApdbBGIUGh77+xQzKKLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwA8vurvzxPfDU0TOUxZmBdQuipxziSxsT5ta8590FI1ufM4zGE
	27ItKhFpxcuWFFAg++4xbq1SgSWibuLmialdZRsKNR2a7psxIVTvQp4EI54b8klqofm7s6xyXJd
	9MMuQj3dXQwjlUe7dGvZE4AffdbNid8mg9znepQ==
X-Gm-Gg: ASbGncvGkNKJvwpVeB0/THSgRJfXjFfnzANLX5I1VgLzrWuAkECU2kObLhJr5v3OSBE
	3cAR9rqKEKsze2fp60qfKsBZo4r23MVuHD5zLOO5o3yzzVscGLgXmbxETwqf+C/Ss/rhdNod76s
	TKvUOTs3qXZ1C8ekYVMLh9ZazT+Qk=
X-Google-Smtp-Source: AGHT+IF0PzKaNKAL7SPqWhs9UxBZVmDcGAhQ39w6MNvnxwI7NAxBaxdfkqg2A7NnvQaWeAw8MONWf7mWrGQhnF9ndlg=
X-Received: by 2002:a17:907:3e1d:b0:ac2:aa51:5df2 with SMTP id
 a640c23a62f3a-ac3b7f91d17mr235997766b.47.1742384438476; Wed, 19 Mar 2025
 04:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318140226.19650-1-linmq006@gmail.com>
In-Reply-To: <20250318140226.19650-1-linmq006@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Mar 2025 12:39:58 +0100
X-Gm-Features: AQ5f1JpZhZOJWrjReMX_ekwAE_r0NF0Q1GA_lYDgPOQJ7eXkzTyG3252h8Kv8jI
Message-ID: <CAPDyKFreSxNRF7ZuokqjxJQQsAxHOvX8VBS8C5usyDJuvT4p+Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap: Fix memory leak in mmc_omap_new_slot
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Aubin Constans <aubin.constans@microchip.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Christian Loehle <christian.loehle@arm.com>, Allen Pais <allen.lkml@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-omap@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Mar 2025 at 15:02, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> Add err_free_host label to properly pair mmc_alloc_host() with
> mmc_free_host() in GPIO error paths. The allocated host memory was
> leaked when GPIO lookups failed.
>
> Fixes: e519f0bb64ef ("ARM/mmc: Convert old mmci-omap to GPIO descriptors")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Applied for next and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 62252ad4e20d..3cdb2fc44965 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -1272,19 +1272,25 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
>         /* Check for some optional GPIO controls */
>         slot->vsd = devm_gpiod_get_index_optional(host->dev, "vsd",
>                                                   id, GPIOD_OUT_LOW);
> -       if (IS_ERR(slot->vsd))
> -               return dev_err_probe(host->dev, PTR_ERR(slot->vsd),
> +       if (IS_ERR(slot->vsd)) {
> +               r = dev_err_probe(host->dev, PTR_ERR(slot->vsd),
>                                      "error looking up VSD GPIO\n");
> +               goto err_free_host;
> +       }
>         slot->vio = devm_gpiod_get_index_optional(host->dev, "vio",
>                                                   id, GPIOD_OUT_LOW);
> -       if (IS_ERR(slot->vio))
> -               return dev_err_probe(host->dev, PTR_ERR(slot->vio),
> +       if (IS_ERR(slot->vio)) {
> +               r = dev_err_probe(host->dev, PTR_ERR(slot->vio),
>                                      "error looking up VIO GPIO\n");
> +               goto err_free_host;
> +       }
>         slot->cover = devm_gpiod_get_index_optional(host->dev, "cover",
>                                                     id, GPIOD_IN);
> -       if (IS_ERR(slot->cover))
> -               return dev_err_probe(host->dev, PTR_ERR(slot->cover),
> +       if (IS_ERR(slot->cover)) {
> +               r = dev_err_probe(host->dev, PTR_ERR(slot->cover),
>                                      "error looking up cover switch GPIO\n");
> +               goto err_free_host;
> +       }
>
>         host->slots[id] = slot;
>
> @@ -1344,6 +1350,7 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
>                 device_remove_file(&mmc->class_dev, &dev_attr_slot_name);
>  err_remove_host:
>         mmc_remove_host(mmc);
> +err_free_host:
>         mmc_free_host(mmc);
>         return r;
>  }
> --
> 2.39.5 (Apple Git-154)
>

