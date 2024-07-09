Return-Path: <linux-omap+bounces-1760-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA292C192
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 19:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 744D4282832
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 17:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46385188CC8;
	Tue,  9 Jul 2024 16:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="p7gvrddl"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECC1158A25
	for <linux-omap@vger.kernel.org>; Tue,  9 Jul 2024 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542701; cv=pass; b=EVuxLNU+wxC9nNzIUXw5ulTTwyw2hOdvo1MDz7JpsPYloth2EWLN0VwWJ6Hl2Kry2ixuXbMWUoBkz0i9tegTsXDKykCwydgxeXraiVt74UmczwL2vN6YfKh8/I1KqakSBStYqD9dG73z9q4ClpK5IYIbsG1lU5DLEpnRRtwniJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542701; c=relaxed/simple;
	bh=qVPNzoIMDnSnqoiO+dP0N7hCZXyLjSsHFSskrmSqDtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJEAXQo1hxqc+rCHx5gzoIYGqyJG5Ju8d0mk/wPF7XebCwXgoUMbe0+uMZ4D+2u67Zx7sy76BmT1D7izpeb8lVUFgAbiOg7RxzZsLEEa+zHMr375LDFAcMmAtFjUbHMIIIZyq921vgJHBMO/gAYTTo/aMjHnXFw9gWqlOEAh1Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=p7gvrddl; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from roadster.musicnaut.iki.fi (85-76-117-154-nat.elisa-mobile.fi [85.76.117.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WJRMK2r7pz49Pyc;
	Tue,  9 Jul 2024 19:31:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1720542693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcnFjhP4bxkbcbZfu8yMe2OiH3uLrc4+sVecmHvM5/Y=;
	b=p7gvrddl8DCcg5CzZD2gFKB/PeTj4HEnOtZd3aBzMgrN/JvSD4zfl0TxFYVv4ivzyRDq5U
	MFZaIGG1C0FEh9Iv7thMN+kLcMzza356uEcOGIwVXuadxdlrcNyiAZRqHff6xNJ8KQIdfo
	zqGpdKS2vArXy1NG2BFUYtE6KOqOIaajNClwqsODwkW0NF2CXTAFocNLmpaE5AhPZyegUD
	/qWNB0Xrqn3I78h0x1/lJXzsNPvyoDjgGVLO7whUB/5Dg/wf5tXizu8EYHnQW7aRempnyI
	NGx9aEzfJp1yyVGoR4/7cXUKb1YCvImKueYig4Bdnk0sheVBTOO5EItF+ItWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1720542693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcnFjhP4bxkbcbZfu8yMe2OiH3uLrc4+sVecmHvM5/Y=;
	b=vLjIG4pRVIs31CRBWC0JCr1nkbYeC16OsHUzKtMVKMpgAsYdndsf8SDge2puaXjeP+yi+4
	aspU+rgtTKWg5RMtLkoG2oURmb5vxwAGnh26ZMMMGLSe+Zb2jGjdDtso96cJlGY8W9To40
	MUu3VtBblwn5A+F3nqw5mPyVivAIxMBj6uNC9E5yeF+EaB0hu7LHDG4AkWZKvkxDfkE1Al
	JJ63RjCzH9xir73CbhvujVw6XHZVFPg7bioCbq4FkREUxBvI6CK6fa+ZREB75xb59FVpRa
	NPXlIC5wWJ2QsJLziXYwCt5Ll2lZJB6zE0EvZ7V/P7fFVbTYlNhY1pLKEHHMgw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1720542693; a=rsa-sha256;
	cv=none;
	b=HBHeI4FOP1OebdOnFtENkTFxr6iIeyf7r3+LlFsRBFjZp73TjVbVuJqvz7FIJ0m72Lc4e1
	6sXc5HV/FWFJfmNf6yzLRa8ssaAX/0bxxjJBwc3xYq1bV6CnFNZrnNYTocZqtR3+4bs8sa
	OlmY3T7x7sw09gvpEGrpPx7OiEqN9OzKhQBpWmoBQFTzpN3dWPCXnNVjSAuEGIFkjnz4D1
	x7TfcVUk9i5py9QE/TSUvtQyNRXKetiiUjRoIlwA2UBczAvkFJy4DHJE2oA+5L9FYhlflP
	uZep8qtWHn1lHY3wFPAAQYxW9bDUcpZ1Fbj0W/TcAVfOKD2fiOLN8Pc+qbv5bA==
Date: Tue, 9 Jul 2024 19:31:22 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	Russell King <linux@armlinux.org.uk>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH] MAINTAINERS: Add more maintainers for omaps
Message-ID: <Zo1l2uUaLYzUZ0vP@roadster.musicnaut.iki.fi>
References: <20240709135930.3405-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709135930.3405-1-tony@atomide.com>

Hi,

On Tue, Jul 09, 2024 at 04:59:29PM +0300, Tony Lindgren wrote:
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

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

> ---
>  MAINTAINERS | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16445,7 +16445,7 @@ F:	arch/arm/boot/dts/ti/omap/am335x-nano.dts
>  OMAP1 SUPPORT
>  M:	Aaro Koskinen <aaro.koskinen@iki.fi>
>  M:	Janusz Krzysztofik <jmkrzyszt@gmail.com>
> -M:	Tony Lindgren <tony@atomide.com>
> +R:	Tony Lindgren <tony@atomide.com>
>  L:	linux-omap@vger.kernel.org
>  S:	Maintained
>  Q:	http://patchwork.kernel.org/project/linux-omap/list/
> @@ -16457,10 +16457,13 @@ F:	include/linux/platform_data/ams-delta-fiq.h
>  F:	include/linux/platform_data/i2c-omap.h
>  
>  OMAP2+ SUPPORT
> +M:	Aaro Koskinen <aaro.koskinen@iki.fi>
> +M:	Andreas Kemnade <andreas@kemnade.info>
> +M:	Kevin Hilman <khilman@baylibre.com>
> +M:	Roger Quadros <rogerq@kernel.org>
>  M:	Tony Lindgren <tony@atomide.com>
>  L:	linux-omap@vger.kernel.org
>  S:	Maintained
> -W:	http://www.muru.com/linux/omap/
>  W:	http://linux.omap.com/
>  Q:	http://patchwork.kernel.org/project/linux-omap/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
> -- 
> 2.45.2

