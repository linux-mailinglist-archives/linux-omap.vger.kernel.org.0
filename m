Return-Path: <linux-omap+bounces-3295-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6CEA373CD
	for <lists+linux-omap@lfdr.de>; Sun, 16 Feb 2025 11:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCB8C7A362E
	for <lists+linux-omap@lfdr.de>; Sun, 16 Feb 2025 10:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9BC18DB19;
	Sun, 16 Feb 2025 10:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="K+An97/r"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B41487C8;
	Sun, 16 Feb 2025 10:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739701658; cv=pass; b=X3gtZYkflRIX5jlP43ZHkasSopPMgHeg81XzWayjre6UFF6oqvCTWYVpwdfWIOdO+NEWw4pVkvcIMIY3dNiv0OlnGjKKQlUAEW43qPw6gml3Or7+G4q9m62psST8nLIlFfqWRyZ0nqQjUrLogWWj7drBvMTdiKQGPAW98xdXEb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739701658; c=relaxed/simple;
	bh=ZJVKciOgP7PmjbwdZRxbXiNIcAo73yiYS1lbDWwoIfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8kQ00jCNwypYdevGyiBb27/Xl5cShgfFfDcALMX3xPQLlYbdeQUsB3BwWT8o79Ct/2xufrUy5flnFavl+vkdfwf3Kt1P9fzrS/Q/9RLfg7/dHpbLqHjPDpQfsSVG0lpb+chApvSaI/oxJZP2DmlXZLhb6LZGM8TRWa0JBEXWro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=K+An97/r; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Ywhmz4Kyhz49Pwk;
	Sun, 16 Feb 2025 12:27:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1739701653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UDdI7fW/FRxm0SJsuY4wz4Lj3XvYXPcwSHR/kIT/08=;
	b=K+An97/rQeUnbTmrWPrvvfYWYEb0ba6S0P++RyswK5SuQfvgm3ptDEKeMwntqCAuCHjpEl
	U17q8hUo8bRKpnVdbJqr+t3yq76iR+EpSg2kk0kEnbb4DM1gYLd+lRWs3ssHf7pUa+mQPT
	xndl+4EeWuMmGCLN41AIzujd2Ds0DaSwvJG1Qk89L3TATKXW17W6NqGCsX/exoA+37rbgg
	v4DiGTVcaDbqW36C/fBL0V31iCP98EESFsRzL/7g1ubE3ZQIstdC/9o42TIFbEd4cETOUQ
	LTHyNXFiZXXdD/8d8GdF7cU7MzzF9ufSdxqpaXlzMd4kTcWEnuQRwWHZOmL5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1739701653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UDdI7fW/FRxm0SJsuY4wz4Lj3XvYXPcwSHR/kIT/08=;
	b=VJOMQUOJqf5983pAmXgu3K/uH+noiSsRM2knVL/ON9EbWzS6A6hSQgNFK7l8e9+dvostFq
	EPmfj7+Mz3OP+2dRWdfP3h0wcqqyXBPuq2w62LRQrFx4EKiGgVHcV290GYmPwsR1m/b+yJ
	WAYgeO+of8dZ6Qc1ad5OwkFfdIdM79QQgSJGg+M/6JyD0kQ7ZiUtEs0Aw66WYiVUpolagY
	TTrtRS5YCTrygiy3u9EhqEBWqc/dUbNglQsGvfTU/QGSyy8s506Dkffx/zFvGdH8R+m2uV
	fylchr+47fBYNb72TEVe3fLxEaMTsBszCvph+JuHlsOSCMfwWP5hEUsrR/fjnQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1739701653; a=rsa-sha256;
	cv=none;
	b=ZBJ56CB07Z+z1S8bIb+4rr4vRBy8w5OVBoISiy3QMAVjzbBtBLc5Y1soyYHWX8fOb6mCdY
	jbiZ5urA6n9O3nnnQGXoNeLv8TR3PTkyEQA4rh0DZOZ3v0PQgKLzTOiThP7zB3sZ+nCeYk
	Xa4cFZEijGV377BvPEslHroBqWnxDMsTLaqGhdsWkl3XJdX9Gr63F4Zq5WRHkjYKhUkJV8
	KyZCnWKQsA2yN8oIm5dk2UP4KgYwtRJMG3Xq8f8MPnzc1zwww/bql+32zYq+jDnDRQUKFC
	OLlM+FWzb9oIH6DLu6045YxYhnmbdl58TNcn/MbSxONjf06B1bw5MTRzyNAu/Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35F8A634C93;
	Sun, 16 Feb 2025 12:27:30 +0200 (EET)
Date: Sun, 16 Feb 2025 10:27:30 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sicelo <absicsz@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org, will@kernel.org, mchehab@kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org, hns@goldelico.com,
	b-padhi@ti.com, andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: omap3isp: Handle ARM dma_iommu_mapping
Message-ID: <Z7G9kkYgvWQu2xPa@valkosipuli.retiisi.eu>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <34542c9552ce8cd12a5c292e79589acd964075d5.1730136799.git.robin.murphy@arm.com>
 <Z7A61N13dZpu53xI@tp440p.steeds.sam>
 <20250215194328.GF12632@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215194328.GF12632@pendragon.ideasonboard.com>

Hi Laurent, others,

On Sat, Feb 15, 2025 at 09:43:28PM +0200, Laurent Pinchart wrote:
> CC'ing Sakari.
> 
> Sakari, would you pick this patch ?

Thanks! I wonder what happened -- it wasn't visible in Linuxtv.org
Patchwork but could be found via the message id.

It's in my tree now.

> 
> On Sat, Feb 15, 2025 at 08:57:24AM +0200, Sicelo wrote:
> > On Mon, Oct 28, 2024 at 05:58:36PM +0000, Robin Murphy wrote:
> > > It's no longer practical for the OMAP IOMMU driver to trick
> > > arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> > > same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> > > the arch code's dma_iommu_mapping out of the way to avoid problems.
> > > 
> > > Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > >  drivers/media/platform/ti/omap3isp/isp.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> > > index 91101ba88ef0..b2210841a320 100644
> > > --- a/drivers/media/platform/ti/omap3isp/isp.c
> > > +++ b/drivers/media/platform/ti/omap3isp/isp.c
> > > @@ -1961,6 +1961,13 @@ static int isp_attach_iommu(struct isp_device *isp)
> > >  	struct dma_iommu_mapping *mapping;
> > >  	int ret;
> > >  
> > > +	/* We always want to replace any default mapping from the arch code */
> > > +	mapping = to_dma_iommu_mapping(isp->dev);
> > > +	if (mapping) {
> > > +		arm_iommu_detach_device(isp->dev);
> > > +		arm_iommu_release_mapping(mapping);
> > > +	}
> > > +
> > >  	/*
> > >  	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
> > >  	 * VAs. This will allocate a corresponding IOMMU domain.
> > > -- 
> > > 2.39.2.101.g768bb238c484.dirty
> > > 
> > 
> > I have finally found time to test this patch on the Nokia N900 and can
> > confirm it is working fine.
> > 
> > I was wondering - is there a reason that it is not merged yet? I tested
> > on 6.14-rc2, which did not have it, and notice it is also not in
> > linux-next.
> > 
> > If it helps:
> > 
> > Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> 

-- 
Regards,

Sakari Ailus

