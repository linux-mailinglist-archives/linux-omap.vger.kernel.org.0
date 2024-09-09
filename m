Return-Path: <linux-omap+bounces-2154-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1AF971A8C
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 15:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D99B61F23741
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 13:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCFA1B86DD;
	Mon,  9 Sep 2024 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdOwkL4W"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F11B29A7;
	Mon,  9 Sep 2024 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887694; cv=none; b=IFQzpK666c1ltqgf6YoPoaLnpLNFcKVex2gEpqcwPzFTAQX5H6NSNYU4k5ghhlvMQdUm3mhBvQV3mO6wgXSn0gjBzo2JPkS6s8TzjYk0AENcTD4BRXoHJ+YmrqxrdaHKIKQGGeK7LaZ7wq/u/xqDDax/DryqX4XztKJZa1k/l0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887694; c=relaxed/simple;
	bh=9Sg+fnMmVyAN3qAVnnTdGEPx4hzaDBZUsOYGrDgbLZo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uG+QP6EDpkG9ffQq4zIBG1AXV2qcUayiYRNJMPAaWfzrRx1/JSCd68Dc9aH7iDQfYDs9cmJi69+qii16w39rDhVkslhSCyUcawyEC2Q2jMpPLqcX6ETO0F/guapSV3e/nUfvvQxZnfKkViyWtStfz0+w3veiSPfmGRgAgb319mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdOwkL4W; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-71798661a52so2557903b3a.0;
        Mon, 09 Sep 2024 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725887692; x=1726492492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Cd5fhD8ici5afX6+xiG5utNAqtTvz1M5Dqy2BN2P8=;
        b=NdOwkL4WNYgvgXp1kl9xupUQhg1SDc22uo6PH1JsYFZt6+RGeveW+JhqteoHZJjvlX
         0K+rbEia55ifTOjJf4ciXIq79qQpWPS3hfSEpjp1LCD+mpMNPPGORy+yybXVgK0WFS7b
         TMg+dDeJaC/4flA9vGezy2K4EqsCTXAHb9sawHApy7Db5mW0iXnWlXBNKqGBLnROwiH2
         VXEwQTo8CV5hlSTH3cu2Ey7dScRg7Bo3ck1oWaDLfgDPxluDMLPFjDhvQlZ6VT8FUq9Q
         sRpXdYBjK5ml88BboknoSzK1G8A4GAz+re+g2ZABw6udBzDYCLKshLHl3+XT2WGBTx4Y
         xI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887692; x=1726492492;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Cd5fhD8ici5afX6+xiG5utNAqtTvz1M5Dqy2BN2P8=;
        b=lOF/pQ3zMPF83z6TDC9s/3Ql4cFPc6M37hu7uCh5nr90Zl1MciY+uRFGuASw9Rw75V
         hICgEhysgQB68eAtsODTg/+0Kgtf98iZS/hDjw0f9oJMnkLCHtTWELEM0x/4+pUN7RF8
         DFwtawjlYe0uAbvhVFWipKEaZHCejdKBgmf9o3iM61uM0YMKy74ATB+iPbZJQ63Opn+/
         5N/fuCd7+C9qlhajFZB9YMgjbK2JlOIQMpdhOGV8zMahk6oz7rOjQVLK8YLznN5f3NmO
         KZ4sHqT0doUHPJA9WlJ8FnQ9dSGy7pKzw2GU0BsRlfMIWYa1JJupK74zUf1Z49HdLTla
         j53g==
X-Forwarded-Encrypted: i=1; AJvYcCUkvahG2rSW7+kGaP11qZnbVrQcDGWJ3cK1lYceE0+M3Thd63mGQjWxgDsxFfnKz11iEkGYCACynhQ=@vger.kernel.org, AJvYcCVA1SW/gdTckcPfFrtu+VX+f+uHCK5UaXMGQb1aJpTMYAc6xFyENbaGtNoWU52kVNX/rNpqRD8/3XG5izs=@vger.kernel.org, AJvYcCVSxmlnzP2tMAsuJR3PXIaNkNR5JaWT8lAcaqq9Mm2VsLD2V0lV2LgHlQJYn9DY3k0uqoq/OhCPQlu83VI=@vger.kernel.org, AJvYcCWiodEeXjMxNhLWqedch7L+vainpj7C4OpImUqyEA2/AzIzsss06FKjpKh471WTh/ytT3dZVX8iMBugsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySKSWMt2mGDLusgftZoQJElr8Co5zZmET7BwSli/esqcSsDlHU
	51OdtUqyhzV9AdMcZFJxJm97XLublQ+e98hcf65PbQt1NzoFUl2H
X-Google-Smtp-Source: AGHT+IGnhYZgwGNXFcQ7s7STKWrNIO2hqlAK0VnpZ8PE0GryIBXkZ1t9udpbTlWICo5af882CgWSiQ==
X-Received: by 2002:a05:6a00:6f0e:b0:712:7512:add9 with SMTP id d2e1a72fcca58-718d560bb37mr13347863b3a.13.1725887691912;
        Mon, 09 Sep 2024 06:14:51 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5897d43sm3496400b3a.28.2024.09.09.06.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:14:51 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <e8f204ee-55d9-4a65-9fc0-582e361183ae@gmail.com>
Date: Mon, 9 Sep 2024 21:14:43 +0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Content-Language: en-GB-large
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
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
 <20240909-arguable-detection-02445bd1cc89@wendy>
In-Reply-To: <20240909-arguable-detection-02445bd1cc89@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024-09-09 21:06, Conor Dooley wrote:
> On Mon, Sep 09, 2024 at 08:14:16PM +0800, Celeste Liu wrote:
>> On 2024-09-09 19:53, Conor Dooley wrote:
>>
>>> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>>>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>>> introduced it because of Docker, but Docker has removed this requirement
>>>> since [1] (2023-04-19).
>>>>
>>>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>>>> needs an RT budget assigned, otherwise the processes in it will not be able to
>>>> get RT at all. The problem with RT group scheduling is that it requires the
>>>> budget assigned but there's no way we could assign a default budget, since the
>>>> values to assign are both upper and lower time limits, are absolute, and need to
>>>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>>>> with values that would work by default in the general case.[2]
>>>>
>>>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>>>> can only be enabled when all RT processes are in the root cgroup. But it will
>>>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>>>
>>>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>>>> support it.[3]
>>>>
>>>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>>>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>>>
>>>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>>
>>> I don't think this fixes tag is suitable, the commit you cite in
>>> moby/docker is a year younger than the one in the fixes tag, so it was
>>> correct at the time it was written. I think the fixes tag should just be
>>> removed, since that commit was not wrong. Or am I missing something?
>>
>> The Docker commit I cited introduce the fix, not the bug. So it should be later
>> than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
>> config from upstream.
>>
>> Timeline is:
>> 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
>> 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
>>               in fixes tag.
>> 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
>>               commit I cited.
> 
> Yes, this is the way I understood things to be. IOW, when Heinrich wrote
> ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), it was
> a requirement for docker. The requirement later being removed doesn't
> make his patch incorrect, which is why I don't think this is a fix.

Oh, you are right. I will send v3 later.


