Return-Path: <linux-omap+bounces-5477-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF22D21912
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 23:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C16CC300558B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 22:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292C528469A;
	Wed, 14 Jan 2026 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rzQ9DGe1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4C3AEF4B
	for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429812; cv=none; b=cerKXcSo/w8eMXHlS6XUD9B/sdEgNmhcx3NjkW/s3p2OyUmCyhIJl6cQ/dzKF+1cPzIXdsDhXW514FpGDYnSklRdnfSLDJWBx2qm/TyaS1NauQtf045ZZmhS70MwhrxLzvlQn3/Qb5xfn8d2cToc8NUCTa6AKwxebO/O8BEnxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429812; c=relaxed/simple;
	bh=PXVggypcbBwJihCtpCrmBLopaA1RXwINv+2Iwfde8Lk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kz3j7rsWiV9vtKCX4VtlWywJDZm90HvcjCEMYU4NYH41EryHvKSKgoPicgssiipRboDOhwqAS9yjjs7RfTfWwZ3rhXujNLTpPdR9tEkKET7mafh58yFFRJZH9On7XXSjMTRaYJTMW5PAZl+H5bYu1XpDS0QDRaYHRpnm++rmsuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rzQ9DGe1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81f223c70d8so229012b3a.1
        for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 14:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768429805; x=1769034605; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ymy5giR6WrVAtVFXMff8n5QnBmgyVv03sjiXQEbjz38=;
        b=rzQ9DGe1vQYjvJmJI6BuZ7gB0/d8ncL1Nq0OTaqvyRvHoGfemAwaUORwMWkPJLdClU
         srNXLcCX0jEwyWFvPlEmc12LFh0Wy72lVDoL+Myg/s0aq6WCpUzto5zf1wXAwyjI+Jmq
         M/110jGt04M36BNknYY7K1Bp5EkYEhkF1ZoVyTtpRYPYwDnrYZB8uK+4S2Uti9Wy0Xtz
         AaMtIIXJhtXYWC8kK1mY46bK+2IK839vGUIFj56ix2lVjKQZCeU9aKxKktV+I6cuJ54V
         R6c1lI6ZnEgLpdQtXWa1VkRQIF1fTAbhwTxg9I5bHZxR43v8d8zmVddxJBnXbB9vsRlo
         yetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768429805; x=1769034605;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymy5giR6WrVAtVFXMff8n5QnBmgyVv03sjiXQEbjz38=;
        b=WkPhbEzbRWQxUwyWEeWidO9AKRCMCHE6W+IbaMVYiHqIASbUbMJKu8og4ldsVCElSi
         eo51Qh/Od5dZ58hYSASef3dhMuwO3ghIii4WSQrp7bVvgmWZnKbjcvRo68i/1UA+7MFP
         lTopgvOVm07El5luyCf8e7PTLdeBN5o887Fpgo0EaZZYpGCylOuIFmkM3839TkM6vnRS
         vqAKEhtbERioglHj/5OO9I2lwWQ/6oEfYmGxM7uzZ/qR10F/SsIAdq5ChPy7Uw+gsyQk
         WinF3VxrQKuAlJ53pjbhEMKEvoelzhO3s6VfI/jBNvUnqbC2W9y9W3CzpADRZW/ESpJt
         KPXg==
X-Forwarded-Encrypted: i=1; AJvYcCWVeHz91GeYWIg0DO8V98wNnQBHP3ZeTb7twzXXXRNtl4grmcny1Kb3Q2bKsJ8NV5usGNofngxDh32s@vger.kernel.org
X-Gm-Message-State: AOJu0YwS66M4/Isy5Iao8siHE6Ox1yGMnTgSqlFuy0+QLZqsppBXFF3M
	H0eLF6rzF/3aJKketmaiXzsQRK5r/mZ0oZBmufB3K8caOhQtFOMg7cGev3OmLJ8SeDs=
X-Gm-Gg: AY/fxX7QrSHvS+f4lJ70NIOqHatW0hNCk/am3dO2/S/skaE27dt7GL+TniS0tNtFGQX
	sT0FYfjs4x9iNK3CIZlTJaRNfvlss44hOxPrq3hE6UQnBoRqmPRSdbl54rpbegUrueDLYzHHLzE
	a2FhwZIxD3QN68BcGFN/zoA01kbPy/1o1ZQDfUBGBhY+iKqcXzME2LUff8gWRC4YYTdPVrOWLXr
	1gEE6tV4Vtw3S9xe+EbCXc1XOJfrQJfPdResG4zSEdxyeOvkxfBE7U1YOcZychnryz2qxEOSidF
	AGacGMATaWZKf3NrrfltWWMnyv9C4rigTdxKpa3bdGS5TVGtTNOcoKS9L7kr3qqlcKY+tCUMdQG
	Hdo5oH2HT7Wr74MweLTQ/T0UcEoC4Bn/naU/GYHsIL1kQkJizZZ/afWN9XhtaWFaJrhSCgCg31m
	4XebWwL6tK
X-Received: by 2002:a05:6a00:4145:b0:81f:3d13:e069 with SMTP id d2e1a72fcca58-81f81cdee8amr3317222b3a.8.1768429804947;
        Wed, 14 Jan 2026 14:30:04 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e64c33dsm515228b3a.44.2026.01.14.14.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:30:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, Jonathan Cameron <jic23@kernel.org>
Cc: akemnade@kernel.org, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, David Lechner <dlechner@baylibre.com>,
 Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: ti/omap: omap4-epson-embt2ws: fix typo in
 iio device property
In-Reply-To: <20260112094259.4648cfaa@kemnade.info>
References: <20251231-mpu9150-v1-0-08ecf085c4ae@kernel.org>
 <20251231-mpu9150-v1-2-08ecf085c4ae@kernel.org>
 <20260111123200.6871a41b@jic23-huawei>
 <20260112094259.4648cfaa@kemnade.info>
Date: Wed, 14 Jan 2026 14:30:02 -0800
Message-ID: <7ha4yfzv2t.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> On Sun, 11 Jan 2026 12:32:00 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
>
>> On Wed, 31 Dec 2025 22:14:17 +0100
>> akemnade@kernel.org wrote:
>> 
>> > From: Andreas Kemnade <andreas@kemnade.info>
>> > 
>> > Define interrupts properly. Unfortunately, this hides a bug in the linux
>> > driver, so it needs to be used with the driver fixed only.
>> > 
>> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
>> 
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Not related to patch 1 so if TI soc folk can pick this up that would be
>> great.
>> 
> well, it needs things fixed via patch 1 to avoid creating havoc...
> But from a strictly dogmatic point of view the devicetree describes the
> hardware, so it is unrelated.
> ... but from a more pragmatic point of view, I do not want to have interrupts
> enabled for drivers which do not handle them correctly.
>
> Of course this should be picked up by omap folks.

Based on the changelog comments, I will pick up the DT patch when the
driver fix gets applied.

Kevin

