Return-Path: <linux-omap+bounces-2193-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24497670B
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 12:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA206285C1D
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 10:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E96019F430;
	Thu, 12 Sep 2024 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dyq2Uler"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD8218DF92;
	Thu, 12 Sep 2024 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726138492; cv=none; b=hednN5Kvm+FcB4aVpJVO8xwPUtaqyK56PsbDUUAamkKTCeqMrrGKGWy/9fg7CLDJsrZBIj44Wg5v35qSAoaRBkSk3YIvstkHtOfkoiJGpbNIM36E4yW4dtyd4zlaPgElvP182jq7nV/twzjtV0j9r5h3Besoa+275Wkihf6UdgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726138492; c=relaxed/simple;
	bh=pWPGrAnMxY2LcfZ6t8ajMLvCDzI8PQPI4Eji5RnI56c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjtyL6GCQ6Ls3TQVUlpV+lqTuSMM92B39fMmQhdaB7GIDY746kLTRpiNNPqy08N8h2w0lAQvIUBoPjwauWRrAz0W1QoZvPDWztetHHyF6VH9Ss82UoSmQXlLmo3GHoqIWp6sdUHCVBRdXGKodKZS2qBH2xoab+pQRW9dGTJqJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dyq2Uler; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C03C4CEC3;
	Thu, 12 Sep 2024 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726138491;
	bh=pWPGrAnMxY2LcfZ6t8ajMLvCDzI8PQPI4Eji5RnI56c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dyq2Uler3kIar0Gk76Eytq5X8QR+p2OIC8YGF1IuU9Uy8vIC3Gvbw3/0WudHfmj39
	 qZ07H6wuEsoLOQEVflSlCMQ1D84tcCn4tOvRVuY83HZKiHInqhy6i12wANPp2s5m0g
	 HQE+I0mmvb1rui3kM5zAUi5tHwGcOFW73IhW7u0Vn+Qp3DmDprmsoVXkAiWwx/ZguC
	 QjSWqfB9FPeIArnyD2mFs/Ek16TGXHP0aL9ZeYbRV/otBesc7npaAcwjuEfwPV+IQb
	 Noial7WLBXZCe2/W6snqZAMMrUI3Hr7HN1Eo6aqtJ2l8W7n6TjrXDkwLLLZEFw3UM8
	 StiBQPb+w5gmQ==
