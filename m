Return-Path: <linux-omap+bounces-1761-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1092CDF3
	for <lists+linux-omap@lfdr.de>; Wed, 10 Jul 2024 11:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A109281B4C
	for <lists+linux-omap@lfdr.de>; Wed, 10 Jul 2024 09:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4270D18FA1C;
	Wed, 10 Jul 2024 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hO1qB8V3"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19518FA15
	for <linux-omap@vger.kernel.org>; Wed, 10 Jul 2024 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720602565; cv=none; b=TSU5OU2ncyy/+fAzh9D3lbwgniTEUTNWCKvjvLMLNVUoYZuGCviorq/DNOPa9eKPW0WAq98Rqhqn05X2TQp2acdzENRIuFfDN6dPP2dQcoSXCX+amX2YkXqGsA2YYGbl7DYbPRFFg+26pCe+Ew9KoQLn+tSFzran6tZ8MDm5XtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720602565; c=relaxed/simple;
	bh=CBvf55qAjexMmNIphn9j6k7pzhaGetIpKjeEenPMYO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXLUNccvUvQ4nqLhDTMXsrfkRp2lhMrmuEDUYPBfopQEK7hgPkAFeCPP8CdQlZGWCm4lNSbYxSPHCRq9tpW/Hw8XZy2hsX0QsvahxfGctEBqDAPxh09BIokHwJRQypTEew7vPgoUp6qEFY1IH9PTM9HBA4WKofJXwxsdol6wF44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hO1qB8V3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F74C4AF07;
	Wed, 10 Jul 2024 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720602565;
	bh=CBvf55qAjexMmNIphn9j6k7pzhaGetIpKjeEenPMYO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hO1qB8V3VAj63tFIfc+w23E/wEChoiJh+zwqsOhF1bpOOV1ZpTMRehBfxXdohKXVE
	 jUBJ03OqN4Ku89f8ROU9czp06yeOSxVkMR/MqLaYYyPTvp0G4dNhS33pXtZy6de+y9
	 QlszjdD82Eh26+7TNNJrN1E4NRnQtlhyyzN7W+n1cCpkl94HCqUC7WxawR3MexOe66
	 oBPUFzHHVnQJp2JN40HlEHqJloBFnlMwgT3T/RNn7QMd1BIb5Vn7a9iJXvM+weTMU2
	 DWLiittCiSdNF7oQjVxlG18IwavgLtJaY5dfP/hU2524CK5G3jd4uWZsuAHDPMTKPs
	 K7e88VR/JECiQ==
Message-ID: <e1c351ab-2981-4fa0-9c9b-e2fd5a5d4b37@kernel.org>
Date: Wed, 10 Jul 2024 12:09:19 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add more maintainers for omaps
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
 Russell King <linux@armlinux.org.uk>, Vignesh R <vigneshr@ti.com>
References: <20240709135930.3405-1-tony@atomide.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240709135930.3405-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/07/2024 16:59, Tony Lindgren wrote:
> There are many generations of omaps to maintain, and I will be only active
> as a hobbyist with time permitting. Let's add more maintainers to ensure
> continued Linux support.
> 
> TI is interested in maintaining the active SoCs such as am3, am4 and
> dra7. And the hobbyists are interested in maintaining some of the older
> devices, mainly based on omap3 and 4 SoCs.
> 
> Kevin and Roger have agreed to maintain the active TI parts. Both Kevin
> and Roger have been working on the omap variants for a long time, and
> have a good understanding of the hardware.
> 
> Aaro and Andreas have agreed to maintain the community devices. Both Aaro
> and Andreas have long experience on working with the earlier TI SoCs.
> 
> While at it, let's also change me to be a reviewer for the omap1, and
> drop the link to my old omap web page.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Roger Quadros <rogerq@kernel.org>

