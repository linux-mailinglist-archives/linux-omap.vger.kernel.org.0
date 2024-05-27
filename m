Return-Path: <linux-omap+bounces-1400-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE908D01DF
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2024 15:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B1A229504F
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2024 13:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F9515F33A;
	Mon, 27 May 2024 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eCgZ0cWU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2333F15F3F4
	for <linux-omap@vger.kernel.org>; Mon, 27 May 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817078; cv=none; b=Iek6AfUKjHub8CZLQAZstMgiJRUGhZs7AR6F0bR+a0r3Abu086sHi66m5XKzaHygQ3EXkZPbkaQhPMz5fvh/kTHUNJ3RUUYrU4omtSrw+K59dcdNoeNuGVXNKW0GXLlQbgKpe1N/ZOT8jlSmlvnaS4lY9Id8MljvEVEvVN8tEGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817078; c=relaxed/simple;
	bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HA+hy5DhNq2NVnGg/PZYG6iIw2afQpNPlj88zI+uRCir3hdcE5+IEvt6xogZ0rTWBcg3KC67Cy9Of05miP/ftbKtcUazwT3DEbn66lBQMdv9pDtefHh5axPZHgZwPOPNcT1KDxgu9KSQNmIVyrabJoNvPNO3TnUziATpW4hYv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eCgZ0cWU; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-df771b45e13so3033438276.2
        for <linux-omap@vger.kernel.org>; Mon, 27 May 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817076; x=1717421876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=eCgZ0cWU8XvjJ+3rIdwk38GQ85ioZedXr/yh5C1PXCUy8eujLIBsVkzmEo+lI6I5Cy
         9aVz0PgLjw27AN8C7BzX2tlR/2aQ/SvKOJIXp/oZdMPBHWAtYDPvGY9PryXGRjqGlilR
         6dR8+zzCiiJECAVS1G6fGl90VA69XEArGBpcHxiCUkGUsUejtZIGnJ9UdTZ8RpYa3lYq
         RLBpEPtzijIS89HWplQnqZs9P1HnOUeXr//TGnLnrikEfqO4gdrbNYJoLP/RwS36U6Dr
         eUQs1y9hPRUIUCoRmoAWpCkce22ZPFdBeklMPj1+0fhp+KdMBNo6TVQOmOAPU5yUTNUh
         RvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817076; x=1717421876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=tw8MKS7b7ZigCcj/wrmPL0rhorsKVefKSmMrnUmz92qtso951Ru4Iuz/vG8Ys3kJOg
         YOyUApPrQVuxuGRvBk77hK8Nrp9iDVmsRYadpQp8UA3Iect/q4prweRmCvlFOx5303Rv
         VsdMncV7fHCYBY/iHU3BTXo+gAz8U5DqaDNUMMaCwnfdVefdx5GaRgh5wV20VUU66hV1
         12vQC/hc3VZPWgo6tRihp9QljkKa7bHn/4f2fYfNJewqk/1nBESO7xLsUwubEeSMpATi
         BzWgBNK0MtfM8daJhFFWLCpfqKWjQBUauqOLPJ11jlz7MzsGhEibVJJpKQ943dCw5B+g
         FQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0F+JGnSp3+mgy37KT8iqNB6u1ck3IqYYvVyomyBGZSHiwOVld7SQmkYrF2tWihHlsxzembfJeBgS49ziNJX3eQoBJ6eOWApuVnQ==
X-Gm-Message-State: AOJu0YwcF8sT0f87JaO+lGRwK1gCGpRmBICoeTcCZdGqP+tnVmH1ftsw
	0hiKQo+9BavErhNdB0bpYBFsnOhrrNyZ4l0iI+3ORRjRa/yM2gjONXvObwLXSeGI7tXmJuymTBy
	N3cIBn9dp4Zlyb6Y+VPlYQkcgG+A73sGk9cGGYw==
X-Google-Smtp-Source: AGHT+IG3ODce9dNV390Ozs9wlqpcGCT+NP7kvAR3YSrx49G8pypddGGuh8zJs0qLVCnoqGn9N6DYCNxnN4AlbhGb3Ao=
X-Received: by 2002:a25:d610:0:b0:de5:9d13:591b with SMTP id
 3f1490d57ef6-df7721c660emr8663079276.32.1716817076072; Mon, 27 May 2024
 06:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com> <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:37:45 +0200
Message-ID: <CACRpkdZFfjCitNiGVe=F4Jd_M36fqdG0ixD7396xEVbvqZUdyA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 4:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Would maybe mention in the commit that the quirk to gpiolib
is already in place (people are already confused by it) but no big
deal.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

