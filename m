Return-Path: <linux-omap+bounces-2198-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F19977273
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 21:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0368281B0E
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 19:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC39E1C1743;
	Thu, 12 Sep 2024 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ql680EI1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741201BFDEC;
	Thu, 12 Sep 2024 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726170517; cv=none; b=RoLMXS2GKeqzYVadvIN35u6wXiGRrpBtp2vZkC8WaxR8zLT1nvf/hl1bEvrAJY9wpzYkrKyj7YNcSfPZG7vQS8En1ozOXi058sjicYrF4Ga4liPrKbtRBF7zaxK/bZNd2oOvd8HjAb8Km/5tYrxMx6VRhwHsL46vMFXawjPlpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726170517; c=relaxed/simple;
	bh=0Dh+ieYXw/rcIjGTcITPSznHlHgF8i2WP64Lx/3B8mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdLCxbZ218m7kZTzyBDxUP0T65sDDYDfPxvO7YMaPN7Z8bwWkhxebWWHkiFfVdykNoY3xiaF15SrVnA8RTX3rNtqhtuCwF9G5/lyhzvqVYaLUBNvpLAllE4DxCBRc5lFQeI4uNr+OlRfeBAYLycnvsfIALKpVw8r3HDrlRNmdVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ql680EI1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EF4C4CEC3;
	Thu, 12 Sep 2024 19:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726170517;
	bh=0Dh+ieYXw/rcIjGTcITPSznHlHgF8i2WP64Lx/3B8mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ql680EI1ISMAcd/Bj2DmWPVqytOAxXjyAMSaJYIzdpWGnIrD+dCImnFUjcjXLqPa4
	 YHZF7nTwKzYUVc7knpkokvkUTMkg8lKsE3bPCV7HXoXTyU9EeS2/kU2gTYaX3W13V8
	 VFjYpma3jryIttHoawIkw5dVbKZm1Wko8jknPebcD/L21T63WnQEZj1emjUi7IK6+Z
	 aAwS3L8tJaH5KYTgkvYsD2iOIsc08xMPpbYASzybti6aVnxC2Y+eE/6MfZnrAUXQUJ
	 pOuJIJ7TQMnzUBlBrkZERMStE2NLXYSr5EEeutzqugubnnsQqARKFZoSxY2cyFJ/xE
	 h1mY8YTku00uw==
Date: Thu, 12 Sep 2024 20:48:32 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next 1/3] net: ethernet: ti: am65-cpsw: Address
 __percpu Sparse warnings
Message-ID: <20240912194832.GQ572255@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
 <20240910-ti-warn-v1-1-afd1e404abbe@kernel.org>
 <20240911170643.7ecb1bbb@kernel.org>
 <20240912095813.GG572255@kernel.org>
 <20240912084515.5dcbb391@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912084515.5dcbb391@kernel.org>

On Thu, Sep 12, 2024 at 08:45:15AM -0700, Jakub Kicinski wrote:
> On Thu, 12 Sep 2024 10:58:13 +0100 Simon Horman wrote:
> > Thanks for pointing that out, and sorry for not thinking of it myself.
> > 
> > Looking over the code, and taking a first pass at implementing this,
> > I believe the answer is yes :)
> > 
> > I also think that, as a second step, by using dev_core_stats,
> > the custom ndo_get_stats64() implementation can be removed.
> > LMKWYT.
> 
> Second step or one conversion patch, no preference. But AFAICT you're
> right, the ndo can be completely removed thanks to the conversion.

Thanks, I'll see about making it so.

