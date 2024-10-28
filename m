Return-Path: <linux-omap+bounces-2491-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C19B358A
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 16:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B06FF1C21F7E
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 15:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADB11DE892;
	Mon, 28 Oct 2024 15:58:57 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDFF1DE885
	for <linux-omap@vger.kernel.org>; Mon, 28 Oct 2024 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131137; cv=none; b=RIPwVggif4+l5OVV1ePBgtsodm0Zm+YN58rLFlLMp2EEubUsqW6/MH4gMvmwHXXYzYHM7y5nPQA1VoVOUcAY4yvZjpIZn/OitkMEiTMWail+sMg4dyyneabklGfQcGtFgN0fLzY18Ci6uYFC8CKJTz2+2jhf5Qg4Yg7lyVXlT6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131137; c=relaxed/simple;
	bh=/MshvjACWnxUNhjugoOtI7n8b/8Px1wYEMoFAXQ+Cok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eChVR9pCFwKW9SqJOTrscT9NY3xEPDNPXqAxmkcdRPKrrE99kIXaHfgn3qXvB2zgfxw8U682ks3Rg0pdLYftQzCMm0U3R7u8gYRBTTrAaQKK06DX0wOXFnwoEN6YZWyasZtBSFQIrngyDi68BXkPjNcM/m5jht/zaA6bW9WU2yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5E6A497;
	Mon, 28 Oct 2024 08:59:23 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A60F3F73B;
	Mon, 28 Oct 2024 08:58:53 -0700 (PDT)
Message-ID: <73426db8-ca40-4bd1-9e8e-aeb111e5104c@arm.com>
Date: Mon, 28 Oct 2024 15:58:14 +0000
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
 <10d3a86c-d7a8-4ac5-8ad3-010a91c0a25f@arm.com>
 <FCFEB115-846A-4577-A489-D1537AC77DEA@goldelico.com>
 <5c3ea490-f2f5-49e5-99fd-1dc239aee28d@arm.com>
 <F4A297DC-8EBD-4434-97EA-BFEEBB062042@goldelico.com>
 <1a0ff734-73b2-4d73-839b-71e2017ae3c4@arm.com>
 <C6F2F131-2295-4655-A4E2-600200FD7318@goldelico.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <C6F2F131-2295-4655-A4E2-600200FD7318@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2024 5:15 pm, H. Nikolaus Schaller wrote:
> Hi Robin,
> 
>> Am 25.10.2024 um 16:27 schrieb Robin Murphy <robin.murphy@arm.com>:
>>
>> On 08/10/2024 8:52 pm, H. Nikolaus Schaller wrote:
>>>> Am 08.10.2024 um 20:20 schrieb Robin Murphy <robin.murphy@arm.com>:
>>>>> The -ETIMEDOUT seems to come from of_iommu_configure().
>>>>
>>
>> Hmm, I dug around and found a Pandaboard in the cupboard, and ostensibly this seems to work as expected there:
>>
>> 6:12-rc3:
>> chu-chu-rocket:~ # dmesg | grep -i iommu
>> [    0.628601] iommu: Default domain type: Translated
>> [    0.633575] iommu: DMA domain TLB invalidation policy: strict mode
>> [    1.636047] omap-iommu 4a066000.mmu: 4a066000.mmu registered
>> [    3.265869] omap-iommu 55082000.mmu: 55082000.mmu registered
>>
>> 6.12-rc3 + of_xlate:
>> chu-chu-rocket:~ # dmesg | grep -i iommu
>> [    0.629577] iommu: Default domain type: Translated
>> [    0.634582] iommu: DMA domain TLB invalidation policy: strict mode
>> [    1.622802] omap-iommu 4a066000.mmu: 4a066000.mmu registered
>> [    3.316009] omap-iommu 55082000.mmu: 55082000.mmu registered
>> [    3.329040] omap-rproc ocp:dsp: Adding to iommu group 0
>> [    3.335083] omap-iommu 4a066000.mmu: 4a066000.mmu: version 2.0
>> [    3.356506] omap-rproc 55020000.ipu: Adding to iommu group 1
>> [    3.362396] omap-iommu 55082000.mmu: 55082000.mmu: version 2.1
>>
>> Guess I'm going to have to dig further for an OMAP3 to figure out what additional shenanigans that ISP driver is up to... :/
> 
> I was able to confirm on 6.12-rc4 ecept a small difference in the last lines (ocp:dsp and no version 2.x):
> 
> root@letux:~# dmesg|fgrep iommu
> [    0.402191] iommu: Default domain type: Translated
> [    0.402221] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.741607] omap-iommu 4a066000.mmu: 4a066000.mmu registered
> [    2.461120] omap-iommu 55082000.mmu: 55082000.mmu registered
> [    2.474914] platform ocp:dsp: Adding to iommu group 0
> [    2.481719] platform 55020000.ipu: Adding to iommu group 1
> root@letux:~#
> 
> On OMAP3 it is similar. The patch is doing something.
> 
> I get this w/o patch:
> 
> root@letux:~# dmesg|fgrep iommu
> [    0.515808] iommu: Default domain type: Translated
> [    0.515808] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.528686] omap-iommu 480bd400.mmu: 480bd400.mmu registered
> root@letux:~# dmesg|fgrep .isp
> [   10.924438] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, using dummy regulator
> [   10.989044] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, using dummy regulator
> [   11.082916] omap3isp 480bc000.isp: Revision 15.0 found
> [   11.107879] omap3isp 480bc000.isp: failed to create ARM IOMMU mapping
> [   11.160736] omap3isp 480bc000.isp: unable to attach to IOMMU
> [   11.181640] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set to 24685714 Hz (div 7)
> root@letux:~#
> 
> with patch:
> 
> root@letux:~# dmesg|fgrep iommu
> [    0.522552] iommu: Default domain type: Translated
> [    0.522583] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.525543] platform 480bc000.isp: Adding to iommu group 0
> [    0.525726] omap-iommu 480bd400.mmu: 480bd400.mmu registered
> [   34.422973] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
> root@letux:~# dmesg|fgrep .isp
> [    0.525543] platform 480bc000.isp: Adding to iommu group 0
> [   34.413330] omap3isp 480bc000.isp: deferred probe timeout, ignoring dependency
> [   34.429412] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, using dummy regulator
> [   34.446655] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, using dummy regulator
> [   34.456115] omap3isp 480bc000.isp: Revision 15.0 found
> [   34.463165] omap3isp 480bc000.isp: failed to attach device to VA mapping

