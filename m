Return-Path: <linux-omap+bounces-2191-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B2976516
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 10:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 845FC1F24532
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 08:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE909193403;
	Thu, 12 Sep 2024 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/CtgxfV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E98126C16;
	Thu, 12 Sep 2024 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726131575; cv=none; b=nXRqrObqn3RFQiC0xhokiyiBKTzJq6MMAJCtYXxQw1BO7oNFYQD72xPiZaL+g4rUtd6EtHYdId5NenDS52pNmFG6TG+tLLBhEhOPrW37hu5xOyCxbmv2m0surrzIjQag37s0G7BOH/9VL0iw0LjTNLsFGFGWkzvwC0naZWhOEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726131575; c=relaxed/simple;
	bh=5wbXtFl13LS4fzM8TQZTImPk5C3pfWEpGNTii/WzCkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTYV2BdFB5jHXRa5TbmNSxFfpPl+VV8K/CnRi/L2p1QxLAWLC+VBVS7llJoCjw2KxarLaW5hp2Drb9dOL8xUZCeQZ7bi+JMhOEJNJyV8ab3ccFDM18v3ANDQOXuXqnNoLymqMRGytkN96janlb6add8VhLyi9iTraLVlnTLnJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/CtgxfV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2F1C4CEC3;
	Thu, 12 Sep 2024 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726131574;
	bh=5wbXtFl13LS4fzM8TQZTImPk5C3pfWEpGNTii/WzCkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/CtgxfVU2D/w1RmOoTi0eip/rfA0KuoA1S0sRFkVN1djn/ltmt83JWAcaOjPqvEE
	 DoarBNsXKxN9kxThfFfiXlmSxvYS45uGksKK8eOHmxj4hbxTYykOXOgb+ZDpG2VJLS
	 kDJNIJahyLaxaaNGexEJ9Sc0Uy42++Em46W4nNJZcUDrN2ec/ZUWK3ia9BpVqxbq9v
	 FS/9J10o3mB0LSojf16TCO0+vpXKqW3E3J4R1Evp2LVqIYTHGabL40f5fKec+AaJ7W
	 yBr/VSy59BU4sb/SkCoNscNGF70YvNIsj/qnFwBUQqBRaJ/5cYa7LjmIRig7/0XscB
	 xK4UDMDyWgPaw==
Date: Thu, 12 Sep 2024 09:59:29 +0100
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: cpsw_ale: Remove unused
 accessor functions
Message-ID: <20240912085929.GF572255@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
 <20240910-ti-warn-v1-3-afd1e404abbe@kernel.org>
 <78b4ca2a-9448-4451-8e25-c57306af38e9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78b4ca2a-9448-4451-8e25-c57306af38e9@kernel.org>

