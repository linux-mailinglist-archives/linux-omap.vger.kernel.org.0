Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA7E4F756F
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 07:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235147AbiDGFlJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 01:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbiDGFlI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 01:41:08 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED7A11C7E94
        for <linux-omap@vger.kernel.org>; Wed,  6 Apr 2022 22:39:07 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 18A668138;
        Thu,  7 Apr 2022 05:36:44 +0000 (UTC)
Date:   Thu, 7 Apr 2022 08:39:05 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc:     Drew Fustini <dfustini@baylibre.com>, Suman Anna <s-anna@ti.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/omap: Fix regression in probe for NULL pointer
 dereference
Message-ID: <Yk54+S0iaMueWN63@atomide.com>
References: <20220331062301.24269-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331062301.24269-1-tony@atomide.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tony Lindgren <tony@atomide.com> [220331 09:21]:
> Commit 3f6634d997db ("iommu: Use right way to retrieve iommu_ops") started
> triggering a NULL pointer dereference for some omap variants:
> 
> __iommu_probe_device from probe_iommu_group+0x2c/0x38
> probe_iommu_group from bus_for_each_dev+0x74/0xbc
> bus_for_each_dev from bus_iommu_probe+0x34/0x2e8
> bus_iommu_probe from bus_set_iommu+0x80/0xc8
> bus_set_iommu from omap_iommu_init+0x88/0xcc
> omap_iommu_init from do_one_initcall+0x44/0x24
> 
> This is caused by omap iommu probe returning 0 instead of ERR_PTR(-ENODEV)
> as noted by Jason Gunthorpe <jgg@ziepe.ca>.
> 
> Looks like the regression already happened with an earlier commit
> 6785eb9105e3 ("iommu/omap: Convert to probe/release_device() call-backs")
> that changed the function return type and missed converting one place.

Can you guys please get this fix into the -rc series? Or ack it so
I can pick it up into my fixes branch?

Without this fix booting is failing for a bunch of devices.

Regards,

Tony


> Cc: Drew Fustini <dfustini@baylibre.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Suman Anna <s-anna@ti.com>
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Fixes: 6785eb9105e3 ("iommu/omap: Convert to probe/release_device() call-backs")
> Fixes: 3f6634d997db ("iommu: Use right way to retrieve iommu_ops")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/iommu/omap-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1661,7 +1661,7 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
>  	num_iommus = of_property_count_elems_of_size(dev->of_node, "iommus",
>  						     sizeof(phandle));
>  	if (num_iommus < 0)
> -		return 0;
> +		return ERR_PTR(-ENODEV);
>  
>  	arch_data = kcalloc(num_iommus + 1, sizeof(*arch_data), GFP_KERNEL);
>  	if (!arch_data)
> -- 
> 2.35.1
> 
