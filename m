Return-Path: <linux-omap+bounces-3101-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B5CA0BF95
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 19:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FB9B1680D0
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 18:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489CD1C1F27;
	Mon, 13 Jan 2025 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcIfX37/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF18A189F20
	for <linux-omap@vger.kernel.org>; Mon, 13 Jan 2025 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736791729; cv=none; b=Wd/Kog8CAMe5WVvAIb5bYE5SOO6fOrfWklgoepfaktKuJQwLwzytEDWbYgXT7vTa8/q6l2T9aPW/ipdIi/Vk4dR+WeACqPdS28l6JKWVVBwUZg+jke5/SMV2Mw5EDzXFtiSsHUcxVEELBD0D7F6P6fQT+7eCcUedEUsgtZrs/aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736791729; c=relaxed/simple;
	bh=fjGnrnA+PJF3XUTyX0tLFDsfny9iP/CBBSsHZyVzpV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ccb/YzMz90lKHhkcqu6bjXeWpdtCb6jbosDD9tqI4Umgpc4lbpmC37TSt1cs6hl10jY89t8L4Nlrl8+emSfhyhgXoz7wkvMOJY17lComIesVeT9JSOQNdHQkg81+5EsXAzR/wJUIF0KKnKLGXE7qbqgQiUBKrTioGX7X8F18nbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcIfX37/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351CAC4CED6;
	Mon, 13 Jan 2025 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736791728;
	bh=fjGnrnA+PJF3XUTyX0tLFDsfny9iP/CBBSsHZyVzpV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FcIfX37/Onopt1lbvQfIy/DUix1JOl6bHWYb93Ec3aDDjmARJcqb+rX0nUsH5PVac
	 ITECje3zkGppJqSvblCbLOZH1SYC8UlSu2bUt1c+594jsxjkUDrskG2LSQAXDe/TqP
	 JIr0TZFVXfaxXfZh+WbfnGGqEXQXe6e4RugP45BSrGNLBPMOuTRs23P4ydr8eKKOrz
	 Z6rLtqI81U0H7Uw7V6W69uzLHhG8meRPOttkIdJke9hF2PcDZtdHaOHaWdvVu/V+6u
	 P3OMOUPUQBnFkxWZo3tQN7ZKTPKB7rrYNmYKF9Mdtg7FdfpNCiAYxN0NBO4TNqN18n
	 jM0rQOoYdAPcw==
Message-ID: <25491f79-323b-421f-8053-36d5655e5323@kernel.org>
Date: Mon, 13 Jan 2025 20:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: ti-sysc: mark AM62 wkup_uart0 as non deferrable
To: Francesco Valla <francesco@valla.it>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 linux-omap@vger.kernel.org
References: <20250109175211.113945-2-francesco@valla.it>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250109175211.113945-2-francesco@valla.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/01/2025 19:52, Francesco Valla wrote:
> The ti-sysc driver implements a probe deferral logic to be sure to probe
> the parent interconnects before their children, postponing the probe of
> interconnects not marked as "early" instances until one of these is
> found.
> 
> Since the driver is alse used for the wkup_uart0 block found on the AM62

alse/also

> SoC, but not for other devices on the same platform, this logic forces
> the probe for it to be artificially deferred 10 times and can lead to
> the device not being probed at all. The missed probe was seen on a
> BeaglePlay with the kernel configuration stripped to bare minimum and
> no module support.
> 
> Add the ranges for wkup_uart0 to the list of "early" interconnect
> instances, forcing the driver to skip the defer logic entirely for this
> device.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/bus/ti-sysc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index f67b927ae4ca..917b7168fbd0 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -687,6 +687,8 @@ static struct resource early_bus_ranges[] = {
>  	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
>  	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
>  	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
> +	/* am62 wkup_uart0 */
> +	{ .start = 0x2b300000, .end = 0x2b300000 + 0x100000, },
>  };
>  
>  static atomic_t sysc_defer = ATOMIC_INIT(10);

While this is probably OK for now, we need to ensure that sysc_defer_non_critical()
is not called for such devices that don't have an interconnect managed by
the sysc driver (i.e. non OMAP based systems).

Maybe this calls for a new compatible for AM62 sysc?

Reviewed-by: Roger Quadros <rogerq@kernel.org>

-- 
cheers,
-roger


