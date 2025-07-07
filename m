Return-Path: <linux-omap+bounces-4070-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D42DFAFB096
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jul 2025 12:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE3A16BE02
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jul 2025 10:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453AF293C58;
	Mon,  7 Jul 2025 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="desZQQHh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718E92D78A
	for <linux-omap@vger.kernel.org>; Mon,  7 Jul 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882402; cv=none; b=YggA+b3cHNypc0xVw8v2k3HIFXXahC1maASK7vPv9KP64jxQdGDF9tFaJlxYGdnXKFjYg2yaIqeLcU186Q1BC/XHsUtzmazqZY6V10h1psyXoY43TLEHFz8ihnTpBdRRqB44m6I6pb0OYhUsXHzUomg4DeXxYsSYC8YmAtOnmC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882402; c=relaxed/simple;
	bh=OQ34og8I8X3z80o99fbXU1v3ZxqvcPIL2A769bcQgaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b08aMLI3iJNseZErzDlDn5ZSDSa7Soh4RkIAJLMHzgYsRJvVJ7TJs8GTyXNtQ2XRtlIEXmNzoHALTYcEGA7Vqbe+wyZG7vydq+b7hdR7RMkbEmmCG+peINGdu8E3HzKR4vBb1Ld2f+br+skJCTYRGPLzG62F6+mSW3LsnDsaDB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=desZQQHh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso25043265e9.0
        for <linux-omap@vger.kernel.org>; Mon, 07 Jul 2025 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751882399; x=1752487199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GF8vc1c9D0lLEMqMMZKCgAxa6DKwsWgtBoqT1qS5YRs=;
        b=desZQQHhqp3mhpyYeupR5QZNaL047znpGYcRsaIDNHT0aCQ3fYlUJZVXTu41/TPm94
         gSAheh7zv53nzMlaSnWP19iZlOourWHrDpYySkuHtrfveS1XN9rvKYPYUFiqc6+QcZaE
         7MskhgwNV5gYyDnTIxQhvrBkvTsHxxC2pydo5jeLIQZypE0IlyQPKhOXkWlFldiL5mU0
         ix7l3nMTmqZYO7Z0bTjYqJh4Ok/oSLkAhGgSqoKLMTl82tAO6S91m1jVj64SWtv7/NR7
         rTKtG49i0LC+BSKqTGYlI7MTB7OfyoavnJEnFqBu/krWIYy9gbMQo353hC0axZXsAurc
         PA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882399; x=1752487199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GF8vc1c9D0lLEMqMMZKCgAxa6DKwsWgtBoqT1qS5YRs=;
        b=v77tgWvzLzVylDUSSgki64q9LyHK5Ogl2lKkG1YKKOs6B224nF8qgdsD8RChmxt0L3
         entborR/An7f+w10D6TCC/r5tPe/q/R1DzlDTfjJobu4m5Wy9aR2T6zfqVxlDqhEeBsV
         qfDmHSCQsjepkNBF1Udxm+mwQMh0mXsDX01BmdqVcPs/HNuLYxdK/9Pj8IAUGdCBIUbH
         pBvvdyq/ITuDxoO78hqrIpbQLBD2xHebrLyU22sKKWRL6YgcI4N1sWm7IttAQ0egCSCR
         pc1/DGMF54LzFl3UmT7SlyR+WvP05JWceKs7p6lOBnLL7QNSdMPpTgQi2Fj1VSWmAG17
         HfsA==
X-Forwarded-Encrypted: i=1; AJvYcCXr00YQ4FCeoMkMHNUOisUiOiCjzixiXdo/Tsnfr8jLvoVDDmhAWF65pizeUbKhrQRqihBPF7iD0MuK@vger.kernel.org
X-Gm-Message-State: AOJu0YzkCelVX+L351DO0L/rHEyh/jK8rMmXa4AvSL61xzqvkSgdB7GA
	37rk1CVN6qb5OYGiVYHks0jb5vV3SuznioO0mSQogrBoBVpFtcOCIDGU++dpRtm7Szc=
