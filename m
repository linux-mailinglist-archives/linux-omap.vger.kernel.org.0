Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A13226E30A
	for <lists+linux-omap@lfdr.de>; Thu, 17 Sep 2020 19:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgIQRjm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Sep 2020 13:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgIQRjJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Sep 2020 13:39:09 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546C5C06174A;
        Thu, 17 Sep 2020 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=VYUzAIxzefItAIMc2bAxCCwS4TSxDuuY0l1BQz5HsqM=; b=ph3uLJKZ1SEIYRoNExzFzxbNX8
        lA3e4IsBsmRH7GSKbLajZdCqiPlICxMl83Ius2GubVRyJ6+8ndYHPBHPKTq59HVM6I9u+OtRYdQly
        bhQ535OV0TkCxvrLtvNFzSx61cEueXeap4y29JbU95oarup6bq+RYJC1zQrJwko09yiZLZxQXycZm
        AoXi4BcbYGt9LSDVBXEup+EqaNHwaLj5MoHP06siCL3nmUCR/LMxzRiIVsTw5/UoBIxGGSPEDaOxK
        jH8QV7CNC3jCdDNmcZTMDDYdRI9A8Zoj17YkwE6s1nGRHnm8oJgXN4PDUQk/mYXdxSlAPstbRXNDN
        u1AbPGOg==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIxs6-0003B9-91; Thu, 17 Sep 2020 17:39:02 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 2/4] ARM/footbridge: switch to use dma_direct_set_offset for lbus DMA offsets
Date:   Thu, 17 Sep 2020 19:32:27 +0200
Message-Id: <20200917173229.3311382-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917173229.3311382-1-hch@lst.de>
References: <20200917173229.3311382-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Switch the footbridge PCI devices to use dma_direct_set_offset to set the
DMA offset instead of using direct hooks into the DMA mapping code and
remove the now unused hooks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/dma-direct.h             |  4 +-
 arch/arm/include/asm/memory.h                 |  2 -
 arch/arm/mach-footbridge/cats-pci.c           |  7 +++-
 arch/arm/mach-footbridge/common.c             | 40 ++++++++++++++-----
 arch/arm/mach-footbridge/common.h             |  3 ++
 arch/arm/mach-footbridge/ebsa285-pci.c        |  7 +++-
 .../arm/mach-footbridge/include/mach/memory.h |  4 --
 arch/arm/mach-footbridge/netwinder-pci.c      |  7 +++-
 arch/arm/mach-footbridge/personal-pci.c       |  7 +++-
 9 files changed, 54 insertions(+), 27 deletions(-)

diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
index 77fcb7ee5ec907..1f04a5e1c615de 100644
--- a/arch/arm/include/asm/dma-direct.h
+++ b/arch/arm/include/asm/dma-direct.h
@@ -13,12 +13,12 @@ static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
 {
 	if (dev && dev->dma_range_map)
 		pfn = PFN_DOWN(translate_phys_to_dma(dev, PFN_PHYS(pfn)));
-	return (dma_addr_t)__pfn_to_bus(pfn);
+	return (dma_addr_t)__pfn_to_phys(pfn);
 }
 
 static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
 {
-	unsigned long pfn = __bus_to_pfn(addr);
+	unsigned long pfn = __phys_to_pfn(addr);
 
 	if (dev && dev->dma_range_map)
 		pfn = PFN_DOWN(translate_dma_to_phys(dev, PFN_PHYS(pfn)));
diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
index 99035b5891ef44..af612606136ff2 100644
--- a/arch/arm/include/asm/memory.h
+++ b/arch/arm/include/asm/memory.h
@@ -346,8 +346,6 @@ static inline unsigned long __virt_to_idmap(unsigned long x)
 #ifndef __virt_to_bus
 #define __virt_to_bus	__virt_to_phys
 #define __bus_to_virt	__phys_to_virt
-#define __pfn_to_bus(x)	__pfn_to_phys(x)
-#define __bus_to_pfn(x)	__phys_to_pfn(x)
 #endif
 
 /*
diff --git a/arch/arm/mach-footbridge/cats-pci.c b/arch/arm/mach-footbridge/cats-pci.c
index 0b2fd7e2e9b429..257cb068ac0c5b 100644
--- a/arch/arm/mach-footbridge/cats-pci.c
+++ b/arch/arm/mach-footbridge/cats-pci.c
@@ -13,6 +13,7 @@
 #include <asm/irq.h>
 #include <asm/mach/pci.h>
 #include <asm/mach-types.h>
+#include "common.h"
 
 /* cats host-specific stuff */
 static int irqmap_cats[] __initdata = { IRQ_PCI, IRQ_IN0, IRQ_IN1, IRQ_IN3 };
@@ -56,8 +57,10 @@ static struct hw_pci cats_pci __initdata = {
 
 static int __init cats_pci_init(void)
 {
-	if (machine_is_cats())
-		pci_common_init(&cats_pci);
+	if (!machine_is_cats())
+		return 0;
+	bus_register_notifier(&pci_bus_type, &footbridge_pci_dma_nb);
+	pci_common_init(&cats_pci);
 	return 0;
 }
 
diff --git a/arch/arm/mach-footbridge/common.c b/arch/arm/mach-footbridge/common.c
index eee095f0e2f6c2..dc14d72ca7bb3f 100644
--- a/arch/arm/mach-footbridge/common.c
+++ b/arch/arm/mach-footbridge/common.c
@@ -12,6 +12,8 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/spinlock.h>
+#include <linux/device/bus.h>
+#include <linux/dma-mapping.h>
 #include <video/vga.h>
 
 #include <asm/page.h>
@@ -219,8 +221,17 @@ void footbridge_restart(enum reboot_mode mode, const char *cmd)
 	}
 }
 