Oh fiddle... this is getting complex...

I was testing the of_xlate patch rather than the diff below, which 
should avoid the deferred probe timeout but otherwise achieve much the 
same effect. Trouble is, that turns out to only "fix" things back to 
another breakage due to 4720287c7bf7 ("iommu: Remove struct iommu_ops 
*iommu from arch_setup_dma_ops()"), wherein we lost the fragile 
combination of setting up the IOMMU while still causing 
arm_setup_iommu_dma_ops() to ignore it. Thus what now happens here is 
the domain from the ARM DMA ops gets in the way of the driver attaching 
its own. Looks like I missed that with the remoteproc driver since it 
only starts trying to do IOMMU API stuff upon successfully loading 
firmware, which I didn't have.

I think the most practical answer is going to be to give the ISP and 
remoteproc drivers the same workaround for that as the various DRM 
drivers use, lemme write those up too...

Thanks,
Robin.

> [   34.470306] omap3isp 480bc000.isp: unable to attach to IOMMU
> [   34.477661] omap3isp 480bc000.isp: probe with driver omap3isp failed with error -16
> root@letux:~#
> 
> Maybe I am missing something from your latest patches. I currently have:
> 
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index c9528065a59af..de14a3cd4b426 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1230,7 +1230,8 @@ static int omap_iommu_probe(struct platform_device *pdev)
>                  if (err)
>                          return err;
> -               err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
> +               err = iommu_device_register(&obj->iommu, &omap_iommu_ops, NULL);
>                  if (err)
>                          goto out_sysfs;
>                  obj->has_iommu_driver = true;
> @@ -1691,7 +1692,8 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
>                  if (!oiommu) {
>                          of_node_put(np);
>                          kfree(arch_data);
> -                       return ERR_PTR(-EINVAL);
> +                       /* Not fatal, will re-probe once the right instance registers itself */
> +                       return ERR_PTR(-ENODEV);
>                  }
>                    tmp->iommu_dev = oiommu;
> 
> Do you have a link to the patches you have tested?
> 
> What I have also compared are the DTS and DTSI files of omap3/36xx and omap4/omap4-l4.
> Although there are architectural differences I didn't find anything significant.
> More different is how the omap3-isp vs. omap4-iva is handled.
> 
> omap3-isp is a media driver calling arm_iommu_create_mapping() which fails.
> omap4-iva is a remoteproc driver using a different strategy (omap_rproc_of_get_internal_memories ?)
> where I do not know details where iommu comes into the game.
> 
> Hope this helps.
> 
> Best regards,
> Nikolaus
> 

