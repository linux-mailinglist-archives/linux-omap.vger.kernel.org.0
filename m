Return-Path: <linux-omap+bounces-5417-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C8AD0FB28
	for <lists+linux-omap@lfdr.de>; Sun, 11 Jan 2026 20:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DEC93048151
	for <lists+linux-omap@lfdr.de>; Sun, 11 Jan 2026 19:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A79D350D64;
	Sun, 11 Jan 2026 19:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i34F6F02"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF434B1A0
	for <linux-omap@vger.kernel.org>; Sun, 11 Jan 2026 19:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161069; cv=none; b=SCeVO4UWzPlqlqmYojHmzGK/ak+t1XV3zyXqML+dL8510xCMf8zkGzqsk7bM34ADLJVWATWDQzb3S5KAVN2K0HfLzz5g1j0iwkqUzYiRJKOSJPGgzcs1WoLBUEi5u8+TEMiaXiCwVVEYdhThoqJ7lP+vg05eu54rzijey9zgHr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161069; c=relaxed/simple;
	bh=76yxRtZvGFU55xsNBTw1GUfwE7XmvAmO7p7IQzUMX0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Felow4eZ8RHI1rZ1lOBB4tpMIsuVi2g5rRxq2/y2tfPruEr1G7mCnd7xyS0mJc//fSuj8sA87xm06iCZILrpRUl+LgKRQvV54vzM1WNnYHA62l9so/upW6zBh3gHtAlhhvpn2gmYlg+D5hoPw0yFRzwa22uVVLxs/uiHfrgMm8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i34F6F02; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a137692691so38452975ad.0
        for <linux-omap@vger.kernel.org>; Sun, 11 Jan 2026 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768161067; x=1768765867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRLXkFTiZd9a9Tg70dQ7iXKOuDpg8c1t7/NoM418xOw=;
        b=i34F6F02y0KCD1eutFFOusDtOlmptNcj47nOGWCJUV7Jpa4dZ4qs0aL5yjfIQ8Pi02
         wBqR6LxuusJue2qdiQUOjcTbXL8rvDTpaMKqZMmjD9lpGToZsOm9NUsIBNwk6ofwvZP7
         cSdbJi7xwUMaM1Dg7BT0Xlv1CuqBuD7CcS/EeYvDDaT1enUrv2y2biGJhiYjCAyY8q8/
         CzLcSG+BiEmGNzDEeDQsw2es7w94awA0IsrS733Z6Eg92Ro3cZYPuXB5KshBSZfwAZAu
         RiGnJ87NhrmujkgNNArF4LEVDVxitwAmuqlTs9pZaLVCCdTpCU38xN2HYs7+LYsAVpz+
         qhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161067; x=1768765867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRLXkFTiZd9a9Tg70dQ7iXKOuDpg8c1t7/NoM418xOw=;
        b=WTOQk+fJD8vcdWY6bg+4fqxIGYNKONlqcvfGHve7ST2ERnOVsYoPvngVlqDMb1b08Y
         ky5BKV6UA3ZB3R353G/CRgT1lZrg69yWP32om4lDyZYXuznHCOVMaJggD1Y+FnmlqR3n
         WzMxDpxgGJ1+kYlNK88TCDZVH3Xmf+AVFkPmCW6wIYWhz+VTaUO5DcGJFMPQmH4zlmI1
         k4SO3c9cW7g34eKyukDPf4p/uhniOWC75BMzHEiiPhlgMtuDXlXfQuh51SFJ4Huk31ar
         qvxEcYAlZym/Ms0OIvPbmBRpwxC5aZd7sxYm08jAdxZFYkBYRXCAUKRJP7virMujzrBP
         3SQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoKvzocqQ6WsgcePRUiu7wFDoNuVpLwS6OyS7J9NWsPlJJ5iLRt22x87rbBA5dDqLvTjjlafnb6OBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YykPcTXtV2Hp+/tsuEGj2Ttce3fbWQPBrvNSo4SwLXyxRA1xKJO
	md8mVS18l4KuBpOg/ZOy6+tguMRvorVBYYW1Tuh0RkFxtYZm1EBi13vN
X-Gm-Gg: AY/fxX79DMAPjmdW94nl7Y9leDebwX+FCfXXxCpxi9uda+TeAALt8/HcKO/bw/uyRHO
	AZ5zJQTk5i1qmNfxairv0XxCOrbF6RhgGnwJVDf6fo64Bnvz4mnXwEMzWz+bwLXDQDWy34jnt1U
	cAKRnF6IqRNAE+S+CLP8v5FOtjPlSLmC41XP+jVFgGS5+CeEA4j0JHYugQTlYxNQJbKaDn9Lali
	f9zbGuoWHjGi+VfNtVdBrYqKtcp7VfUtRv/LcjnclcPt4AYtS+lBcwRplSrW7gHBf2P9KWfD3BQ
	CJwkIjJAbQ0Fu2SxyDE3u2Rm6BZ14fL9BSL0dAtm58b6yadSSDx2bCVKwjb6PD/+iD1N4Zfp2Wn
	ehXu1sW8e5o+ySz5Hk7Swk32vsRM0L9xyV0ncTfHSVQ1JhQZPb2BJgk1wwurNmU/EMoXziN9M9J
	ywBDAdKpZyFhF6HiEvTGeiDvYw8o23Hpl6U/+DCanhfUrwaVTnXDRslsFk1om2
X-Google-Smtp-Source: AGHT+IE6MC5cdfKFrapIzQPAQHoSLTs/H9+tHC4hZDCvPVWe/VgmNXYnGJFwo73wIBWsCgtbF09Mjw==
X-Received: by 2002:a17:902:e88f:b0:2a0:a793:3357 with SMTP id d9443c01a7336-2a3ee4fecdcmr148105215ad.43.1768161066959;
        Sun, 11 Jan 2026 11:51:06 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:a2d6:d17d:ed6b:f017? ([2601:1c0:5780:9200:a2d6:d17d:ed6b:f017])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152979465ad.86.2026.01.11.11.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:51:06 -0800 (PST)
Message-ID: <75cb40e4-bf33-46eb-875f-f6100f657801@gmail.com>
Date: Sun, 11 Jan 2026 11:51:05 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, gregkh@linuxfoundation.org
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-2-chintanlike@gmail.com>
 <40911dd0-52e1-46de-b060-0372988291ca@gmx.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <40911dd0-52e1-46de-b060-0372988291ca@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/11/26 10:50, Helge Deller wrote:
> On 1/7/26 05:42, Chintan Patel wrote:
>> Add dev_of_fbinfo() to return the framebuffer struct device when
>> CONFIG_FB_DEVICE is enabled, or NULL otherwise.
>>
>> This allows fbdev drivers to use sysfs interfaces via runtime checks
>> instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
>> remaining fully buildable.
>>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>>   include/linux/fb.h | 9 +++++++++
>>   1 file changed, 9 insertions(+)
> 
> Whole v4 series applied to fbdev git tree.
> 
Appreciate Helge and everyone who reviewed it! This was my first kernel 
series and it was good learning experience for me.

