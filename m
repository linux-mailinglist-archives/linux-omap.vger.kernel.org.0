Return-Path: <linux-omap+bounces-2348-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD4995656
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 20:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A331C255BF
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 18:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D27189910;
	Tue,  8 Oct 2024 18:20:12 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9521E0DD1
	for <linux-omap@vger.kernel.org>; Tue,  8 Oct 2024 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728411612; cv=none; b=WR4eozp5+JcCbmD2R3YN06DFNCXS8BpTTcW8Vdvr+s1j1rSR8gldi4H8IvahdOOi9pDhL7G8o+bVrxwXkelPK1be0CWomyRnYcKwhaRyzYm9ZmomlFfwixlEmxxAwD4EJK+ezUkwpEJnQazwWs9VFLJpgFm0MpEwJivw6YdY6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728411612; c=relaxed/simple;
	bh=MrlCSStZxCy+qwEaQzYsTzseUQ+MqWbnwJDFXtMHokc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlinMMdb4kbY2zY2PkpCxkCIuN0WEUApO67qSl3D7/Y/VQjc4q4zWW5joVxv3CIJswEEP9XlBBXrzN6aQDTOtdi0JMZwnBJyDCdzS7SF3E+PdgY2gWlgecWRDnkZTkH5Ei65sUcjLx6LNceE7rnKPPupVJJzilAFXqfn5DnS4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E294113E;
	Tue,  8 Oct 2024 11:20:38 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D113A3F64C;
	Tue,  8 Oct 2024 11:20:07 -0700 (PDT)
