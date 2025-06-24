Return-Path: <linux-omap+bounces-3965-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A6AE7003
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 21:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A25A13ABF4D
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 19:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957732EAD1A;
	Tue, 24 Jun 2025 19:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuweBf/D"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D92E88B3
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794245; cv=none; b=Z8qb8u8jNFJm3u94UzMLSvjR0MbrifMIt+qrUDEKAAtc5ogmznRJS/b9eyNUf2Si4Pkan2CFrjIp9fBZ2huHJBrGOIQ4y+5MIMtbFRPLPAO7up18a4W2AnHnHzDiQnPNAfGtLGnGAkVeKz2oLKXfxIZLNyTnAX0aI8PWy+x6LyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794245; c=relaxed/simple;
	bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRUw/2B0S8jo1B/sVarvXmxRJQYigmgKVzG2fCPwhTKKlIATlbMnOxPZ4zXz8wkv7XGOXIfhFfqvSZ+EoWJNaBoHjfIU1czhpwPD8gxJVSuHb/NHDteoUbrlvYuR7EvYW2yPiWEFhnP/B7yK7LCaMLL8ExGsDjnfOuMBg6dgj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuweBf/D; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b595891d2so8141171fa.2
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794241; x=1751399041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=;
        b=YuweBf/Dx6SZV/ES4ka0J24b0HGZJ6DKvelBic6v7vtEMuXQYaq7y7u8fsIdzd53Ug
         T/izPE21Rs6qf2tq2ef9l32nn0rshjyM12/1vAQggoOJJNZ+5wT/XSzDBfIGyU45+pia
         cYKgK6nMTDq0Omn85/YCoHk2NHXo9ucAb/YO1ZbukPV5STuI5bhPdPmENeK1rLamBTpU
         Lxq+9DTSuLoIkURW1yLjC8gwIkTVtGsvZDCKcFYHVXC8rnHKsHN4/g1sN+0kkFLLWwe3
         0LHCplcJ5T9Sktq0SRwZpWO48uR+08HPj/Uah0eoRSDuRFQB3t9jRBa4iYSnuhXlQyVn
         apyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794241; x=1751399041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=;
        b=HWeJQLb0NRRU2nKoHTDY56WZa1CFZSgZZyrrVUWdlEEzIFoX3N6U2CjvY7hvpUr+r5
         csFOeAGyZ+xq+8EsEW0xf7jkXuPEgL8KRBwcI+ddehFzjT/icoT/hDEEGaFEIDfIrWta
         E6OS68iNHan7EKWCgkvCouK6WHTJnl3schlDLL0XZibUcynSnHRYUXaAJTLRJ5K7N6MU
         XBUIoT+KJDNrv6whQM2DTc6y6pQuL++ru1E1+yPqtbZharSbAL+CTYrOu96okA+CHIkC
         QwYz70xqUNqUz41QaokxmWzwowudFnjU9DgpjEiLcXblroSlCCR3VPbEzt7tIlQEOp9S
         VVWA==
X-Forwarded-Encrypted: i=1; AJvYcCXR/BBptp9g9hHK7VHr7DYNFq88MSeFX6+Awt7ajk3GMi98AU+n50MKdynT035TL9W8ugBYvm9rmJ+U@vger.kernel.org
X-Gm-Message-State: AOJu0YxohtvNUHYbEhl6PFT5WMsm9/aylU9PotNPLx2Q0wQg65oTo8er
	MfrWAURUgtJvdww4zj2RIIP8Xo+st4o3DMaYX0i/7l3q9/l3VLOT12nw8DnxlwwOffkKExfUPeH
	xYlNYKFVHwek6FoDmNeIkpfWOSqNC3wA0jvBU7ZgntQ==
X-Gm-Gg: ASbGnctWEhKE3ZpgWXp9HoiAqEC0M5gyNjFQJGgZCWRMZWM3yYA8YOvE7HcBGLqwen0
	qrMEf/KygKwwZZX9IvHUhySaqvIDqsqPBmtQ5cVQTVekolYnsDMg5Zm32H4ZRvU704VWom864aC
	jmlI5uvpmAyK9QmWzgnhWnblOs7Wg+T3ETDRSRVh5AiqE=
X-Google-Smtp-Source: AGHT+IF2ZsZmunuKbQXBbvrJ/CF+mo6d+N7b7ivEICTBxI/GH/HmsLM4r9Hm61QzUCqDuwsN/lGUxeELXR1RoBAx8E4=
X-Received: by 2002:a2e:9e4c:0:b0:32b:7cdb:aa4d with SMTP id
 38308e7fff4ca-32cc657b90dmr64541fa.31.1750794241285; Tue, 24 Jun 2025
 12:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:43:50 +0200
X-Gm-Features: AX0GCFvZTjr80iDIOZKB_55ymASKXhThtYvBCFl997kaJ5_-KuT-0OBBGsj3psE
Message-ID: <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
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
> Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
> module, let's add support for getting the relevant values from generic
> device properties. "label" is a semi-standardized property in some GPIO
> drivers so let's go with it. There's no standard "base" property, so
> let's use the name "gpio-mmio,base" to tie it to this driver
> specifically. The number of GPIOs will be retrieved using
> gpiochip_get_ngpios() so there's no need to look it up in the software
> node.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This works for me.
I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
property all of a sudden just because it now exists as a device
property though... I kind of wish we had a way to opt out of exposing
this to all the sub-property paths. But it seems tiresome, so:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

