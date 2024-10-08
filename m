Return-Path: <linux-omap+bounces-2345-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E1E9950D5
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 16:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776B01F258AA
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 14:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5821DF244;
	Tue,  8 Oct 2024 14:00:22 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D131DED55
	for <linux-omap@vger.kernel.org>; Tue,  8 Oct 2024 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396022; cv=none; b=LKZbl6Uc3ijB1b+ubAvWsCBq5vZD5mUJMxUaRvw8pWTdbFjbdNramgX5RvJ08wFzqh2fmrtRYrHLmoQBbE3GRqjYuE/J2a9NtR/nqrQDAmtwKHbpQztJJ+THtj6TD2vRw4dDv9P0aa765YwBNGafKT8somZWLERQJ/byKhTVrw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396022; c=relaxed/simple;
	bh=D5b/vTNmHezYmt1DXe6RoyKgOQI4inWxD1AEe+j+v2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/qM4kdq4lBC6Qn/DxX77K0G0F2eKrbRn3P3dibCTKlvOC4dgB+bjisfBbKMJKDKkCj6u8QRJJkOQQyjgkFZvmxBJpF1oSZCwMw0wsSzx+dQs2PpDcOMGwdVKitsvktxEGHKg6Qr1CGpbK5ghte18RzWQxa6ugoz4eOkmrG2cF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE3C0DA7;
	Tue,  8 Oct 2024 07:00:49 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CD4B3F58B;
	Tue,  8 Oct 2024 07:00:19 -0700 (PDT)
Message-ID: <10d3a86c-d7a8-4ac5-8ad3-010a91c0a25f@arm.com>
Date: Tue, 8 Oct 2024 15:00:17 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/omap: Don't register ops by fwnode
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 Beleswar Padhi <b-padhi@ti.com>, Andreas Kemnade <andreas@kemnade.info>
References: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
 <2863ACA9-2836-49F6-9D85-749CE480804D@goldelico.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <2863ACA9-2836-49F6-9D85-749CE480804D@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 2:32 pm, H. Nikolaus Schaller wrote:
> Hi Robin,
> 
>> Am 08.10.2024 um 15:17 schrieb Robin Murphy <robin.murphy@arm.com>:
>>
>> The OMAP driver still has its own traditional firmware parsing and
>> instance handling in omap_iommu_probe_device(), rather than using the
>> generic fwnode-based paths. However, it also passes a hwdev to
>> iommu_device_register(), thus registering a fwnode for each ops
>> instance, wherein __iommu_probe_device() then fails to find matching ops
>> for a client device with no fwspec and thus a NULL iommu_fwnode.
>>
>> Since omap-iommu is not known to coexist with any other IOMMU hardware
>> and shares the same ops between all instances, we can reasonably remove
>> the hwdev/fwnode registration to put it back into "legacy" mode where
>> the ops are effectively global and ->probe_device remains responsible
>> for filtering individual clients.
>>
>> Reported-by: Beleswar Padhi <b-padhi@ti.com>
>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Fixes: 17de3f5fdd35 ("iommu: Retire bus ops")
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>> drivers/iommu/omap-iommu.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
>> index c9528065a59a..425ae8e551dc 100644
>> --- a/drivers/iommu/omap-iommu.c
>> +++ b/drivers/iommu/omap-iommu.c
>> @@ -1230,7 +1230,7 @@ static int omap_iommu_probe(struct platform_device *pdev)
>> if (err)
>> return err;
>>
>> - err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
>> + err = iommu_device_register(&obj->iommu, &omap_iommu_ops, NULL);
> 
> Thanks for this proposal, but this prevents my OMAP3 system completely
> from booting (at least with v6.8-rc1):
> 
> ## Booting kernel from Legacy Image at 82000000 ...
>     Image Name:   Linux-6.8.0-rc1-letux+
>     Image Type:   ARM Linux Kernel Image (uncompressed)
>     Data Size:    6491520 Bytes = 6.2 MiB
>     Load Address: 80008000
>     Entry Point:  80008000
>     Verifying Checksum ... OK
> ## Flattened Device Tree blob at 81c00000
>     Booting using the fdt blob at 0x81c00000
>     Loading Kernel Image ... OK
>     Using Device Tree in place at 81c00000, end 81c1fe8e
> 
> Starting kernel ...
> 
> --- no further reaction --

Urgh... is it possible to get earlycon/ealyprintk output on this platform?

As a stab in the dark by inspection, there might potentially be some 
interaction with "iommu: Move bus setup to IOMMU device registration" as 
well, for which the additional diff below might help...

Thanks,
Robin.

---->8----
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 425ae8e551dc..9112178e22d8 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1691,7 +1691,8 @@ static struct iommu_device 
*omap_iommu_probe_device(struct device *dev)
  		if (!oiommu) {
  			of_node_put(np);
  			kfree(arch_data);
-			return ERR_PTR(-EINVAL);
+			/* Not fatal, will re-probe once the right instance registers itself */
+			return ERR_PTR(-ENODEV);
  		}

  		tmp->iommu_dev = oiommu;


> 
> As far as I see, all relevant devices are in the iommu_device_list but
> only omap3.isp is really using iommu. So some other devices may fail by
> this change.
> 
> BR,
> Nikolaus
> 

