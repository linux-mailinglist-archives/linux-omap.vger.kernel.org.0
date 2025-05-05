Return-Path: <linux-omap+bounces-3641-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4741AAA9431
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 15:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BFE818910E7
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 13:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A03258CCA;
	Mon,  5 May 2025 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="02PyttNh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CDC2586C7
	for <linux-omap@vger.kernel.org>; Mon,  5 May 2025 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450926; cv=none; b=dWHCh4Qs2oe1cIBWycTek9FqWSTHlYouh+sj3hr8foCTf7ol+HBCHctV+4To8wji0pnn/Nd9KkM3KMFWbyu1EutvU9ooFUbTRO9b9sU4IYqyg8iIsp2Bx5j7GIH+jVmJOHKjf4Vu+Vr1x4j0Yf93GoFd1Gxm/hY4XfPqJEeb5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450926; c=relaxed/simple;
	bh=A99jGKDLRtcQrbe+REetRwAbi2+qCLn1oe+kW5V+3QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=locfUbOYnOfRPthropucQCYz5KPKrFDi9HZZzrsTj6ltpNuDQKvDyGB9lKQGGVl0KUdS+dobe8VQtxhrRBykvccB/UH+bBmTV8O0UcsjZ6fBIiMfrUdXD8+xhAQv3dNsul+RIAyGEIclVr9aCqywcESEpBzTIfzRZk6QDGSMkWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=02PyttNh; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399838db7fso4443304b3a.0
        for <linux-omap@vger.kernel.org>; Mon, 05 May 2025 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746450923; x=1747055723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+wXhdSDx+zuoZH6nHSo9n5TKzFsocoVJt1FeJpCcH4=;
        b=02PyttNhHbrba2jONU16CIjVmiSbAWfJ5N/S4rka9u3QywKH8cGfzomCRIrUSdN2gW
         fmUz68oOnHS/45vUt96WIx5ab+rYMy83OEtVX7JGl2yhNxRe4lZIUQNBBuwOdeao4dxS
         8WjDYBBZVoFUIYN+B027xIylvDH7Vvh6ygaKWBvXLIg1m6ONjzYG6XkV9mQrdRsaCyiH
         dWOzP9g0BCZfBwP/yHrFzmNIksk1KkbhEPtM6rZDcnljXXxH8mT/H19LZLGuZKzxNdpW
         BgBu1+VwAtinRiM/++Edle6YXvlO4prYdyIopPFc9v8ZjRRZpHK4ylHYth3G2daXUIx4
         0KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450923; x=1747055723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+wXhdSDx+zuoZH6nHSo9n5TKzFsocoVJt1FeJpCcH4=;
        b=TllqZpl7PToge5Nm9IvfOr5ua7gUy3mkLuItSXMghoOHdguAZXld6Xvu24pwvh3UiK
         r/lRVVrXFQ6Dehe8VEbEA8XUE+onVQDzZTkpLGW8Tx1rBWoCYEfCzRtW4CmdAePx5OiM
         nHA4jV4guCfesmVgmo4HVTx/xwmwupLk7Bi7KGr9fRrB3umkyKHAtDbLV0m3FcqCQDLK
         FksAYConKomtGp6NQqI7X5viTXwcnbpKkH/C5m1PmmIV/O/RQamZS7WBAAKLxVGQ0kzS
         cjgNyfzEw6K7O0EVECQU09DPoi+rkliyVA2/8IsNIBtML8GQfKFPpALBe/l0nhGzwvo/
         6QhA==
X-Forwarded-Encrypted: i=1; AJvYcCUckjdTR1bgk/z8q+Y1mJleS46oDtcQq05/EsZKoPS7QNS/jR0iDqL3hDn8Q/FWtnoE7HKGTjrX/LBU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6wYdFaNBKuG/zET2d17wqx62YGV+ECYm3BO8tgPlhKQFTXegq
	PuUdV0HK82AFucOUb9pnE8Dvj/aFoukqfWl5EV0AIgLgNL7Df6RtvrHPZS6MOJUeZfID8ikCwVa
	njHI=
X-Gm-Gg: ASbGnct5FiWXajU0+mM3XiowDVKyHsNSdtT6LgAvgPPgCJPsOS2zpQ36sHwL579vNbt
	jF+iP3RKrEaaUDP1PUc5cgdsyGh+Nnfg07LgahE2SASrY4hwNKSMqmw0t2zjfeXat6oR1/9rxcr
	YBMSPPFmmrVm0GT8UIveDcRttV9Vdg2uZR3n0F3wexACdbgCPDEFk297oeNIcUc0Ju5qOiB4QKc
	8D/UoT/0lf54Pb4PzPIy7T5YLPbWwlccyU+U2U8szr1HSvXDrV9/O5LuECeWTbaJzfWzqfJDEDr
	lX4bcVwJfNzW2sdwQztLBfjG10pPdWxOWnz4Z9NYWw04r5HWGCjqG1iuHi8t7EwEzV0R8I0yi6e
	o2Rh+3RgipC44
X-Google-Smtp-Source: AGHT+IGWr7oErzhQXzi3/npvL3HPlXx3q5Y4G/drXHId6r0SRlbJxSxCSrWFC6Hy+SgESOr57oqMaw==
X-Received: by 2002:a05:6a00:3774:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-74049265f69mr23753393b3a.12.1746450923390;
        Mon, 05 May 2025 06:15:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:cc35:2777:db60:cc54? ([2a01:e0a:e50:3860:cc35:2777:db60:cc54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbaa2sm6906018b3a.57.2025.05.05.06.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:15:22 -0700 (PDT)
Message-ID: <fa33b7d6-8e28-40bc-9219-41dab643e88f@baylibre.com>
Date: Mon, 5 May 2025 15:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Nishanth Menon <nm@ti.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
 <20250505123615.yqzdv7dlel7kyojf@degrease>
Content-Language: en-US, fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <20250505123615.yqzdv7dlel7kyojf@degrease>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 05/05/2025 à 14:36, Nishanth Menon a écrit :
> On 13:24-20250504, Guillaume La Roque wrote:
>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>> select on ARCH_K3 are not needed anymore.
>>
>> Remove it and give possibility to enable this driver in modules.
>>
>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>   arch/arm64/Kconfig.platforms | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 8b76821f190f..5b63a42c4dff 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -138,8 +138,6 @@ config ARCH_K3
>>   	select PM_GENERIC_DOMAINS if PM
>>   	select MAILBOX
>>   	select SOC_TI
>> -	select TI_MESSAGE_MANAGER
>> -	select TI_SCI_PROTOCOL
>>   	select TI_K3_SOCINFO
>>   	help
>>   	  This enables support for Texas Instruments' K3 multicore SoC
>>
> While at this, is it possible to remove MAILBOX and PM_GENERIC_DOMAINS
> from select and make them as modules?
>
good point i will confirm  and come back to you.

