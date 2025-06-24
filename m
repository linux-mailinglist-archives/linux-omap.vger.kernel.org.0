Return-Path: <linux-omap+bounces-3967-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B47EAAE702A
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 21:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2C027B0C7A
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 19:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236352E92A8;
	Tue, 24 Jun 2025 19:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uvz+GWRp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D02EACE9
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794351; cv=none; b=LrwT2kOl26kpxcY1XoNX3HJtZK8k6Tg15e5MTRgayoEQ5nbtupYKxcSTBBaYPPxHgstqo8HjniWT3zNan2DI0T85nRLsQUTUsXAtkk/l3IGQZ+RqrvnykdkMX5SnNrwuPj06YPpRPFCUV97O7NNF1+d70Lp4itLvXGUKX/VIPf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794351; c=relaxed/simple;
	bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tomFS1GQepTqq+zYGkgaPqduZDtaJRUe4JaR2/Z+72FTO76I7mrh2pxa6XcSAk0BPGOuR+ouCtqV09W41BME/A2NoeCXa74i6Jf6msaxabPVJGgm0kEQ/yT710wOjuO1w1kt254iHxSXwBjZ6AFwtzCqDny7i+lNTOI8Gt0+8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uvz+GWRp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b561a861fso7246491fa.0
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794348; x=1751399148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=Uvz+GWRpTRnT8nKtxhEc/eCo7ZG5NAvzQCPFuUyl+e7x4xx34/OQVluMhmvu2AMSX1
         afYwoBsuAd1iyqI8sJGGp0VLXRYjybuRn1C+Z3FdRI0+PJyfx05xsjhGZnr1alWI7taj
         9UY3ldcznOUMO77Dtryz/RDlY5G35wQt1xyq17iL8qSzfDXktUtM97Xk3G7zr0fdxHIa
         bn03ruHMVzVdAlW8z6EPnIPdDwDbbZ8qHsV9N6XoyxjgUuffNOQeWAr/3W3rlhK3bHyb
         ui9ne4B1nQQWlcZ7zsAUHBPwBycSu9tDthaM8YesgizqXmRdQFI8fO7AVAkzKn3sQu7S
         oBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794348; x=1751399148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=OrMO881hA1XgP1BOgVF/BWrqh24piUE4lf/+6tM52YaCalrahsDfEq0OaWpauTqzqT
         SNLjapC0JPLtuYgZTKD7zqYTL04CmXLH3NDpBAWSCPJ+f/Q3O682INg5eQfy6UpwF8Jz
         FtoaA1ABc6p3mRvO9tR3BFGtatP27BAaE4YmyRJori3r/NZzZ3mKTwZzFYkoaTdqbZ1L
         lw8oHUoanA5/W2ww6TECTjL05ruGNduIe1MhRfXI+GD6x2S96AHIzrfkpf24VWM+geOB
         Ngws+xx1k/9CVzRJpNo76vMcqarMGkMtiTnY7wa7AkkImOZynsvDBiZBLXgCSIixygwm
         CjuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDZSL4ZGD3WKT248iIVjBovV44ve+ma3BXOwgKHA7t2wFRRK9+y2sKC6eHWtq8s9EjToWI8CAwnIB6@vger.kernel.org
X-Gm-Message-State: AOJu0YzKUY4BCVlkJb5YERFU2Oh5gjzIDgf41Boojo0c81UMN/C2l63Q
	UnWWKcA+GEFk16kK7bvoKkRkX5X2ZS1SZOLptfn311GZJz+wRTM+nBQH1tVonWpu2PxSdbjqvJW
	D2JDvkZj7Ncs9MEKYPVGFf5XNX3+k2SwzO3QzxPwZTA==
X-Gm-Gg: ASbGncviIXrabDQxuu4IyJc2OuCuezTSJC2LJsjalHhbnKVfHIeKxD1I2vbcA0Ow0+r
	79muTaSwBzIp3e8V4BDv8+Vn2RmWJHHx3XYGk8QC1Nq33g5jBelhmcCZ6Gf1D5eBG4fhUQayqKq
	DxU2lvh8vFJ13OcXhtmwvJ0Eb0TmI+6zhOMEtBT99ixdd4ixLGVlxl/g==
X-Google-Smtp-Source: AGHT+IFmqiLtBv2UOTh1D8iZHZIySmZyFDbcKWQIsCqDE3SSo4mBAPZZgwKH6/ZLVohgVWg9CA+g75neATAOTu7gWuo=
X-Received: by 2002:a2e:a7c1:0:b0:32c:a006:29d5 with SMTP id
 38308e7fff4ca-32cc6432fc5mr199911fa.9.1750794347783; Tue, 24 Jun 2025
 12:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:36 +0200
X-Gm-Features: AX0GCFuxMgt5rF_SL0XMbgco8X42yBA-5q-4FLSXTx6fBKQwC2WxaI2emdRh8Cc
Message-ID: <CACRpkdYTQywBeO_NSdjHZFAc3GizCpM9bSU2W+o59vtkp=Cf8g@mail.gmail.com>
Subject: Re: [PATCH RFT 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The two latch GPIO devices in ams-delta are registered with struct
> bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
> remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
> also able to get the relevant values from the software node. Set up
> device properties and switch to using platform_device_info to register
> the devices as platform_add_devices() doesn't allow us to pass device
> properties to the driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

