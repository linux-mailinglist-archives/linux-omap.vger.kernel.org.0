Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 599D686C67
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390430AbfHHVaH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:30:07 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59461 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729780AbfHHVaH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:30:07 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M3VAI-1hwOCu3Lmc-000coR; Thu, 08 Aug 2019 23:29:38 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Dominik Brodowski <linux@dominikbrodowski.net>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 08/22] ARM: omap1: move CF chipselect setup to board file
Date:   Thu,  8 Aug 2019 23:22:17 +0200
Message-Id: <20190808212234.2213262-9-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RnYUAFwmM2m8m3O3+HxSSuGDaMoTlH+cBY3+Em0tOAfUOFvgiWl
 DGMc8fUF062WVjG28ZUaUjq8Rg2rNw40pVJ58L5chj9rpHv7J9L6TBrJIbFnL2h5o1QXtr+
 N1LXPAFl2IyKboH9pXfEpzkQKV8H24+tFDXlUzWzf7JVy+Fjg4ifDix1Jwg3YkZHCkarvJT
 lUbx971y+k3+es6cqk4IQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3VR5CSysz1I=:iP2/yKLl57ITrfMx5hjul6
 Bha0XcVmbYovcD/iBBKCj1uzDy6KT6vwjB4AwlmFrHTUgLY8BZ9tMa4Ik7mrU7uwssU8dIisD
 hsTQV37EhUVgQdj5dgWluuFjcN3+pa0+qH8W6b5QTm5+wheWeI/mTSjcDhLxfQNnE5M27rAoN
 6w5kFCm9zXloTf7MTln36UQhMBuBD6KtIy/qB9QqAkBv6VgyfYm4eSf+fZnxuOr9ySD3fXtxq
 gzhLRHVOq5nbGPWiTU3CdSzJNL9vEYA/k+TyRbOGjMysq24f1xzKvsQXGTnozTh1iOoAV0UN1
 nfg991BHUM03zZIqEM95pXgK9tQmmT8B+0FLs/JLIZAwRASO+7qWrnAhW3lrbgcqIHipijx3u
 u1Iwn6jv+L0/O+2PC7Lm1XH57FCtrqKSc/stl7FR+4o5GeSWmMXogqHTBETKwdGIllisM869y
 +Ivw/KTqHMoHIyoHfAmV7FOx4KLiohSYfUsdZnaEMwzi/sipZ58arT/gYewDn9Lg2nq3F2u+2
 80KDfRMKJtWwoF/0bYnvEudR4BUgBsigLclTvrYtOMpTkK0LA/5GuKjikcV63LsE6SwjMOuaW
 Zh6xUwqQTt98d4Sui0D7PxTTOOxySM2Ra1SL0fUEGqJEMs86urCOWEVa4Bc9L/Xfk+5Ko5cAq
 LSrjWl+ZK+HnowMJwtfwlKxQ+lNLoHCvP5dKyjDiWHgSlPIz0yfWER7OdqfmoBiqTsDYvi7zs
 28RqK/XWNHaas+ei7eQnVMT0HLgv3qFs9OwM9Q==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is only one board that uses the omap_cf driver, so
moving the chipselect configuration there does not lead
to code duplication but avoids the use of mach/tc.h
in drivers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-osk.c | 38 ++++++++++++++++++++++++++++-----
 drivers/pcmcia/Kconfig          |  3 ++-
 drivers/pcmcia/omap_cf.c        | 38 ++++++---------------------------
 3 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 99ebe4503787..38d73da5d13d 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -149,14 +149,14 @@ static struct resource osk5912_cf_resources[] = {
 	[0] = {
 		.flags	= IORESOURCE_IRQ,
 	},
+	[1] = {
+		.flags = IORESOURCE_MEM,
+	},
 };
 
 static struct platform_device osk5912_cf_device = {
 	.name		= "omap_cf",
 	.id		= -1,
-	.dev = {
-		.platform_data	= (void *) 2 /* CS2 */,
-	},
 	.num_resources	= ARRAY_SIZE(osk5912_cf_resources),
 	.resource	= osk5912_cf_resources,
 };
@@ -267,13 +267,41 @@ static void __init osk_init_smc91x(void)
 	omap_writel(l, EMIFS_CCS(1));
 }
 
