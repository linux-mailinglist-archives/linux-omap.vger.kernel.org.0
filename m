Return-Path: <linux-omap+bounces-1495-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 195C98FF54C
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 21:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04FDB1C24759
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 19:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442744AECB;
	Thu,  6 Jun 2024 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Kt7dO5PL"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F823F9C5;
	Thu,  6 Jun 2024 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717702337; cv=pass; b=mhn2W7RZIiRhsUoWEkVL7m0reXgxjQZs4207v0ENzcEw1ju0fBAoygqf2xCbEZR6chGvY0ZvqBSF9qn4pzc7b7khqnmHIbIeDfoP2fjU11oJOnt7wx5Jyr2D1PAkCIGuf1RBjwUUTqmI7l+KDoiJ7yVDIdfjQeHvwO351KTsfno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717702337; c=relaxed/simple;
	bh=mO+1Ftxqq4589VdeFMJmWCGzaDlSTAJ0LpbFsraI4QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLHCatCXxiFcJzWLj4/LObM6LIjj46CHqqnkL1oMh8/bdqLSBivdD+3gAYB50zTZVcPf3RQUWdgps6dq+7FSvxfJ8iGcCxtYOskzE4CK6WGYDzjH78gvEDhYUM+CLZau8BHBbS8BkCyoeW/eIecDnlh47vlSoSVPaD+hXoTJ/aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Kt7dO5PL; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-74-208-nat.elisa-mobile.fi [85.76.74.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VwDx01NqGz49Pyc;
	Thu,  6 Jun 2024 22:32:03 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1717702325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fOE5refhVYmgYhGy/7BLh0kzb17xpI98nmAMDjYzLKk=;
	b=Kt7dO5PL+hAKAO7BMWL4c3Pkg8E06WDDg43ZVGvQKzppz67Ek3f56ft6xc+GDcfiEOSG7i
	8vNJExCYRzB8vxTvbGpqdTbXe7QFTClAp9+vQvBEoiPJm5Fr25T4vpoMjXGfk+UG6E26bk
	AEaM0wg4fsJRGvzB+yU6PR14+e8UM6FFXogzh7hxRULPw8tB8E7M4yyiYi66kVI7g3O5jI
	cwnKEfQy3+Ed39zTE6qw2eqWOOd1dBcpv0MM2Y5Ot/0rG8YwewzcaAyIsH5SJJbqwNPcPo
	eyEBF2D9IQfYPTsxPTkPyj8rhTFC0DqSXDGQkCJvb55Gev2JuArZn/ZGLJJDSg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1717702325; a=rsa-sha256;
	cv=none;
	b=dzh622iDqYoZExWNbWR9X5ptuh+zwWIpoldjUDA6qx4L8XNllbPeOxlGfVYVli3GwrGheR
	7Ke9nK6XyU97zMiT6uCWhcCP1TNiC1GSpbX1KePm/Eygw0tjR9Qs+JE0q40JYVdi7M0AT4
	BIEtSkr7zmxiVwjBMvz4ABg/4WBOt4o+jHHazGpO7i4XZ6U8mrSW9BtvnEtG+D7JLwpE9l
	f9Y4zP+MFS4WcVXIpHJdzohRv4rKusyAW0DHv4OrmdB9JzTnBekYI+Eq0VEcUYC9oDkPYl
	DijkOA8mX6kwsSJijXjW4S6jMkBBentwtfh2K5wielvsBW9AI9yJ0RdnrPzo2w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1717702325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fOE5refhVYmgYhGy/7BLh0kzb17xpI98nmAMDjYzLKk=;
	b=ouH9XyFr2tNubzCLbPdeafXegjPI/fPROf1AeHoPqgXuB5xG+TsO3D14uYqrDzHxagDHdg
	RXrLdHu+JcFWZzrBm6KzrKXQvqY+ezUFtxg0f2Imn7qM4Ac8bax207NELbZwBpO8AEryOi
	mtaBX1j8djKOPaHHeQcw94knySbuS1Wc7Z+Z6PRFhuwh2PVYfcU4xmjqQCyCWR/XSl4Sls
	Yp69NqOeOe4VebB0qpt4rurhcFwO1QIZQoCDh2nB6nF8K8jx5II7umMRLyCKriz2CJY8rs
	NRfPbYFGrhMJVweKmD/5JOrQqjyI9w9GN8zwO7cxi7DmfSWLIaN+E05hajYamw==
Date: Thu, 6 Jun 2024 22:32:02 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v1 1/1] ARM: omap2: Switch to use kmemdup_array()
Message-ID: <20240606193202.GD9487@darkstar.musicnaut.iki.fi>
References: <20240606165104.3031737-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165104.3031737-1-andriy.shevchenko@linux.intel.com>

Hi,

On Thu, Jun 06, 2024 at 07:51:04PM +0300, Andy Shevchenko wrote:
> Let the kememdup_array() take care about multiplication and possible

          ^^^^^
          Typo.

> overflows.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/arm/mach-omap2/omap_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
> index fca7869c8075..800980057373 100644
> --- a/arch/arm/mach-omap2/omap_device.c
> +++ b/arch/arm/mach-omap2/omap_device.c
> @@ -315,7 +315,7 @@ static struct omap_device *omap_device_alloc(struct platform_device *pdev,
>  
>  	od->hwmods_cnt = oh_cnt;
>  
> -	hwmods = kmemdup(ohs, sizeof(struct omap_hwmod *) * oh_cnt, GFP_KERNEL);
> +	hwmods = kmemdup_array(ohs, oh_cnt, sizeof(*hwmods), GFP_KERNEL);

Maybe same result, but I guess the 3rd parameter should be count?

A.

