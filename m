Return-Path: <linux-omap+bounces-2188-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48585976227
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 09:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1E6DB20A4B
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 07:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F0818BB8C;
	Thu, 12 Sep 2024 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qggXxvoF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD11B815;
	Thu, 12 Sep 2024 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124854; cv=none; b=mtQ+00dYDf6GhCGf/f+QfWuIY8lIBTJBfcxqmSqrYgjEhWz45IGph71ZmTd7pNnvNwwPBfsXaSFCtZPi+Gg7yEzoaMDis5t9DDgAJzFObVvi7i9/NUn9b9JHfJmx5u+creJdZso2vyzai9VGAL/PSkrmbBnPUtM1whBY5FB+x84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124854; c=relaxed/simple;
	bh=69y25PwAy51c7wIFJtcvKHnoF+GCBnoeurqhThhxInI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hvv8H2bqfbc6Qyf79Web0iuIZCuwgZXTOddzvDcvbL0/n2XqQY1iiTT/aMl0in0uOAyOXubKR+fcOawg5Un5LUb3J2ZjVYbQD8Hm8GIli3EbTh+J4DsXjJHq+KCAUMHCOwaa5fTX5cVKePfDCE5vLoiX5lUn6Mk0dBEKr45+NzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qggXxvoF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC0EC4CEC3;
	Thu, 12 Sep 2024 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726124853;
	bh=69y25PwAy51c7wIFJtcvKHnoF+GCBnoeurqhThhxInI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qggXxvoFp/XyOtIWam7cxt/EqVmJ4+epD2qJhrNRgyls5Z94czX7t2Njyx1u92Q3M
	 wY9XZ0jFFG7SVCczrXytNuw9L6vqpqhJL4G48UZuHq/5PTh91XwpHtHopgZS58wXfV
	 W9MVc2D+NWt0De6Ot2ae2efjMysTh6ujKb7zAQIavDRqWo44hcEBSHR/ZIYvUkHjm2
	 Jy9lN79uaDXZmbZb/ngerVNO9Uajn5ccbqjqns1b9fodQakLZJ8yXm1OSWgXAEqUUV
	 G4wZsAlMkQwhzxm9EHvLUlMbAtnFgbKBB6BCkgNlfAaOjOwcwb8d+dqatrnHAceHDG
	 VN12qDClSkYZQ==
Message-ID: <78b4ca2a-9448-4451-8e25-c57306af38e9@kernel.org>
Date: Thu, 12 Sep 2024 10:07:27 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: cpsw_ale: Remove unused
 accessor functions
To: Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: netdev@vger.kernel.org, linux-omap@vger.kernel.org, llvm@lists.linux.dev
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
 <20240910-ti-warn-v1-3-afd1e404abbe@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240910-ti-warn-v1-3-afd1e404abbe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Simon,

On 10/09/2024 10:17, Simon Horman wrote:
> W=1 builds flag that some accessor functions for ALE fields are unused.
> 
> Address this by splitting up the macros used to define these
> accessors to allow only those that are used to be declared.
> 
> The warnings are verbose, but for example, the mcast_state case is
> flagged by clang-18 as:
> 
> .../cpsw_ale.c:220:1: warning: unused function 'cpsw_ale_get_mcast_state' [-Wunused-function]
>   220 | DEFINE_ALE_FIELD(mcast_state,           62,     2)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> .../cpsw_ale.c:145:19: note: expanded from macro 'DEFINE_ALE_FIELD'
>   145 | static inline int cpsw_ale_get_##name(u32 *ale_entry)                   \
>       |                   ^~~~~~~~~~~~~~~~~~~
> <scratch space>:196:1: note: expanded from here
>   196 | cpsw_ale_get_mcast_state
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Compile tested only.
> No functional change intended.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/ti/cpsw_ale.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index 64bf22cd860c..d37b4ddd6787 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -141,27 +141,39 @@ static inline void cpsw_ale_set_field(u32 *ale_entry, u32 start, u32 bits,
>  	ale_entry[idx] |=  (value << start);
>  }
>  
> -#define DEFINE_ALE_FIELD(name, start, bits)				\
> +#define DEFINE_ALE_FIELD_GET(name, start, bits)				\
>  static inline int cpsw_ale_get_##name(u32 *ale_entry)			\
>  {									\
>  	return cpsw_ale_get_field(ale_entry, start, bits);		\
> -}									\
> +}
> +
> +#define DEFINE_ALE_FIELD_SET(name, start, bits)				\
>  static inline void cpsw_ale_set_##name(u32 *ale_entry, u32 value)	\
>  {									\
>  	cpsw_ale_set_field(ale_entry, start, bits, value);		\
>  }
>  
> -#define DEFINE_ALE_FIELD1(name, start)					\
> +#define DEFINE_ALE_FIELD(name, start, bits)				\
> +DEFINE_ALE_FIELD_GET(name, start, bits)					\
> +DEFINE_ALE_FIELD_SET(name, start, bits)
> +
> +#define DEFINE_ALE_FIELD1_GET(name, start)				\
>  static inline int cpsw_ale_get_##name(u32 *ale_entry, u32 bits)		\
>  {									\
>  	return cpsw_ale_get_field(ale_entry, start, bits);		\
> -}									\
> +}
> +
> +#define DEFINE_ALE_FIELD1_SET(name, start)				\
>  static inline void cpsw_ale_set_##name(u32 *ale_entry, u32 value,	\
>  		u32 bits)						\
>  {									\
>  	cpsw_ale_set_field(ale_entry, start, bits, value);		\
>  }
>  
> +#define DEFINE_ALE_FIELD1(name, start)					\
> +DEFINE_ALE_FIELD1_GET(name, start)					\
> +DEFINE_ALE_FIELD1_SET(name, start)
> +
>  enum {
>  	ALE_ENT_VID_MEMBER_LIST = 0,
>  	ALE_ENT_VID_UNREG_MCAST_MSK,
> @@ -217,14 +229,14 @@ static const struct ale_entry_fld vlan_entry_k3_cpswxg[] = {
>  
>  DEFINE_ALE_FIELD(entry_type,		60,	2)
>  DEFINE_ALE_FIELD(vlan_id,		48,	12)
> -DEFINE_ALE_FIELD(mcast_state,		62,	2)
> +DEFINE_ALE_FIELD_SET(mcast_state,	62,	2)

I don't understand why we need separate macros for GET and SET.
The original intent was to use one macro for both.

Otherwise we will have to add DEFINE_ALE_FIELD/1_SET to all the fields.

>  DEFINE_ALE_FIELD1(port_mask,		66)
>  DEFINE_ALE_FIELD(super,			65,	1)
>  DEFINE_ALE_FIELD(ucast_type,		62,     2)
> -DEFINE_ALE_FIELD1(port_num,		66)
> -DEFINE_ALE_FIELD(blocked,		65,     1)
> -DEFINE_ALE_FIELD(secure,		64,     1)
> -DEFINE_ALE_FIELD(mcast,			40,	1)
> +DEFINE_ALE_FIELD1_SET(port_num,		66)
> +DEFINE_ALE_FIELD_SET(blocked,		65,     1)
> +DEFINE_ALE_FIELD_SET(secure,		64,     1)
> +DEFINE_ALE_FIELD_GET(mcast,		40,	1)
>  
>  #define NU_VLAN_UNREG_MCAST_IDX	1
>  
> 

-- 
cheers,
-roger

