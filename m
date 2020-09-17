Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5972226E2C2
	for <lists+linux-omap@lfdr.de>; Thu, 17 Sep 2020 19:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgIQRo2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Sep 2020 13:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgIQRng (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Sep 2020 13:43:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0CFC06174A;
        Thu, 17 Sep 2020 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=XFljnFDti4QEsmWoOX3xJZfimZiN02p4vQEiHXyuaE4=; b=wF2bUHTVwRAUqjQnPLUqAdeev1
        Vs8+S+9bqNVuPhKWEUCvUZW/XpokfEm0pIbBEvrfi+a0UHhRk7C3AHghP96WwC+uZsc9eVlvQ4i/j
        OTfe+JD/xA5yyTxiv3bDsG/xlJuCOIk63PYbXeuH7EvumzyDgwMMmltctRqb+TYoMJm4ddBV4i96k
        aLS9n0lnayRUw+zAd7tMrbWiHc30OCooC6IZikynz+J67p5S16LqSpCiHmGLGCfhOsugTX9bny/0B
        11HJ5qKWwVWiikzl4prU4ksPQy7/s90nIie/TuUhm9zwlaaT8Bioc3SPY5cjeF75oKrWM9r3DFd4W
        ceT2V6qQ==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIxwK-0003We-HL; Thu, 17 Sep 2020 17:43:24 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 4/4] ARM/dma-mapping: remove the arm specific phys to dma translation helpers
