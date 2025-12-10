Return-Path: <linux-omap+bounces-5148-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE73CB1E6F
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 05:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6D430698F7
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 04:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEF430EF86;
	Wed, 10 Dec 2025 04:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfpgHscR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED412FB0BA
	for <linux-omap@vger.kernel.org>; Wed, 10 Dec 2025 04:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765340691; cv=none; b=t8XPWNJ0fayQemoTnpdXPPSDxHWqCQh4K7t1HjXp8zztmZNOKm+PuUB8GVQofAxtH723U9wQXNNFRPyXrB9RP7IzLN9lolC0hJUs0L8AoOoG9o1iSZK/NyIjGnG6QV3POkxyvoYyeykMGDWpttPR1EZFWoqqrI/vH54c+uzepL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765340691; c=relaxed/simple;
	bh=cbubf1NYJfCvFoWNQLYMFA2LJeNlUgm2HmggK2vgpLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhtV37BxJND0cPeEE8mFAK79CNH9v6McismptikruqH9BLuoXxYthdsTP5zd31Gnc61ftXmZT9FE5S5nBJdY5cNZkAjhBrS6nG2ewz80vWUiTQQp93mQXTBR64QTMyzW5nUCVdwP6IsYKEiDm4g2tjWlwRlBKLgbncKEscevl/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfpgHscR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2981f9ce15cso84292315ad.1
        for <linux-omap@vger.kernel.org>; Tue, 09 Dec 2025 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765340689; x=1765945489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZHURbWUQgIv6rDE4plYGzDdoLRCquvnAG2DekAVeb8k=;
        b=gfpgHscRzbg/3mIu1hfQjld+HqZgJG2nv4UTogQhqtGdoFjJsE6UxluafU0SWg+yah
         G/CnSdY16oCresSu+iSi88zBpMmIx7+GXsstPrJ59f2XCgsBYG4zkYUPXu0vBslOhhE/
         0+vAqvszq5PtC4JJjU/RfJ6jsQ+6E+KKAKWnpcPL7+iSM/zQWgbhPxS3SNhOl7xkjPLB
         6909K8Tojvfs1Gp3a0F2zflXUKPx4OPECCQj59LDjr7k2e65rrKgMdw7uuAjDRQZAFHZ
         aoklaDr6tTfk3o+MNy1ZISIQorvaNSY8FdtXG5rO1b/wfDJL7LKO+Z1CnH2M9VqFBfjC
         l3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765340689; x=1765945489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHURbWUQgIv6rDE4plYGzDdoLRCquvnAG2DekAVeb8k=;
        b=DNtRLqJU6jY2QFBJB+CFsqiO2HaEaLMUect+0HWI4V0RwrbiGmRV+w3DgRk3BiRcTZ
         KJMJU4abV9JEgi7TYtxrf64+YP2P5v5VCK8U4n/gffjL8iwDPM1anNC+VXvK71MpOc0R
         tak55F4ue6KkHISeSQW21pNmLvX4q2s9zW4Vc9MNEXaHUtiMIwv4kaeVsSTC6BwJTTpe
         +z9S0c4VwyTBMmOw4CXtNC6T8OXag31s2oAqXf+Tm27nXy7/wj1fi7VsRS3HQ+TRIj7x
         9i5nJCtmDGAw1nWu6EUYR1FYmgQGsCOECNHgh9BDiicvThDqXu/afrhL/nAFTYzgeywz
         KmSg==
X-Forwarded-Encrypted: i=1; AJvYcCWNHLxeiVcC32PuIGbznzEMjfkgGYr8OaYFmfMo9SaXBfn+dsa2iJqPr9BNxmxT/+RfMmb0QPLdwfRS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Y9SqSCzqp5fLuvtCSuGnF/jY2q+MaK/dBpTG+YJH+EtDyPQ8
	d1TkpIxMQbnjOpCtrkkYQr3Bw8JYVGiriI6ppk+QZj/Ts44Az5em5zzd
