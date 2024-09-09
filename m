Return-Path: <linux-omap+bounces-2155-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3AD971A92
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 15:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F281F250A4
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 13:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9A01B86E6;
	Mon,  9 Sep 2024 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fXTN6cuU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F018E11
	for <linux-omap@vger.kernel.org>; Mon,  9 Sep 2024 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887712; cv=none; b=LGgd6u2xblgdnoMhDQEgauG5JnznYSJFCKPd4ygMnmxgpXw/OFBmHHr5vpa+OLkOLhSiWeoG1HDXChRd8I3DUA3vPjoyMZKKxGYgH7II+4u9xecW7f4un+xbAvaXh1fGuvlnP/zCpaguD57SMA4q0+Iyyk1qQGr3+sU8qqolhsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887712; c=relaxed/simple;
	bh=6mdNTEsjiQN5pqvgQZf5ZMa+SrjewyKRq3O8UeBPb4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdhHpaqL/GhzpuV6SL0KqM2Sf9fwzRGEEv+Pa69AQq+bZWBYJFYYcbNVYQ4oKJFp4VtzAY3nSDwkmnY7dOESa3AX1CbOgil/2DPFUEAe0giPqmCC/UObsLpCczc8S/5mI8AdltUUBLT+YJXOJgShX1LA9Gh8AYdEl6NWin0QE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=fXTN6cuU; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EB5743F5BB
	for <linux-omap@vger.kernel.org>; Mon,  9 Sep 2024 13:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725887705;
	bh=u1n/O2W+LcrKETL5zYIpc+SVEc0AbjVbXS3O8zNwBEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=fXTN6cuUvENb9+xfZos3SM2Oo8ewgNG9wgAe06+LL+8D9+dILKty54ulL7J2fPTWf
	 78RC+zsK5rUrfxyKR1++FrCPFecaDKZErWlJvMUbCYjNDfDPxDu7tR7ySSlItJTOuF
	 Y+uzs7v1sa4Bbo5u1AarRqO7ClHTaBVt49YdKMdCRgS1gv6p79XpLY0+4DKTJ9L66N
	 mAutcEvSKAKTUjiOrOEGNMIOZ7fivUbBIj6kBVZ8J9ZWzZYScNvxV1yzUnET+3DMfM
	 iY3RpSRSHhsR1sNYwioLVyIWntpsH5G7X5ytKPiQmJ18yIt1rHAvCmDGrczEA4mnRd
	 JO+pvoELkUS4g==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb857fc7dso6568915e9.0
        for <linux-omap@vger.kernel.org>; Mon, 09 Sep 2024 06:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887700; x=1726492500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1n/O2W+LcrKETL5zYIpc+SVEc0AbjVbXS3O8zNwBEk=;
        b=iC6Kp5GZm66bJjr7orucLSbCOQxKi31FT8VEbO2DignNKiP9I0ebn+SnRXmOlPB7b7
         CWjqU23Ua2YuPUfivR/qMVr68XFAMqiXWRV/WhF0I9+LF9MyT/t7RIOPXAHGC3i04tII
         VTu/PTWG3KpngoX+4b+BX+81izXNwI54CKabZhajqs5i5dRNmmFOy5Ebee2rVxJM7QjF
         GlsRlHlXCHRPNmBUWOCUghXpZDXoz/Wy84JrDgTTKJ78Cib4LCLi5KR9RxQeoYAfgZQ3
         JkBsITdsejXa6uUJyFHuLfQTjip2PS8q/wKLPeMtCK9Bes8SiJ2tY5jIhvITVu/35hZQ
         WRwA==
X-Forwarded-Encrypted: i=1; AJvYcCUwwNLB/pwg77q7HClWBzwOXj24LmeCWgXwszO2uc7KNXEMitEva3UeqYzG6WBAJd/E28ZrXIdxBgHv@vger.kernel.org
X-Gm-Message-State: AOJu0YzdAudCwjzv03nDz2MUlQxVPpwS3f3CAz5FmPJcwqY5kOWCYuG6
	KipiXOwkvC3Fyt/lg/vjHyyjzSRWL6XqbLH+9dktYj9kH2Ux0rmhe/qiRAC//GiFSB1Rs4rczi7
	pULF4URVuLT+G6TFY1eLZD/AoVyFNWYwWUSAiFyd+3KK2QqoqHEedNOqrHbuxeStZx6OHOF/rXW
	Y=
