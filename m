Return-Path: <linux-omap+bounces-4618-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D2B51B95
	for <lists+linux-omap@lfdr.de>; Wed, 10 Sep 2025 17:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 834E21614FE
	for <lists+linux-omap@lfdr.de>; Wed, 10 Sep 2025 15:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340F6286439;
	Wed, 10 Sep 2025 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kNJMVzRt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iFOR+0lD"
X-Original-To: linux-omap@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A71A2580EC;
	Wed, 10 Sep 2025 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757517987; cv=none; b=ZfnBdDtRtg6r+tefEMDeDNCBQ6zcF3BHvXSZlKd4bEXUAi55ituS+mI45Qbqzs8i1WVTdOV90Eby6MlV39o10U4/9L2aqsVtvZJRzzXq5sI00iLH+Hyl6io2Vj77p4IHQrZx6VXcAi1HofXs6zvc40PeFCRa2ySeOwyjtEax6eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757517987; c=relaxed/simple;
	bh=T2CS+NKBsmlOM97mYUVSr0u0M9DqWaL5zze4Dd2w2/A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b+AP6lVkamett8ihS83g2VnGV5AdiZLwlf84geRs5gNbpUCIIl2yEnvNbc3HDMHxMg5s3PCLaJcjfPH4HIY5yQZC2K4dpCT/llfrHsYi0SGw5J8jhiS36IaZyuwyTK9SWyGywCkAPwQLYMvE82LwwuuKttASr2tCGe6Hfs4k2F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kNJMVzRt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iFOR+0lD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757517984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kGmx9y73twYgAj+HMlxs/QHS0uUhuMVYK9cXsb+3QM=;
	b=kNJMVzRtt/l1vjwfcRb6Z7t7D0h2Dgy3tr355zMCQ2YJRXW0izHMVgsqspBun4SU8eTGv3
	i7xoPhoBx+CkJwy1tpqElbjAY5up9dE8co5bzD5cmrCUaSt2pAr2t8OxPl1HT8fo8kGhx1
	LZERaX12jK4eEuKOalcLoi+Mu51H98PRGHz/Tni1ehQuCM6dCpefr0F3F19lN/ow61Wq8L
	EGVchW3yU2l4nKY4XZYZ5RcdQw1Bm8O8ZV1Bra0Jkc+aVzn3sHMvuaZ7LCmrHIZmPQ8Txv
	IopzsVhuFcNBzZSbGMXZKHrHFBGBj4r1LPVtbQMzdGrg5+Qg5Yjk7FoEgitD3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757517984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kGmx9y73twYgAj+HMlxs/QHS0uUhuMVYK9cXsb+3QM=;
	b=iFOR+0lDfoN2cPK6KP9Sdz3o0R5UM9yVu6WjDhP3f+/w3I371HE9zfxYe0bnbaPtEWhFJc
	zYx0MneTe3lf1bBw==
To: Haofeng Li <920484857@qq.com>, Tony Lindgren <tony@atomide.com>, Kevin
 Hilman <khilman@baylibre.com>
Cc: Roger Quadros <rogerq@kernel.org>, Andreas Kemnade
 <andreas@kemnade.info>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, Haofeng Li
 <lihaofeng@kylinos.cn>
Subject: Re: [PATCH v1] mfd: twl4030-irq: Fix unused variable warning when
 CONFIG_OF disabled
In-Reply-To: <tencent_C3FBDADE7060045B2952DE00576F922C5E06@qq.com>
References: <tencent_C3FBDADE7060045B2952DE00576F922C5E06@qq.com>
Date: Wed, 10 Sep 2025 17:26:23 +0200
Message-ID: <87wm66s50g.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 17 2025 at 10:41, Haofeng Li wrote:
> -
> -	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
> +#ifdef CONFIG_OF
> +	fwnode = of_fwnode_handle(dev->of_node);
> +#endif

This #ifdeffery is horrible.

> +	irq_domain_create_legacy(fwnode, nr_irqs, irq_base, 0,

        irq_domain_create_legacy(dev_fwnode(dev), ....

Makes all of those problems go away.

