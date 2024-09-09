Return-Path: <linux-omap+bounces-2152-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC4897191E
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 14:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A94EC1C22BCE
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 12:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CEA1B78ED;
	Mon,  9 Sep 2024 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP2O9R4X"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5693A1B29A3;
	Mon,  9 Sep 2024 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884183; cv=none; b=HtaXRADJRYODFLvkf8W1y40MRosztOY3sB0LnOmK0Em7cjzKjKNKAy7fA+Ii9SG6zuS76aIoZgBJYymTUlv6BbejqV0zMguF+5Zh9CDz6u1u2xiz3HrtrS8J+pDR7ak0m7kzjMH/o4VovNk2XlAcvlQWv/NUqcgZxgjw4iCjbpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884183; c=relaxed/simple;
	bh=RWj3XqX8Nl9ZvEaZRWgMI0tNYmiYxDpGbyz5uPwusho=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QvZfUcK6FSEvedeJwNRfpDKaQxVcJFBMDlCY0VjPSg4zbu8OYnUzc7wu3GS3nN4QkbpkUPtMwKOMU26ICb+jwjv6DWYcVMsoOKAMYLhM+HoAEXel0oGAvW9uXrN3nS0MlsKzIHuvqhWWJFTXM0g/nW+B0WBiMfdfIfGf6d6Lw+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP2O9R4X; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7179802b91fso2553288b3a.3;
        Mon, 09 Sep 2024 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725884181; x=1726488981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPJ7uHySGWvGCBzUZkM0XzRLu8h7eCfH2Esu33AGR14=;
        b=WP2O9R4X3ijj8tk0QBQfrX+hM8v7C8+abUgHVZrUm5r1J6XNZAXV4xxGyTy4fO0y3R
         gZYHyhjRiCDAj9PMrSTZ/+IsDHV8okYrWSXO+UI5gAkZo4PQUNsJ7rWYk19zKHmPyclL
         K4zz7mfttyH8XEdTtwRJIZv2yo8t2GzCgmflOpH3qU59G/N9cXkObx1JA5Pl3Fw85tUi
         DPqm4A17pZFepex3bo5e+7+unj2CGX3K78/iqX/upfo8UirWKO6Nyozdp5Emd5FkDjYH
         LgNrfkdK5FMNfbzYRbGWJ8j5iWD6/Xp8f7bqjkWB/SPr83boiGZSn6hhX2+I0gfvq+o+
         6ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725884181; x=1726488981;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPJ7uHySGWvGCBzUZkM0XzRLu8h7eCfH2Esu33AGR14=;
        b=PUVZniGWOGRQ7cLy9b2uXZHFuD4YzYlGdCbgqKIvXZSHq5X1Mwx8O0lhowrdSlggXo
         fzrifG4Ha2mTxRONKbh9Gb82AgRmqB3lhyURau7GapX1ngoYgbdfyZzb5YvIcUnmlVgU
         l0Dl/eBtQFC8EVC04+jtmk+1TeEtRyHxPnW7jY1bULTTpXgWEB7rtljKKzXjs+lB2wfx
         Tw1GqMHot3hrJktR9SVZcucboUxvPa7/pztwDK3KBmeyelJ7QWB2t4LEFg15yHl/+4Pk
         qD9dDM37Q12Uw5rhsY2J55tV8F0zhcqj5c+X9sR04f7M7r7ce0NsSeTAduSP47Et0jsp
         laDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF1mYPh8DMWV0DgFATb5ph4Ltklmrrt9c7nDddnIGYDZuJ6QUThUN+Nn/a7zeh5lF7VcGepSZ0FwAfG4o=@vger.kernel.org, AJvYcCVI3/WcOghUzc+Fz+iQOvZbdn68m/9Ws3dsmb1L9/gYlQCxnPjvgKjhDHCKlBrLth+5SBxV5Epx+j0=@vger.kernel.org, AJvYcCVI8OLmhGYXpFxkil4GvkPKP/8L3YL29iogyBOIv1q3EpHaeeHRV1b8mQESC2P0K/M8FhRQAitSyH/WWg==@vger.kernel.org, AJvYcCWlLRelfvH0EK8grD37OPYvflljtxoJ/vKm/8w8l1OHPsCpQxiBUV4QlSdkGxKDy3C8RevW+13jxdDVQ0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIxKEHfIfCkGRP/8biX6ULXaA03n7Mv1N6AE0Iz+EMOb5vXcjD
	pfoVJiZr83JxMX4RSk3Dol9NqMw9jl1H16M69vPGohm2Q0AuXYfD
X-Google-Smtp-Source: AGHT+IHM6o7g7DPr5Llw8JRr5tP9jGrL5l9uJZb1UkPnnG81PEEIs9bo2qQPnTUWF40R2wiNKVBM8Q==
X-Received: by 2002:a05:6a00:4b16:b0:718:dd1e:de1a with SMTP id d2e1a72fcca58-718dd1edeb4mr8053950b3a.28.1725884181407;
        Mon, 09 Sep 2024 05:16:21 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e59687cbsm3397730b3a.115.2024.09.09.05.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:16:20 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Date: Mon, 9 Sep 2024 20:14:16 +0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
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
Content-Language: en-GB-large
In-Reply-To: <20240909-gave-celtic-af2ea8bc38d5@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-09-09 19:53, Conor Dooley wrote:

> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>> introduced it because of Docker, but Docker has removed this requirement
>> since [1] (2023-04-19).
>>
>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>> needs an RT budget assigned, otherwise the processes in it will not be able to
>> get RT at all. The problem with RT group scheduling is that it requires the
>> budget assigned but there's no way we could assign a default budget, since the
>> values to assign are both upper and lower time limits, are absolute, and need to
>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>> with values that would work by default in the general case.[2]
>>
>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>> can only be enabled when all RT processes are in the root cgroup. But it will
>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>
>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>> support it.[3]
>>
>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>
>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> 
> I don't think this fixes tag is suitable, the commit you cite in
> moby/docker is a year younger than the one in the fixes tag, so it was
> correct at the time it was written. I think the fixes tag should just be
> removed, since that commit was not wrong. Or am I missing something?

The Docker commit I cited introduce the fix, not the bug. So it should be later
than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
config from upstream.

Timeline is:
1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
              in fixes tag.
3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
              commit I cited.

[1]: https://github.com/moby/moby/commit/fb85a99f5899df7475ba6b1ac4b2e1d32974eca2

> 
>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>> ---
>>  arch/riscv/configs/defconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 12dc8c73a8ac..de85c3ab261e 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
>>  CONFIG_MEMCG=y
>>  CONFIG_CGROUP_SCHED=y
>>  CONFIG_CFS_BANDWIDTH=y
>> -CONFIG_RT_GROUP_SCHED=y
>>  CONFIG_CGROUP_PIDS=y
>>  CONFIG_CGROUP_FREEZER=y
>>  CONFIG_CGROUP_HUGETLB=y
>>
>> -- 
>> 2.46.0
>>


