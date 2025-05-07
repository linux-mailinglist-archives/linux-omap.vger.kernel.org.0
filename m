Return-Path: <linux-omap+bounces-3675-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05143AAE7AA
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 19:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE2263BB9C2
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 17:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD9028C5B6;
	Wed,  7 May 2025 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCN7Koml"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135428C01A
	for <linux-omap@vger.kernel.org>; Wed,  7 May 2025 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638451; cv=none; b=XJZ8NytTwtzKT+PxcQv4WASyscZShGV2AV1ay+5l+yfShsmpzwTtZi0yGHjUdnKSAKWzlzdRGLAvZY7EF3Q1Dftc09FZnWM3QevyPkYQlMiUEy+kJuJNrl4b5n+9xoEfiEjKamiWe+xyegp4b2Dld8z2fCD719UB1O/6y8rD8Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638451; c=relaxed/simple;
	bh=EK2I+PIDSegdPp//dTcXMle/m2bG3MDkkTJ0GRpOWaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAhoOHfyi1mT1kXRFsp+KtEuoam8Uus4eLgcslFPMGI0ToTiK3nsvxgByq2EFgb+xPRSC2HSk02TOrZvJKtNqjdQgB/I8Ur9Smg7NpDVGE75DwWUFnj73xzKcrCN4fTycW40oy+4C2Vzot+IcN1JJofkwQmJKk9LvDwomUJN8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCN7Koml; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso792785e9.2
        for <linux-omap@vger.kernel.org>; Wed, 07 May 2025 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746638447; x=1747243247; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZIDIc+98VT1uzADSEdsyAT7FWEyMDLAchzu3TvkXi1A=;
        b=dCN7KomlMk1JGtp7bNKag2Q1HMu+y0S+xgl89Ts5SdoDRZNhhIsG2UikAKzcDaIymj
         5jvMg/fRpn+jelkx6/O+6bdStDOdfu9WXJi/Qm0HOFKyziH39pdOurqRAk1I3dc2VTbL
         VsZ6ckyj/jIduAL3tqBZvilEzrvhDbBB4qpQ09yjpk58YONvXhtwPAqgVCBRFOsnxpX+
         vqakyph3cDOplhr54dzysiICn2SQuBsDhOO7SmSa6l41Uy6I4QjYBy327xvHtp1prU3i
         NVaoAASPyeHVIkL9XsellWgqmzJdzx8rTPHtSMaxbrlnlKViY1469qSvyg4iYQR5RT7z
         J+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638447; x=1747243247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIDIc+98VT1uzADSEdsyAT7FWEyMDLAchzu3TvkXi1A=;
        b=bG7GP+iBbwSJ6uNzLIHj7fb1VtkhO4OMoKaeIKZkIBLUtllVM8FnyfRanbasJY6BbQ
         Dg8aDCqDRYJA2nu0ZPyddjfnQudZlcwPIqTLIj5HVqfBE8JULVHYiF3zI1XDtRZExlv0
         k8S4uEB8NaX5hDxAlq2kx1HXmfVj3wAXxz5CwPCDQ61VHn/SELj9nyRwe9Ml6oKDiDl0
         AgypV8PeOV9j7miVvs4cL41Yu0OIqNMHRqwL8wXYOTEaJyAZt1/2QAM/Lb8t6gbq4Dpg
         RgeUY/4VvhewBI19hKsfrpaJQ+0M/7yOodIr7nNMZU7KSvSVYOqR35WuSkDl2+1fGL9w
         q3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCV356dNOTQYt6Mp0R157/so6EqCWa/XYOWjNwMiC1Sk1LKYdTRDQtoZo/iZ9h9UbXRzzDB1ka+oQ4s+@vger.kernel.org
X-Gm-Message-State: AOJu0YzpSv6GPIN57UZkVQWsmMIfrCFCoWJQHh2BDk7ynho0hp5obfpf
	yt/kLEBHMX3/TQfMuEzaXpd9HjHjNFF5xoPeVcX0V/xpUqaH8uEIhgIn76uapgY=
X-Gm-Gg: ASbGncvfyXWfmHcR/FaH9ts14X2HgmGP4ZAAc38ZnhEp9VQkRtb4RHosFkCgQysIlLw
	7/ZdABAoDevUGL/xvSw1CEPaWU+0VIWP/tbGQJpM83iQ2qyL3Dqm8IKcdr6CDf6zJ3120hUadaM
	cOJn4sVNBJezwNS+IaC5UPdZVw7nTW/UN7aZTWBD1WoW4KtMQyDFsE+Tv6sdOEW+iUGw6Gb/NvJ
	oTk/gHz9oov5sd0a/a1IERvDfxARFqRUJO2Zg6qTHGg/U+QqJzoAWOQWuZHVMCWeNCiieEwa0S9
	oEN1XvXYpkSVdt16kNYgxYP9qHeKfKpeU/gDyQjz8P0Gyw==
X-Google-Smtp-Source: AGHT+IEgJ+zhZsE37EffQPRp8AYlsaRDot3L3dV0W/8v18j/U3bL8+1nDlYSIXsP5Wo9mJZnrHE3Fw==
X-Received: by 2002:a05:600c:a413:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441d44dd4a6mr34168545e9.24.1746638447619;
        Wed, 07 May 2025 10:20:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd350d96sm7383635e9.18.2025.05.07.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:20:47 -0700 (PDT)
Date: Wed, 7 May 2025 20:20:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] regulator: tps65219: Fix erorr codes in probe()
Message-ID: <aBuWbImT1jgm2QTt@stanley.mountain>
References: <aBtZHEkgYGK33fWk@stanley.mountain>
 <43f5dfb3-ea3a-4f1d-b3bd-9e62f976b651@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43f5dfb3-ea3a-4f1d-b3bd-9e62f976b651@wanadoo.fr>

On Wed, May 07, 2025 at 07:17:25PM +0200, Christophe JAILLET wrote:
> Le 07/05/2025 à 14:59, Dan Carpenter a écrit :
> > There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
> > instead of "error".  The "rdev" pointer is valid at this point so the
> > existing code returns a positive value instead of instead of a negative
> > error code.
> > 
> > Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/regulator/tps65219-regulator.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Hi,
> 
> > 
> > diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> > index b16b300d7f45..f5cd8e33e518 100644
> > --- a/drivers/regulator/tps65219-regulator.c
> > +++ b/drivers/regulator/tps65219-regulator.c
> > @@ -454,7 +454,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
> >   						  irq_type->irq_name,
> >   						  &irq_data[i]);
> >   		if (error)
> > -			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> > +			return dev_err_probe(tps->dev, error,
> >   					     "Failed to request %s IRQ %d: %d\n",
> >   					     irq_type->irq_name, irq, error);
> 
> and error can also be removed in the message as well, with the corresponding
> %d.
> 

Good point.  Also I spelled "error" wrong in the subject.

regards,
dan carpenter


