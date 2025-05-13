Return-Path: <linux-omap+bounces-3698-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33EAB53BE
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 13:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FD0719E3DB0
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 11:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB8128D8C2;
	Tue, 13 May 2025 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InxzWI8a"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07F28D840;
	Tue, 13 May 2025 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135409; cv=none; b=M27/dZE58h/ToWkUSsbbQf5QYc4KK5UlWvrnK/V9zPfEvx5OQBqVvAQ4g9Fc2a/hjNj/McJS+/WLaExpuwi2zhp81w9QK/FNZL1xb1PZMAdjdKOcNWvSlMvrbuHgABa8M9QWS1XRw5Ua/6ha2egL+SnJ4j29D8+3sOH60Xdbh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135409; c=relaxed/simple;
	bh=t9jS1x/YvXLsXUVlOHRpXEQ1NUosivINnVeq2109bOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoQ0KsTXBOLMrtIl/Ogvh3BQHZSQHIG0mL55MiZtPKim2/I03Re83v3246Q4GAzomTu3ElKFekKKgpOV/WlQAIsUDNEXD3kpxyoNXT3+KVNkpq3z2d2hiFdNhHJtcq+r0nHu7c6d/tPYDJTLFObvduj1gepoDmmN5O6e0vpRHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InxzWI8a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71B2C4CEE4;
	Tue, 13 May 2025 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747135408;
	bh=t9jS1x/YvXLsXUVlOHRpXEQ1NUosivINnVeq2109bOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=InxzWI8a/l+p9XCiwXBwCVJzeVa9Lr+PlapJNCbDQomFGXunqynh2SeoCFm7e9PHQ
	 bXyIiyQglFyjtrYfUp8X8v0ZNrFUAtZywLKxGUxB9ewoNf6eYCU2VKv0vLSn6ja4y9
	 acZnfAGOwoh/by+ToBDD/iZ83ogsYWA1jDZvixR6R8gWn/npoHlGy0W07UI9oIPC5q
	 u9/s1pBTjlxiWyen3oFmg6ztBfCi4pCK+prpxbiPpMLvcjc4Ny1sMBC74CFiHNNkvo
	 YerZvr8Ik3dWbLbP+xGS46uxMJixhEl6oDbjk32QCP3HDHF1qnpocSrcR9Dwbeo8Yw
	 5fVi/Sgn6Y7nQ==
Message-ID: <5ec638ab-e61f-4fe7-b7bc-14c03a0de359@kernel.org>
Date: Tue, 13 May 2025 14:23:23 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 7/9] net: ethernet: ti: cpsw_ale: add policer
 save restore for PM sleep
To: Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
 <20250505-am65-cpsw-rx-class-v2-7-5359ea025144@kernel.org>
 <23278f6d-f111-46f7-a844-2cd7fbf8b623@redhat.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <23278f6d-f111-46f7-a844-2cd7fbf8b623@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/05/2025 16:49, Paolo Abeni wrote:
> On 5/5/25 6:26 PM, Roger Quadros wrote:
>> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
>> index ce216606d915..4e29702b86ea 100644
>> --- a/drivers/net/ethernet/ti/cpsw_ale.c
>> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
>> @@ -1823,3 +1823,45 @@ int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
>>  
>>  	return 0;
>>  }
>> +
>> +void cpsw_ale_policer_save(struct cpsw_ale *ale, u32 *data)
>> +{
>> +	int i, idx;
>> +
>> +	for (idx = 0; idx < ale->params.num_policers; idx++) {
>> +		cpsw_ale_policer_read_idx(ale, idx);
>> +
>> +		for (i = 0; i < CPSW_ALE_POLICER_ENTRY_WORDS; i++)
>> +			data[i] = readl_relaxed(ale->params.ale_regs +
>> +						ALE_POLICER_PORT_OUI + 4 * i);
>> +
>> +		regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
>> +		data[i++] = readl_relaxed(ale->params.ale_regs +
>> +					ALE_THREAD_VAL);
>> +		data += i * 4;
> 
> I'm confused by the '* 4' part. I think that you just need:
> 		data += i
> 
> to move to the next policer context. I *think* the current code causes
> OoB?!?

Good catch. Since data is u32 pointer we should not need '* 4'

> 
> /P
> 

-- 
cheers,
-roger


