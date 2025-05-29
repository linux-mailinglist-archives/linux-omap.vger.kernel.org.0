Return-Path: <linux-omap+bounces-3748-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4491AC819A
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 19:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A757ADD1E
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 17:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CA422DFE3;
	Thu, 29 May 2025 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2UaXeMhT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566A822DFBB
	for <linux-omap@vger.kernel.org>; Thu, 29 May 2025 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748539273; cv=none; b=Amwm0gVw5QXwGXRPjBK5/tZTdGZDS0xlV7JPBIZdj0FeN1wZL2wetodabACekEiJvqZMId7ifaDzM/RiWvVA/t3Iw4bDYG5qNE2FltTS1SBWyelRqMPqT/GHs1GPV4IulxLg8tbGQfMHswtFV9H6i4rZClx+MpQbiTDo9P50Jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748539273; c=relaxed/simple;
	bh=14XvdjCWpYFMm6zM1TygU+AlStuIOYC9yEl0h75Jbxw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZtSBaoAQyv7kMMRm/bSdrQc3E4eB8fLsjwsEvYiuisSPAzEgACnwiLt3zRyIEfcxplb4JoIIZkYXK/sLNtjK/s9pt0Y7Za6VwvNFOmTNafYOTPDJ8vdcT2jtJG+LtahC2vD/Ms2xb3E3XF4Jwm1bCDFYD6Nwrj19mF+6b6XdJaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2UaXeMhT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1262998b3a.2
        for <linux-omap@vger.kernel.org>; Thu, 29 May 2025 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748539270; x=1749144070; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=;
        b=2UaXeMhTjky4OYmUCPBXbKVWuyYi2rdhnpsD3QPvAOhFhwa/BnsNNmzDVqYCqcHrfk
         EWBrmhSRB1diAXxHbvcD5w4Ad1faSArAlThqee4R8uItD7ywUqBb2ytYYIvspUmALsU5
         bQv5G5ScOtf1qhgn0keXUQ86Ysb843Bs7Gg8fi42yW03i/jsYPazOVPTUXvLMIG3UVhh
         vq7JxH/TD2yM1wCKuBzxptLwjB2nky+lKryf8DpxbXM6+3ds+GfZUCuyBO+r79EbE32u
         vmP6otod5Hg+UnbZiHC5j7JbOtMcpIR+Yz35yplCvX7HlVJsLRVl1alqJJF5Quwpa9Pr
         p5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539270; x=1749144070;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=;
        b=LNU0Hf49hawnyF9PxnK+VRaddztEBmMDr3L8o3FHmilsmIB4m9kbsnEdsJZntlhtod
         40vnUTMZG+qn2wnzQpB8+XmFKhlW72ozQywLzt7UTlOlGRAVewm7fyyX4dI9QRu4t0ev
         C72aLLgnrAQHIm68rzIZF1QT9C1gG8QOJ7vKgU/H7AzuoZKLDJ46gJuheUn+/8uwSoX1
         ErfC0YUsAJOvhVQTTpMjf85Q9Y/vpK9K/r2l6bL37SWO9bCt4x9zrO6AWMFUqBr1SrkZ
         1snJWWLlWSj0ahW+ksGr5sOz12VCLg9QLfiL1N+MjGvX98mbRe0DKysWg+Wyh1AOaeZM
         UZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpqhx8XsbMeSN2FpmEp8iWQP3LVt4hXBvWCqv4Au7RRQ4XfiRz831nSU85LR4Uc0nKd5jA+uFxWySX@vger.kernel.org
X-Gm-Message-State: AOJu0YypHm0qkvwZoiB+adtgiu6yJcZ2S5+Kpb23LjyvZ6Izc31kA+zN
	1ayWyzEwjbdXOsi/Wu0qObh2xO0YjstgTqYgoVA42Sn+3MAE9MERpSZQn4m8WKqI3Ec=
