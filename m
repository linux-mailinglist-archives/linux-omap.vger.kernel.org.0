Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7C15506E5F
	for <lists+linux-omap@lfdr.de>; Tue, 19 Apr 2022 15:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352764AbiDSNnx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Apr 2022 09:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352553AbiDSNls (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Apr 2022 09:41:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C26D381AA;
        Tue, 19 Apr 2022 06:38:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE5CF616A7;
        Tue, 19 Apr 2022 13:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1F3C385B0;
        Tue, 19 Apr 2022 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650375534;
        bh=4iDu1ZR93Hpdk0ePDMtItzf+hxINHA/lI2UqgUNvzAk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iYu4XDHn5LNc7q3bp0MnU+38E/Ct276pZyBclM70B5U7U15YheXM7tnLSDrpUiUFQ
         LOdrjAjpzyttsvLOqFC2b7tDcSoaZFMybnxyY5aUJrfJtURup3vbi2iY75ltYnDLuS
         R0BLoJT+6r95ZIXxT2lNCWCFV7jGVZ7Sde1XjlYMf9LdvnqvV4unQN9PnYwj+Xjx8X
         7eBiNtO4k2iiNvODCKeMIIYXlu+l9Iz92DSuTWievPEejspI9ZHnElvJr2WOS2dbqw
         lFRLt6aXKxLOfia2VmyXNyqNDgSTrk89Sgbp424LQiBRKM9tKYyKriV+ZzqFh6k3u5
         x1pStxY//K6Sg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
        jmkrzyszt@gmail.com
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        Kevin Hilman <khilman@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Mark Brown <broonie@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 10/41] ARM: omap1: move CF chipselect setup to board file
Date:   Tue, 19 Apr 2022 15:36:52 +0200
Message-Id: <20220419133723.1394715-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

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
index b627a4351cf0..5dbc8f109aa7 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -153,14 +153,14 @@ static struct resource osk5912_cf_resources[] = {
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
@@ -275,13 +275,41 @@ static void __init osk_init_smc91x(void)
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
@@ -580,7 +608,7 @@ static void __init osk_init(void)
 	u32 l;
 
 	osk_init_smc91x();
-	osk_init_cf();
+	osk_init_cf(2); /* CS2 */
 
 	/* Workaround for wrong CS3 (NOR flash) timing
 	 * There are some U-Boot versions out there which configure
diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index 2ce261cfff8e..ec977f031bc2 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -246,7 +246,8 @@ config PCMCIA_VRC4171
 
 config OMAP_CF
 	tristate "OMAP CompactFlash Controller"
-	depends on PCMCIA && ARCH_OMAP16XX
+	depends on PCMCIA
+	depends on ARCH_OMAP16XX || (ARM && COMPILE_TEST)
 	help
 	  Say Y here to support the CompactFlash controller on OMAP.
 	  Note that this doesn't support "True IDE" mode.
diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index f0b2c2d03469..093022ce7d91 100644
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
@@ -273,15 +258,6 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 
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
2.29.2

