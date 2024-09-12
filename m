Return-Path: <linux-omap+bounces-2195-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485E976A95
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 15:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E0CF281B40
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 13:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9541ACDF9;
	Thu, 12 Sep 2024 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fogam7TV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ACD1A0BD0;
	Thu, 12 Sep 2024 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726147775; cv=none; b=KgOsYMAswGmXH+V2M/5/zpYmgriuhPRm/JFnCRh+7bt6ESlGkVcb0rLEBN0JCd4kummHQlVTwZVp9Qsjc8jot7ZDs9ZHdC5ohBtH+0MzTcNTJdVRV9+OAopinXAbQFair8uC6o4RRqMDQoAVqJMEJeQnLjGR8301uGuNzXX3RWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726147775; c=relaxed/simple;
	bh=cDR842oWCxDc+RlGVodDRKRscX8dR9N/N15PRmbdwMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=te6aPth+TXz7OLq4YBTsV/T9OTmU9KENnzO9g9GbJrkcRneT2sMzXbPj033dSjdTLsV9Wluf/yhmlPvEaMJ7hMeHt0+j6iAIKFlfBFIGp2CT8MuoRjsygxRZTrlov+q6p6fqjSpq70C4y46ioNfAauBbEh1TSixBhTH+sXyD75A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fogam7TV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8AEC4CEC3;
	Thu, 12 Sep 2024 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726147775;
	bh=cDR842oWCxDc+RlGVodDRKRscX8dR9N/N15PRmbdwMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fogam7TVDWvBHPKQUS7C5sx3DDmHl1szs5RP6yUe0XoYmtkf205JODwMmgmtj7sCB
	 weokamqV8wmqJoI6gXZtPR6oB7yE2CI0L4bREI+R9R3XHH6HQy7hhxTRTVr/Jymr9b
	 KTxULy1FrWQtcjUzIQ2Aub1KZH8deDZhffly0YutdkYiw8ueenVkPz8vXeMmFSAwdC
	 cBxQkzcduhLmcP4R4emSBuLp6hq77Lr9E/QXQKcyQioadisYzCsIlBbjKHC00kru+o
	 hgQkWwJtJ+WUE68/UcU2vy9IkhPJg6FZ1Fy/TAPf9PVWQLJrLXNIMzSgCf/tba0uq0
	 HHUgjVZNklSyg==
Message-ID: <88515afd-6c5a-4245-bcff-d3340e94aa26@kernel.org>
Date: Thu, 12 Sep 2024 16:29:29 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: cpsw_ale: Remove unused
 accessor functions
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org, llvm@lists.linux.dev
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
 <20240910-ti-warn-v1-3-afd1e404abbe@kernel.org>
 <78b4ca2a-9448-4451-8e25-c57306af38e9@kernel.org>
 <20240912085929.GF572255@kernel.org>
 <97c7665c-d05f-4363-94c6-9ce89921096a@kernel.org>
 <20240912112700.GK572255@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240912112700.GK572255@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/09/2024 14:27, Simon Horman wrote:
> On Thu, Sep 12, 2024 at 01:54:45PM +0300, Roger Quadros wrote:
>>
>>
>> On 12/09/2024 11:59, Simon Horman wrote:
>>> On Thu, Sep 12, 2024 at 10:07:27AM +0300, Roger Quadros wrote:
>>>> Hi Simon,
>>>>
>>>> On 10/09/2024 10:17, Simon Horman wrote:
> 
> ...
> 
>>>>>  	ALE_ENT_VID_MEMBER_LIST = 0,
>>>>>  	ALE_ENT_VID_UNREG_MCAST_MSK,
>>>>> @@ -217,14 +229,14 @@ static const struct ale_entry_fld vlan_entry_k3_cpswxg[] = {
>>>>>  
>>>>>  DEFINE_ALE_FIELD(entry_type,		60,	2)
>>>>>  DEFINE_ALE_FIELD(vlan_id,		48,	12)
>>>>> -DEFINE_ALE_FIELD(mcast_state,		62,	2)
>>>>> +DEFINE_ALE_FIELD_SET(mcast_state,	62,	2)
>>>>
>>>> I don't understand why we need separate macros for GET and SET.
>>>> The original intent was to use one macro for both.
>>>>
>>>> Otherwise we will have to add DEFINE_ALE_FIELD/1_SET to all the fields.
>>>
>>> Hi Roger,
>>>
>>> Sorry for not being clearer.
>>>
>>> My intent was to avoid declaring functions that are never used.
>>> Perhaps it is best explained by some examples.
>>>
>>> In the case of mcast_state, the compiler flags that the get accessor is
>>> never used. The intent is of this patch addresses that by declaring the set
>>> accessor for mcast_state. Likewise for other similar cases.
>>>
>>> OTOH, in the case of, f.e. vlan_id, the set and get accessor functions are
>>> both used, and DEFINE_ALE_FIELD continues to be used to define them both.
>>> DEFINE_ALE_FIELD is implemented as the combination of _SET and _GET.
>>>
>>
>> Thanks for the explanation Simon. I understand now.
>>
>> Would using __maybe_unused__ be preferable to get rid of the warnings?
>> That way we don't need to care if both set/get helpers are used or not
>> and don't have to touch the below code ever again except to add new fields.
> 
> Thanks Roger,
> 
> IMHO, it is nicer to not declare them at all.  But I do get your point and
> I'm happy to try that approach if you prefer it.
> 
> ...

Simon,

I don't have any preference. I'll leave it to you to decide on your next spin. Thanks.

-- 
cheers,
-roger

