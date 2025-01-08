Return-Path: <linux-omap+bounces-3036-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EACA06932
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 00:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8A99166762
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 23:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4BB204C11;
	Wed,  8 Jan 2025 23:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TJUjuIwF"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061A204C06
	for <linux-omap@vger.kernel.org>; Wed,  8 Jan 2025 23:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377449; cv=none; b=EK8HoQRk2Hey+AoiO2DzThDmg6wJknrBOgmiKyCTSj0pFxuBduT7kbycm6XqzViP3I8VXGCr7UC6UIodOPM0x4e1vMtLIQs1qWCEOSNVeIHq4OtorIKVjZdnugU9HcHTbmiV8fq8GYiI+KrTQfioF2ecH59ojT4RMdCT9XqK0Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377449; c=relaxed/simple;
	bh=IuogZTVK1CzdlgsrSMy5Hk7uz2L2g1g2l0NeJ7ZfwiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFhh3cR48OrGrG8ovPthmJAuPYLLOYfgPJYmGzLSjfwXmpimCicLY7y6cfTE+fPtvbUMwyP58Y0bY3PZy4fz67OJBwqjzbomaSZ60uHCenL6hqAcGAzJo3T2yckDJ+TeJkEXjk0xnKlWbORCz3NiY+pMKx41zwBDxBxlGZC4sxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TJUjuIwF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08A4F6F3;
	Thu,  9 Jan 2025 00:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736377386;
	bh=IuogZTVK1CzdlgsrSMy5Hk7uz2L2g1g2l0NeJ7ZfwiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJUjuIwFBZqPb3G+QaK+12qyOUxckM8DHZALcre1wzCkNOMYS4RjxGQWzEunH2LqR
	 VAlE8+SV1w1/UmeMrqems4DhOQGvWhQAtNH2lcVFnSv9KfKfG3Q601xahe6Q0NKrLm
	 ICLEPyiXAQpbDqPzPTdq1GFn9UqQiWPOSQ/Um5pw=
Date: Thu, 9 Jan 2025 01:03:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: deller@gmx.de, kuninori.morimoto.gx@renesas.com,
	elfring@users.sourceforge.net, linux-omap@vger.kernel.org
Subject: Re: [PATCH] fbdev: omapfb: Fix an OF node leak in
 dss_of_port_get_parent_device()
Message-ID: <20250108230336.GI32541@pendragon.ideasonboard.com>
References: <20250108011537.2748127-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108011537.2748127-1-joe@pf.is.s.u-tokyo.ac.jp>

Hi Joe,

Thank you for the patch.

On Wed, Jan 08, 2025 at 10:15:37AM +0900, Joe Hattori wrote:
> dss_of_port_get_parent_device() leaks an OF node reference when i >= 2
> and struct device_node *np is present. Since of_get_next_parent()
> obtains a reference of the returned OF node, call of_node_put() before
> returning NULL.
> 
> This was found by an experimental verifier that I am developing, and no
> runtime test was able to be performed due to that lack of actual
> devices.
> 
> Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> index c04cbe0ef173..7c636db79882 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -36,6 +36,7 @@ struct device_node *dss_of_port_get_parent_device(struct device_node *port)
>  		np = of_get_next_parent(np);
>  	}
>  
> +	of_node_put(np);
>  	return NULL;
>  }
>  

-- 
Regards,

Laurent Pinchart