Message-ID: <97c7665c-d05f-4363-94c6-9ce89921096a@kernel.org>
Date: Thu, 12 Sep 2024 13:54:45 +0300
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
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240912085929.GF572255@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/09/2024 11:59, Simon Horman wrote:
> On Thu, Sep 12, 2024 at 10:07:27AM +0300, Roger Quadros wrote:
>> Hi Simon,
>>
>> On 10/09/2024 10:17, Simon Horman wrote:
>>> W=1 builds flag that some accessor functions for ALE fields are unused.
>>>
>>> Address this by splitting up the macros used to define these
>>> accessors to allow only those that are used to be declared.
>>>
>>> The warnings are verbose, but for example, the mcast_state case is
>>> flagged by clang-18 as:
>>>
>>> .../cpsw_ale.c:220:1: warning: unused function 'cpsw_ale_get_mcast_state' [-Wunused-function]
>>>   220 | DEFINE_ALE_FIELD(mcast_state,           62,     2)
>>>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> .../cpsw_ale.c:145:19: note: expanded from macro 'DEFINE_ALE_FIELD'
>>>   145 | static inline int cpsw_ale_get_##name(u32 *ale_entry)                   \
>>>       |                   ^~~~~~~~~~~~~~~~~~~
>>> <scratch space>:196:1: note: expanded from here
>>>   196 | cpsw_ale_get_mcast_state
>>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Compile tested only.
>>> No functional change intended.
>>>
>>> Signed-off-by: Simon Horman <horms@kernel.org>
>>> ---
>>>  drivers/net/ethernet/ti/cpsw_ale.c | 30 +++++++++++++++++++++---------
>>>  1 file changed, 21 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
>>> index 64bf22cd860c..d37b4ddd6787 100644
>>> --- a/drivers/net/ethernet/ti/cpsw_ale.c
>>> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
>>> @@ -141,27 +141,39 @@ static inline void cpsw_ale_set_field(u32 *ale_entry, u32 start, u32 bits,
>>>  	ale_entry[idx] |=  (value << start);
>>>  }
>>>  
>>> -#define DEFINE_ALE_FIELD(name, start, bits)				\
>>> +#define DEFINE_ALE_FIELD_GET(name, start, bits)				\
>>>  static inline int cpsw_ale_get_##name(u32 *ale_entry)			\
>>>  {									\
>>>  	return cpsw_ale_get_field(ale_entry, start, bits);		\
>>> -}									\
>>> +}
>>> +
>>> +#define DEFINE_ALE_FIELD_SET(name, start, bits)				\
>>>  static inline void cpsw_ale_set_##name(u32 *ale_entry, u32 value)	\
>>>  {									\
>>>  	cpsw_ale_set_field(ale_entry, start, bits, value);		\
>>>  }
>>>  
>>> -#define DEFINE_ALE_FIELD1(name, start)					\
>>> +#define DEFINE_ALE_FIELD(name, start, bits)				\
>>> +DEFINE_ALE_FIELD_GET(name, start, bits)					\
>>> +DEFINE_ALE_FIELD_SET(name, start, bits)
>>> +
>>> +#define DEFINE_ALE_FIELD1_GET(name, start)				\
>>>  static inline int cpsw_ale_get_##name(u32 *ale_entry, u32 bits)		\
>>>  {									\
>>>  	return cpsw_ale_get_field(ale_entry, start, bits);		\
>>> -}									\
>>> +}
>>> +
>>> +#define DEFINE_ALE_FIELD1_SET(name, start)				\
>>>  static inline void cpsw_ale_set_##name(u32 *ale_entry, u32 value,	\
>>>  		u32 bits)						\
>>>  {									\
>>>  	cpsw_ale_set_field(ale_entry, start, bits, value);		\
>>>  }
>>>  
>>> +#define DEFINE_ALE_FIELD1(name, start)					\
>>> +DEFINE_ALE_FIELD1_GET(name, start)					\
>>> +DEFINE_ALE_FIELD1_SET(name, start)
>>> +
>>>  enum {
>>>  	ALE_ENT_VID_MEMBER_LIST = 0,
>>>  	ALE_ENT_VID_UNREG_MCAST_MSK,
>>> @@ -217,14 +229,14 @@ static const struct ale_entry_fld vlan_entry_k3_cpswxg[] = {
>>>  
>>>  DEFINE_ALE_FIELD(entry_type,		60,	2)
>>>  DEFINE_ALE_FIELD(vlan_id,		48,	12)
>>> -DEFINE_ALE_FIELD(mcast_state,		62,	2)
>>> +DEFINE_ALE_FIELD_SET(mcast_state,	62,	2)
>>
>> I don't understand why we need separate macros for GET and SET.
>> The original intent was to use one macro for both.
>>
>> Otherwise we will have to add DEFINE_ALE_FIELD/1_SET to all the fields.
> 
> Hi Roger,
> 
> Sorry for not being clearer.
> 
> My intent was to avoid declaring functions that are never used.
> Perhaps it is best explained by some examples.
> 
> In the case of mcast_state, the compiler flags that the get accessor is
> never used. The intent is of this patch addresses that by declaring the set
> accessor for mcast_state. Likewise for other similar cases.
> 
> OTOH, in the case of, f.e. vlan_id, the set and get accessor functions are
> both used, and DEFINE_ALE_FIELD continues to be used to define them both.
> DEFINE_ALE_FIELD is implemented as the combination of _SET and _GET.
> 

Thanks for the explanation Simon. I understand now.

Would using __maybe_unused__ be preferable to get rid of the warnings?
That way we don't need to care if both set/get helpers are used or not
and don't have to touch the below code ever again except to add new fields.

>>
>>>  DEFINE_ALE_FIELD1(port_mask,		66)
>>>  DEFINE_ALE_FIELD(super,			65,	1)
>>>  DEFINE_ALE_FIELD(ucast_type,		62,     2)
>>> -DEFINE_ALE_FIELD1(port_num,		66)
>>> -DEFINE_ALE_FIELD(blocked,		65,     1)
>>> -DEFINE_ALE_FIELD(secure,		64,     1)
>>> -DEFINE_ALE_FIELD(mcast,			40,	1)
>>> +DEFINE_ALE_FIELD1_SET(port_num,		66)
>>> +DEFINE_ALE_FIELD_SET(blocked,		65,     1)
>>> +DEFINE_ALE_FIELD_SET(secure,		64,     1)
>>> +DEFINE_ALE_FIELD_GET(mcast,		40,	1)
>>>  
>>>  #define NU_VLAN_UNREG_MCAST_IDX	1
>>>  
>>>
>>

-- 
cheers,
-roger

