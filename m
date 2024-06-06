Return-Path: <linux-omap+bounces-1498-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A45868FF5A0
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 22:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573561F251E1
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 20:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5215574409;
	Thu,  6 Jun 2024 20:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DPMN2ScE"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B0D1FAA;
	Thu,  6 Jun 2024 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717704274; cv=pass; b=VxUL5t8fqYKDFJs58VIp3yUinnqdiHIVPENkuDK3RpgMN8pCpAJIM7TqNznSoj8/0VU4puCHfgp+Feq7y56ZV0p1mHPRT02Y31cLpahro1NZxi22mX01wQBbzKE44fudIHV0anYt+Gdr2QamhSPXl5u4eQaIUDrs51cp/rKl/bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717704274; c=relaxed/simple;
	bh=t/QRjov8o1xd9sV/wTGbFC/xycKAroLSt9xxW428i2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GawhvqTMldFmkGMw8oJSMFIbDe4dYwY9/9zbE0R0LdSE9Mc5vRPhAyiINrZChNhiCqasCJWMWY3D2kQy5u+GkDtxbSzmM2Cfs79fQBCVyol+LruToHY6FYojldW3TF05yPQv5gd53IuJzP00m4nTLruKn5JmOJfUfvcThgpQaa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DPMN2ScE; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-74-208-nat.elisa-mobile.fi [85.76.74.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VwFfC39jNzyPV;
	Thu,  6 Jun 2024 23:04:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1717704264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1uMICLpSAgkmnnEnROxEEBbssd3pa/fn+ZCfeEb1oMs=;
	b=DPMN2ScEBbDaD+IKYQRG8oEhlc8vifkXEzEBWFE4yUBKkGaybMl3Xl/kvmpwAMyptpPOTq
	qv3tYIlgqTIXjgYnZ0cqM1DvznFZ+MYp4MStKh2+P4R9RnmKQ8ukHvvpysM9ToEBWOCOez
	14oMkgWUOiFlHRHKetSgdGsTEvDhlyQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1717704264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1uMICLpSAgkmnnEnROxEEBbssd3pa/fn+ZCfeEb1oMs=;
	b=LbFr3JgBm62/EJZWz6cOa2zEyQWPW1EsAQKi98wJbBMZ48kgj+SELTMHufS7gS8SQTCRBg
	QfJxGHQ9R4kZ42Mnnh7YT2OtM3BYzMOJQfLJwfOn3J94IHxCPmyBlkVRteC8Wl6jnwwWaW
	fcDc249jlJv8UpvK5+fu/80y2awiNmo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1717704264; a=rsa-sha256; cv=none;
	b=kaqtSd1p1cnSUTkFgRYhRYD9EBLybg/OmRGDnP5P3AwEG2LQLLQxopiBeIVoKNzhdbfFLf
	4SlRgHlBTlV4ty0oZwhY5dDy+2OCHUyV55FlwWT6V9qe3EqnG+vheN5gFLN3WkaF+/zN6T
	v9ysDQVOvkugxBArBMH97AZZVXgPGD0=
Date: Thu, 6 Jun 2024 23:04:16 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: linux@treblig.org
Cc: tony@atomide.com, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: Remove unused struct 'dma_link_info'
Message-ID: <20240606200416.GF9487@darkstar.musicnaut.iki.fi>
References: <20240505202214.623612-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505202214.623612-1-linux@treblig.org>

Hi,

On Sun, May 05, 2024 at 09:22:14PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> I think the last use of this was removed somewhere
> around the two:
> Commit 755cbfd8cf89 ("ARM: OMAP2+: Drop sdma interrupt handling for
> mach-omap2")
> and
> Commit 16630718ee46 ("ARM: omap1: move plat/dma.c to mach/omap-dma.c")
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

> ---
>  arch/arm/mach-omap1/omap-dma.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/omap-dma.c b/arch/arm/mach-omap1/omap-dma.c
> index 9ee472f8ead12..f091f78631d09 100644
> --- a/arch/arm/mach-omap1/omap-dma.c
> +++ b/arch/arm/mach-omap1/omap-dma.c
> @@ -59,19 +59,6 @@ static struct omap_dma_dev_attr *d;
>  static int enable_1510_mode;
>  static u32 errata;
>  
> -struct dma_link_info {
> -	int *linked_dmach_q;
> -	int no_of_lchs_linked;
> -
> -	int q_count;
> -	int q_tail;
> -	int q_head;
> -
> -	int chain_state;
> -	int chain_mode;
> -
> -};
> -
>  static int dma_lch_count;
>  static int dma_chan_count;
>  static int omap_dma_reserve_channels;
> -- 
> 2.45.0
> 

