Return-Path: <linux-omap+bounces-2864-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D609F8DF2
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 09:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20ADD189509F
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 08:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420461A83EB;
	Fri, 20 Dec 2024 08:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrzztL+z"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED3111A8;
	Fri, 20 Dec 2024 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734683219; cv=none; b=a+6Sddhf7ZJAZ5dcwZtYJqwfbtgyORY5x5FP/sPfLNWXVKPhe9P5o1vmTJ3CjKe19mz5EwHoOfJOn/pQIm/gEYZHdrUXYh99To+x2Cx+x/PC9xbkM5e3PLSYzlga/lwwzfHtivxhgkv7gKx9IIQM3lETCUIYcp3lqL3ccdmbm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734683219; c=relaxed/simple;
	bh=IKIwZku7f3pRfjJvAJfGTmanaHuxA5Tq8kqO3a3fhJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2m7irtFxa8hTnP6LupkXwC0jaiOJO+jSQZbks8mt/acaKqufGVteTbPqccrwFM7a4rpCj9KGnQU6Zd2XXJavhGe51/DYz5uBw9Tq3YbpjGlkhHJWtyRprq/8Os7+lsPt+dkMo0ZAHGeyDtovC77FO3YyjT8EIQkWqtgzY4U3s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrzztL+z; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so297270366b.2;
        Fri, 20 Dec 2024 00:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734683216; x=1735288016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PigV1/aOahiChMj/C1LZ422rLUqIiVtTZD/HFwq39gs=;
        b=nrzztL+z/BgjK//o3TxyHKjHD9Z+yPvgJEcFG6EFWAXS5wMQFNOJoe3iuq28WkoyJC
         B8ZMNh0pqc8d8sZ+KCPoxBslpKyHZ+aQ9fjNTWJLytivSdkEaUPFZOKDITOFxasU+TM1
         BDDPM3o24UUrGARLWMiWt0p9MavXrE46N3U/A/nU1K9mKP6HIIdHpI/06JWyrw7MMIHJ
         HiNUb2K/aCZmDORVvcy4TqzrOAMKbJ9kyygp53yhlS+i+8Iv6xARmTXP4p+e4tONux5q
         /B7nrs1vuAn//2GHwbYu6aoR1spYl6koDR87OCbEotCi5y8ZPyaoIDYDno2fngCA/mru
         JprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734683216; x=1735288016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PigV1/aOahiChMj/C1LZ422rLUqIiVtTZD/HFwq39gs=;
        b=lFb4zJ8xUwAHFQt1UK9xLNmE5YK5EBFy2iqKFZ39ddl9LI+MxAx238qbsuAXVIFC0R
         SliGDdJz0xXMXvwAP+UwoCIz/WgYICAL5nR8ALLnN8vCWPOXeAyHajRZx2pvNnWR0Ety
         Tv4gDBgNyDOmva0I/4JAvOj6n+8PUXDxURr+Gc2rGIBNMcIDSwrI3ybPOtfTBVYTMSsg
         JGSMrRqAIXmcH37yX7FMrfoqtLJ11eOJkjCXJjluYZ0bZwFsAO9FU953VFZ5aKlaUl73
         fq1aG0mim9ZJ0DnHRAT+/YH4MxIB8orTunCaxIxD+/A0rLhGqXSgwb+4gpsmGuTXrby8
         METw==
X-Forwarded-Encrypted: i=1; AJvYcCVOHqWsOTEYyzZXh+d2+At33MjgQ0p2evz52+x60QECuHV32+KYOUuGpohL52M3ZdaHDYp8wtlj@vger.kernel.org, AJvYcCWMNZHTiXRuE2K1TuO249MeSCU+c82a/h3Vw4ajpTxM4s6HuAcNVaQO9zW+LQ/zE9SONq6BzSIEo2sN@vger.kernel.org, AJvYcCXvBHIMqsL8m9FjuP8PTauiagTkX3nUVpj2eZeFv9B04Xz+FyJ6VoGFBKLmNjeQ//re12vgpHXa/5vmCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxrWAjf1Uds/C4xVohGuDnrmpNlUvP5dU3MIsD5YESNEsepcb
	ZwFxIIP+5ZBi3WM2tkI6oNUmWd/Brf1eAbDhCC1aNmgwWfd5pC0L
