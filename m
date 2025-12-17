Return-Path: <linux-omap+bounces-5200-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 638EACC9043
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 18:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADAEC31222B9
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 17:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F64C36212B;
	Wed, 17 Dec 2025 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rT3cLlYU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92D2362125;
	Wed, 17 Dec 2025 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977732; cv=none; b=p9Y7DrQiAqI5LsnKw2AAMcqGyWHuameSrbnEyYm/96nmkxsaEJoMLFiWr+NHLTP/DDh7+cdFX+d1EmwS42fdWAzBBNOK57T8euWT2VdlsidTRYavN4p9Ka9s+CIO+DHC3oJCKcatYnlMbDOXt8vMqGQvC6puy2xvPs87KubKDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977732; c=relaxed/simple;
	bh=iXiSmYCHNO4aL+u4qy0Fy2fLpin+IvdRnbTAhB39BH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hegUVPJgzpjgq8lZW3XGpzJTr6a4SMyHpv2vgBXFVyO/Uf/ZZxt57horyvUpYFp5oGdA/MVGwXECnxc38LM+nRTJJycBwJfiGXsnnarMhTZpMjXP4QI5BfkWZAUtsvP1UwPOGVyvbD9rSRKCujl/yI6wd0j2OkUmiRrruz1W1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rT3cLlYU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A98C4CEF5;
	Wed, 17 Dec 2025 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765977731;
	bh=iXiSmYCHNO4aL+u4qy0Fy2fLpin+IvdRnbTAhB39BH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rT3cLlYURVTwDQbVUGAWhceqc5LgoYZidB7IEgaBjQ4EwwmchGNFPemEvwKxqOebZ
	 TtqUvq7DjldfZVsvzJu69pGtPlBhjSDoxbf0PVfEM0NJeQGMEsZ8OxDP8hrPtu5gwG
	 Rf54PhNuA1b+mUWVpr1YAoxdyt6iVR9+i7u6Cdoo=
Date: Wed, 17 Dec 2025 14:22:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: ehci-omap: Fix missing usb_phy_init() error
 handling
Message-ID: <2025121757-hazelnut-oxymoron-19ed@gregkh>
References: <20251202080027.1124-1-vulab@iscas.ac.cn>
 <20251203034741.461-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203034741.461-1-vulab@iscas.ac.cn>

On Wed, Dec 03, 2025 at 11:28:22AM +0800, Haotian Zhang wrote:
> usb_phy_init() may fail if the PHY clock or regulator setup fails,
> but ehci_hcd_omap_probe() does not check its return value,
> potentially causing later operations to act on an uninitialized PHY.
> Original cleanup also calls usb_phy_shutdown() on uninitialized
> PHYs, which is unsafe.
> 
> Add proper error checking for usb_phy_init() calls. Add a new
> error label to properly remove the hcd. Use local bool array to
> track successfully initialized PHYs, only shutdown properly
> initialized PHYs during cleanup.
> 
> Fixes: 4e5c9e6fa2d2 ("USB: ehci-omap: Tweak PHY initialization sequence")
> Fixes: 49f092198f4f ("USB: ehci-omap: Fix detection in HSIC mode")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
>   -Add a local bool array to track successfully initialized PHYs.
>   -Check if PHY is successfully initialized before
>    calling usb_phy_shutdown().
> ---
>  drivers/usb/host/ehci-omap.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)

Again, how was this found and tested?

thanks,

greg k-h

