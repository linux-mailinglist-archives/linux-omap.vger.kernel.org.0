Return-Path: <linux-omap+bounces-3294-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9EA37075
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2025 20:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53C10167C14
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2025 19:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E1F1F78E6;
	Sat, 15 Feb 2025 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ciXV6QQK"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B09178F4B;
	Sat, 15 Feb 2025 19:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739648630; cv=none; b=RY7vpTXneXlR26wOt15Eu9BTTXeVs4j2zvT2a4fjP5tkJm+kifTErhnM3pEB0NKXEURVICwP6aa+TLp4HQZpyfiKTEdMlsbcq42L6DpbNLax2819rrONNQ2Odd1HIjWHIskLDvMf3T0R5y541NZ57DFwvwMDtovz4rVw0+2wiqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739648630; c=relaxed/simple;
	bh=aqlKCwiWQwaADZiGJGLwvMY4WxGCqqgsu+/fFmoalpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePdADfXzD5AI3HtheL7fvA46J6WYQCDO+Yx/5VskD61OMYqSzYeHWVBXZdOWWdpmlFO79yfgDBPNzg8cGVClOwJyG9JAS0uEOOg8Zg06Zh+3870/NlJ1Z/xmxXWHlt0sBVYD9882GfjdcL5ykbb4k0Q8DR8QrP18D1ZlBJBXkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ciXV6QQK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8268578E;
	Sat, 15 Feb 2025 20:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739648540;
	bh=aqlKCwiWQwaADZiGJGLwvMY4WxGCqqgsu+/fFmoalpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciXV6QQKMNabAtWB71rKDXbANKJy2yaHJYmQjmMfOW/mo7VsdeM/SZ/3d1dZryChw
	 8BHpgt6jUkPX/KKqqAxmgFrGHJD9ATWgivTFS68lFAREsNfcSAI2chxrmL/tvhFWfz
	 k9YWROuZQxMg5m1R16mm9aeJ7fRWKHXVGSdIUrUY=
Date: Sat, 15 Feb 2025 21:43:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sicelo <absicsz@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
	mchehab@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, hns@goldelico.com, b-padhi@ti.com,
	andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/4] media: omap3isp: Handle ARM dma_iommu_mapping
Message-ID: <20250215194328.GF12632@pendragon.ideasonboard.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <34542c9552ce8cd12a5c292e79589acd964075d5.1730136799.git.robin.murphy@arm.com>
 <Z7A61N13dZpu53xI@tp440p.steeds.sam>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7A61N13dZpu53xI@tp440p.steeds.sam>

CC'ing Sakari.

Sakari, would you pick this patch ?

On Sat, Feb 15, 2025 at 08:57:24AM +0200, Sicelo wrote:
> On Mon, Oct 28, 2024 at 05:58:36PM +0000, Robin Murphy wrote:
> > It's no longer practical for the OMAP IOMMU driver to trick
> > arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> > same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> > the arch code's dma_iommu_mapping out of the way to avoid problems.
> > 
> > Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> >  drivers/media/platform/ti/omap3isp/isp.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> > index 91101ba88ef0..b2210841a320 100644
> > --- a/drivers/media/platform/ti/omap3isp/isp.c
> > +++ b/drivers/media/platform/ti/omap3isp/isp.c
> > @@ -1961,6 +1961,13 @@ static int isp_attach_iommu(struct isp_device *isp)
> >  	struct dma_iommu_mapping *mapping;
> >  	int ret;
> >  
> > +	/* We always want to replace any default mapping from the arch code */
> > +	mapping = to_dma_iommu_mapping(isp->dev);
> > +	if (mapping) {
> > +		arm_iommu_detach_device(isp->dev);
> > +		arm_iommu_release_mapping(mapping);
> > +	}
> > +
> >  	/*
> >  	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
> >  	 * VAs. This will allocate a corresponding IOMMU domain.
> > -- 
> > 2.39.2.101.g768bb238c484.dirty
> > 
> 
> I have finally found time to test this patch on the Nokia N900 and can
> confirm it is working fine.
> 
> I was wondering - is there a reason that it is not merged yet? I tested
> on 6.14-rc2, which did not have it, and notice it is also not in
> linux-next.
> 
> If it helps:
> 
> Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>

-- 
Regards,

Laurent Pinchart