X-Gm-Gg: ASbGncuW0YoYZjz/+ePwFKAXuXCd6EmyLxH/w9fNp6Kx/VOWRDmSONAk3/kLKr/CuUD
	Hn0xdGsbD60E2AnT+QvzO+644ZtYnOjftV1oGKFc6d1P3XhInqw34WOBXRQ1giQAFRxvsCzuQRh
	W7NiouiaLivaf5d0V7VfAmlU+2xHJ+zG7WdqC/n4xpggF8gQ3uLtR/qgtSnFLe4Q3b5GwA2p57B
	M1GU6o/pVQriznT6P4wnsk7uWv5zijMCk189RowrT92jNULy2/lHfDdmM4czBRN+ipBChfNNeDi
	3lGu2KGs1ZKWXSC3n9xqPHmNJkIdyNBFv5YSHSxvruLRz49DYkxUjMo3wIQk7jTA/GhQViWBQGB
	VXgej9pvmqx6+7W2zHUDpur9vGhEWmnbSdaNhQeSE/06J37B8
X-Google-Smtp-Source: AGHT+IF34CvLvhWRVo7LSPobpPH5qg3at/fJZwvXVZcYhyWYXvqq08y8ovXQkVtwEFRGdYzpTqQwIA==
X-Received: by 2002:a17:907:6e90:b0:aa6:5d30:d974 with SMTP id a640c23a62f3a-aac2d3286bfmr159677866b.28.1734683216329;
        Fri, 20 Dec 2024 00:26:56 -0800 (PST)
Received: from ?IPV6:2a02:3100:a560:5100:cd65:47f8:25ce:a8f2? (dynamic-2a02-3100-a560-5100-cd65-47f8-25ce-a8f2.310.pool.telefonica.de. [2a02:3100:a560:5100:cd65:47f8:25ce:a8f2])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e82f2fasm149713666b.9.2024.12.20.00.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 00:26:55 -0800 (PST)
Message-ID: <7128fc70-895d-4622-b12c-eab2475e3049@gmail.com>
Date: Fri, 20 Dec 2024 09:26:54 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: add and use phy_disable_eee
To: kuba@kernel.org
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@armlinux.org.uk, andrew@lunn.ch,
 andrew+netdev@lunn.ch, pabeni@redhat.com, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <173466543676.2462446.11795736705448322037.git-patchwork-notify@kernel.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <173466543676.2462446.11795736705448322037.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2024 04:30, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> 
> On Mon, 16 Dec 2024 22:29:58 +0100 you wrote:
>> If a MAC driver doesn't support EEE, then the PHY shouldn't advertise it.
>> Add phy_disable_eee() for this purpose, and use it in cpsw driver.
>>
>> Heiner Kallweit (3):
>>   net: phy: add phy_disable_eee
>>   net: ethernet: ti: cpsw: disable PHY EEE advertisement
>>   ARM: dts: ti/omap: remove eee-broken properties
>>
>> [...]
> 
> Here is the summary with links:
>   - [net-next,1/3] net: phy: add phy_disable_eee
>     https://git.kernel.org/netdev/net-next/c/b55498ff14bd
>   - [net-next,2/3] net: ethernet: ti: cpsw: disable PHY EEE advertisement
>     https://git.kernel.org/netdev/net-next/c/c9f5a5dabbf5
>   - [net-next,3/3] ARM: dts: ti/omap: remove eee-broken properties
>     (no matching commit)
> 
Patch 3 is marked "not applicable" in patchwork and didn't make it to net-next.
Any issue with this patch?

> You are awesome, thank you!


