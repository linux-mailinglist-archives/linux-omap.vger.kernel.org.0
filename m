Return-Path: <linux-omap+bounces-5300-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B4DCEA775
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 19:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7CD83005325
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 18:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72C132E130;
	Tue, 30 Dec 2025 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcHyOqK9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456BC24BBFD
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767119150; cv=none; b=WwpxHsIaseXQi0r8oHMd9cg3vxtI/4iGoRbGCfRneyHl4eMX8oCvyq0O6aVggLz5QsleaaBDLF8QwQFfQ3LgaWmrv4JYNfsptFWhEb9x5yeMBdFw2gBuRE02+HR3obLbsroJ8KgG3C5x2LyThiAWWs9deDILSjyR9WJMcxWvL9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767119150; c=relaxed/simple;
	bh=xtaO4aAep/mnQs8q7Kd3W/+2UGJBHxvxH9CS/1w3fME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNOvRAF5zOWATlZqZBnGmh0nzPN4MsYNAmeWASRHyPDfbiO/5a5I3k3SgON8hgTTtniN3kto7d3j1KYqkJUxmKZifoPwyRLv/VxkMtGTqZtnZOX4VKvXpU65JJdys1bpqrMBT2SdeACjomCkXhQeS/9ozCG3z9hXw4YhwUM151Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcHyOqK9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b75e366866so4572564b3a.2
        for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 10:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767119148; x=1767723948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqTUGT/buUVKhGmIbkmEN3zb8z3R3/y5Q/VjnKNHpcQ=;
        b=RcHyOqK9qRAYJB6ZHfxj1Tygdirpf4IW8A+b59SEttuAoY/4avh2TUAHf0TyGpaqMG
         LpeeczW54jAxOWLgK4LhNy3GtLTZz1fXEYHO7qtuHsf6bcpP1HXWjdLvVGMgC50DJSE2
         MNL6ZFgjDBcy93WiS/53fveaCoqnfD97Wh0KL6X30FMwejaKJkcm5SY8HTDVdnMGvAbj
         Zq4gsln9lNMPvUnupVL/FNIYcMlQU8zESzW5Y41VHfYHNYioKXvDYjPv6BgnCqX+RoSj
         sPnwW4Y+V5NiMRZ/HqJiMTC+3AGKJiI+da/gaaTImlE2fFhdsjYrl/RjBKCiUlX2F5Op
         v66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767119148; x=1767723948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqTUGT/buUVKhGmIbkmEN3zb8z3R3/y5Q/VjnKNHpcQ=;
        b=ViDrVIdg2J4QLFnFbmWuaVDra6JxmWWO4RxOnmfO/kwNglL1clni6EFknREIj8cNtD
         E6+kgyoY75KhjWWpLQIGw+yf0hityKajafIuAiW1hW5RNtw6yYMa2+0IBfq79vkvATHI
         /SG03HNtoJadtmxL8mlw+WFdp+huIzDwVAfVMYpLJIDg/JrSibUB3HRDaVlXU5k9zquA
         OCE8mqwoDnFNVJNw/9o163O/etWKejIeAc5gm0oJMxaJnX2bxwBjwsUKeYyGDuaLW7Kv
         /A4AlkXHRbRkV6RkfjhDWKkl2QiZk0JxolJDew+cBzMHMU0JTxAvMfS9WydZUmPB1JQZ
         hq6A==
X-Forwarded-Encrypted: i=1; AJvYcCWRjf7OvWb00idsNH2Hp4TJnFuc5xEKwDKl1k4qBrnsI/XTAItEORPDko97umbYIo9n4zT6gGvQun8w@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIedt1VoZ1SznhbwSNLo1dc7uALyKbwATFCkISfcc3pafEtYP
	RHCipZUVshcA3WgcS7T5U5NuKeeOrF8j4XIm99v17HH7IT0vMej6vTfg