X-Gm-Gg: ASbGncvD8cakCpI4C7JGObRQhWtgP+67fmNXJu0gFEB7oqCibW1OyrtecN17e6apoGD
	xBsc6ERMxdcNVXFMMex6bvv7bHlD8f8NuW5jG5y7sdiZHKSXS2DwWuqHb8U9nBQiWRQrCejUj6N
	gSf/N/7AX1Y8mvdYh3744qcsz36ftIeZg6tH33PsIlqH/fjNm7JyKwe94pxK/UwyaWdUnJzQuJm
	3ZRMx9J2ek9gc5mfFcH0vvBbvtTRmbCjhp7gGMEs7asM8hdVhdtECktfHRwMpnhIlbb41q4x5ej
	yR2J3TZxmNo1A67OGRVBkvHWYYyC5JTGYXY0yklw7sAYPm0RgAQOOdCtqku0
X-Google-Smtp-Source: AGHT+IH1834zzk2lUOPVUHGH3EeY98SO550LzAmtRD9p+dqmamQc9GnfdhVQPk+w3gTCeLfLx3OdJA==
X-Received: by 2002:a05:6a20:93a1:b0:1f5:9098:e448 with SMTP id adf61e73a8af0-21ad94f971amr763041637.5.1748539270578;
        Thu, 29 May 2025 10:21:10 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9711asm214068a12.57.2025.05.29.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:21:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Sukrut Bellary <sbellary@baylibre.com>, Russell
 King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 4/4] ARM: multi_v7_defconfig: Enable am335x PM configs
In-Reply-To: <7hbjs3tf1j.fsf@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <20250318230042.3138542-5-sbellary@baylibre.com>
 <7hbjs3tf1j.fsf@baylibre.com>
Date: Thu, 29 May 2025 10:21:09 -0700
Message-ID: <7hldqfnxiy.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Arnd,

Kevin Hilman <khilman@baylibre.com> writes:

> Sukrut Bellary <sbellary@baylibre.com> writes:
>
>> Enable Power management related defconfigs for TI AM335x[1].
>>
>> [1] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>>
>> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>
> Arnd, can you take this via the SoC tree please?

Looks like this slipped through the cracks for v6.16.   Could you apply
this for v6.17 please?

Thanks,

Kevin


>> ---
>>  arch/arm/configs/multi_v7_defconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index 37e3baa33b67..1d2600b5f975 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -985,6 +985,7 @@ CONFIG_EDAC=y
>>  CONFIG_EDAC_LAYERSCAPE=y
>>  CONFIG_EDAC_HIGHBANK_MC=y
>>  CONFIG_EDAC_HIGHBANK_L2=y
>> +CONFIG_RTC_DRV_OMAP=y
>>  CONFIG_RTC_CLASS=y
>>  CONFIG_RTC_DRV_AC100=y
>>  CONFIG_RTC_DRV_AS3722=y
>> @@ -1095,6 +1096,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>>  CONFIG_EXYNOS_IOMMU=y
>>  CONFIG_QCOM_IOMMU=y
>>  CONFIG_REMOTEPROC=y
>> +CONFIG_WKUP_M3_RPROC=m
>>  CONFIG_OMAP_REMOTEPROC=m
>>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>>  CONFIG_KEYSTONE_REMOTEPROC=m
>> @@ -1146,6 +1148,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>>  CONFIG_ARCH_TEGRA_114_SOC=y
>>  CONFIG_ARCH_TEGRA_124_SOC=y
>>  CONFIG_SOC_TI=y
>> +CONFIG_AMX3_PM=m
>> +CONFIG_WKUP_M3_IPC=m
>>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>>  CONFIG_RASPBERRYPI_POWER=y
>> @@ -1162,6 +1166,7 @@ CONFIG_EXTCON_MAX77693=m
>>  CONFIG_EXTCON_MAX8997=m
>>  CONFIG_EXTCON_USB_GPIO=y
>>  CONFIG_TI_AEMIF=y
>> +CONFIG_TI_EMIF_SRAM=m
>>  CONFIG_STM32_FMC2_EBI=y
>>  CONFIG_EXYNOS5422_DMC=m
>>  CONFIG_IIO=y
>> -- 
>> 2.34.1

