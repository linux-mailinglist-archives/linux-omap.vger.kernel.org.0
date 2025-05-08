Return-Path: <linux-omap+bounces-3678-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FE0AAFC01
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 15:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86723A5083
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 13:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E36622D4DF;
	Thu,  8 May 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QijR9yQP"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F4208D0
	for <linux-omap@vger.kernel.org>; Thu,  8 May 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712176; cv=none; b=J9F+AXpgovSYZqVv84Dp/G8oK+8n3yNsKF+SgJXSdhWvJhUhfiVKUXdPoREel8hLr6DiQscCdFKDAJypY/L1XUuJ4I3lXg9RQWcAYy31hmR4ZyNaMj1/dSuaQY8iD1cYto47JTz4uFH37ZOgG6lBNJohfEwrtoXUhQIRjGeBcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712176; c=relaxed/simple;
	bh=OD8GxFlJxZjRjI0IBByxRgE9JRBwwfxhYepxx0fCF40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqGcLgIOG/LpAouO4Z0NXSZE/pG9KIlppW458n7TJVrLD5jcWtnajogR2vS90KcbW5jMW5+I75+2KXRnWbRWGKYe97P4EcnzrX7h6i4RHEwd3i8D9xDucSIvxmuY5IeNMwaXX7uvFRv/OHOzxfutXIQ/sSSYzFy1yxOTn0kAjYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QijR9yQP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CywF47gXjpgY/l1leg6XrAUlD5bu0hAVfhP0zMhN6lE=;
	b=QijR9yQPrC1aPhxBRw9mIPM7qBkyqW6Q7/mmfksMMT9AF2Y5zGTG8RCstaOqts2/gwYzd9
	2LkvdA4eCuZffx4mDdfYyPQNRvbSjq9gTqzXN/MuZex28GjJYxqW2RDk+KFKLfVpNo9aXq
	xoppGB8FFGKup8OEWobcMb4zBwdkQys=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-FLUDdyLQNheCryMEygetkw-1; Thu, 08 May 2025 09:49:31 -0400
X-MC-Unique: FLUDdyLQNheCryMEygetkw-1
X-Mimecast-MFC-AGG-ID: FLUDdyLQNheCryMEygetkw_1746712170
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so414612f8f.2
        for <linux-omap@vger.kernel.org>; Thu, 08 May 2025 06:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712170; x=1747316970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CywF47gXjpgY/l1leg6XrAUlD5bu0hAVfhP0zMhN6lE=;
        b=PhFBLdo7/qcbnQ6PuP288ao0XRr9BHowbhThJ7KVHZjxbHOkIJ0PkRRG7RDb+Bbp0w
         e22mWGoCD9Dy8CtBWqKVQGFUESIfMNrrTvpShHdLwQ52ZSFDLkcE9gSlAHeBpkTGOh5Q
         4uKiSe9Krns5BzRix7HTLOFVYA6DZsWK6AZRvsu9cqSY/8NRtUBvdV/4tzZTt5Dga/0y
         PWpOwLvrZK5meMzrhJ+6T9g+9ByhCiUSkeJVyK2rW0AGsDHT3zy+lho1vcD48ycleXqB
         KvlzzxG8fQAJfo8PuJDjxxRKgEGGITWlnxSF1jjX40rWOI8yzc9NZWrr/ZYQu+jyZbvP
         C/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWjgCYbxexdB1PSrMtdwDAugkaiYxYF3u0VK4zScRfXk8xs7u2RnZcrFiOTNOzGXh9OUS/iq7lj+zDR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ysze/9J/p6VbE/d/C3DZuuxnvR2bYcE+conLf9WdDxwMFpHp
	+j6rCc8zxJbBbEhdiAXBGagD7rwzeedWIwKPc/wX7y96JXIx9Tt1pOjOVfood5ZrkOdlth1r7m0
	pSAfYDdOUyorR5MQP6aC/DE46qR5kMYjgeWISsjFylpBTFNhcrF/Jhpg6lgc=
X-Gm-Gg: ASbGncvU9JrueinJf3lL0dIS7GzqiScVQ2OW5wix5JY5pPM8osso7USFBFVKcqQOliD
	imqWON+5w/y3pe6b14JTv3/3Q45lIymNm5GzJIOe1DMqYYh1fW+bsItyofyhJcYpc0ieYPFjugJ
	Svs+B9mJvpS6EI6cl7uf5S0mPSjnaxuuJIUxEOAkIdgg+fI+afPsUEEd9tD20RmqL0UaVI953fC
	ckDILPlu3RWuQQeYgnD+1ROxL2b5S5f4F1k5GGTLTlZ3DuKpVzmIeHkfFX62uYfBlCNoSiviPfw
	GdQ/ZfV49YQpBbX6
X-Received: by 2002:a05:6000:290c:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-3a0b4a68652mr6692116f8f.51.1746712170392;
        Thu, 08 May 2025 06:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECjAERYWa6S2sVnLY/p8FyXyHfUJVuA1XUuJN5svWBMIQPW9IiG9y/gkXhSokA6jatooc4QA==
X-Received: by 2002:a05:6000:290c:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-3a0b4a68652mr6692103f8f.51.1746712170075;
        Thu, 08 May 2025 06:49:30 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244b:910::f39? ([2a0d:3344:244b:910::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de0b2sm42895f8f.19.2025.05.08.06.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:49:29 -0700 (PDT)
Message-ID: <23278f6d-f111-46f7-a844-2cd7fbf8b623@redhat.com>
Date: Thu, 8 May 2025 15:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 7/9] net: ethernet: ti: cpsw_ale: add policer
 save restore for PM sleep
To: Roger Quadros <rogerq@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
 <20250505-am65-cpsw-rx-class-v2-7-5359ea025144@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250505-am65-cpsw-rx-class-v2-7-5359ea025144@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 6:26 PM, Roger Quadros wrote:
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index ce216606d915..4e29702b86ea 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -1823,3 +1823,45 @@ int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
>  
>  	return 0;
>  }
> +
> +void cpsw_ale_policer_save(struct cpsw_ale *ale, u32 *data)
> +{
> +	int i, idx;
> +
> +	for (idx = 0; idx < ale->params.num_policers; idx++) {
> +		cpsw_ale_policer_read_idx(ale, idx);
> +
> +		for (i = 0; i < CPSW_ALE_POLICER_ENTRY_WORDS; i++)
> +			data[i] = readl_relaxed(ale->params.ale_regs +
> +						ALE_POLICER_PORT_OUI + 4 * i);
> +
> +		regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
> +		data[i++] = readl_relaxed(ale->params.ale_regs +
> +					ALE_THREAD_VAL);
> +		data += i * 4;

I'm confused by the '* 4' part. I think that you just need:
		data += i

to move to the next policer context. I *think* the current code causes
OoB?!?

/P


