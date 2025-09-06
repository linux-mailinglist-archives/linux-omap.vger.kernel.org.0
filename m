Return-Path: <linux-omap+bounces-4595-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 338AFB46DD8
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 15:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7BB3A41978
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 13:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7042EFDBD;
	Sat,  6 Sep 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ct+9dnkW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE6258EF3;
	Sat,  6 Sep 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757164782; cv=none; b=YiZ2TfT+BeIDJx63mPlGcuvpkJTjJ/5oH4OeKK5BIlYg4yc6wQxzbkUL0IiWPl0882wxA8becxRtjuuxDrOxgiTozjhrdJtG88jpFI/hkl6dn9sCDJ1qGQL+8ysWqTaYagUFkF6HxDjCDDEc2MN9YkuybgACCrK94vxm+JBpK1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757164782; c=relaxed/simple;
	bh=2TSB9zeqUYd2ayg2BNkwMlnOaUYJ7kih1JPWfo2YsVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWoz2G05q3D0Jo5bogDPFqbjMGe02aIHR61jP9A5mcTdIT0YouQmAN2gLerjZSfdRAMwDM72MC0PSSOGXY3XbdniaE+iTATtR15SKiXacenUyxEirWqerRM3hJYwSEXhsGoiEUlz5MYOAm92gxQHdKmLSy/5Pc4ofgNRkpIFhzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ct+9dnkW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E286AC4CEE7;
	Sat,  6 Sep 2025 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757164782;
	bh=2TSB9zeqUYd2ayg2BNkwMlnOaUYJ7kih1JPWfo2YsVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ct+9dnkWDnoGM4eJF8t6Rf7lHIShj2n/VN0mLAOjSCTFfBhgHi8snJ+OVTrzNI2Am
	 9KTXB2HPHXU4arZHGWbuut82LaLp3JVDX2E3LpXzzwOSeby6zDnD7PRRHG/eTnZu8i
	 V3fPYIpG1O/3Jh62f2VeZDztCQL88y6O8vstKLIQI++SOLO6xJl52vpMpctySnzNxd
	 t1MfuMnbuNm1DEWa0HTpEF42WNxlpzbMBRPepOr2Em1CS2FGkH43nMLhWBbAGPJb9O
	 tyw7dITqnGSFK1rnOwcESpj8J83jKRe6+mujF0iPlv2ToCVp4wPC2MZMdG+rtLBhUH
	 y43Zo/R42/isw==
Date: Sat, 6 Sep 2025 03:19:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, ebiggers@google.com,
	u.kleine-koenig@baylibre.com, sakari.ailus@linux.intel.com,
	ovidiu.panait.oss@gmail.com, linux-omap@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: omap - convert from tasklet to BH workqueue
Message-ID: <aLw07CDxKcp2NDmL@slm.duckdns.org>
References: <20250906114135.76961-1-ryotkkr98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906114135.76961-1-ryotkkr98@gmail.com>

On Sat, Sep 06, 2025 at 11:41:35AM +0000, Ryo Takakura wrote:
> tasklet has been marked deprecated and it's planned to be
> removed. Make omap crypto drivers to use BH workqueue which
> is the new interface for executing in BH context in place
> of tasklet.
> 
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

