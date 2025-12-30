Return-Path: <linux-omap+bounces-5291-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F226CE8F84
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 09:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B9BB30169AA
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 08:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5654E2FD696;
	Tue, 30 Dec 2025 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iq0D/MjB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B141519B4;
	Tue, 30 Dec 2025 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767081911; cv=none; b=hgH16g1UVjvuwNMgZ/tk+jKCQ5BPCZfJ4K8tj5XCQI6NCMnLKm3jtmz0g/nwstMWPdYbdsHDw+bNGddDNOzt9x0c0NHpW+THC3ARaxiTQiAlxSFHELKxC64Suy15vadOWQ5LO86leSSZz1G9Og/qPSiavSv6EE3f4GaF6JtNFNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767081911; c=relaxed/simple;
	bh=GnoT2BMbxd3I8fElj3TLKeZfmfLN5pOG7eddMq5a8hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceiG3AuQduKldRBPY1t4CwZE8cK9C5Ml84ZRCJopQSEu6EYZcBo1Qz+057+p/8NwPa/YCbys9HlJSZKz41GXNGn0ZhwvGJIE0/XiDBTlzYZclDfi9+BEz612rmw0lj/gEcsnumEs/kpRazivkr7VuAG+Ds0K/lrYsJenxikt5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iq0D/MjB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE603C4CEFB;
	Tue, 30 Dec 2025 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767081909;
	bh=GnoT2BMbxd3I8fElj3TLKeZfmfLN5pOG7eddMq5a8hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iq0D/MjBWQz9DUMUB9AsqfVzilTE8AKDRVQfpRnAP1AUZzjck1gTOOP9ZHzudcTiB
	 cVWSBMYf+lwF6AYa/utjRvfttuIcPayMTc9VtpJlMygTfDi/4UbSOdhE+WIFid90Tj
	 t4dZ94GCWeJ1czarOSGsp3gxP5jO2DjZKVD+xtA8ybEU9DHSWtGAyg2PbugM+21gOi
	 oo+AVuoilQQQZlP8Z06tViQm8kfTUKEq1oCx06XNJ24u4D0T+fJu1HYrOCXOWdBCZY
	 MKusSGQYrZjt+xZ2fH20KZenSy81XKp+jp/yEypYM1e/CZL/nzj0d7bGD4TYLfgM5o
	 u9YJ3AlsjElPg==
Date: Tue, 30 Dec 2025 09:05:04 +0100
From: Helge Deller <deller@kernel.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Message-ID: <aVOHsFXNx_wzG_yg@carbonx1>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-4-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-4-chintanlike@gmail.com>

* Chintan Patel <chintanlike@gmail.com>:
> omapfb provides several sysfs interfaces for framebuffer configuration
> and debugging, but these are not required for the core driver.
> 
> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() to obtain the backing device at runtime.
> When FB_DEVICE is disabled, sysfs operations are skipped while the code
> still builds and is type-checked.
> 
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>

Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>  drivers/video/fbdev/omap2/omapfb/Kconfig        |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 16 ++++++++++++----
>  2 files changed, 14 insertions(+), 5 deletions(-)