-static void __init osk_init_cf(void)
+static void __init osk_init_cf(int seg)
 {
+	struct resource *res = &osk5912_cf_resources[1];
+
 	omap_cfg_reg(M7_1610_GPIO62);
 	if ((gpio_request(62, "cf_irq")) < 0) {
 		printk("Error requesting gpio 62 for CF irq\n");
 		return;
 	}
+
+	switch (seg) {
+	/* NOTE: CS0 could be configured too ... */
+	case 1:
+		res->start = OMAP_CS1_PHYS;
+		break;
+	case 2:
+		res->start = OMAP_CS2_PHYS;
+		break;
+	case 3:
+		res->start = omap_cs3_phys();
+		break;
+	}
+
+	res->end = res->start + SZ_8K - 1;
+	osk5912_cf_device.dev.platform_data = (void *)(uintptr_t)seg;
+
+	/* NOTE:  better EMIFS setup might support more cards; but the
+	 * TRM only shows how to affect regular flash signals, not their
+	 * CF/PCMCIA variants...
+	 */
+	pr_debug("%s: cs%d, previous ccs %08x acs %08x\n", __func__,
+		seg, omap_readl(EMIFS_CCS(seg)), omap_readl(EMIFS_ACS(seg)));
+	omap_writel(0x0004a1b3, EMIFS_CCS(seg));	/* synch mode 4 etc */
+	omap_writel(0x00000000, EMIFS_ACS(seg));	/* OE hold/setup */
+
 	/* the CF I/O IRQ is really active-low */
 	irq_set_irq_type(gpio_to_irq(62), IRQ_TYPE_EDGE_FALLING);
 }
@@ -577,7 +605,7 @@ static void __init osk_init(void)
 	u32 l;
 
 	osk_init_smc91x();
-	osk_init_cf();
+	osk_init_cf(2); /* CS2 */
 
 	/* Workaround for wrong CS3 (NOR flash) timing
 	 * There are some U-Boot versions out there which configure
diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index e004d8da03dc..ca6e2ac2a92f 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -250,7 +250,8 @@ config PCMCIA_VRC4173
 
 config OMAP_CF
 	tristate "OMAP CompactFlash Controller"
-	depends on PCMCIA && ARCH_OMAP16XX
+	depends on PCMCIA
+	depends on ARCH_OMAP16XX || (ARM && COMPILE_TEST)
 	help
 	  Say Y here to support the CompactFlash controller on OMAP.
 	  Note that this doesn't support "True IDE" mode.
diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index 0a04eb04f3a2..98df6473034d 100644
--- a/drivers/pcmcia/omap_cf.c
+++ b/drivers/pcmcia/omap_cf.c
@@ -16,13 +16,12 @@
 
 #include <pcmcia/ss.h>
 
-#include <mach/hardware.h>
 #include <asm/io.h>
 #include <linux/sizes.h>
 
-#include <mach/mux.h>
-#include <mach/tc.h>
-
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 /* NOTE:  don't expect this to support many I/O cards.  The 16xx chips have
  * hard-wired timings to support Compact Flash memory cards; they won't work
@@ -205,6 +204,7 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 	struct omap_cf_socket	*cf;
 	int			irq;
 	int			status;
+	struct resource		*res;
 
 	seg = (int) pdev->dev.platform_data;
 	if (seg == 0 || seg > 3)
@@ -215,6 +215,8 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return -EINVAL;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
 	cf = kzalloc(sizeof *cf, GFP_KERNEL);
 	if (!cf)
 		return -ENOMEM;
@@ -230,24 +232,7 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 		goto fail0;
 	cf->irq = irq;
 	cf->socket.pci_irq = irq;
-
-	switch (seg) {
-	/* NOTE: CS0 could be configured too ... */
-	case 1:
-		cf->phys_cf = OMAP_CS1_PHYS;
-		break;
-	case 2:
-		cf->phys_cf = OMAP_CS2_PHYS;
-		break;
-	case 3:
-		cf->phys_cf = omap_cs3_phys();
-		break;
-	default:
-		goto  fail1;
-	}
-	cf->iomem.start = cf->phys_cf;
-	cf->iomem.end = cf->iomem.end + SZ_8K - 1;
-	cf->iomem.flags = IORESOURCE_MEM;
+	cf->phys_cf = res->start;
 
 	/* pcmcia layer only remaps "real" memory */
 	cf->socket.io_offset = (unsigned long)
@@ -269,15 +254,6 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 
 	pr_info("%s: cs%d on irq %d\n", driver_name, seg, irq);
 
-	/* NOTE:  better EMIFS setup might support more cards; but the
-	 * TRM only shows how to affect regular flash signals, not their
-	 * CF/PCMCIA variants...
-	 */
-	pr_debug("%s: cs%d, previous ccs %08x acs %08x\n", driver_name,
-		seg, omap_readl(EMIFS_CCS(seg)), omap_readl(EMIFS_ACS(seg)));
-	omap_writel(0x0004a1b3, EMIFS_CCS(seg));	/* synch mode 4 etc */
-	omap_writel(0x00000000, EMIFS_ACS(seg));	/* OE hold/setup */
-
 	/* CF uses armxor_ck, which is "always" available */
 
 	pr_debug("%s: sts %04x cfg %04x control %04x %s\n", driver_name,
-- 
2.20.0

