Return-Path: <linux-omap+bounces-2196-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B1D976E0A
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 17:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 207511C22A9C
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 15:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D712F1B9B33;
	Thu, 12 Sep 2024 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eibCqRXI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702EF126BE2;
	Thu, 12 Sep 2024 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726155786; cv=none; b=SB9ugC2mdnhmKmZNz0sCAG5uII9F5ASxrBoIK8/Utfzo/GpzggLxoUNL/v/be+jk2HuJTdGkYm+wKKkrwxAhxZ0/CBsNffjy13Htcno3zH/5aK7kigfwc8SIclbJ7l7kyVe+n0Eoh4pNLAOgg6fUsWgkuaURuO91NhpKJxj4keA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726155786; c=relaxed/simple;
	bh=DJlTnMXTzSPE1wESPOeCcZKNceRrE6lAZaXs++xgXE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/vmG7iyK1z8eaAoVGxYEWXMDAEOUHad7mgf9krfplkq13yWD//WYklIBl/WLETWRACVhvxYMtkhE0MKA7OpPFRce7xQnXRCha7uEIPLCxURQjYjYyqulR+kRXeHAHp0qyH2jRe64LOS0jtIZUTI/92ZGcjUqwCWFBEgr7qiuAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eibCqRXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65650C4CEC5;
	Thu, 12 Sep 2024 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726155785;
	bh=DJlTnMXTzSPE1wESPOeCcZKNceRrE6lAZaXs++xgXE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eibCqRXIj9PPuDHUlmcBe4B2uO6JYtDsXRfiDXuSkEawhkI3mQIg82Q4wyEvN0dgf
	 9VMf6e2HNAtsFQqZMmTZ8jEVlUtZ3VudP55TT1LLWWSqRgQfGseasdXfKeSR6ZLX7J
	 0D8P5NBk/UQpPWn7yVtGt+fov9Lkix45dK065NbQTYJE004Og3cbBTYIKAzF4NDTEM
	 ICR7NSF8DDcJIvOxhMXXQNwnGVEWXUQL/fza5TOu9MPZ2Fa1TRmlZb0ilNJem8d4ju
	 e/aDbPQbdJ+1MPs2/EQMbVMAoIXMrMmNJWlt7ZDtLcPD48icq6oiosWmve/fOQX8rP
	 nySChV/vodEyQ==
Date: Thu, 12 Sep 2024 16:43:01 +0100
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
Message-ID: <20240912154301.GP572255@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
 <20240910-ti-warn-v1-3-afd1e404abbe@kernel.org>
 <78b4ca2a-9448-4451-8e25-c57306af38e9@kernel.org>
 <20240912085929.GF572255@kernel.org>
 <97c7665c-d05f-4363-94c6-9ce89921096a@kernel.org>
 <20240912112700.GK572255@kernel.org>
 <88515afd-6c5a-4245-bcff-d3340e94aa26@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88515afd-6c5a-4245-bcff-d3340e94aa26@kernel.org>

On Thu, Sep 12, 2024 at 04:29:29PM +0300, Roger Quadros wrote:
> 
> 
> On 12/09/2024 14:27, Simon Horman wrote:
> > On Thu, Sep 12, 2024 at 01:54:45PM +0300, Roger Quadros wrote:
> >>
> >>
> >> On 12/09/2024 11:59, Simon Horman wrote:
> >>> On Thu, Sep 12, 2024 at 10:07:27AM +0300, Roger Quadros wrote:
> >>>> Hi Simon,
> >>>>
> >>>> On 10/09/2024 10:17, Simon Horman wrote:
> > 
> > ...
> > 
> >>>>>  	ALE_ENT_VID_MEMBER_LIST = 0,
> >>>>>  	ALE_ENT_VID_UNREG_MCAST_MSK,
> >>>>> @@ -217,14 +229,14 @@ static const struct ale_entry_fld vlan_entry_k3_cpswxg[] = {
> >>>>>  
> >>>>>  DEFINE_ALE_FIELD(entry_type,		60,	2)
> >>>>>  DEFINE_ALE_FIELD(vlan_id,		48,	12)
> >>>>> -DEFINE_ALE_FIELD(mcast_state,		62,	2)
> >>>>> +DEFINE_ALE_FIELD_SET(mcast_state,	62,	2)
> >>>>
> >>>> I don't understand why we need separate macros for GET and SET.
> >>>> The original intent was to use one macro for both.
> >>>>
> >>>> Otherwise we will have to add DEFINE_ALE_FIELD/1_SET to all the fields.
> >>>
> >>> Hi Roger,
> >>>
> >>> Sorry for not being clearer.
> >>>
> >>> My intent was to avoid declaring functions that are never used.
> >>> Perhaps it is best explained by some examples.
> >>>
> >>> In the case of mcast_state, the compiler flags that the get accessor is
> >>> never used. The intent is of this patch addresses that by declaring the set
> >>> accessor for mcast_state. Likewise for other similar cases.
> >>>
> >>> OTOH, in the case of, f.e. vlan_id, the set and get accessor functions are
> >>> both used, and DEFINE_ALE_FIELD continues to be used to define them both.
> >>> DEFINE_ALE_FIELD is implemented as the combination of _SET and _GET.
> >>>
> >>
> >> Thanks for the explanation Simon. I understand now.
> >>
> >> Would using __maybe_unused__ be preferable to get rid of the warnings?
> >> That way we don't need to care if both set/get helpers are used or not
> >> and don't have to touch the below code ever again except to add new fields.
> > 
> > Thanks Roger,
> > 
> > IMHO, it is nicer to not declare them at all.  But I do get your point and
> > I'm happy to try that approach if you prefer it.
> > 
> > ...
> 
> Simon,
> 
> I don't have any preference. I'll leave it to you to decide on your next spin. Thanks.

Thanks, let me think about it.

I'll probably hold off on v2 until the next the development cycle as
the patch queue seems busy enough this week.

