Return-Path: <linux-omap+bounces-1765-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 156E592E046
	for <lists+linux-omap@lfdr.de>; Thu, 11 Jul 2024 08:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C61F5282E30
	for <lists+linux-omap@lfdr.de>; Thu, 11 Jul 2024 06:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A104412C482;
	Thu, 11 Jul 2024 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="l1OdgdQR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787811803D
	for <linux-omap@vger.kernel.org>; Thu, 11 Jul 2024 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720680267; cv=none; b=lAf11MF1xUTr17uJal8MJHetT2IekfQkwYAH2e7+OTv+yII/dnsmcs6CLxPvqysR+RtZznNcuQU8Bk1rGmeKd9O7y+oHx+hA/JVbsoPJvFwQHtFGXpKGa/HzqM6Q2f0EfWWPffAtYbfucY1qEs3w62iqyqWsdLKyCEYBpmh+cc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720680267; c=relaxed/simple;
	bh=AS3eHkE0Agp6JJ3Pssc1r/7r9CMTHmzs69o6+/nxc3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gtesf7t8eylO7pkXVi+mzbOalhDmQ1t30VXRkhfKSGAKWryqUsr42/tGn2siHAallYRcdtddCOLkkUVlWN/gdhiXVVrxMYvwJjSr6s4yal3XvlMKZxGx30DvNCWu9I5cjRf5JCeQz6e5+1rYs9ey1ljLXrhtKd6fxP9msNuHeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=l1OdgdQR; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KNPh6VXzOTMPr2Zh7/8kS/ysBQisnKxE+COcuf23ZW4=; b=l1OdgdQRCMHUrymcXX6rZI0MwQ
	+lpffUpphbsDVWQwVCrXJ9kpbBaohQajqBPoCr+C9T1wRGFVGRtC/jEuL4p0QYclR6uFIBfswHejp
	TRJGoGNTAkoYkul41Luq+zGbF+pcHrIL6GsHTykRef3Tf31+HO3iNXzlUuYmE/TijFohFTJ93XQJ5
	40D4GNcEcPWGzNtWIKpWVnQboWubWlVOkyEP5q5tdY4uvfQZwtumKGfAbE7kEWsOxoxTKtIdomJxg
	cP//vciHgPJLY+eD+Y7D+87Sk2z6vzv6KAhVNin1Wf7NHx25akygcwoWm91fFtxUab542weSRA5BN
	Ae90eWhQ==;
Date: Thu, 11 Jul 2024 08:44:11 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nishanth Menon
 <nm@ti.com>, Olof Johansson <olof@lixom.net>, Russell King
 <linux@armlinux.org.uk>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH] MAINTAINERS: Add more maintainers for omaps
Message-ID: <20240711084411.60bcd32b@akphone>
In-Reply-To: <20240709135930.3405-1-tony@atomide.com>
References: <20240709135930.3405-1-tony@atomide.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.37; aarch64-alpine-linux-musl)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  9 Jul 2024 16:59:29 +0300
Tony Lindgren <tony@atomide.com> wrote:

> There are many generations of omaps to maintain, and I will be only
> active as a hobbyist with time permitting. Let's add more maintainers
> to ensure continued Linux support.
> 
> TI is interested in maintaining the active SoCs such as am3, am4 and
> dra7. And the hobbyists are interested in maintaining some of the
> older devices, mainly based on omap3 and 4 SoCs.
> 
> Kevin and Roger have agreed to maintain the active TI parts. Both
> Kevin and Roger have been working on the omap variants for a long
> time, and have a good understanding of the hardware.
> 
> Aaro and Andreas have agreed to maintain the community devices. Both
> Aaro and Andreas have long experience on working with the earlier TI
> SoCs.
> 
> While at it, let's also change me to be a reviewer for the omap1, and
> drop the link to my old omap web page.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by Andreas Kemnade <andreas@kemnade.info>

> ---
>  MAINTAINERS | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16445,7 +16445,7 @@ F:
> arch/arm/boot/dts/ti/omap/am335x-nano.dts OMAP1 SUPPORT
>  M:	Aaro Koskinen <aaro.koskinen@iki.fi>
>  M:	Janusz Krzysztofik <jmkrzyszt@gmail.com>
> -M:	Tony Lindgren <tony@atomide.com>
> +R:	Tony Lindgren <tony@atomide.com>
>  L:	linux-omap@vger.kernel.org
>  S:	Maintained
>  Q:	http://patchwork.kernel.org/project/linux-omap/list/
> @@ -16457,10 +16457,13 @@ F:
> include/linux/platform_data/ams-delta-fiq.h F:
> include/linux/platform_data/i2c-omap.h 
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
>  T:	git
> git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git


