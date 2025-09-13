Return-Path: <linux-omap+bounces-4630-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E0B55E63
	for <lists+linux-omap@lfdr.de>; Sat, 13 Sep 2025 06:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25E933B661C
	for <lists+linux-omap@lfdr.de>; Sat, 13 Sep 2025 04:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCBF2D77E8;
	Sat, 13 Sep 2025 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="QpW7cwpm"
X-Original-To: linux-omap@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2948191F89;
	Sat, 13 Sep 2025 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757737907; cv=none; b=uWiO++0/+N9uJwLtkBAYM0ijWzhXZanBNdrdUmMNvvO3Fh4rrSBhwcXJTguydWgTDwqkZJRvXZJR6D6TdOlJCaabjXDPRWT/QlfbqUN737JKxM6vdkDXNsmcQsIvVypp9pvzgBWZqph8PAoAoPfX+NNntGQfCZCjq1b2ApY+flE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757737907; c=relaxed/simple;
	bh=3znz+a1OabVPLqDWf8DP51mwzppcu25nbMbRVdqzpHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJd83OVQq49F8cI00c2hjxvDbUXFQsDoKo8ytfyDoLu7g7bL9CnLLyDpCL41H7HWjsk+wssj1OjwYCFuriRfEP8tVBxIubiSBMtT9pMKe1m/M0reFpMv69LmPPCsa+UZvyjQaVwC+iNolp0Di1K4nQF+LR112FME5SkJ4zBBQxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=QpW7cwpm; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=V4ED0PIsHZOur7dkc3zTuW5CJ6TkxnIsv+oXNQjkWMQ=; b=QpW7cwpmlzNcz3HcmlruuXfnRg
	I8mQvRmnT9TBL9CFXw1UH7xW7FzS63Buvn84V+fHuxMQhBd1+nPH6qTFFd5LwjXPjmVgEmnlIBZnT
	F9d5qJuDyD9cFZW+oRsAw8x8isNMBzy7/a4CFWUV8V9d3MtWEqt6DKiUVvYsps7SxEyKh2frHUFGH
	gY1zX5UG32zAcklRab7/++tpULuSDZxWmqgcohlDYGgsrpgeDrGkc58lSvauc/Nq49YAoTn0LEtkB
	INMIITpN+MJLmnnCbNy5VBA7GwOi+fBMotiZe7djDDllEGbHE+HRHG4RKqGRf+v3EM3jqpqEhETeW
	FqTVIiIw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uxHfm-0053xA-2V;
	Sat, 13 Sep 2025 12:31:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 13 Sep 2025 12:31:35 +0800
Date: Sat, 13 Sep 2025 12:31:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: davem@davemloft.net, ebiggers@google.com, tj@kernel.org,
	u.kleine-koenig@baylibre.com, sakari.ailus@linux.intel.com,
	ovidiu.panait.oss@gmail.com, linux-omap@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: omap - convert from tasklet to BH workqueue
Message-ID: <aMTzp8QFIuna_17V@gondor.apana.org.au>
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
> ---
> 
> Hi!
> 
> The background on tasklet -> BH workqueue conversion can be found here[0].
> system_bh_wq is used as suggested.
> 
> Sincerely,
> Ryo Takakura
> 
> [0] https://lore.kernel.org/all/20240130091300.2968534-1-tj@kernel.org/
> 
> ---
>  drivers/crypto/omap-aes.c  | 15 ++++++++-------
>  drivers/crypto/omap-aes.h  |  2 +-
>  drivers/crypto/omap-des.c  | 17 +++++++++--------
>  drivers/crypto/omap-sham.c | 15 ++++++++-------
>  4 files changed, 26 insertions(+), 23 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

