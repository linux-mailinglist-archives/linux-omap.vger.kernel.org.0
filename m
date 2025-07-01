Return-Path: <linux-omap+bounces-4015-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D256AF033E
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 20:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C36CC7ABFE4
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 18:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0803B27EFEE;
	Tue,  1 Jul 2025 18:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V5XSQ3ZC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB39E26B2AA
	for <linux-omap@vger.kernel.org>; Tue,  1 Jul 2025 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396276; cv=none; b=OXf4JKb3ln+52ZHL/K4K+U0puNOvVFQneCj8BbFUYl7Aafbv10eqs9PuJv+kXG3e0rsO+k+T9IDhOxLvgiawo8XbD6UX0UxodDfE+nUbhDOMCWX3QcKnNRMMItmKx5+ivRVnkf3ocFiDFBRI8ENWo0vVHCjH60M3CPJNsghOync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396276; c=relaxed/simple;
	bh=GWEL99hdlJ/IrXmR+14f96xedSnSMx9f2OPajvke3F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RImE86X4j0/desH5eJifcK5VcbR8e1lQOONxQcc09Sto6xomVFRFPp6/sUWY6jz/tmBhUUQFFacI33DL3i8BYQhNVZ4hBawsH1qaTEjfsUv/zEUCkIXF5D5rcYzWfyMhJZ3OZ9JNscDIDZqM6a06zqkCcNSUj794QtCHFtV421o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V5XSQ3ZC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3075673f8f.0
        for <linux-omap@vger.kernel.org>; Tue, 01 Jul 2025 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751396273; x=1752001073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OnXkb5Xk0A16V2ni6PtoSDVdWoQW1678+k13MiKScA=;
        b=V5XSQ3ZCbAIR01/YKILh1W/SYSBoEeEC/amW5yxeFeW9FRQnrZ/15LJv4HFHhizV59
         OoBApdRrOr7I5pE3EZLiBKfs4qbOpWR/G2SjjuqEjevDnQ0iuK9lEFmldiRuT0MBB4jK
         BktIhNlFv3lEa5i9Jj1ctzlQsBWURnmFCJ0EdguhjJtPfa4Q2mdIBx8tVClaeLDbZ4RG
         tNTSlXHiGyQps1oDruq6SpuaLFsuHj9v1dYn5XdvfwObR2Io7/c+1fVtFMqZuFtvDoVh
         8kZd16OfcRDSdhGQUJ+m9DVEy0QIRUrGj8QJ68UYJc64SiOkKfn+qGYL1AGBQaXTXFMB
         ou9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396273; x=1752001073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OnXkb5Xk0A16V2ni6PtoSDVdWoQW1678+k13MiKScA=;
        b=NJf2JHXSmfGg+UnGekKDvJE3IAL3FMwfb+B92r6zxiqXu3sMvQPKvm2rrFiprcPfIp
         AdLC8FBFhbDWXaWp+1AicdvYuSgHxkT01ezFdF7GjHa9BP+3RT499/MMjOmVyPP19+t0
         G0MvpxdpyPDKpuiqgA+E1DpII8EbjJNSmfRx3EKhExTPXrSLmvQWBDXiZ2yahcKkZkbs
         nJF3BRqqQQ6Wde4Fq/kCZEtuwj7smfSoy1JNaLw58VXcwASvM+Mt+qDZ7IeFF0U7GlvW
         jNgUvS15pVEVGAH63XUrxIh/cdLEIaZ80YLkSNEUbA+rIK+woqycwpVYmZsLMiPLJXQb
         kNrA==
X-Forwarded-Encrypted: i=1; AJvYcCUauk/sSs0nD/IExjAGOFhB9xHYIQa7+EC6qYYa04f/8OUbsRT0CMiPzlXAZtZk5AvxufOXYIFtZHr5@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEl05E9Sp6+USD34xxMZn8s5IMCt2G2gpZvD5DilEaGDg/Bqw
	4Mg7O152yq6ph9cYe1mJQPA2rJJ414YtzzjbPsh5PHdItxoBp3dm9Jdyw8EAwPSt6p0=
X-Gm-Gg: ASbGnctrdyOeU0/6HjiQ16AnCp3iUSCFtkts9AehALGTkRX591o4kAE7sIjV+G656Ks
	CGZTl17hmh7ZN/bNFVzUUXDsUEulL4oaWXA1pXn2of7Qa6psB0vkhEWkPFTJmHY0icxl1JUQKAl
	OumjP2Y7Nmi9/C41FP0sYsGlRE1W7WARICw8AEcDOFr9CkK/f+Ugt7dYFxKssVVtgQRGCBWr+V5
	Fx8P7MYM3lU1j+7/BhhRczleV+0WA8A5HFGOF2qcb22h2eWnJJjDvnRjbOTaQnRUhWlDZMrbHOD
	XdDZcMGd4ru7r0umVlFR1r1/CROt9t0oVzkqhVpAqw4LhiwyIUG3AGbVrVmIXIWyPDIJjRheDiB
	kkNwCduAIVewZEIXG0jkpj2K1/Ag1dZk=
X-Google-Smtp-Source: AGHT+IG417ZWU7rctrUCSCtMeXYKqD6ggMKJuzWIMQooXOk1KUkGBbzbIcqMGsVv01VYeq1mnM/67Q==
X-Received: by 2002:adf:9cc5:0:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a8f482c161mr14623720f8f.21.1751396273005;
        Tue, 01 Jul 2025 11:57:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:3714:f5bf:56c8:9f3? ([2a01:e0a:e50:3860:3714:f5bf:56c8:9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm203068035e9.6.2025.07.01.11.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 11:57:52 -0700 (PDT)
Message-ID: <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
Date: Tue, 1 Jul 2025 20:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nishanth Menon <nm@ti.com>, linux@ew.tq-group.com
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
Content-Language: en-US
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
> On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>>
>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>> select on ARCH_K3 are not needed anymore.
>> Select MAILBOX by default is not needed anymore[3],
>> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
> 
> Hi,

Hi,

> 
> what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
> on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
> not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
> enabling other unneeded features to pull it in.
> 
With master branch if i apply this patch and i do make ARCH=arm64 
defconfig and check in .config  both TI_SCI_PM_DOMAINS and 
PM_GENERIC_DOMAINS are enabled.
with linux-next it's same. i don't really understand link with  PM part 
in this patch and boot issue on your SOM.

I probably misunderstand something.


what is your problem exactly ?

if you can share log or link to jobs

Regards
Guillaume

> Best,
> Matthias
> 
> 
>>
>> Remove it and give possibility to enable this driver in modules.
>>
>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>> [3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>> Changes in v2:
>> - Remove some other config after comment from Nishanth.
>> - Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com
>> ---
>>   arch/arm64/Kconfig.platforms | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 8b76821f190f..bf9e3d76b4c0 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -135,11 +135,7 @@ config ARCH_SPARX5
>>   
>>   config ARCH_K3
>>   	bool "Texas Instruments Inc. K3 multicore SoC architecture"
>> -	select PM_GENERIC_DOMAINS if PM
>> -	select MAILBOX
>>   	select SOC_TI
>> -	select TI_MESSAGE_MANAGER
>> -	select TI_SCI_PROTOCOL
>>   	select TI_K3_SOCINFO
>>   	help
>>   	  This enables support for Texas Instruments' K3 multicore SoC
>>
>> ---
>> base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
>> change-id: 20250504-kconfig-68f139fbf337
>>
>> Best regards,
> 


