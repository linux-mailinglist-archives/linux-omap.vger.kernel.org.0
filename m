Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5661B26E2AE
	for <lists+linux-omap@lfdr.de>; Thu, 17 Sep 2020 19:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgIQRmE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Sep 2020 13:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgIQRlT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Sep 2020 13:41:19 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CB8C06174A;
        Thu, 17 Sep 2020 10:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=KzFlskTtmrM7XbM2RHeFq/XrvDOcZp5iQ+zvN+xoZ6s=; b=W52KmyKfz6Yg3D0Gg5sOUVRhY6
        9YO2fXcc15UC2+ZB2tB1a0OE4cfo9DsFWP7/dS743uyXakYRhS1KIY3opHGbxQt+iLIdF6wvt2WtP
        LLz0yp5vyGE6FTYHWtp4ORfhbFh7EO7JQPux3AS+/zCdT0F8/GUZmhaNyWdj4k6BRIwfnFewGpgKs
        nMrx6f3O+9pRsKF9wBuEEgVYdWEmAhrDe76OJoWf3L6mY3oyBVMyPt+zNlZaxqln9B5i+OgP3qbYF
        ZkRP5uQO5bM2XVOxbcPsz4RCDpxE0XOPeTJZPAYeOBc+Oder4glvi+mKRSlECAkvSONOV8ILHN1Xk
        TAnZT62Q==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIxuD-0003Ny-D8; Thu, 17 Sep 2020 17:41:13 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 3/4] ARM/dma-mapping: don't handle NULL devices in dma-direct.h
Date:   Thu, 17 Sep 2020 19:32:28 +0200
Message-Id: <20200917173229.3311382-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917173229.3311382-1-hch@lst.de>
References: <20200917173229.3311382-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The DMA API removed support for not passing in a device a long time
ago, so remove the NULL checks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/dma-direct.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
index 1f04a5e1c615de..84cb4e30658891 100644
--- a/arch/arm/include/asm/dma-direct.h
+++ b/arch/arm/include/asm/dma-direct.h
@@ -11,7 +11,7 @@
  */
 static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
 {
-	if (dev && dev->dma_range_map)
+	if (dev->dma_range_map)
 		pfn = PFN_DOWN(translate_phys_to_dma(dev, PFN_PHYS(pfn)));
 	return (dma_addr_t)__pfn_to_phys(pfn);
 }
@@ -20,16 +20,13 @@ static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
 {
 	unsigned long pfn = __phys_to_pfn(addr);
 
-	if (dev && dev->dma_range_map)
+	if (dev->dma_range_map)
 		pfn = PFN_DOWN(translate_dma_to_phys(dev, PFN_PHYS(pfn)));
 	return pfn;
 }
 
 static inline dma_addr_t virt_to_dma(struct device *dev, void *addr)
 {
-	if (dev)
-		return pfn_to_dma(dev, virt_to_pfn(addr));
-
 	return (dma_addr_t)__virt_to_bus((unsigned long)(addr));
 }
 
-- 
2.28.0