Message-ID: <5c3ea490-f2f5-49e5-99fd-1dc239aee28d@arm.com>
Date: Tue, 8 Oct 2024 19:20:06 +0100
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
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <FCFEB115-846A-4577-A489-D1537AC77DEA@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 5:13 pm, H. Nikolaus Schaller wrote:
> Hi Robin,
> 
>> Am 08.10.2024 um 16:00 schrieb Robin Murphy <robin.murphy@arm.com>:
>>
>> On 08/10/2024 2:32 pm, H. Nikolaus Schaller wrote:
>>> Hi Robin,
>>>> Am 08.10.2024 um 15:17 schrieb Robin Murphy <robin.murphy@arm.com>:
>>>>
>>>> The OMAP driver still has its own traditional firmware parsing and
>>>> instance handling in omap_iommu_probe_device(), rather than using the
>>>> generic fwnode-based paths. However, it also passes a hwdev to
>>>> iommu_device_register(), thus registering a fwnode for each ops
>>>> instance, wherein __iommu_probe_device() then fails to find matching ops
>>>> for a client device with no fwspec and thus a NULL iommu_fwnode.
>>>>
>>>> Since omap-iommu is not known to coexist with any other IOMMU hardware
>>>> and shares the same ops between all instances, we can reasonably remove
>>>> the hwdev/fwnode registration to put it back into "legacy" mode where
>>>> the ops are effectively global and ->probe_device remains responsible
>>>> for filtering individual clients.
>>>>
>>>> Reported-by: Beleswar Padhi <b-padhi@ti.com>
>>>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> Fixes: 17de3f5fdd35 ("iommu: Retire bus ops")
>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>> ---
>>>> drivers/iommu/omap-iommu.c | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
>>>> index c9528065a59a..425ae8e551dc 100644
>>>> --- a/drivers/iommu/omap-iommu.c
>>>> +++ b/drivers/iommu/omap-iommu.c
>>>> @@ -1230,7 +1230,7 @@ static int omap_iommu_probe(struct platform_device *pdev)
>>>> if (err)
>>>> return err;
>>>>
>>>> - err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
>>>> + err = iommu_device_register(&obj->iommu, &omap_iommu_ops, NULL);
>>> Thanks for this proposal, but this prevents my OMAP3 system completely
>>> from booting (at least with v6.8-rc1):
>>> ## Booting kernel from Legacy Image at 82000000 ...
>>>     Image Name:   Linux-6.8.0-rc1-letux+
>>>     Image Type:   ARM Linux Kernel Image (uncompressed)
>>>     Data Size:    6491520 Bytes = 6.2 MiB
>>>     Load Address: 80008000
>>>     Entry Point:  80008000
>>>     Verifying Checksum ... OK
>>> ## Flattened Device Tree blob at 81c00000
>>>     Booting using the fdt blob at 0x81c00000
>>>     Loading Kernel Image ... OK
>>>     Using Device Tree in place at 81c00000, end 81c1fe8e
>>> Starting kernel ...
>>> --- no further reaction --
>>
>> Urgh... is it possible to get earlycon/ealyprintk output on this platform?
> 
> Ah, my mistake. earlycon did reveal a NULL pointer dereference coming from that
> I have added some printk() to iommu_device_register() and friends. And one
> assumed that hwdev is not a NULL pointer and we can print hwdev->kobj.name...
> 
>>
>> As a stab in the dark by inspection, there might potentially be some interaction with "iommu: Move bus setup to IOMMU device registration" as well, for which the additional diff below might help...
>>
>> Thanks,
>> Robin.
>>
>> ---->8----
>> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
>> index 425ae8e551dc..9112178e22d8 100644
>> --- a/drivers/iommu/omap-iommu.c
>> +++ b/drivers/iommu/omap-iommu.c
>> @@ -1691,7 +1691,8 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
>> if (!oiommu) {
>> of_node_put(np);
>> kfree(arch_data);
>> - return ERR_PTR(-EINVAL);
>> + /* Not fatal, will re-probe once the right instance registers itself */
>> + return ERR_PTR(-ENODEV);
>> }
>>
>> tmp->iommu_dev = oiommu;
> 
> Now I can boot with both patches applied (and Jason's patch and my printk removed),
> but there is still (exactly the same as with Jason's patch):
> 
> root@letux:~# uname -a
> Linux letux 6.8.0-rc1-letux+ #19517 SMP PREEMPT Tue Oct  8 17:23:11 CEST 2024 armv7l GNU/Linux
> root@letux:~# dmesg|fgrep iommu
> [    0.700195] iommu: Default domain type: Translated
> [    0.705078] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.728393] platform 480bc000.isp: Adding to iommu group 0
> [    0.734161] omap-iommu 480bd400.mmu: 480bd400.mmu registered
> [   23.565216] omap3isp 480bc000.isp: iommu configuration for device failed with -ETIMEDOUT
> [   23.605102] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
> root@letux:~# dmesg|fgrep isp
> [    0.000000] OMAP3630/DM3730 ES1.2 (l2cache iva sgx neon isp 192mhz_clk)
> [    0.728393] platform 480bc000.isp: Adding to iommu group 0
> [   11.472045] omapdss_dss 48050000.dss: bound 48050400.dispc (ops dsi_vc_flush_receive_data [omapdrm])		<-- false positive of fgrep
> [   23.557586] omap3isp 480bc000.isp: deferred probe timeout, ignoring dependency
> [   23.565216] omap3isp 480bc000.isp: iommu configuration for device failed with -ETIMEDOUT		<-- duplicate with fgrep iommu
> [   23.625183] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, using dummy regulator
> [   23.657135] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, using dummy regulator
> [   23.665832] omap3isp 480bc000.isp: Revision 15.0 found
> [   23.700073] omap3isp 480bc000.isp: failed to attach device to VA mapping
> [   23.724182] omap3isp 480bc000.isp: unable to attach to IOMMU
> [   23.731262] omap3isp: probe of 480bc000.isp failed with error -16
> root@letux:~#
> 
> The -ETIMEDOUT seems to come from of_iommu_configure().

Oof, yeah, now we've wound up with the opposite problem that because 
it's the generic "iommus" binding, it gets as far as of_iommu_xlate() 
but now the NULL fwnode no longer matches the phandle target so that 
thinks it's waiting for an instance which hasn't registered yet :(

OK, different track, does the diff below fare any better? (I've not 
written it up fully yet as the DRA7 special cases will need some more 
work still)

Thanks,
Robin.

----->8-----

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index c9528065a59a..44e09d60e861 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1723,12 +1723,19 @@ static void omap_iommu_release_device(struct 
device *dev)

  }

+int omap_iommu_of_xlate(struct device *dev, const struct 
of_phandle_args *args)
+{
+	/* TODO: collect args->np to save re-parsing in probe above */
+	return 0;
+}
+
  static const struct iommu_ops omap_iommu_ops = {
  	.identity_domain = &omap_iommu_identity_domain,
  	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
  	.probe_device	= omap_iommu_probe_device,
  	.release_device	= omap_iommu_release_device,
  	.device_group	= generic_single_device_group,
+	.of_xlate	= omap_iommu_of_xlate,
  	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
  	.default_domain_ops = &(const struct iommu_domain_ops) {
  		.attach_dev	= omap_iommu_attach_dev,

