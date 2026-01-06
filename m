Return-Path: <linux-omap+bounces-5339-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 689DCCF6BB5
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 06:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6707F301AE0A
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 05:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFF12EA172;
	Tue,  6 Jan 2026 05:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZwYEIHk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E4B2DF703
	for <linux-omap@vger.kernel.org>; Tue,  6 Jan 2026 05:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767676078; cv=none; b=fsCwcq5ywSqLjwjmzuAvAPtG3cguPKU00CfXVKEs6ova4JDuTs+S4bYvh0I+ULOwAbRI2uvSqbzZ6KMhNOSefD/g1FCyy5ACOo7wOW53vGUcm3+5+ZlF/yANBK3jmJN1IYhUOKz7LOvD7puS+sP+zYx79doHGKxuwb82sUX521U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767676078; c=relaxed/simple;
	bh=PvKsoC1yJDKXpvwc/Ywpgr06jgkkUxx9YT/NT7YJY4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkUvfNyUf9OvwMWizu8yAt1xec7AS5Idim5VYwT70fxcOpAJIa48Cc3XfxtbWVALrGk7LjmF1kSGgf8+w4zi59AJAMcZLGIl6WLrIcNGBbCgtZooi46IHlbJWBUELjeinDg9uXXarVYHsbOq3isDKnBO5xc4KcjibLGRjVH5rKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZwYEIHk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so788337b3a.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 21:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767676074; x=1768280874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gtGPUtnrtvwlzSCngVczC/q2RK/CQdmnl4xMzqGXCo=;
        b=dZwYEIHkOayOmYUN/scZL4w+LGYKtSWb4tlzh1I5U1dKaTGq0Fq8WAe3/CwDjP+t2E
         nQ8VEYumnw0hEwDq8UayVuuQog66HijgcCap4hmiHb7/8AGinH89vc9ioTjLRgcGc9Gl
         EvWxPfaHKebNl34GTnujf3zEvF7qHNIRbJDv5WPl8QnZ3UWX6JsCEapg0PXrEnpGLRbS
         cxUmuX57zjb4eZWhJctI7jL/AwOdg5p1YhLy0TEfQ2/KCHM7I+9haato5/78xcgKFo2z
         e+yOVFodcaw1DWd8feNCIqm7tAWOObMB4ynhTfv5nZxVjXb/oY1hOL89FbggKpthQCA+
         zrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767676074; x=1768280874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gtGPUtnrtvwlzSCngVczC/q2RK/CQdmnl4xMzqGXCo=;
        b=wUghivE9V7V4n9rBhrR4YxKUY+DVnORkAZZkbdLldqHZWBdWAR1JG/RUZJc4mR2k9S
         Xv0h5tM3EHyv9EaMmcB91ZVEFBxHn0qXi+PEJr3DdveJxGcrEUneC2qILQZ9KLQndqMQ
         5kv2FF1Fwwrd1aCbPaVYBU8rPgfCAoDt3GN+x7ncJ2mwIhlf0pb1GvW5H2j84aoS+bkN
         HVUhzfS47BUb6ebC8H906HdXA2kgaFyiawTvyH+ygvWT4jsX1FPXV7xdUN/zeygxQf6n
         0TzKbkI0bvveP8NxaLH6qjerO/l6hPPos6AAvkbIihqzQ2XVuwR2rGjhnh5o3+pqnR45
         /pjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+4ktKZMqnWXjMHe+dk6PrvvyrrH1FWdHAaASuMkuFICilI6xAUZQqYwaUqumBZpWBI1dgBKzKuZ80@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOb/gk3u0LzqOXyiEYgecy9/7EaRm6ehcxZCAWOW163z+w+Ya
	oSs9R4uE27gottjUXOw49wG4tY06Ubfngl8KhjCiWwu0cUkeWVsF3qG/
