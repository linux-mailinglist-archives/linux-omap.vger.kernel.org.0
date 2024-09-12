Return-Path: <linux-omap+bounces-2194-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C4E9767E5
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 13:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34B141C234EA
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 11:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354E1AB6DD;
	Thu, 12 Sep 2024 11:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/aOsJmn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CB1A3A96;
	Thu, 12 Sep 2024 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726140426; cv=none; b=nfQlXQ9gH5OFaBgo2+5ayqJIurBjzhyK4loHKzbE0fxIFeP+Q/IZB4c3uCYRJ0yzHEmQZnB+VAJRGE9puTRH/64ZQwgpVEauhwiUOUEXETYiMpdCB1iV8iPpp5CtISDw1m+Q6nNRJUjB0WE7iO2IS5dM+3ie9whNqKD9EI4TYB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726140426; c=relaxed/simple;
	bh=DxB0YhCPzaPYBjQ9+N/1u7xN+x8IRRQdqUxm0evMBYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUuMAdOxgWctHiOCGLFC3cG9QbxG0wImr1e/EW26RmInRjrk/vZnDiDBqOUzYOz5/RdmjO1bUUJ6XXXMoQTm14cEpuy7BWzAlclxWhtqbpt2FIHGnfwQjKe1fJvCQcAlRimbuJ5iez8iSHQryXU6c2FaqSDeSQFBq8PVZP+qgcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/aOsJmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D977C4CEC3;
	Thu, 12 Sep 2024 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726140425;
	bh=DxB0YhCPzaPYBjQ9+N/1u7xN+x8IRRQdqUxm0evMBYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/aOsJmnj2Bx64Zta36HlSZAgYOHdmte+dVZz4gI8eTIJTpkCSL9xXCW1Z2WiBrB5
	 u9hcjhYkJklF0KFaEQtG9lOFYF+mVUKS5d3uqOnaF9THczGdqmDcdLvaKpor/HNLT4
	 WDi65//nt90DhqVNPDbmEVKiKxKBHLDC4Tw6HX5iXWP06pFSNZBa5erqiHl01tDNpA
	 FTvi3scVb1g8S2wCX9scBMQJogrcWAJtuqlGijcCCqv4kz5FfXEt4PiHWXB63hTA/L
	 orhbqyHYdjXn9Csn4Sb5raTmLFs+Kh/ncIkdnhf6t+dDHq+RN14UypM+b5rk7v0aY3
	 ruexj/MPkBYpQ==
Date: Thu, 12 Sep 2024 12:27:00 +0100
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
Message-ID: <20240912112700.GK572255@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
 <20240910-ti-warn-v1-3-afd1e404abbe@kernel.org>
 <78b4ca2a-9448-4451-8e25-c57306af38e9@kernel.org>
 <20240912085929.GF572255@kernel.org>
 <97c7665c-d05f-4363-94c6-9ce89921096a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97c7665c-d05f-4363-94c6-9ce89921096a@kernel.org>

On Thu, Sep 12, 2024 at 01:54:45PM +0300, Roger Quadros wrote:
> 
> 
> On 12/09/2024 11:59, Simon Horman wrote:
> > On Thu, Sep 12, 2024 at 10:07:27AM +0300, Roger Quadros wrote:
> >> Hi Simon,
> >>
> >> On 10/09/2024 10:17, Simon Horman wrote:

...

> >>>  	ALE_ENT_VID_MEMBER_LIST = 0,
> >>>  	ALE_ENT_VID_UNREG_MCAST_MSK,
> >>> @@ -217,14 +229,14 @@ static const struct ale_entry_fld vlan_entry_k3_cpswxg[] = {
> >>>  
> >>>  DEFINE_ALE_FIELD(entry_type,		60,	2)
> >>>  DEFINE_ALE_FIELD(vlan_id,		48,	12)
> >>> -DEFINE_ALE_FIELD(mcast_state,		62,	2)
> >>> +DEFINE_ALE_FIELD_SET(mcast_state,	62,	2)
> >>
> >> I don't understand why we need separate macros for GET and SET.
> >> The original intent was to use one macro for both.
> >>
> >> Otherwise we will have to add DEFINE_ALE_FIELD/1_SET to all the fields.
> > 
> > Hi Roger,
> > 
> > Sorry for not being clearer.
> > 
> > My intent was to avoid declaring functions that are never used.
> > Perhaps it is best explained by some examples.
> > 
> > In the case of mcast_state, the compiler flags that the get accessor is
> > never used. The intent is of this patch addresses that by declaring the set
> > accessor for mcast_state. Likewise for other similar cases.
> > 
> > OTOH, in the case of, f.e. vlan_id, the set and get accessor functions are
> > both used, and DEFINE_ALE_FIELD continues to be used to define them both.
> > DEFINE_ALE_FIELD is implemented as the combination of _SET and _GET.
> > 
> 
> Thanks for the explanation Simon. I understand now.
> 
> Would using __maybe_unused__ be preferable to get rid of the warnings?
> That way we don't need to care if both set/get helpers are used or not
> and don't have to touch the below code ever again except to add new fields.

Thanks Roger,

IMHO, it is nicer to not declare them at all.  But I do get your point and
I'm happy to try that approach if you prefer it.

...

