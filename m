Return-Path: <linux-omap+bounces-699-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D918085EB6C
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 22:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E65FB22707
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 21:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54C3127B6F;
	Wed, 21 Feb 2024 21:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="drqEE/Ra"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FAB1272DF
	for <linux-omap@vger.kernel.org>; Wed, 21 Feb 2024 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552512; cv=none; b=X6barVW77uCUed059C/U3OHxpXcWLamtUFE9qoNOBfVOIpXaYmoDe4iO06jgbntqaPvN9XR8s4WMVHa/VxotC9Od1dQkwwmTUZZ6CWnuG6qHhu5oxbsmxSS0YWxRwjfgHdMvDyuLWYiVy7LNt+aoHFwEzwfGpj48DgD2svbsRR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552512; c=relaxed/simple;
	bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daqc0qLl5OJLGnvaRAQ+MLa3R9HqyiBhPvI9IUp1vx8lSESIzOqRqf5k2N1oMDKhRI0cPcaLApaWx9GRo1cJQ5YbhizZiNs6kVbwWj4O/JRuDj4zDBpjcqP8AN7zgO9W7dDKUZvT1bFr8R31ro32lyEzuDzHBemxsdwEsPmVpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=drqEE/Ra; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60822b444c9so30055917b3.2
        for <linux-omap@vger.kernel.org>; Wed, 21 Feb 2024 13:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708552510; x=1709157310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
        b=drqEE/Ra7/oHoShJ7/NZDmAVwtS0BWeyxBhhJ8pG0Q+hfOT7/RkP1v4BPHiKR0l+TW
         2pEHKFm5WmwIi9za/fv4FYJimgSrIxuuEs/7MGdBTLj4f3X7E48RBGOjLOwBhjpAFduM
         42tjxlzb8MDXXHi9bR0NOa27f6f6ILYvFdV2v/Sa2UzsetY5ZWkpMYqftkKJqXbgtauK
         WORIW/FkuPGeVWFU//sFhGjZs6bd231h00u9XX95CqEJaGaWxRgtJCStxG/IDH8qVDmH
         Hh9nB/0AwHVFxofSGBzQyKaoahb+eCHVljS8/7bqDQu4+VFfhZo4a8EYIDrzh0t/bdJQ
         lA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552510; x=1709157310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
        b=ocp21fVkSzI/07WSpPaHs5qc/iwCjQhwy1iQB0otm+yvGzCva5EA67S5slaFx5ZelJ
         b+ETxoQER+C35J6f0MM6ASC8uPlKshSmQmTbzbxYbBkvXSLyBhVDTbRLLFslGDD5YTsj
         VyQSQuOlJzKFXklHLze3sJmfmkGRKZQW6GVcjf/zL5noVDhdt53Md3FSfw31ITZCe3Dx
         nkMzefg/ZpWQGPaNAAcy8B2jnAbMVxj/oCZupj6QCq4vDYl8pyDmGkmnxRHB4HN20fhB
         hh5BUwBOHjiyhAXEigtCjq3dbEB2HdxOV686eSaRqfKaH+hzDASf5zZHPbu+oKfg3O5X
         egcw==
X-Forwarded-Encrypted: i=1; AJvYcCXc//7dZSZqVmr/cu/gKn6M9xdEM+/gIFEpyHbWeIyX3Ol57j7MMLY67mlZlRAdkTxDf3QbjGiqPydUsUP+YqRi0kTn+O58lGvgWA==
X-Gm-Message-State: AOJu0Yw7gmN+I3/QfWlfoOR/WtZM/cY4UMTCO0ZA/OS27ZynwKn/zUUn
	9STED70wG187o/KI20S8ZR+ZpTl3pCvtjgMGGsg5x3lceMUNbi0+4nwpmP+Thkh9E/JINtyGzny
	wRXjNZcLLQEG8zeGxCzBzGl1lAtIMwiawKreS8Q==
X-Google-Smtp-Source: AGHT+IFG7OkXBXjbNPYxfp6BSZzFgHptfq8O7pHlOruVpRLafhQo6wGBbhxmoAykBBf2wzpi0CwmDlGUgveqYfQh/CQ=
X-Received: by 2002:a81:8341:0:b0:5ff:796e:481f with SMTP id
 t62-20020a818341000000b005ff796e481fmr18807228ywf.11.1708552509905; Wed, 21
 Feb 2024 13:55:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com> <20240102-j7200-pcie-s2r-v3-1-5c2e4a3fac1f@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v3-1-5c2e4a3fac1f@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 22:54:59 +0100
Message-ID: <CACRpkdYSw5_70H4k5ZX-stCU=CH=v_0Ggm+R+FSBhdbk6mnhOA@mail.gmail.com>
Subject: Re: [PATCH v3 01/18] gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 4:18=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Some IOs can be needed during suspend_noirq()/resume_noirq().
> So move suspend()/resume() to noirq.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