-#ifdef CONFIG_FOOTBRIDGE_ADDIN
-
+#ifdef CONFIG_FOOTBRIDGE_HOST
+/*
+ * The footbridge is programmed to expose the system RAM at 0xe0000000.
+ * The requirement is that the RAM isn't placed at bus address 0, which
+ * would clash with VGA cards.
+ */
+static inline unsigned long fb_bus_sdram_offset(void)
+{
+	return 0xe0000000;
+}
+#elif defined(CONFIG_FOOTBRIDGE_ADDIN)
 static inline unsigned long fb_bus_sdram_offset(void)
 {
 	return *CSR_PCISDRAMBASE & 0xfffffff0;
@@ -248,17 +259,24 @@ unsigned long __bus_to_virt(unsigned long res)
 	return res;
 }
 EXPORT_SYMBOL(__bus_to_virt);
+#else
+#error "Undefined footbridge mode"
+#endif
 
-unsigned long __pfn_to_bus(unsigned long pfn)
+static int footbridge_pci_dma_notifier(struct notifier_block *nb,
+		unsigned long event, void *data)
 {
-	return __pfn_to_phys(pfn) + (fb_bus_sdram_offset() - PHYS_OFFSET);
-}
-EXPORT_SYMBOL(__pfn_to_bus);
+	struct device *dev = data;
 
-unsigned long __bus_to_pfn(unsigned long bus)
-{
-	return __phys_to_pfn(bus - (fb_bus_sdram_offset() - PHYS_OFFSET));
+	if (event != BUS_NOTIFY_ADD_DEVICE)
+		return NOTIFY_DONE;
+
+	if (dma_direct_set_offset(dev, PAGE_OFFSET, fb_bus_sdram_offset(),
+			(u64)-1))
+		WARN_ONCE(1, "failed to set DMA offset\n");
+	return NOTIFY_OK;
 }
-EXPORT_SYMBOL(__bus_to_pfn);
 
-#endif
+struct notifier_block footbridge_pci_dma_nb = {
+	.notifier_call		= footbridge_pci_dma_notifier,
+};
diff --git a/arch/arm/mach-footbridge/common.h b/arch/arm/mach-footbridge/common.h
index e12587db59c4c8..1773a4183b580c 100644
--- a/arch/arm/mach-footbridge/common.h
+++ b/arch/arm/mach-footbridge/common.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/notifier.h>
 #include <linux/reboot.h>
 
 extern void footbridge_timer_init(void);
@@ -13,3 +14,5 @@ extern void isa_init_irq(unsigned int irq);
 extern void footbridge_restart(enum reboot_mode, const char *);
 
 extern void footbridge_sched_clock(void);
+
+extern struct notifier_block footbridge_pci_dma_nb;
diff --git a/arch/arm/mach-footbridge/ebsa285-pci.c b/arch/arm/mach-footbridge/ebsa285-pci.c
index 6f28aaa9ca79b2..80b4f5ace20b35 100644
--- a/arch/arm/mach-footbridge/ebsa285-pci.c
+++ b/arch/arm/mach-footbridge/ebsa285-pci.c
@@ -13,6 +13,7 @@
 #include <asm/irq.h>
 #include <asm/mach/pci.h>
 #include <asm/mach-types.h>