Date:   Thu, 17 Sep 2020 19:32:29 +0200
Message-Id: <20200917173229.3311382-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917173229.3311382-1-hch@lst.de>
References: <20200917173229.3311382-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Now that the two remaining architectures that hooked into the DMA
translation directly use the range map instead, there is no need to
override phys_to_dma and dma_to_phys.  Remove asm/dma-direct.h after
switching the remaining callsites to the phys addr based generic
helpers instead of the PFN or virt addr based arm ones.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/Kconfig                  |  1 -
 arch/arm/common/dmabounce.c       | 14 +++++-----
 arch/arm/include/asm/dma-direct.h | 45 -------------------------------
 arch/arm/mm/dma-mapping.c         | 20 +++++++-------
 4 files changed, 17 insertions(+), 63 deletions(-)
 delete mode 100644 arch/arm/include/asm/dma-direct.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e00d94b1665876..2c4d608fa5fecf 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -14,7 +14,6 @@ config ARM
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
-	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
diff --git a/arch/arm/common/dmabounce.c b/arch/arm/common/dmabounce.c
index d3e00ea9208834..561d6d06c6b6aa 100644
--- a/arch/arm/common/dmabounce.c
+++ b/arch/arm/common/dmabounce.c
@@ -258,7 +258,7 @@ static inline dma_addr_t map_single(struct device *dev, void *ptr, size_t size,
 	}
 
 	dev_dbg(dev, "%s: unsafe buffer %p (dma=%#x) mapped to %p (dma=%#x)\n",
-		__func__, buf->ptr, virt_to_dma(dev, buf->ptr),
+		__func__, buf->ptr, phys_to_dma(dev, virt_to_phys(buf->ptr)),
 		buf->safe, buf->safe_dma_addr);
 
 	if ((dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL) &&
@@ -279,7 +279,7 @@ static inline void unmap_single(struct device *dev, struct safe_buffer *buf,
 	BUG_ON(buf->direction != dir);
 
 	dev_dbg(dev, "%s: unsafe buffer %p (dma=%#x) mapped to %p (dma=%#x)\n",
-		__func__, buf->ptr, virt_to_dma(dev, buf->ptr),
+		__func__, buf->ptr, phys_to_dma(dev, virt_to_phys(buf->ptr)),
 		buf->safe, buf->safe_dma_addr);
 
 	DO_STATS(dev->archdata.dmabounce->bounce_count++);
@@ -320,7 +320,7 @@ static dma_addr_t dmabounce_map_page(struct device *dev, struct page *page,
 	dev_dbg(dev, "%s(page=%p,off=%#lx,size=%zx,dir=%x)\n",
 		__func__, page, offset, size, dir);
 
-	dma_addr = pfn_to_dma(dev, page_to_pfn(page)) + offset;
+	dma_addr = phys_to_dma(dev, page_to_phys(page)) + offset;
 
 	ret = needs_bounce(dev, dma_addr, size);
 	if (ret < 0)
@@ -380,8 +380,8 @@ static int __dmabounce_sync_for_cpu(struct device *dev, dma_addr_t addr,
 	BUG_ON(buf->direction != dir);
 
 	dev_dbg(dev, "%s: unsafe buffer %p (dma=%#x off=%#lx) mapped to %p (dma=%#x)\n",
-		__func__, buf->ptr, virt_to_dma(dev, buf->ptr), off,
-		buf->safe, buf->safe_dma_addr);
+		__func__, buf->ptr, phys_to_dma(dev, virt_to_phys(buf->ptr)),
+		off, buf->safe, buf->safe_dma_addr);
 
 	DO_STATS(dev->archdata.dmabounce->bounce_count++);
 
@@ -420,8 +420,8 @@ static int __dmabounce_sync_for_device(struct device *dev, dma_addr_t addr,
 	BUG_ON(buf->direction != dir);
 
 	dev_dbg(dev, "%s: unsafe buffer %p (dma=%#x off=%#lx) mapped to %p (dma=%#x)\n",
-		__func__, buf->ptr, virt_to_dma(dev, buf->ptr), off,
-		buf->safe, buf->safe_dma_addr);
+		__func__, buf->ptr, phys_to_dma(dev, virt_to_phys(buf->ptr)),
+		off, buf->safe, buf->safe_dma_addr);
 
 	DO_STATS(dev->archdata.dmabounce->bounce_count++);
 
diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
deleted file mode 100644
index 84cb4e30658891..00000000000000
--- a/arch/arm/include/asm/dma-direct.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef ASM_ARM_DMA_DIRECT_H
-#define ASM_ARM_DMA_DIRECT_H 1
-
-#include <asm/memory.h>
-
-/*
- * dma_to_pfn/pfn_to_dma/virt_to_dma are architecture private
- * functions used internally by the DMA-mapping API to provide DMA
- * addresses. They must not be used by drivers.
- */
-static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
-{
-	if (dev->dma_range_map)
-		pfn = PFN_DOWN(translate_phys_to_dma(dev, PFN_PHYS(pfn)));
-	return (dma_addr_t)__pfn_to_phys(pfn);
-}
-
-static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
-{
-	unsigned long pfn = __phys_to_pfn(addr);
-
-	if (dev->dma_range_map)
-		pfn = PFN_DOWN(translate_dma_to_phys(dev, PFN_PHYS(pfn)));
-	return pfn;
-}
-
-static inline dma_addr_t virt_to_dma(struct device *dev, void *addr)
-{
-	return (dma_addr_t)__virt_to_bus((unsigned long)(addr));
-}
-
-static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
-{
-	unsigned int offset = paddr & ~PAGE_MASK;
-	return pfn_to_dma(dev, __phys_to_pfn(paddr)) + offset;
-}
-
-static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
-{
-	unsigned int offset = dev_addr & ~PAGE_MASK;
-	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
-}
-
-#endif /* ASM_ARM_DMA_DIRECT_H */
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 8a8949174b1c06..9d800d0a53af7a 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -131,14 +131,14 @@ static dma_addr_t arm_dma_map_page(struct device *dev, struct page *page,
 {
 	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
 		__dma_page_cpu_to_dev(page, offset, size, dir);
-	return pfn_to_dma(dev, page_to_pfn(page)) + offset;
+	return phys_to_dma(dev, page_to_phys(page)) + offset;
 }
 
 static dma_addr_t arm_coherent_dma_map_page(struct device *dev, struct page *page,
 	     unsigned long offset, size_t size, enum dma_data_direction dir,
 	     unsigned long attrs)
 {
-	return pfn_to_dma(dev, page_to_pfn(page)) + offset;
+	return phys_to_dma(dev, page_to_phys(page)) + offset;
 }
 
 /**
@@ -159,7 +159,7 @@ static void arm_dma_unmap_page(struct device *dev, dma_addr_t handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
-		__dma_page_dev_to_cpu(pfn_to_page(dma_to_pfn(dev, handle)),
+		__dma_page_dev_to_cpu(phys_to_page(dma_to_phys(dev, handle)),
 				      handle & ~PAGE_MASK, size, dir);
 }
 
@@ -167,7 +167,7 @@ static void arm_dma_sync_single_for_cpu(struct device *dev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
 	unsigned int offset = handle & (PAGE_SIZE - 1);
-	struct page *page = pfn_to_page(dma_to_pfn(dev, handle-offset));
+	struct page *page = phys_to_page(dma_to_phys(dev, handle-offset));
 	__dma_page_dev_to_cpu(page, offset, size, dir);
 }
 
@@ -175,7 +175,7 @@ static void arm_dma_sync_single_for_device(struct device *dev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
 	unsigned int offset = handle & (PAGE_SIZE - 1);
-	struct page *page = pfn_to_page(dma_to_pfn(dev, handle-offset));
+	struct page *page = phys_to_page(dma_to_phys(dev, handle-offset));
 	__dma_page_cpu_to_dev(page, offset, size, dir);
 }
 
@@ -193,7 +193,7 @@ static int arm_dma_supported(struct device *dev, u64 mask)
 	 * Translate the device's DMA mask to a PFN limit.  This
 	 * PFN number includes the page which we can DMA to.
 	 */
-	return dma_to_pfn(dev, mask) >= max_dma_pfn;
+	return PHYS_PFN(dma_to_phys(dev, mask)) >= max_dma_pfn;
 }
 
 const struct dma_map_ops arm_dma_ops = {
@@ -722,7 +722,7 @@ static void *__dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
 	if (page) {
 		unsigned long flags;
 
-		*handle = pfn_to_dma(dev, page_to_pfn(page));
+		*handle = phys_to_dma(dev, page_to_phys(page));
 		buf->virt = args.want_vaddr ? addr : page;
 
 		spin_lock_irqsave(&arm_dma_bufs_lock, flags);
@@ -762,7 +762,7 @@ static int __arm_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 	int ret = -ENXIO;
 	unsigned long nr_vma_pages = vma_pages(vma);
 	unsigned long nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
-	unsigned long pfn = dma_to_pfn(dev, dma_addr);
+	unsigned long pfn = PHYS_PFN(dma_to_phys(dev, dma_addr));
 	unsigned long off = vma->vm_pgoff;
 
 	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
@@ -803,7 +803,7 @@ static void __arm_dma_free(struct device *dev, size_t size, void *cpu_addr,
 			   dma_addr_t handle, unsigned long attrs,
 			   bool is_coherent)
 {
-	struct page *page = pfn_to_page(dma_to_pfn(dev, handle));
+	struct page *page = phys_to_page(dma_to_phys(dev, handle));
 	struct arm_dma_buffer *buf;
 	struct arm_dma_free_args args = {
 		.dev = dev,
@@ -837,7 +837,7 @@ int arm_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
 		 void *cpu_addr, dma_addr_t handle, size_t size,
 		 unsigned long attrs)
 {
-	unsigned long pfn = dma_to_pfn(dev, handle);
+	unsigned long pfn = PHYS_PFN(dma_to_phys(dev, handle));
 	struct page *page;
 	int ret;
 
-- 
2.28.0