On Thu, Sep 12, 2024 at 10:07:27AM +0300, Roger Quadros wrote:
> Hi Simon,
> 
> On 10/09/2024 10:17, Simon Horman wrote:
> > W=1 builds flag that some accessor functions for ALE fields are unused.
> > 
> > Address this by splitting up the macros used to define these
> > accessors to allow only those that are used to be declared.
> > 
> > The warnings are verbose, but for example, the mcast_state case is
> > flagged by clang-18 as:
> > 
> > .../cpsw_ale.c:220:1: warning: unused function 'cpsw_ale_get_mcast_state' [-Wunused-function]
> >   220 | DEFINE_ALE_FIELD(mcast_state,           62,     2)
> >       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > .../cpsw_ale.c:145:19: note: expanded from macro 'DEFINE_ALE_FIELD'
> >   145 | static inline int cpsw_ale_get_##name(u32 *ale_entry)                   \
> >       |                   ^~~~~~~~~~~~~~~~~~~
> > <scratch space>:196:1: note: expanded from here
> >   196 | cpsw_ale_get_mcast_state
> >       | ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Compile tested only.
> > No functional change intended.
> > 
> > Signed-off-by: Simon Horman <horms@kernel.org>
> > ---
> >  drivers/net/ethernet/ti/cpsw_ale.c | 30 +++++++++++++++++++++---------
> >  1 file changed, 21 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> > index 64bf22cd860c..d37b4ddd6787 100644
> > --- a/drivers/net/ethernet/ti/cpsw_ale.c
> > +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> > @@ -141,27 +141,39 @@ static inline void cpsw_ale_set_field(u32 *ale_entry, u32 start, u32 bits,
> >  	ale_entry[idx] |=  (value << start);
> >  }
> >  
> > -#define DEFINE_ALE_FIELD(name, start, bits)				\
> > +#define DEFINE_ALE_FIELD_GET(name, start, bits)				\
> >  static inline int cpsw_ale_get_##name(u32 *ale_entry)			\
> >  {									\
> >  	return cpsw_ale_get_field(ale_entry, start, bits);		\
> > -}									\
> > +}
> > +
> > +#define DEFINE_ALE_FIELD_SET(name, start, bits)				\
> >  static inline void cpsw_ale_set_##name(u32 *ale_entry, u32 value)	\
> >  {									\
> >  	cpsw_ale_set_field(ale_entry, start, bits, value);		\
> >  }
> >  
> > -#define DEFINE_ALE_FIELD1(name, start)					\
> > +#define DEFINE_ALE_FIELD(name, start, bits)				\
> > +DEFINE_ALE_FIELD_GET(name, start, bits)					\
> > +DEFINE_ALE_FIELD_SET(name, start, bits)
> > +
> > +#define DEFINE_ALE_FIELD1_GET(name, start)				\
> >  static inline int cpsw_ale_get_##name(u32 *ale_entry, u32 bits)		\
> >  {									\
> >  	return cpsw_ale_get_field(ale_entry, start, bits);		\
> > -}									\
> > +}
> > +
> > +#define DEFINE_ALE_FIELD1_SET(name, start)				\
> >  static inline void cpsw_ale_set_##name(u32 *ale_entry, u32 value,	\
> >  		u32 bits)						\
> >  {									\
> >  	cpsw_ale_set_field(ale_entry, start, bits, value);		\
> >  }
> >  
> > +#define DEFINE_ALE_FIELD1(name, start)					\
> > +DEFINE_ALE_FIELD1_GET(name, start)					\
> > +DEFINE_ALE_FIELD1_SET(name, start)
> > +
> >  enum {
> >  	ALE_ENT_VID_MEMBER_LIST = 0,
> >  	ALE_ENT_VID_UNREG_MCAST_MSK,
> > @@ -217,14 +229,14 @@ static const struct ale_entry_fld vlan_entry_k3_cpswxg[] = {
> >  
> >  DEFINE_ALE_FIELD(entry_type,		60,	2)
> >  DEFINE_ALE_FIELD(vlan_id,		48,	12)
> > -DEFINE_ALE_FIELD(mcast_state,		62,	2)
> > +DEFINE_ALE_FIELD_SET(mcast_state,	62,	2)
> 
> I don't understand why we need separate macros for GET and SET.
> The original intent was to use one macro for both.
> 
> Otherwise we will have to add DEFINE_ALE_FIELD/1_SET to all the fields.

Hi Roger,

Sorry for not being clearer.

My intent was to avoid declaring functions that are never used.
Perhaps it is best explained by some examples.

In the case of mcast_state, the compiler flags that the get accessor is
never used. The intent is of this patch addresses that by declaring the set
accessor for mcast_state. Likewise for other similar cases.

OTOH, in the case of, f.e. vlan_id, the set and get accessor functions are
both used, and DEFINE_ALE_FIELD continues to be used to define them both.
DEFINE_ALE_FIELD is implemented as the combination of _SET and _GET.

> 
> >  DEFINE_ALE_FIELD1(port_mask,		66)
> >  DEFINE_ALE_FIELD(super,			65,	1)
> >  DEFINE_ALE_FIELD(ucast_type,		62,     2)
> > -DEFINE_ALE_FIELD1(port_num,		66)
> > -DEFINE_ALE_FIELD(blocked,		65,     1)
> > -DEFINE_ALE_FIELD(secure,		64,     1)
> > -DEFINE_ALE_FIELD(mcast,			40,	1)
> > +DEFINE_ALE_FIELD1_SET(port_num,		66)
> > +DEFINE_ALE_FIELD_SET(blocked,		65,     1)
> > +DEFINE_ALE_FIELD_SET(secure,		64,     1)
> > +DEFINE_ALE_FIELD_GET(mcast,		40,	1)
> >  
> >  #define NU_VLAN_UNREG_MCAST_IDX	1
> >  
> > 
> 
> -- 
> cheers,
> -roger
> 