+#include "common.h"
 
 static int irqmap_ebsa285[] __initdata = { IRQ_IN3, IRQ_IN1, IRQ_IN0, IRQ_PCI };
 
@@ -40,8 +41,10 @@ static struct hw_pci ebsa285_pci __initdata = {
 
 static int __init ebsa285_init_pci(void)
 {
-	if (machine_is_ebsa285())
-		pci_common_init(&ebsa285_pci);
+	if (!machine_is_ebsa285())
+		return 0;
+	bus_register_notifier(&pci_bus_type, &footbridge_pci_dma_nb);
+	pci_common_init(&ebsa285_pci);
 	return 0;
 }
 
diff --git a/arch/arm/mach-footbridge/include/mach/memory.h b/arch/arm/mach-footbridge/include/mach/memory.h
index 46fd4a8872b9a3..3a5d2638c18f88 100644
--- a/arch/arm/mach-footbridge/include/mach/memory.h
+++ b/arch/arm/mach-footbridge/include/mach/memory.h
@@ -26,8 +26,6 @@
 #ifndef __ASSEMBLY__
 extern unsigned long __virt_to_bus(unsigned long);
 extern unsigned long __bus_to_virt(unsigned long);
-extern unsigned long __pfn_to_bus(unsigned long);
-extern unsigned long __bus_to_pfn(unsigned long);
 #endif
 #define __virt_to_bus	__virt_to_bus
 #define __bus_to_virt	__bus_to_virt
@@ -42,8 +40,6 @@ extern unsigned long __bus_to_pfn(unsigned long);
 #define BUS_OFFSET		0xe0000000
 #define __virt_to_bus(x)	((x) + (BUS_OFFSET - PAGE_OFFSET))
 #define __bus_to_virt(x)	((x) - (BUS_OFFSET - PAGE_OFFSET))
-#define __pfn_to_bus(x)		(__pfn_to_phys(x) + (BUS_OFFSET - PHYS_OFFSET))
-#define __bus_to_pfn(x)		__phys_to_pfn((x) - (BUS_OFFSET - PHYS_OFFSET))
 
 #else
 
diff --git a/arch/arm/mach-footbridge/netwinder-pci.c b/arch/arm/mach-footbridge/netwinder-pci.c
index 9473aa0305e5f7..68dac9446e7f44 100644
--- a/arch/arm/mach-footbridge/netwinder-pci.c
+++ b/arch/arm/mach-footbridge/netwinder-pci.c
@@ -13,6 +13,7 @@
 #include <asm/irq.h>
 #include <asm/mach/pci.h>
 #include <asm/mach-types.h>
+#include "common.h"
 
 /*
  * We now use the slot ID instead of the device identifiers to select
@@ -54,8 +55,10 @@ static struct hw_pci netwinder_pci __initdata = {
 
 static int __init netwinder_pci_init(void)
 {
-	if (machine_is_netwinder())
-		pci_common_init(&netwinder_pci);
+	if (!machine_is_netwinder())
+		return 0;
+	bus_register_notifier(&pci_bus_type, &footbridge_pci_dma_nb);
+	pci_common_init(&netwinder_pci);
 	return 0;
 }
 
diff --git a/arch/arm/mach-footbridge/personal-pci.c b/arch/arm/mach-footbridge/personal-pci.c
index 4391e433a4b2fc..5d6759e158b9d0 100644
--- a/arch/arm/mach-footbridge/personal-pci.c
+++ b/arch/arm/mach-footbridge/personal-pci.c
@@ -13,6 +13,7 @@
 #include <asm/irq.h>
 #include <asm/mach/pci.h>
 #include <asm/mach-types.h>
+#include "common.h"
 
 static int irqmap_personal_server[] __initdata = {
 	IRQ_IN0, IRQ_IN1, IRQ_IN2, IRQ_IN3, 0, 0, 0,
@@ -50,8 +51,10 @@ static struct hw_pci personal_server_pci __initdata = {
 
 static int __init personal_pci_init(void)
 {
-	if (machine_is_personal_server())
-		pci_common_init(&personal_server_pci);
+	if (!machine_is_personal_server())
+		return 0;
+	bus_register_notifier(&pci_bus_type, &footbridge_pci_dma_nb);
+	pci_common_init(&personal_server_pci);
 	return 0;
 }
 
-- 
2.28.0