X-Gm-Gg: AY/fxX5cWEjG750AGH5sJog/p88aBtlMKLoka974Iak4iMfs6VyExEw1Ecu327FhJy1
	t75y50WaFwRJrdRq22EynRH//a224WSsHzUovplOwWIGYCgUNUk7kwSgauSJ7qoAlZXmykEXSzC
	zAskbtdLa8JeDhAgsryncySdJLSjeqdj0BIvq5SLHnINpkmwar1D3wKCvWHKajhehJbNSMMVFgu
	ieC1hG9u+guu4N5qFriodtcW7aNngI3axxtiWbnQKYGUfbQnOQCgWyWz7MwnznLEf21kYCvDUIC
	KC1yNcvKDWTNsoko/vm84RBWzCklyqtzoj9IuAqy/i1EV+/h5Pvg3JEJ6onl6HyZd6gwftKZP02
	fEscMjXbyPoAXMgdcy1b52/0+GlKjloRR/HdjljrhlyHiQb91ElwY4r36sxD0pys8R+cRMi7rT0
	2pxYE8dE8e41PCyp1kGl5iFiK4GwHqJTPXq1CKHEyE0hCYytsHVDcIXJRakmDS
X-Google-Smtp-Source: AGHT+IFLjbHqKm1TeTHwPWHgM/dVq6lAyHbS/510gkTwuZ9bXQQa6783zsMnS6eOgTYVIMZq9D1MPA==
X-Received: by 2002:a17:903:198d:b0:298:1422:510d with SMTP id d9443c01a7336-29ec2d8b9f2mr11445495ad.48.1765340689155;
        Tue, 09 Dec 2025 20:24:49 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:b90d:2938:bd7a:289f? ([2601:1c0:5780:9200:b90d:2938:bd7a:289f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf97fsm167022355ad.25.2025.12.09.20.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 20:24:48 -0800 (PST)
Message-ID: <89b08d9a-9f96-40f0-9ae6-e54b16b65879@gmail.com>
Date: Tue, 9 Dec 2025 20:24:47 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbtft: Make sysfs and dev_*() logging conditional on
 FB_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <20251209042744.7875-2-chintanlike@gmail.com>
 <329423e8-d778-4f30-904a-825b1be72ce2@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <329423e8-d778-4f30-904a-825b1be72ce2@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 12/8/25 23:25, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.12.25 um 05:27 schrieb Chintan Patel:
>> The fbtft core and sysfs implementation unconditionally dereference
>> fb_info->dev and register sysfs attributes. When FB_DEVICE=n, these
>> fields are unavailable, leading to build failures.
>>
>> This patch wraps all sysfs attribute creation/removal and dev_dbg/ 
>> dev_info
>> logging in #ifdef CONFIG_FB_DEVICE, with pr_*() fallbacks for the
>> non-FB_DEVICE case. This makes fbtft fully buildable when FB_DEVICE is
>> disabled.
>>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>>   drivers/staging/fbtft/fbtft-core.c  | 20 ++++++++++++++++++--
>>   drivers/staging/fbtft/fbtft-sysfs.c |  8 ++++++++
>>   2 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/ 
>> fbtft/fbtft-core.c
>> index 9e7b84071174..dc967bdeabe8 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -365,9 +365,14 @@ static int fbtft_fb_setcolreg(unsigned int regno, 
>> unsigned int red,
>>       unsigned int val;
>>       int ret = 1;
>> +#ifdef CONFIG_FB_DEVICE
>>       dev_dbg(info->dev,
> 
> Rather use fb_dbg() [1] and similar helpers for logging. They only need 
> the info pointer and do the correct output by themselves.
> 
> [1] https://elixir.bootlin.com/linux/v6.18/source/include/linux/fb.h#L895

Thank you for this pointer - I actually didnt now this existed. Will do v2.

