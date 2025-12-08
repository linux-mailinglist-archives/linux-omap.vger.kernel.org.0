Return-Path: <linux-omap+bounces-5125-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAE5CAC746
	for <lists+linux-omap@lfdr.de>; Mon, 08 Dec 2025 09:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3DF5301E5B1
	for <lists+linux-omap@lfdr.de>; Mon,  8 Dec 2025 08:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4379C2D3ECA;
	Mon,  8 Dec 2025 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSTEl7vD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6229D275AF5
	for <linux-omap@vger.kernel.org>; Mon,  8 Dec 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765181048; cv=none; b=lXqDfJpM8i/692gjKc9ksO4161cJS/b+4eyYsksjr4OyOeqDt/tj5xb8byT4/zmUnHGSIJXtoVFHAGcw7ndYmNwEXWP5cv8LOmFTvoX87iQjipV7z0igKY6DsbyG9romJdkvUREx0osJWPwKuf22ivQIUBsu9Cm5irMGA4q5i/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765181048; c=relaxed/simple;
	bh=LcIjzS/QX9OdfzWd7S5fStct/j5BiQOmeNhDz/vl8LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnrgBMzjTN2PM3kl8MsOmQl2sMGjKpTdW6r1N8N+TVFoW39ZXIdVHSPGzzIbSr+4LUDh+Pz9PrEx+j33+c4O0b7IaNfxMHSuhh+I7UhcB/8lEQBm/PoOiRo+Huw9uTrK3Xr0lXK89icZkfcm5JWKzEavDC8mRcBV6C7ZqWf1c3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSTEl7vD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so3158858e87.3
        for <linux-omap@vger.kernel.org>; Mon, 08 Dec 2025 00:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765181045; x=1765785845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=RSTEl7vDc1dcrV43f4lJp71x71nXdxonolSC+FgFuW2YrEJPE+ZMyPV0P1/UvbeGg7
         3rIAzVfJ1h0EgIoQYtz2j49lWTVnmXZgCkbqWODl5IF8edwdTqlPYrNnRJGjJ9zC9JJh
         jg26EOgV7P0Vm9/2A8Ovijk839KiGACsWcyvRNyBTYzLEo9LOdlFT5Hmcx8vEXK1tV1P
         OQIras0Rhqw/3cV1AH8p6GpM/2+6Cr1ogNpf2swjA4i7kItSWxFyxyy2T3nBWQHOIzPo
         Qd4p/0Tg5LLNMbWm37CZG8gcG4QXRYLWvsCywPbO6ahrgrZi4l19j8AXaL1xAa6vmOoO
         x3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181045; x=1765785845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=tPMYhUtMt8Tdte9qNE7RNmAss8Nm0fJ0h35JLHjAl+1tC3w6vSrVZoMHejwncc89Q3
         SxRq/zlNSnbj+3Rq/2t3124AW7yMBxkW0zyQt8w1vcSKH05tTyUlIW4EqWjPRSBYMEvS
         3M7jwkCd75pG+jAZPwinS/ACe3qYZq+9jO6k64lFgK7pE7oWYCtWRm3LvqtjnAfaW4SZ
         dh+tZeA3ig5SUCRWhZeZnFPJRjhPuF2AxWGQghUEpHLFS8LBiKUsvyOzuMKAnBfXOEbc
         62wag8XvJf+WKOv2zWdtQV3f5Fz2FOzP2N5sKuLGXxQKvFfFtCO4rmMD2u5+C8/iV8bJ
         S3OA==
X-Forwarded-Encrypted: i=1; AJvYcCXI9QuZiaxwWHNSXa6qod9Yghg6kzgxSGvjJF7DhPqWT0aUDMKh63Mvhio4CRh/K4JGZNNq/H9jNhM3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Z2AifYsuOG3OZhtmLYqo6boSCZAqLh0AC5bGelaq2rMsfZ7B
	TIQPeObJAPC/eURw9FCO1WF+Dv0pZgXCWCrrGlUSMKEjBX/vOKsRmIwX
X-Gm-Gg: ASbGncu3gKjOjGWkB7tiJuMv800+sZWvGvzVnFfAuVcPIIepy20k00OBFY9TcgRMA4X
	Yoj4eZixup7xT0y3IVm3D3LTp6aejthW8I7V/MrbJbSKALbqmlyOXGNGEScBC3rDImUPxKITbmi
	THvDB+DeUkAge0ADKKW8ZD+G+Ql7yysndZljJtpQguvur/K1eJXm/iZc0W7zhL6/6WRiQTsTFGi
	EYGCnO68pwB8hlBRM1LXorx60WwVCUqKKa1MKfZl/fwFmqcuH1hIxzpfzBLyySs4Ai9gtZ23gec
	7M3iRQiITBkIyo6yGVQeMPWHwSqQp5iWU13Rw3mo4jPYsoNlEpGAFHCOuEhgxx0Sm82RbeBea+q
	yM6pM2Rat/nWwG10FeqVCp5wpNUv8AyEhDoJ/LWsr/lCXWBCz1jjHGEnlbKWEkGyhIaqdSHIbKQ
	cnrjZ6ofkRSRAvGSYngThl7DH275IdLKqq+IOg81HL69LqqWx1CX07tmNadM3AaIlbl/eNG+z0w
	HCh1UI=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203;
        Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

