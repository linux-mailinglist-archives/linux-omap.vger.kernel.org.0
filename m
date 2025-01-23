Return-Path: <linux-omap+bounces-3203-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6556A1AAA2
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 20:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECFB716B8F8
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 19:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDC21BBBC8;
	Thu, 23 Jan 2025 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RqBw+EEy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BDF1A8F99
	for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737661716; cv=none; b=UhRelTY+Obz2pg/Rz2sxuEEQ4OZsqLRx07esGhDDY0kOHsmTV7jhU0s+5ijAvXi3TdREFrW05zNtdgJHRINFQ037OLtH2NZhiyj57R1nYUAj2/jlS0V6/9e+mlIBpTaSzkQhMLkKaOaAYDpldOIG7JwgJU6mNOQaxYH7YpfLjHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737661716; c=relaxed/simple;
	bh=MrZdOfIrJAXOsLPBGF6einOYAQ9GwImx93xKqEcUlbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbFV1mdptpxWSuu3I3efHTzjz/S6IXs7/8lsi/KgskhjYH1i2nPBHyCrHn9NH9aeFSGt91NLYbhBRsihg46v6DVy4parARfUoML9TfeQBNsrH2SgVJHOlEBYwo4kvfpW3J/67t7dTQBUNS7KCcpst0nqtbyfG1a1Q3SFJ80afss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RqBw+EEy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a39e659cso8878755e9.2
        for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 11:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737661711; x=1738266511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEzQx5EKwKnXykiE3C9S4XHeCQPE3yQLJe/q7xEl0UI=;
        b=RqBw+EEyxk/O6HF6aSsY0lqxSL76QgDSTEc21vkAy8HHOw3tgvK9EoFGTyPnzyxaJS
         G9mJfgjxIAdkMPYzIgC+kxsPSbddvJBVVnu7CDQlmTUWtbf/u97rZslpfkBgGoHP23VZ
         uZjy0xZmbMTV1bjA0fG3XANavv+oSKc4aUcFxR+hNSnQxU9RYVcJPDBwi9YbwPG8vIyJ
         BkZuqsp3fZVZqWeaufyMCvAkVpQTR9x7J+nAsUjg4ZgqKDa7gGdDOx+hubRVGmsJFZqF
         rp9mC95lSBWCNmi693E8t1nQB094zedbiywDPypN3ZJlXbKlcYZNCCL22BkRvJIZtApj
         AeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737661711; x=1738266511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEzQx5EKwKnXykiE3C9S4XHeCQPE3yQLJe/q7xEl0UI=;
        b=KcLB1VvvQyTu2I7qY8C98VtHEIiGFmhZNydlsnTI7rFW5aOBwSxoFPsFvWPfr+5CVX
         cPPKWoHMIq22IuixjXScnvdesHVUI15CYX7zk4hBnL3PCpNoAzKeFwszp/vwejNiUKbK
         oqPzRKFnVYppHMPWA1ZU8yYo5bRs+rnkl68Z+pEwxT3noQmUPJ+2Eqmkh1XvEdDI0BzR
         mDivN2u+5cSRfnVKVSjQtgcGdjIgErdQFrSo+a/7oC2rU4j121U9Pimc8CKhj8FNxQ24
         e99RJ+yyKIubYkciHsp86QJ8PzaTuOidey8UkMeeG56OwgqA1a8urUaKtNuYm+Zt7hnl
         bw/A==
X-Forwarded-Encrypted: i=1; AJvYcCVUClQ4eViyupV3CZRI1gTuh521XFqc7+1/5oP/qu928s2//V0hR+m+LeBmw6epkeFbCuN7jMG3j4pQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtulYGMQKTcMLdhYsEIrEjFcUsB7q1dt72WGy/fncXFsmvuHjK
	Al7wzqmuggiNE4f1tpUgAw5lGysJL+5a+4kI7wAF0tH6cmi4h0iigVVIYQ1pE/Y=
