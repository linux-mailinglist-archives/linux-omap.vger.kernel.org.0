Return-Path: <linux-omap+bounces-2486-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD49B05C8
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 16:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBBA31F23A80
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 14:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9D91FDFA8;
	Fri, 25 Oct 2024 14:27:38 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D861FB89E
	for <linux-omap@vger.kernel.org>; Fri, 25 Oct 2024 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866458; cv=none; b=GJ6m/ZcxYbLv+w0Tu3lIpZEJ983oJVN9XKluO35T6Fde+s55MhhfN7G85Dskkp1bYFVpCj1irKaelQg3Lwe2GYFA04I8Tujgd2ghf1cYiNf0xOcsLyhGmOMy4TCDQtsHVNCFuZm04jtv85cHZF9cva0cY4D0Xy9Ffy1Q6zz10L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866458; c=relaxed/simple;
	bh=40eOsWpBkyjEEzDVxLYU6zqXUWiZv8YYSiAG/diekao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVsrUHUPWBBCX6yJxSdMJgwWUyKWQWlp48L/GQzRCfENczE/wwDu8Eb3H2SnKEotLrw6++CDGaX6JzX7xA9t/touttEUmt+FjdgX4nih7aN15h5TxvUpyX2Cp7e4A2zdpiqvmk7mgaKvGY7M0i/vgxqPuVNBr4HCy/yzGMCYZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58381339;
	Fri, 25 Oct 2024 07:28:03 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FE0C3F73B;
	Fri, 25 Oct 2024 07:27:32 -0700 (PDT)
Message-ID: <1a0ff734-73b2-4d73-839b-71e2017ae3c4@arm.com>
Date: Fri, 25 Oct 2024 15:27:09 +0100
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
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <F4A297DC-8EBD-4434-97EA-BFEEBB062042@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 8:52 pm, H. Nikolaus Schaller wrote:
> 
> 
>> Am 08.10.2024 um 20:20 schrieb Robin Murphy <robin.murphy@arm.com>:
> 
>>> The -ETIMEDOUT seems to come from of_iommu_configure().
>>
>> Oof, yeah, now we've wound up with the opposite problem that because it's the generic "iommus" binding, it gets as far as of_iommu_xlate() but now the NULL fwnode no longer matches the phandle target so that thinks it's waiting for an instance which hasn't registered yet :(
>>
>> OK, different track, does the diff below fare any better? (I've not written it up fully yet as the DRA7 special cases will need some more work still)
>>
>> Thanks,
>> Robin.
>>
>> ----->8-----
>>
>> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
>> index c9528065a59a..44e09d60e861 100644
>> --- a/drivers/iommu/omap-iommu.c
>> +++ b/drivers/iommu/omap-iommu.c
>> @@ -1723,12 +1723,19 @@ static void omap_iommu_release_device(struct device *dev)
>>
>> }
>>
>> +int omap_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
>> +{
>> + /* TODO: collect args->np to save re-parsing in probe above */
>> + return 0;
>> +}
>> +
>> static const struct iommu_ops omap_iommu_ops = {
>> .identity_domain = &omap_iommu_identity_domain,
>> .domain_alloc_paging = omap_iommu_domain_alloc_paging,
>> .probe_device = omap_iommu_probe_device,
>> .release_device = omap_iommu_release_device,
>> .device_group = generic_single_device_group,
>> + .of_xlate = omap_iommu_of_xlate,
>> .pgsize_bitmap = OMAP_IOMMU_PGSIZES,
>> .default_domain_ops = &(const struct iommu_domain_ops) {
>> .attach_dev = omap_iommu_attach_dev,
> 
> 
> Unfortunately no change :(

Hmm, I dug around and found a Pandaboard in the cupboard, and ostensibly 
this seems to work as expected there:

6:12-rc3:
chu-chu-rocket:~ # dmesg | grep -i iommu
[    0.628601] iommu: Default domain type: Translated
[    0.633575] iommu: DMA domain TLB invalidation policy: strict mode
[    1.636047] omap-iommu 4a066000.mmu: 4a066000.mmu registered
[    3.265869] omap-iommu 55082000.mmu: 55082000.mmu registered

6.12-rc3 + of_xlate:
chu-chu-rocket:~ # dmesg | grep -i iommu
[    0.629577] iommu: Default domain type: Translated
[    0.634582] iommu: DMA domain TLB invalidation policy: strict mode
[    1.622802] omap-iommu 4a066000.mmu: 4a066000.mmu registered
[    3.316009] omap-iommu 55082000.mmu: 55082000.mmu registered
[    3.329040] omap-rproc ocp:dsp: Adding to iommu group 0
[    3.335083] omap-iommu 4a066000.mmu: 4a066000.mmu: version 2.0
[    3.356506] omap-rproc 55020000.ipu: Adding to iommu group 1
[    3.362396] omap-iommu 55082000.mmu: 55082000.mmu: version 2.1

Guess I'm going to have to dig further for an OMAP3 to figure out what 
additional shenanigans that ISP driver is up to... :/

Thanks,
Robin.

> 
> A very tiny issue was that the second argument can not have a const specifier in the
> v6.8 series, but starting with v6.9 it should be there. But since 6.8 and 6.9 are
> already EOL, there will be no back-ports anyways. And if someone does really
> backport (like me for testing purposes) it is obvious what to do.
> 
> BR and thanks,
> Nikolaus
> 

