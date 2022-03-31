Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF394ED3D9
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 08:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiCaGZH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 02:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiCaGZG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 02:25:06 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D1E1C1EC9A8
        for <linux-omap@vger.kernel.org>; Wed, 30 Mar 2022 23:23:19 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EBFAA80FA;
        Thu, 31 Mar 2022 06:21:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc:     Drew Fustini <dfustini@baylibre.com>, Suman Anna <s-anna@ti.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH] iommu/omap: Fix regression in probe for NULL pointer dereference
Date:   Thu, 31 Mar 2022 09:23:01 +0300
Message-Id: <20220331062301.24269-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 3f6634d997db ("iommu: Use right way to retrieve iommu_ops") started
triggering a NULL pointer dereference for some omap variants:

__iommu_probe_device from probe_iommu_group+0x2c/0x38
probe_iommu_group from bus_for_each_dev+0x74/0xbc
bus_for_each_dev from bus_iommu_probe+0x34/0x2e8
bus_iommu_probe from bus_set_iommu+0x80/0xc8
bus_set_iommu from omap_iommu_init+0x88/0xcc
omap_iommu_init from do_one_initcall+0x44/0x24

This is caused by omap iommu probe returning 0 instead of ERR_PTR(-ENODEV)
as noted by Jason Gunthorpe <jgg@ziepe.ca>.

Looks like the regression already happened with an earlier commit
6785eb9105e3 ("iommu/omap: Convert to probe/release_device() call-backs")
that changed the function return type and missed converting one place.

Cc: Drew Fustini <dfustini@baylibre.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Suman Anna <s-anna@ti.com>
Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Fixes: 6785eb9105e3 ("iommu/omap: Convert to probe/release_device() call-backs")
Fixes: 3f6634d997db ("iommu: Use right way to retrieve iommu_ops")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/iommu/omap-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1661,7 +1661,7 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 	num_iommus = of_property_count_elems_of_size(dev->of_node, "iommus",
 						     sizeof(phandle));
 	if (num_iommus < 0)
-		return 0;
+		return ERR_PTR(-ENODEV);
 
 	arch_data = kcalloc(num_iommus + 1, sizeof(*arch_data), GFP_KERNEL);
 	if (!arch_data)
-- 
2.35.1