X-Gm-Gg: ASbGncv6DfescBPIc7GeIQ+KXanZ0aBcm9hE5XP+kzPcAVfGnVuZrqRnCEO4h7FpukU
	3i0Hdi9eAfst1gt+x/ZJ0/tpgIu5sxRUzpsccksUM7iSmXxmxAtCAQMiB01OL00sjtag2Cf8JUf
	O8ko/yBRYlGV5+qR09MkZh32wFx7FWLEMF1W6o9opliUT+90rtEhAXmhuqLFe6MtfRXWadXixZ2
	/VEs1SQI8qQVJrwDCw2HS7yRsII+giVLwcI9rtpdAoeYcrWmktwEa44RMrH4pLgpYKtrnw8R+Xx
	lCelvmslVImNr41SxqLI04L+ym2yiIsNu9EXT5P07QE99R3//6TD
X-Google-Smtp-Source: AGHT+IFCmuRcO2q+WkCuoyE4umxs3Q8grgYjAGWaKRdiWeb/qlKv81TNKgwodg4lbmq0iUf3Z/pwAw==
X-Received: by 2002:a05:6000:156c:b0:386:1cd3:8a05 with SMTP id ffacd0b85a97d-38bf57ce963mr27366273f8f.54.1737661710999;
        Thu, 23 Jan 2025 11:48:30 -0800 (PST)
Received: from ?IPV6:2001:861:d40:ed60:308f:ce31:765f:bf21? ([2001:861:d40:ed60:308f:ce31:765f:bf21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3f5dsm556090f8f.92.2025.01.23.11.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 11:48:30 -0800 (PST)
Message-ID: <971868a3-2dc4-4623-b979-4e722658f6a1@baylibre.com>
Date: Thu, 23 Jan 2025 20:48:30 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: arch_k3: Replace select with imply for TI
 mailbox and TI SCI
To: Andrew Davis <afd@ti.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, nm@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, khilman@baylibre.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, vishalm@ti.com,
 Nicolas Frayer <nfrayer@baylibre.com>
References: <20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com>
 <f1e6f49c-71e2-4c6f-b78f-7608739530c9@ti.com>
Content-Language: en-US
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <f1e6f49c-71e2-4c6f-b78f-7608739530c9@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

thanks for review.

Le 23/01/2025 à 16:29, Andrew Davis a écrit :
> On 1/23/25 6:12 AM, Guillaume La Roque wrote:
>> In order to build TI mailbox and TI SCI as modules, replace
>> select with imply.
>>
>> Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>> Changes in v4:
>> - rebase on master branch
>> - Link to v3: 
>> https://lore.kernel.org/r/20241016-timodulemailboxsci-v3-1-0e7f7a6de97d@baylibre.com
>>
>> Changes in v3:
>> - rebase with master
>>
>> Changes in v2:
>> - Use imply instead of removing select altogether and dropped
>> patches 2/3 and 3/3 from previous series as using imply makes
>> them redundant
>> ---
>>   arch/arm64/Kconfig.platforms | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 02007256709e..a6e4bfffc09d 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -133,8 +133,8 @@ config ARCH_K3
>>       select PM_GENERIC_DOMAINS if PM
>>       select MAILBOX
>>       select SOC_TI
>> -    select TI_MESSAGE_MANAGER
>> -    select TI_SCI_PROTOCOL
>> +    imply TI_MESSAGE_MANAGER
>> +    imply TI_SCI_PROTOCOL
>
> I really don't like "imply" in general, and this will be the only
> instance of it now in the whole file..
>
> Your v1 of this series was the right way to do this IMHO. The only
> issue was patches 2/3 and 3/3 should have been first in the series to
> prevent bisect issues. And they had to go to two different maintainers
> so it shouldn't have been a single series in the first place.
ok for me ,i will reuse v1 , split and resend.

Thanks
Guillaume
>
> Andrew
>
>>       select TI_K3_SOCINFO
>>       help
>>         This enables support for Texas Instruments' K3 multicore SoC
>>
>> ---
>> base-commit: 21266b8df5224c4f677acf9f353eecc9094731f0
>> change-id: 20241016-timodulemailboxsci-412e2a6458fc
>>
>> Best regards,



