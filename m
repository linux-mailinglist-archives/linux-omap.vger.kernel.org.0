Return-Path: <linux-omap+bounces-2197-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFC0976E17
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 17:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBCFD1F2256A
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 15:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8851BAEFB;
	Thu, 12 Sep 2024 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8nvW0Jo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4BC1B78FC;
	Thu, 12 Sep 2024 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726155917; cv=none; b=PQ1LD7xD86Ms5t0o2wtMkuQpKPAiP7vs7TVxHksUp7hGUyfqgkF8RSxnsy8tDkfEh4bF9u3ycUD93iVkLLA7dCwRZKDhMZnToe92sozkUPbvAFCTCyXWvgK9aWGwDCJ9UgRUU6XXuoqSN3h0rsTFP/L8JHAa1xjx0WWkbL2y8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726155917; c=relaxed/simple;
	bh=NS8JcQAnHmj7lIkRFEDOyUMcCuohYZVlfFdgD8BBmLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxaQGFjjuEaaw5DZ48T/7xy+hDwSGtb300ZDUkdEKaTksbV1pmQ71Xqcip4Er/JWnKQPk60ZaPUf1+2w5KEQI7ohuy5DYtiSKhOxrNh1ITwLtU7O7cdQdjkvCeEFDSqIeO+GKHc1OO6kxoJBJ6aibqfC51UJfD4rQ7NPMO5MEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8nvW0Jo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AEEC4CEC4;
	Thu, 12 Sep 2024 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726155916;
	bh=NS8JcQAnHmj7lIkRFEDOyUMcCuohYZVlfFdgD8BBmLQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u8nvW0JoMurbtVVzn/NNbYXEiSYxdODS7Oke42BfIW0Ypr+o36tAPktSiAen2aswy
	 /GEOy8WmOstxS4OJzxdDqH2GiNApalePm9xgcFGdsitdT9okEbsOqLZgY1wleCKeMG
	 4pHhpgUNVmiUqNttc9h2rTN1oGlMegUanVZuW0UNzm8X2te/jdiT1UIiur0K3JHcJo
	 4F+4i8EuTvgk9T3PMMNGwFE+g0gCD0ykNbjMEc/jS7PHCkuuZGc75nFB4OqCqejRyw
	 PpiZjk35gd1Cjz2bvct82rOTaTHn6PDUHR94gs8bzpljiQwx8WEEJG4rPJ8PnhIBK2
	 5K5JAtOOXVwlw==
Date: Thu, 12 Sep 2024 08:45:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next 1/3] net: ethernet: ti: am65-cpsw: Address
 __percpu Sparse warnings
Message-ID: <20240912084515.5dcbb391@kernel.org>
In-Reply-To: <20240912095813.GG572255@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
	<20240910-ti-warn-v1-1-afd1e404abbe@kernel.org>
	<20240911170643.7ecb1bbb@kernel.org>
	<20240912095813.GG572255@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Sep 2024 10:58:13 +0100 Simon Horman wrote:
> Thanks for pointing that out, and sorry for not thinking of it myself.
> 
> Looking over the code, and taking a first pass at implementing this,
> I believe the answer is yes :)
> 
> I also think that, as a second step, by using dev_core_stats,
> the custom ndo_get_stats64() implementation can be removed.
> LMKWYT.

Second step or one conversion patch, no preference. But AFAICT you're
right, the ndo can be completely removed thanks to the conversion.