X-Gm-Gg: AY/fxX5PW9K6WNFtjFnF37/nmDD8waLcmkUpLBV4uxbCt5wo5/ZkPKTd6MNu/KUfx7c
	1C5+LNkdohpmFhyTZ4UqgmFbI0zyYhkqkwKoXjnWb9DyIzNHslhuWsmxHjNN/bvjjlkuSBcVa82
	3W19Lu6raMv0aUlH0MbcNh/C0VPbwdxEToqVpRxl5ZN4VAksi3vRVfOHW31F8F75awEWBqRhVfC
	OHR2jwhqy4zH3+v9xlEAcmOBic8zyz1YrxbMGh+FSvkN9ONleipBr6qPxWJo7laU+FS8XsExfU9
	oXFZZeA/6LDjgo+4n5u4QKB7dRiXSRGGxyh2IJlRAy8uHVsADbBAIuDVVchsWDM6xMzqTDB59af
	inMy4GUgHHmhZd4Gj4G3mxF6FzR0clyP3jg86VEBpDFab/mwzB3AunUnQN7K2RFFg0fDMk3FyM5
	IIdUilXJD7MtD7+8bC3S1XAByu4eed8gZR2eFayi6VVgxzLXgdUzAzZ5RgwDg0VuSGk7AmjGk=
X-Google-Smtp-Source: AGHT+IGUaoIo8GmOrRw+0+JNNNYx6MGrFKAD/C+kQiDMbpeIjuCOzqvoM6Ulwwvxs8WR6NAEOUUl0g==
X-Received: by 2002:a05:6a20:6a07:b0:361:3bdc:916b with SMTP id adf61e73a8af0-376a75e78a3mr31725505637.7.1767119148344;
        Tue, 30 Dec 2025 10:25:48 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:d742:b62c:dcc9:47cd? ([2601:1c0:5780:9200:d742:b62c:dcc9:47cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a39018dc8bsm58720275ad.43.2025.12.30.10.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 10:25:48 -0800 (PST)
Message-ID: <aa2b08f8-e6c3-4768-bce9-e36ad9d1e74b@gmail.com>
Date: Tue, 30 Dec 2025 10:25:47 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
To: Helge Deller <deller@kernel.org>
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com> <aVOJovo-k6-0KnVg@carbonx1>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVOJovo-k6-0KnVg@carbonx1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/30/25 00:13, Helge Deller wrote:
> * Chintan Patel <chintanlike@gmail.com>:
>> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
>> core driver does not require CONFIG_FB_DEVICE.
>>
>> Make sysfs support optional by defining overlay_sysfs_groups conditionally
>> using PTR_IF(). The driver always sets .dev_groups, and the kernel
>> naturally skips NULL attribute groups while the code remains buildable
>> and type-checked.
>>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>>   drivers/video/fbdev/sh_mobile_lcdcfb.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
>> index dd950e4ab5ce..cb7ed1ff9165 100644
>> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
>> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
>> @@ -1350,7 +1350,17 @@ static struct attribute *overlay_sysfs_attrs[] = {
>>   	&dev_attr_overlay_rop3.attr,
>>   	NULL,
>>   };
>> -ATTRIBUTE_GROUPS(overlay_sysfs);
> 
> Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
> isn't it possible to just mark the overlay_sysfs_attrs[] array
> _maybe_unused, and just do:
> + #ifdef CONFIG_FB_DEVICE
> + ATTRIBUTE_GROUPS(overlay_sysfs);
> + #endif
> 
> ?
Hi Helge,

Yes, the __maybe_unused + #ifdef ATTRIBUTE_GROUPS() approach would work.

I went with the PTR_IF(IS_ENABLED()) pattern because Andy suggested 
using PTR_IF() to conditionally include overlay_sysfs_group in 
overlay_sysfs_groups, and to keep .dev_groups always populated while 
letting the device core skip NULL groups. This avoids conditional wiring 
via #ifdef and keeps the code type-checked without CONFIG_FB_DEVICE.
If you still prefer the simpler #ifdef ATTRIBUTE_GROUPS() approach for 
this driver, I can switch to that, but I wanted to follow Andy’s 
guidance here.


Thanks!

