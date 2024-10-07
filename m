Return-Path: <linux-omap+bounces-2339-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CEA993351
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 18:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BB801F23527
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 16:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E984C1DB34A;
	Mon,  7 Oct 2024 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="QbPlBce7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DF412E75;
	Mon,  7 Oct 2024 16:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318729; cv=none; b=PNkmH/qbnNpunWh4cIYw0z8mdgAT+ECXXgi/e5MROqAfLS0H8CLwl/8uNV08k9rfrodWQETIhNC72J2CQsNpUmQ0pL79w5TL9AZFGW8WJr9lZlFWW4RJmFN2uwDXvvvoxB4r/qXmuL3oWhLgUsWoFW6Eld8JEaRjrihamEoVjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318729; c=relaxed/simple;
	bh=VjtvSTNdYXrAjAQPaS2aqcxVJMUYHBsXG09AkWe3ZWI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lt/acSliBMc0/hjlJATp3s6SdP3QxdUXhfBMTiOa9Ozu2sH8MoowwWXzaKxpfEPeK4+GKQdAC7Vsp5idoyUoRggUggCE2yidbk4H9QzNz54PJcgY1qZ6fDjiRVq/KW3rkpEt2kXVCUrmvQA+LjyX0YRK368nufTxmc7SMAAadpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=QbPlBce7; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rnPvO7Dxi7cMsTUnl6ZIPoL6TSUaVMQMLcKbkYrEPaE=; b=QbPlBce7W+iFJ+T2v9ODULwfUS
	OcAHQNBsSlDrfhX06m1/OzFGwjwbFnpXJtuy0cmHapSdWfrJ8MHzQ15cwr2zDCb7f0mWwicSgwplJ
	y5OdYfzdnP0HpLv4f7dKQWbrzfbJBmxGrsD4WT7Zk6MB9kTWKFeCYj0yIIY8+evmP67Hvi8lXiZT+
	4ad+wkqg/8ECVmmutxOpTTxg+RCTOJ/Eet6WijpYlt18oMmEBJRHTyD6eEuVTsvAzSv4BGDlMpveb
	S3MW8t/pThWqd6FHz49XLBZoBBQGiNTKiqScetzuOtWEO1XJmEUD/x8bGtv8+Z0bx63z9N0/c1seF
	f9HosW1A==;
Date: Mon, 7 Oct 2024 18:31:53 +0200
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
Message-ID: <20241007183153.6daa419d@akair>
In-Reply-To: <20241007144824.GS1365916@nvidia.com>
References: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
	<20241007121543.GM1365916@nvidia.com>
	<20241007160117.55d6af74@akair>
	<20241007144824.GS1365916@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 7 Oct 2024 11:48:24 -0300
schrieb Jason Gunthorpe <jgg@nvidia.com>:

> On Mon, Oct 07, 2024 at 04:01:17PM +0200, Andreas Kemnade wrote:
> > > @@ -1233,6 +1233,12 @@ static int omap_iommu_probe(struct
> > > platform_device *pdev) err = iommu_device_register(&obj->iommu,
> > > &omap_iommu_ops, &pdev->dev); if (err)
> > >                         goto out_sysfs;
> > > +               /*
> > > +                * omap has a DT reprensetation but can't use the
> > > common DT
> > > +                * code. Setting fwnode to NULL causes probe to be
> > > called for
> > > +                * every device.
> > > +                */
> > > +               obj->iommu.fwnode = NULL;
> > >                 obj->has_iommu_driver = true;
> > >         }
> > >   
> > hmm, that looks nice for a regression fix.
> > 
> > Does it make sense to adopt dt so that the common code can be used
> > to ease future maintenance?  
> 
> It would be nice, but I recall omap doesn't use the standard dt
> layout?
> 
that is what is said in the comment. But what is missing? Is it one or
two properties at one place, or is it turing everything upside-down?

Regards,
Andreas