X-Gm-Gg: ASbGncufDx4JgCvEZdjRNNc1HCQqXXgvrlDd3mKzNZPAY/d3oscPZ8Tg6aO7V9OfaIM
	miK2BeXUlM5i84C8XQY1DnB8jKi2tZZby5YdKjsda8xbm+Zr8gi3sCfNEz1LkuulYati0bcXUfM
	rR3KGV1aXn2b90Ome4XelDc6VQ2GesBbQdcihi+y+eCm7UgfogMLkdbsT5w9IPvnN3cSLyUNSyb
	V/cQ819EKGTbM8xrAJLdle5mQqAy6o7Jfr6grcLZ4bZ1qn23Zlz/R5XzjhqDT1QlfnihH7/VU7/
	N1rFki9+pglnAw8dUBmtaDDwW1O6UIryb9lk7D4GCVqlbjPk4SW4/trch6g4UOibe4irwxGlm1w
	1JrqqaQmRivLaR0rlHogxSSBiVM+VYpaNjg==
X-Google-Smtp-Source: AGHT+IHvlmHP0oa9KgbeYWJUl4MCBGVkpFuuQN5yKMcqWRZ/ketGUdB/VWArjJjtYOPvEISWj77cWw==
X-Received: by 2002:a05:6000:26ca:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3b497036356mr9229115f8f.54.1751882398533;
        Mon, 07 Jul 2025 02:59:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:1a22:119c:5b1d:302e? ([2a01:e0a:e50:3860:1a22:119c:5b1d:302e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285e241sm9798553f8f.94.2025.07.07.02.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:59:57 -0700 (PDT)
Message-ID: <5d179842-12ac-4b5d-b87e-098643e7cfd2@baylibre.com>
Date: Mon, 7 Jul 2025 11:59:57 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Nishanth Menon <nm@ti.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux@ew.tq-group.com
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
 <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
 <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
 <20250703122813.jh2muwzwe4ok6b6d@process>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <20250703122813.jh2muwzwe4ok6b6d@process>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 03/07/2025 à 14:28, Nishanth Menon a écrit :
> On 09:25-20250702, Matthias Schiffer wrote:
>> On Tue, 2025-07-01 at 20:57 +0200, Guillaume La Roque wrote:
>>>
>>> Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
>>>> On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>>>>>
>>>>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>>>>> select on ARCH_K3 are not needed anymore.
>>>>> Select MAILBOX by default is not needed anymore[3],
>>>>> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
>>>>
>>>> Hi,
>>>
>>> Hi,
>>>
>>>>
>>>> what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
>>>> on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
>>>> not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
>>>> enabling other unneeded features to pull it in.
>>>>
>>> With master branch if i apply this patch and i do make ARCH=arm64
>>> defconfig and check in .config  both TI_SCI_PM_DOMAINS and
>>> PM_GENERIC_DOMAINS are enabled.
>>> with linux-next it's same. i don't really understand link with  PM part
>>> in this patch and boot issue on your SOM.
>>>
>>> I probably misunderstand something.
>>>
>>>
>>> what is your problem exactly ?
>>>
>>> if you can share log or link to jobs
>>
>>
>> Hi Guillaume,
>>
>> with arm64_defconfig, this problem doesn't occur, as other CONFIG_ARCH_* symbols
>> also have "select PM_GENERIC_DOMAINS" (with or without "if PM").
>>
>> We are using a smaller config specific to our K3-based SOMs however. I have
>> attached a defconfig that shows the problem - if you use this as the base for
>> .config on linux-next, there is no way to enable TI_SCI_PM_DOMAINS, as nothing
>> selects PM_GENERIC_DOMAINS.
>>
>> So unless I'm missing some other configuration that would actually be useful on
>> the K3 platform and that would pull in PM_GENERIC_DOMAINS, I think that part
>> needs to be reverted. I can send a patch to that effect later.
> 
> Is a better approach to select PM_GENERIC_DOMAINS in
> drivers/pmdomain/ti/Kconfig instead of depends (similar to what
> drivers/pmdomain/qcom/Kconfig or drivers/pmdomain/arm/Kconfig does since
> TI_SCI_PM_DOMAINS requires PM_GENERIC_DOMAINS?
> 

I send patch to do this :
https://lore.kernel.org/all/20250704-depspmdomain-v1-1-ef2710556e62@baylibre.com/

Regards
Guillaume

