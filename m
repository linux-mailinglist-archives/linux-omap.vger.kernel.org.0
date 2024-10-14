Return-Path: <linux-omap+bounces-2420-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89799D491
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 18:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABF851C2365C
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 16:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518951B4F15;
	Mon, 14 Oct 2024 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="ku52fG03"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628401ADFF9;
	Mon, 14 Oct 2024 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728923090; cv=fail; b=CO4DvI5SyCOh9ZqLZfJ2+c/OPnEMyDeUGBUw1WqD+1o1b36iWpDu4j716weGTDxGJZ4MVI990dI33i6ZN1C3b8pDuZowFv9NAdrAI8nLjvYKnhbLcsSKxH/ba1HERvlpLGnTH71pLZHfveJr08O3cS9LTppG/jJ5EyhhqMsYveI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728923090; c=relaxed/simple;
	bh=lgVZeGHaAeoVCaZ7zXfdGDNEV1YbO1LVdewMscb//Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo4dPG147R+2O3vXVGcMIH/zWGhMdntVat3yOIq5QTrkMcwVNXtlNcp9Zk3PHz+g3R+pLZXjt+ils2IGY4VHSZAYF29ry15dm5PHZ6lvxVW+KgSXaVXPY7/hy60mJbgvegSHbEAnx0eFS4xZDJ+o4TYZ7PxSnZHBr+hK0QG3drk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=ku52fG03; arc=fail smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-77-198-nat.elisa-mobile.fi [85.76.77.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XS2cl1kVMzyQK;
	Mon, 14 Oct 2024 19:24:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1728923080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bA88+Mwqcu5TZnmEDMTMatD0BKBGd4kdYquoS68m2WQ=;
	b=ku52fG03aScxdHq2rJkQRkp8cMQFHabGe9J5p/+nlrubv6mTQ/YnKhtgGTbHNlc0QJJ6BJ
	5rYH5+1iz7WqVbJ1LzSJQ8fdD7yHDiahJJ/zPbzVYvZD6G0u/jQPuWvI+QwGG9VUPDvHlX
	9Egs2h8e1kALnATOtQrit7PaK50hVu0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1728923080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bA88+Mwqcu5TZnmEDMTMatD0BKBGd4kdYquoS68m2WQ=;
	b=GLKKt0dd0aPsnhOb33Mnviq7/X6KnqacA+hMHKOajyk9D6o+8XdMAsHTY5Y3niLsmZsUdm
	zdAdwFbzACkWYNSA7sPCkJbxUaG8IcPDm0YOhvIMbycCY1V/5xxfwZGXTYF0RZUUMdNAcj
	zd9bGS6criXhl4O6G657whC27cL/Mbw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1728923080; a=rsa-sha256; cv=none;
	b=BrmgWvL4sGQ2P9OOZGpp8GGlMjFWZiIfs0Sypxy7ZfctAvwN1jmV5sKz80L8lLQksD1rot
	VsJT8n7GEmrr+kZi9xHmx/ZKfvHY/tdl2AwuhtJ5Y9/DqMgvoQ5IzCtfCdFbf2BnimY/bg
	tz3nd5A2Ftu8kibH6xnvYhFCdNuHRcA=
Date: Mon, 14 Oct 2024 19:24:37 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap
 platform
Message-ID: <Zw1FxSzcs1OSR8QR@darkstar.musicnaut.iki.fi>
References: <20240915195321.1071967-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240915195321.1071967-1-andreas@kemnade.info>

Hi,

On Sun, Sep 15, 2024 at 09:53:21PM +0200, Andreas Kemnade wrote:
> Both used to go through Tony's branches, so lets keep things together.
> This was missed at the time when Co-Maintainers were added.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc40a9d9b8cd1..755c378cb2e73 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16653,6 +16653,10 @@ S:	Maintained
>  F:	arch/arm/*omap*/*clock*
>  
>  OMAP DEVICE TREE SUPPORT
> +M:	Aaro Koskinen <aaro.koskinen@iki.fi>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> +M:	Andreas Kemnade <andreas@kemnade.info>
> +M:	Kevin Hilman <khilman@baylibre.com>
> +M:	Roger Quadros <rogerq@kernel.org>
>  M:	Tony Lindgren <tony@atomide.com>
>  L:	linux-omap@vger.kernel.org
>  L:	devicetree@vger.kernel.org
> -- 
> 2.39.2
> 
> 

