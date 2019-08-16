Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD65590B32
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 00:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfHPW6p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Aug 2019 18:58:45 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54724 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbfHPW6p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Aug 2019 18:58:45 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7GMweZw041435;
        Fri, 16 Aug 2019 17:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565996320;
        bh=ZhrZRIol3LJne5DNWYX66jQ+190Rd1/PWrEfkR4gDCs=;
        h=From:To:CC:Subject:Date;
        b=paBifWsEEojK9yFtprRtARaF/wJ1qFvrKH+RnQuqVLIqJcClpj1LVGMtCO7sYRqnt
         FK9s1pwEY3pxmO36de062r4c6A9f3UAw/7WjRuGi2jpOyNDvZex3/+psk/beMDkb+j
         nAOmheH66XeP0cDH7wM9xtbaCB0nZ5GQpetI8WvQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7GMwdC2031428
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 16 Aug 2019 17:58:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 17:58:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 16 Aug 2019 17:58:39 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7GMwdM8024932;
        Fri, 16 Aug 2019 17:58:39 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x7GMwdZ24401;
        Fri, 16 Aug 2019 17:58:39 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Joerg Roedel <joro@8bytes.org>
CC:     <iommu@lists.linux-foundation.org>, <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH] iommu/omap: Use the correct type for SLAB_HWCACHE_ALIGN
Date:   Fri, 16 Aug 2019 17:58:37 -0500
Message-ID: <20190816225837.6362-1-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The macro SLAB_HWCACHE_ALIGN is of type slab_flags_t, but is currently
assigned in the OMAP IOMMU driver using a unsigned long variable. This
generates a sparse warning around the type check. Fix this by defining
the variable flags using the correct type.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/iommu/omap-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 99a9ff3e7f71..8645e9b175a3 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1818,7 +1818,7 @@ static const struct iommu_ops omap_iommu_ops = {
 static int __init omap_iommu_init(void)
 {
 	struct kmem_cache *p;
-	const unsigned long flags = SLAB_HWCACHE_ALIGN;
+	const slab_flags_t flags = SLAB_HWCACHE_ALIGN;
 	size_t align = 1 << 10; /* L2 pagetable alignement */
 	struct device_node *np;
 	int ret;
-- 
2.22.0

