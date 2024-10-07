Return-Path: <linux-omap+bounces-2332-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86398992E27
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 16:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7A8B1C2319A
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 14:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869A91D47B0;
	Mon,  7 Oct 2024 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="d7+yFab5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705421D0E28;
	Mon,  7 Oct 2024 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309702; cv=none; b=KIDPgUpfqFAD/f5mrwNd33qEdlTO0Oa6ZSadNdY/C2bZ2UeLjVBlp9xfQziJccdb2ikHYiOj9n17BJIlzG9ltSyPSsj2JpEUd8sJ2JOAE4K7XnxFoszIzyk3If7UtFVrPlkiB19mtVsRR5xW8+pl8gEAlVFEmk8QOqWpNJ8oHpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309702; c=relaxed/simple;
	bh=TGNBvXv5GdnuZXYESbXAbUXlqCTDqooqVT0JqLsxwO4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vC7Y8yYOCXXwlYeum/xftYsQ/bHC+iHNiqclXLbvy9up2lalAOOupIu85n77jPsibNnFjkx+D/RLFd3J/JHQkVbvac9X9KvCZ5N7X48h6NMwLDNwCZ9gu110vCqFttCBVB8izEdP0FcOLHPZiWQ9g90sU9JL5+9ftIYgrRa4M4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=d7+yFab5; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=s+sWyptH5zwn7B6MGAg1sDLpBfEjPE/ay3qeZ2Ms1FQ=; b=d7+yFab5GVjH2DPMMpnupKa7dK
	Bw8FKKy5OK+IH96c6DCk+h/hBImCixIr+a/lz88Z16YcI9oxIZwHd3JlX9GVFvXI0AzUcZajxrPgO
	TSul9dE0V0LaHlsQt49ZJxb0Yr4ca22y38M6uswzz/I8plpUdEsxalxT5H2YcxICyG1Tx5DsKXO3I
	DqfBz8rWzHkqId2Qp81+xdEHTFyLA4geGJM4LyqQ+yF6aRaBb2YFIJOBE3nC9oAr6Qwd18e5ovd4q
	h02SfAC1q4Ev9dqlNFo52Ak2gDaQGxb9GLzHhqhv7KAGsUQeF6iLlz2B2dUeO6Irtnzg2ZuCJIn2q
	qDhO67dw==;
Date: Mon, 7 Oct 2024 16:01:17 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Robin Murphy
 <robin.murphy@arm.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Christoph Hellwig <hch@lst.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Joerg
 Roedel <jroedel@suse.de>, tony Lindgren <tony@atomide.com>, Linux-OMAP
 <linux-omap@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org
Subject: Re: BUG: "iommu: Retire bus ops" breaks omap-iommu and omap3isp
Message-ID: <20241007160117.55d6af74@akair>
In-Reply-To: <20241007121543.GM1365916@nvidia.com>
References: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
	<20241007121543.GM1365916@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 7 Oct 2024 09:15:43 -0300
schrieb Jason Gunthorpe <jgg@nvidia.com>:

> On Sun, Oct 06, 2024 at 09:40:00AM +0200, H. Nikolaus Schaller wrote:
> > Hi,
> > 
> > I found that the camera on our OMAP3 based system (GTA04) stopped
> > working with v6.8-rc1. There was no bug in the camera driver but
> > the OMAP3 ISP (image signal processor) emits
> > 
> > [   14.963684] omap3isp 480bc000.isp: failed to create ARM IOMMU
> > mapping [   15.010192] omap3isp 480bc000.isp: unable to attach to
> > IOMMU [   15.023376] omap3isp 480bc000.isp: isp_xclk_set_rate:
> > cam_xclka set to 24685714 Hz (div 7) [   15.065399] omap3isp: probe
> > of 480bc000.isp failed with error -12
> > 
> > Deeper analyses lead to this patch breaking operation. It is not
> > fixed up to v6.12-rc1.
> > 
> > What seems to happen (in 6.8-rc1 code):
> > 
> > - omap_iommu_probe() passes &omap_iommu_ops to
> > iommu_device_register()
> > - iommu_device_register() stores the ops in iommu->ops (only)
> > - __iommu_probe_device tries to read the ops from some fw_spec but
> > not iommu->ops  
> 
> Maybe like this?
> 
> @@ -1233,6 +1233,12 @@ static int omap_iommu_probe(struct
> platform_device *pdev) err = iommu_device_register(&obj->iommu,
> &omap_iommu_ops, &pdev->dev); if (err)
>                         goto out_sysfs;
> +               /*
> +                * omap has a DT reprensetation but can't use the
> common DT
> +                * code. Setting fwnode to NULL causes probe to be
> called for
> +                * every device.
> +                */
> +               obj->iommu.fwnode = NULL;
>                 obj->has_iommu_driver = true;
>         }
> 
hmm, that looks nice for a regression fix.

Does it make sense to adopt dt so that the common code can be used to
ease future maintenance?

Regards,
Andreas

