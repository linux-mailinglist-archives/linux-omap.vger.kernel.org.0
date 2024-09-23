Return-Path: <linux-omap+bounces-2228-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623897EB1B
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2024 13:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB8EC1C2154E
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2024 11:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD999195F28;
	Mon, 23 Sep 2024 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr2TVuSN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEDA1E487;
	Mon, 23 Sep 2024 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727092437; cv=none; b=vGInPBkYRjJNvYXDmj2Npymubaeeco2nQnmp3ZtLSmC63Urf/YX3EGgd8BdZTKCrZz15vfAYImpcbveCw/XgW91yC85+/bdBBTBmXP+HUSXO6A4b+UjXGqiqFbVFkV6oHyV9kXabXsKJaIuvVnUV1WjSV6oCKnDd4b+iMO6h8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727092437; c=relaxed/simple;
	bh=OyExHowZSUtmKe8HBFzqxNIHagSk3OLZ38JExiAyL+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M8tQalSJUhr89I5oJsJ7VKDtp7QHY7GPFZBav3w/6YMne6THCJuc+Zb4TQXf6vIv1A/FMaO2ofDv1WXgXl7QcoCqJ5WCZTDjQsp2l64S/KlsJVX6ALn6ROrXXmGAM/H03DoKDP4y4GNzKRhek2CsegpRVH2N35px06/jVeUlnJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr2TVuSN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57727C4CEC4;
	Mon, 23 Sep 2024 11:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727092436;
	bh=OyExHowZSUtmKe8HBFzqxNIHagSk3OLZ38JExiAyL+M=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Hr2TVuSNGAb0AzNFBSyyGCRS45vT7+z1XA4yQzpXip6g2APgDmzgI5d+agY4azxqx
	 z2h4VzyfCiseZ++Z7bIeQJryBAlezuRg/5QUzMgKOfR+FW0O1WcyloZbJ+/0T67aRO
	 +0e9rqoEa0AmO3xndMErypZJEmk5L85+NWBGUtRU0En8nmNqv6JpxGPXqEWbm6uNcr
	 nH5t+s9hmsBYNv4FVey6ZvMzWcrMvn/F6QuniVF7BpTn5QDrE/c1ZARg81jCpsNkhs
	 FBqzPqCMaAWc18AEhwQYaf7qmoFta2HjXWirT9cY04kmFR3TUgvwr8xPo3XsZZLWKk
	 +HPbscsjFDl6w==
Message-ID: <72af6e7c-59c6-48cf-939d-2053f35e5fbe@kernel.org>
Date: Mon, 23 Sep 2024 14:53:51 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap
 platform
To: Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-omap@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20240915195321.1071967-1-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240915195321.1071967-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/09/2024 22:53, Andreas Kemnade wrote:
> Both used to go through Tony's branches, so lets keep things together.
> This was missed at the time when Co-Maintainers were added.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

