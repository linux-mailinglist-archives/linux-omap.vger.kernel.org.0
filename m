Return-Path: <linux-omap+bounces-318-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFD8830B7D
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jan 2024 17:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0A3E286AB3
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jan 2024 16:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA8422616;
	Wed, 17 Jan 2024 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XGSUNHnx"
X-Original-To: linux-omap@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A271222619;
	Wed, 17 Jan 2024 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705510341; cv=none; b=lXMZIQ++7Yo6iZTyebrivSKJpl4/mO9BrRwWGzDjkTkqWsOoNAdYsMjsrmvF2GI+KLoYCEtsnylvd+lhDUiPl0JM+EJOckkvRChBGj6AwRwn8d/9/mtveRnP/5vbAU8p/Q7rntrcPsylOnQgO/tJ7/2+lXVq6PQ60jf/PrLS36A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705510341; c=relaxed/simple;
	bh=d2jotS6S85nxTTQBqPtcjTv2jv17Jyc0FlHJG/EQUQk=;
	h=DKIM-Signature:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=Bpikw9Me1pSH12OPx57cOQQJH2qBp/RSSFHWEoMfowdovTfDCWDEQdoI03oBCh0HmH8UfnmLVEOOXXXuTWMk3nvBRluCVubROzriR3zK1uT4ph4zgT7dbruzkTrJOlAPde/wgqRYzMlP5ItN2vK/OelRXw8vijTrudkTVdWhm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XGSUNHnx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=5/FGBZFcnL+QZxohlDWVSAVnnE2wpZTP2L5jfNcW670=; b=XGSUNHnxvzjblbQiZd44146i5H
	kYB1pYXmjWY4HnMMp9wLs8ZhS9c0AFROHRW094BP3jkpEdCG4cSUAielj2s4epNj3L4R/H25GmhlP
	kz9Rr21gueGIWkngiPyqHx3W1V3tjfujIedBz17sIctEssXnPECuI4fCmwcaUZHGZmpKEQBgYbUyR
	XIG02o96Lml+lsFamaqWW2JNtc6AjWbAneSBt2jNAwjS72v3KwGITBQL6YVTjc6aD2H7Jxrau5jl7
	lSuv9ZmhNxhtWoyI2czR8veJl2oGbuqtgh6MCUjhrYbkjR8hJ0ufeuh3mhEwGOzafCqbColFueVgh
	ex45lRWg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ99G-0008pP-34;
	Wed, 17 Jan 2024 16:52:18 +0000
Message-ID: <e6692a04-142c-4df4-83dc-534ab27a55f6@infradead.org>
Date: Wed, 17 Jan 2024 08:52:16 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] ARM: OMAP2+: fix a bunch of kernel-doc warnings
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 patches@armlinux.org.uk, Paul Walmsley <paul@pwsan.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Kevin Hilman <khilman@kernel.org>
References: <20240117011004.22669-1-rdunlap@infradead.org>
 <20240117131305.GP5185@atomide.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240117131305.GP5185@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/17/24 05:13, Tony Lindgren wrote:
> * Randy Dunlap <rdunlap@infradead.org> [240117 01:10]:
>> Fix many kernel-doc warnings in arch/arm/mach-omap2/:
> 
> Thanks for fixing these. These are unlikely to conflict with anything so
> please queue them along with other clean-up:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
> 
> Or alternatively let me know if you want me to apply them.

Yes, please go ahead and apply them.

Thanks.

-- 
#Randy

