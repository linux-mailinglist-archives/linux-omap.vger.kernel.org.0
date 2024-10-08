Return-Path: <linux-omap+bounces-2341-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEECD994854
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 14:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2F3283F20
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 12:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304331DE3AE;
	Tue,  8 Oct 2024 12:11:57 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849FF1CF297;
	Tue,  8 Oct 2024 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389516; cv=none; b=qT4UXyfDj14vQsnQ8HQEewcYzTqAaDf06sK9uL44v8OB/ERtmUEHmzCK4J0nKzvsChkyZk9/bN8elaaMp59OakVcF2splJnR6AlYbK6xhuubpy3KlM+0kvZefJN5+yD9ZSzbG2+FnO2ejN9Cv9Zt6TnvP3rH64AcZQHECT8XdAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389516; c=relaxed/simple;
	bh=dtox1i7aL8aeULYxlgyJkmX3+4u0wBN20TMKNgfa4Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgfchdDrRvERd7sIg76CBjbPoWoRYW394MXsPyvnJ+QltLK3aytYiL+D5dx54mhYaUtqgw5YrGIWgMDIFpXHElfSudtLYoBejOdPzkavtEhsaAY/Ul9XayczjKcKl+2dWFCjOC1/T3bPA2eMglZ8/fetcgGaqj8zPGNDnZ6N8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74E9ADA7;
	Tue,  8 Oct 2024 05:12:23 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFDC23F73F;
	Tue,  8 Oct 2024 05:11:51 -0700 (PDT)
Message-ID: <10bb6bbf-b7d0-4da5-8f30-0990748493f0@arm.com>
Date: Tue, 8 Oct 2024 13:11:49 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: "iommu: Retire bus ops" breaks omap-iommu and omap3isp
To: Jason Gunthorpe <jgg@nvidia.com>, "H. Nikolaus Schaller"
 <hns@goldelico.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Joerg Roedel <jroedel@suse.de>, tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org
References: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
 <20241007121543.GM1365916@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241007121543.GM1365916@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2024 1:15 pm, Jason Gunthorpe wrote:
> On Sun, Oct 06, 2024 at 09:40:00AM +0200, H. Nikolaus Schaller wrote:
>> Hi,
>>
>> I found that the camera on our OMAP3 based system (GTA04) stopped working with v6.8-rc1.
>> There was no bug in the camera driver but the OMAP3 ISP (image signal processor) emits
>>
>> [   14.963684] omap3isp 480bc000.isp: failed to create ARM IOMMU mapping
>> [   15.010192] omap3isp 480bc000.isp: unable to attach to IOMMU
>> [   15.023376] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set to 24685714 Hz (div 7)
>> [   15.065399] omap3isp: probe of 480bc000.isp failed with error -12
>>
>> Deeper analyses lead to this patch breaking operation. It is not fixed up to v6.12-rc1.
>>
>> What seems to happen (in 6.8-rc1 code):
>>
>> - omap_iommu_probe() passes &omap_iommu_ops to iommu_device_register()
>> - iommu_device_register() stores the ops in iommu->ops (only)
>> - __iommu_probe_device tries to read the ops from some fw_spec but not iommu->ops
> 
> Maybe like this?
> 
> @@ -1233,6 +1233,12 @@ static int omap_iommu_probe(struct platform_device *pdev)
>                  err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);

Nope, just s/&pdev->dev/NULL/ here. Apologies for overlooking this.

Thanks,
Robin.

>                  if (err)
>                          goto out_sysfs;
> +               /*
> +                * omap has a DT reprensetation but can't use the common DT
> +                * code. Setting fwnode to NULL causes probe to be called for
> +                * every device.
> +                */
> +               obj->iommu.fwnode = NULL;
>                  obj->has_iommu_driver = true;
>          }
> 
> Jason

