Return-Path: <linux-omap+bounces-2513-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618DE9B5AED
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 05:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2515528365F
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 04:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1370E198E89;
	Wed, 30 Oct 2024 04:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gWeb7b70"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4B282899;
	Wed, 30 Oct 2024 04:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730264177; cv=none; b=QuejtaPxAmI/j0Yt+4mMn3X+25TgjBTa9gNEsBWRbsqW6xaqXQYf/hU/WJeLfIlEetG1MmwoG/skWTjBCbfuCKhCubCui/T9xvDIS7UoviR+j2w1j4oI1kHfhSEpsAgDwCpedCtdFd/3oXznvdu1VpXl1hupDBi7lq7pxklrGSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730264177; c=relaxed/simple;
	bh=zwX2RBzU4tpfWfPhSOVdn6ISdGQ1Qt5sl+TvX2kcWHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k435sKI5+T1Ym//4cb5+l4sZncMMyC1GVQ4zHMMBLTVlGCFYbEERw2upjccJG1Otvt+4yvDrsJZKBoAh78PDtfBFcKYxG+F2nRFcfrWL659khmdwyeA7BFif68L9FmsPK3AV4vVM88X48eko27LROfAZTS71eTkyR5SMyn/Ft78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gWeb7b70; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4tiSW033939;
	Tue, 29 Oct 2024 23:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730264144;
	bh=4EA9CUgTC4Juvta7B91Kq5htCC2uTanYEkMECpDwaTM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gWeb7b70TvlWYB2Wm+rPIixoPrV0rgfprDynbM6p/P8JaVsyOXyq5+vbguNzr03pQ
	 FkDJYTUA6IVujGAJn/CSDN4lP+YeCuG4/LdLlPnX7OFfqbSh6M+5iph40OQyc226ZR
	 o9XxXcPNFFVrd4cCuRm3Dn3tmSAjyadyNgfhvwf4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49U4thc1119737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 23:55:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:55:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:55:43 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4tcHH066220;
	Tue, 29 Oct 2024 23:55:39 -0500
Message-ID: <25c5c744-2e4d-4df6-a080-8f5705a47884@ti.com>
Date: Wed, 30 Oct 2024 10:25:37 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
To: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, <will@kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hns@goldelico.com>, <andreas@kemnade.info>, <iommu@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        "Nagalla, Hari"
	<hnagalla@ti.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Robin,

On 28/10/24 23:28, Robin Murphy wrote:
> Hi all,
>
> It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
> through the more recent evolution of the IOMMU API internals. These
> patches attempt to bring it and its consumers sufficiently up-to-date
> to work again, in a manner that's hopefully backportable. This is
> largely all written by inspection, but I have managed to lightly boot
> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> working again.
>
> This supersedes my previous patch[1]. Patches #1 and #2 are functionally
> independent, and can be applied directly to their respective trees if
> preferred.
>
> Thanks,
> Robin.
>
> [1] https://lore.kernel.org/linux-iommu/c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com/
>
>
> Robin Murphy (4):
>    remoteproc/omap: Handle ARM dma_iommu_mapping
>    media: omap3isp: Handle ARM dma_iommu_mapping
>    iommu/omap: Add minimal fwnode support
>    iommu: Make bus_iommu_probe() static


Tested this series on omap4 w.r.t. remoteproc subsystem on v6.12-rc5, it 
works fine; attached logs[2]. Therefore, for series please use:

Tested-by: Beleswar Padhi <b-padhi@ti.com>

Many thanks for working on the fix.

Best,
Beleswar

[2]: https://gist.github.com/3V3RYONE/f9244a0aa0e3514b7c62f7965cbb0bae

>
>   drivers/iommu/iommu.c                    |  3 ++-
>   drivers/iommu/omap-iommu.c               | 26 +++++++++++++++---------
>   drivers/media/platform/ti/omap3isp/isp.c |  7 +++++++
>   drivers/remoteproc/omap_remoteproc.c     | 17 ++++++++++++++++
>   include/linux/iommu.h                    |  1 -
>   5 files changed, 42 insertions(+), 12 deletions(-)
>