X-Received: by 2002:a05:600c:1d22:b0:42c:baf9:bee7 with SMTP id 5b1f17b1804b1-42cbaf9c20dmr9334055e9.12.1725887699783;
        Mon, 09 Sep 2024 06:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOh5t4UDivktvUt6K0PPRZ2R1nhw2jQHB3U8gDmn4MVIqBX9sh6eOQO6zR51vh8x/9pGonlw==
X-Received: by 2002:a05:600c:1d22:b0:42c:baf9:bee7 with SMTP id 5b1f17b1804b1-42cbaf9c20dmr9333485e9.12.1725887698729;
        Mon, 09 Sep 2024 06:14:58 -0700 (PDT)
Received: from [192.168.103.101] (dynamic-046-114-195-052.46.114.pool.telefonica.de. [46.114.195.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b7f1sm77309945e9.48.2024.09.09.06.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:14:58 -0700 (PDT)
Message-ID: <139cd6c2-45e7-46c9-ad17-4d617673fc80@canonical.com>
Date: Mon, 9 Sep 2024 15:14:53 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
To: Celeste Liu <coelacanthushex@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
 <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
 <20240909-gave-celtic-af2ea8bc38d5@wendy>
 <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.09.24 14:14, Celeste Liu wrote:
> On 2024-09-09 19:53, Conor Dooley wrote:
> 
>> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>> introduced it because of Docker, but Docker has removed this requirement
>>> since [1] (2023-04-19).
>>>
>>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>>> needs an RT budget assigned, otherwise the processes in it will not be able to
>>> get RT at all. The problem with RT group scheduling is that it requires the
>>> budget assigned but there's no way we could assign a default budget, since the
>>> values to assign are both upper and lower time limits, are absolute, and need to
>>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>>> with values that would work by default in the general case.[2]
>>>
>>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>>> can only be enabled when all RT processes are in the root cgroup. But it will
>>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>>
>>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>>> support it.[3]
>>>
>>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>>
>>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>
>> I don't think this fixes tag is suitable, the commit you cite in
>> moby/docker is a year younger than the one in the fixes tag, so it was
>> correct at the time it was written. I think the fixes tag should just be
>> removed, since that commit was not wrong. Or am I missing something?
> 
> The Docker commit I cited introduce the fix, not the bug. So it should be later
> than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
> config from upstream.
> 
> Timeline is:
> 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
> 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
>                in fixes tag.
> 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
>                commit I cited.
> 
> [1]: https://github.com/moby/moby/commit/fb85a99f5899df7475ba6b1ac4b2e1d32974eca2

I experience no problems running Docker without CONFIG_RT_GROUP_SCHED on 
Ubuntu 24.04.

The Docker patch is only for contrib/check-config.sh. Probably Docker at 
the time of my patch would have worked without CONFIG_RT_GROUP_SCHED, 
too. I have no issue with the Fixes: tag in this patch.

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> 
>>
>>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>>> ---
>>>   arch/riscv/configs/defconfig | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>>> index 12dc8c73a8ac..de85c3ab261e 100644
>>> --- a/arch/riscv/configs/defconfig
>>> +++ b/arch/riscv/configs/defconfig
>>> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
>>>   CONFIG_MEMCG=y
>>>   CONFIG_CGROUP_SCHED=y
>>>   CONFIG_CFS_BANDWIDTH=y
>>> -CONFIG_RT_GROUP_SCHED=y
>>>   CONFIG_CGROUP_PIDS=y
>>>   CONFIG_CGROUP_FREEZER=y
>>>   CONFIG_CGROUP_HUGETLB=y
>>>
>>> -- 
>>> 2.46.0
>>>
> 


