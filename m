Return-Path: <linux-omap+bounces-1630-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9178491DBB2
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 11:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0F928156E
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931D9126F0A;
	Mon,  1 Jul 2024 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnlvbcmW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3328D2C859;
	Mon,  1 Jul 2024 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719827216; cv=none; b=d8lgisSHAlTz0OFqQSo6ZtpKAuuNtRffmHawYYft4B8TCduDIXA5di2CJ3goSpqzv0Ux52uPiR/oracWhAn/7fnNJRDzZZhjGx74DuVtYe7dcksuXBZ0TaSW7cW1w1g/+AFlKVRr9Uy+puIOaLsauXgRlrLyz43EcSgl0++6VUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719827216; c=relaxed/simple;
	bh=scilYPjhugue+IwrJ02oY8ugBMErZFNzUjkKC21E5ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHd4Hx98uHv0Nr9D8YyX3Kdvqcddic6H4F0Pb0+7nhvMfUYSTOzXHxOOJCa+6EtOYVx7F5z0qzh85VCDCXjKmCPaMl+iWMetJh6en7+zsAwheh5IOpjuZzKafpMFjHJWRvLkgyc2YyiYVhM0kqkHsKet60+oB57zmXBjp1ffNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnlvbcmW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDB6C116B1;
	Mon,  1 Jul 2024 09:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719827215;
	bh=scilYPjhugue+IwrJ02oY8ugBMErZFNzUjkKC21E5ok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mnlvbcmWWykaVA3I6Ag/PsXJ8GXEDQKvKJ42Z7gMCqJPGCQVZepyxwXZHsr/RsjV5
	 ZJT8AWPinQocyTk5v7m5VZGWplWIqFrYNbuW1MX7GOQdkd2NQ9zC5cfQPb4qoWxHxe
	 Xrqc7Op+meRUb7V/HmI4jUOwmtYI15kFNBV2+MvS4ApIXsJfsbjd11DQ7MkhXyd4ux
	 Quh88BlZh8qMs4DEsRFST+MzRQ5kQI67wFhf8t9Znd2pjv3DEcTKCGvTtN2fJ4AeC3
	 Y/XncOGqb5KwVr13rSx9Pi9kE6BQ8oDiqv/lX0kGurOfJHfaerHsc409RP0NflSfW1
	 KWK7T0o53d3MA==
Message-ID: <ab602b9d-dfdf-4d46-9d11-08801c5c52c8@kernel.org>
Date: Mon, 1 Jul 2024 12:46:49 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 5/7] net: ethernet: ti: cpsw_ale: add
 policer/classifier helpers
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Julien Panis <jpanis@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
 srk@ti.com, vigneshr@ti.com, danishanwar@ti.com, pekka Varis
 <p-varis@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-5-c399cb77db56@kernel.org>
 <20240701073550.GK17134@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240701073550.GK17134@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/07/2024 10:35, Simon Horman wrote:
> On Fri, Jun 28, 2024 at 03:01:54PM +0300, Roger Quadros wrote:
>> The Policer registers in the ALE register space are just shadow registers
>> and use an index field in the policer table control register to read/write
>> to the actual Polier registers.
>> Add helper functions to Read and Write to Policer registers.
>>
>> Also add a helper function to set the thread value to classifier/policer
>> mapping. Any packet that first matches the classifier will be sent to the
>> thread (flow) that is set in the classifer to thread mapping table.
> 
> nit: classifier
> 
>      Flagged by checkpatch.pl --codespell

will fix.

> 
>> If not set then it goes to the default flow.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/net/ethernet/ti/cpsw_ale.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
>> index 7bd0dc20f894..75a17184d34c 100644
>> --- a/drivers/net/ethernet/ti/cpsw_ale.c
>> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
>> @@ -1626,3 +1626,27 @@ u32 cpsw_ale_get_num_entries(struct cpsw_ale *ale)
>>  {
>>  	return ale ? ale->params.ale_entries : 0;
>>  }
>> +
>> +/* Reads the specified policer index into ALE POLICER registers */
>> +static void cpsw_ale_policer_read_idx(struct cpsw_ale *ale, u32 idx)
>> +{
>> +	idx &= ALE_POLICER_TBL_INDEX_MASK;
>> +	writel_relaxed(idx, ale->params.ale_regs + ALE_POLICER_TBL_CTL);
>> +}
>> +
>> +/* Writes the ALE POLICER registers into the specified policer index */
>> +static void cpsw_ale_policer_write_idx(struct cpsw_ale *ale, u32 idx)
>> +{
>> +	idx &= ALE_POLICER_TBL_INDEX_MASK;
>> +	idx |= ALE_POLICER_TBL_WRITE_ENABLE;
>> +	writel_relaxed(idx, ale->params.ale_regs + ALE_POLICER_TBL_CTL);
>> +}
>> +
>> +/* enables/disables the custom thread value for the specified policer index */
>> +static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
>> +					       u32 thread_id, bool enable)
>> +{
>> +	regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
>> +	regmap_field_write(ale->fields[ALE_THREAD_VALUE], thread_id);
>> +	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
>> +}
>>
> 
> I like that this patch-set is broken out into nice discrete patches,
> including this one. So I'm in two minds about the comment I'm about to
> make, but here goes.
> 
> As these helpers are unused this raises Warnings with W=1 builds on
> gcc-13 and clang-18, which is generally undesirable for networking patches.
> 
> I can think of a few options here;
> * Ignore the warnings
> * Squash this patch into the following one
> * Add some annotations, e.g. __maybe_unused or __always_unused.
>   Likely dropped in the next patch.
> 
> I think I lean towards the last option.
> But I won't push the point any further regardless.

Thanks for the suggestions. I do not like using any of the __unused flags.
So I'm leaning towards your second solution. Will fix this in next revision.

-- 
cheers,
-roger