X-Gm-Gg: AY/fxX7oBn2EbYN31M7M/Xg6+/Vqv6DfMXx7Daq6p4G7llVOzLEytk0kJxvVswVfNu/
	Z5pIJ1pfkcWCHSvxxxDkaQhmHInEH+roL6gpDWMdzF0Yin9xJjlw6kTDV9ZIZXxXXLGA3fTHxq6
	Ql550pgUt97m4YB1PDHt6jLwYBc1uX+JUfqh7+iiAM5knnfO/EpEik/qDmM0motYyzLpz5eACcg
	zncT6Rtp21bLBbwfXk71XZVZr5QbPK765al72EzLwOwOS1qCcNX06jIjwj6+U0me515hwwPwTup
	EBBOEoRYBc5DwIsjmy+XjSD9q3/8VrRF70RrJX+K0SKE+l5xJdLgT/+4ho2xl6wtLYAoFC1xGLJ
	NJlJE07Z7RS+DFuMtOETJ20CrxB9llCHEmQQcCDALYdG2rRQsO6a0V5SsS/tpkvIbZ1n1Q2uvdA
	17A3kHPDDPzsr4feOx7oFRUb5eJwh1F6e1jEWTkWP75/dgnabwDbeX960+BOEd
X-Google-Smtp-Source: AGHT+IELk3bSN8b6/uvhBy79lAtP4nFKRyXfqVo09Vl9Sea1jJstOayAx+4sJKgZc+BInTNtDc92kA==
X-Received: by 2002:a05:6a00:f8e:b0:7f6:2b06:7129 with SMTP id d2e1a72fcca58-8187f4a1122mr1578438b3a.43.1767676074134;
        Mon, 05 Jan 2026 21:07:54 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:980d:1373:5653:99ac? ([2601:1c0:5780:9200:980d:1373:5653:99ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f8ff7sm752055b3a.37.2026.01.05.21.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 21:07:53 -0800 (PST)
Message-ID: <af800a37-150b-4b7f-ad83-4db6e7e72df9@gmail.com>
Date: Mon, 5 Jan 2026 21:07:52 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Helge Deller <deller@gmx.de>
Cc: Helge Deller <deller@kernel.org>, andy <andy@kernel.org>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com> <aVOJovo-k6-0KnVg@carbonx1>
 <aa2b08f8-e6c3-4768-bce9-e36ad9d1e74b@gmail.com>
 <73007a0a-dd96-43eb-be2e-ccbf8b19cd79@gmx.de>
 <aVkWigAQWC1dZBAv@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVkWigAQWC1dZBAv@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/3/26 05:15, Andy Shevchenko wrote:
> On Sat, Jan 03, 2026 at 10:59:44AM +0100, Helge Deller wrote:
>> On 12/30/25 19:25, Chintan Patel wrote:
>>> On 12/30/25 00:13, Helge Deller wrote:
> 
> ...
> 
>>>>> -ATTRIBUTE_GROUPS(overlay_sysfs);
>>>>
>>>> Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
>>>> isn't it possible to just mark the overlay_sysfs_attrs[] array
>>>> _maybe_unused, and just do:
>>>> + #ifdef CONFIG_FB_DEVICE
>>>> + ATTRIBUTE_GROUPS(overlay_sysfs);
>>>> + #endif
>>>>
>>>> ?
>>>
>>> Yes, the __maybe_unused + #ifdef ATTRIBUTE_GROUPS() approach would work.
>>>
>>> I went with the PTR_IF(IS_ENABLED()) pattern because Andy suggested
>>> using PTR_IF() to conditionally include overlay_sysfs_group in
>>> overlay_sysfs_groups, and to keep .dev_groups always populated while
>>> letting the device core skip NULL groups. This avoids conditional
>>> wiring via #ifdef and keeps the code type-checked without
>>> CONFIG_FB_DEVICE.
>>> If you still prefer the simpler #ifdef ATTRIBUTE_GROUPS() approach
>>> for this driver, I can switch to that, but I wanted to follow Andy’s
>>> guidance here.
>>
>> I assume Andy will agree to my suggested approach, as it's cleaner
>> and avoids code bloat/duplication. Maybe you send out a v4 with my
>> suggested approach, then it's easier to judge... ?
> 
> I'm also fine with original code. But a suggested approach would work as well
> (at least like it sounds from the above description). Ideally would be nice to
> get rid of ifdeffery completely (that's why we have PTR_IF() for), although
> it might be not so readable. TL;DR: the most readable solution is the winner.
> 
Thank you both! I will send v4 with Helge's suggestion and take it from 
there.


