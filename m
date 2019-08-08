Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2298586C50
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733295AbfHHV0C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:26:02 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55247 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732327AbfHHV0C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:26:02 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mw9oq-1iCGs209Ey-00s26z; Thu, 08 Aug 2019 23:25:38 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 04/22] ARM: omap1: move ohci phy power handling to board files
Date:   Thu,  8 Aug 2019 23:22:13 +0200
Message-Id: <20190808212234.2213262-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JOVFoCl4IruBbAq2/W1OlJMnj12jnk0BHfRQXLRVUPvFZ/BkWjI
 uD870aw7Nu4aFsXKVZbyOS2BCbOqI07ZhFAWvSwi4NG4uZ1+QamwJP0M6iA8Jg5QY+yKiJ9
 FFGQEDAlfr7xfXu1qdu6NG5x3iX8cZp+MSbat54QEbZgActZKFxkdfnbAn/mrCp0j7TFIgV
 ut/HF1/KnWdMc3jRtw0bQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jn6kNrwoVF4=:pCDRiVB9Isdg8kO0ofwjp2
 soKcsJ+YtWwpsoePvFK1hEhCFfG56WIGFwrUfTlQeOfHiZdg9FMCwe4dEEmrZFIfWtSXwLYZc
 WumvnzBi1xjf75bSlL4sAxaGa8HwBy8H53910AwuWPrsax6RHBLYdxL1ptcCd+w7ba1HxGvsA
 5nxXrpTUYNKeo7ZiW09lDNQpFPGgWbpr/AQMvPAl14ocFTTgKL1XPramCztSH2CB/LtyGesCZ
 7Osuk84eDaQ4mK4VJJq1wnJLZRSp7Z8hrK0RuzIuCq68iyJO94QOdfX6EG+QzmQrj0L9LlAkO
 nKQ3ikWxui4qBk+L1m/LM5NDm5YI2hAAZsSjO2PGCyBa6UFAW4z438Db0iETqhFul4zdi2tdG
 EfAniHmbEJwIMUZVz/4ECg2KqpPdfYkadSr82eHYTup/SM9skbd1b5cY6Icz7GIXwOXrx8tIy
 2qRpX8J25iLXTVN+N5Dk0v4UQ8AOYJSf9qi1afc4IMCNeVbMRHw4ZXxCEM9lMI2tDHEKJD18d
 /THATWQ/ZJNHp0TAk7HNXwum++xETK3EoAtWNonxczmYFVpM//uB2LZe6u3VzyByA3r2essjt
 pPhcw9L1rBZmthSiIfGfGqcPOC+CvOd0vCVB01+3BYD/xjzOB3KeCLnWlVZ+UqKaTePFFi+Hv
 80npCWaPfK8bSnEF5dgXWnwbLLKVbzfDiwaM2dGp/f5xKmLD16Ma/iO7L25I4r5xxQa/Icebm
 4Bx5L+EzhOBSXP8MutPHKlSKQDG63P9nKXRO2A==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Two boards require a a special handler to control
their transceiver power. Move the corresponding code
into the board files and out of the common code.

The osk board already has a dependency on TPS65010,
this adds another one, with the same hack to get it
to compile with CONFIG_TPS65010=m.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-innovator.c   | 19 +++++++++++++++++
 arch/arm/mach-omap1/board-osk.c         | 19 +++++++++++++++++
 drivers/usb/host/ohci-omap.c            | 28 ++-----------------------
 include/linux/platform_data/usb-omap1.h |  2 ++
 4 files changed, 42 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
index 2425f1bacb33..653af63320a8 100644
--- a/arch/arm/mach-omap1/board-innovator.c
+++ b/arch/arm/mach-omap1/board-innovator.c
@@ -290,6 +290,23 @@ static void __init innovator_init_smc91x(void)
 }
 
 #ifdef CONFIG_ARCH_OMAP15XX
+/*
+ * Board specific gang-switched transceiver power on/off.
+ */
+static int innovator_omap_ohci_transceiver_power(int on)
+{
+	if (on)
+		__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
+				| ((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
+			       INNOVATOR_FPGA_CAM_USB_CONTROL);
+	else
+		__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
+				& ~((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
+			       INNOVATOR_FPGA_CAM_USB_CONTROL);
+
+	return 0;
+}
+
 static struct omap_usb_config innovator1510_usb_config __initdata = {
 	/* for bundled non-standard host and peripheral cables */
 	.hmc_mode	= 4,
@@ -300,6 +317,8 @@ static struct omap_usb_config innovator1510_usb_config __initdata = {
 
 	.register_dev	= 1,
 	.pins[0]	= 2,
+
+	.transceiver_power = innovator_omap_ohci_transceiver_power,
 };
 
 static const struct omap_lcd_config innovator1510_lcd_config __initconst = {
diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 4df15e693b6e..3be7b3b580d3 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -278,6 +278,23 @@ static void __init osk_init_cf(void)
 	irq_set_irq_type(gpio_to_irq(62), IRQ_TYPE_EDGE_FALLING);
 }
 
+/*
+ * Board specific gang-switched transceiver power on/off.
+ * NOTE:  OSK supplies power from DC, not battery.
+ */
+static int osk_omap_ohci_transceiver_power(int on)
+{
+	if (!IS_BUILTIN(CONFIG_TPS65010))
+		return -ENXIO;
+
+	if (on)
+		tps65010_set_gpio_out_value(GPIO1, LOW);
+	else
+		tps65010_set_gpio_out_value(GPIO1, HIGH);
+
+	return 0;
+}
+
 static struct omap_usb_config osk_usb_config __initdata = {
 	/* has usb host connector (A) ... for development it can also
 	 * be used, with a NONSTANDARD gender-bending cable/dongle, as
@@ -292,6 +309,8 @@ static struct omap_usb_config osk_usb_config __initdata = {
 	.rwc		= 1,
 #endif
 	.pins[0]	= 2,
+
+	.transceiver_power = osk_omap_ohci_transceiver_power,
 };
 
 #ifdef	CONFIG_OMAP_OSK_MISTRAL
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index f7efe65f01c5..e92ef3231f2c 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -77,31 +77,6 @@ static void omap_ohci_clock_power(int on)
 	}
 }
 
-/*
- * Board specific gang-switched transceiver power on/off.
- * NOTE:  OSK supplies power from DC, not battery.
- */
-static int omap_ohci_transceiver_power(int on)
-{
-	if (on) {
-		if (machine_is_omap_innovator() && cpu_is_omap1510())
-			__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
-				| ((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
-			       INNOVATOR_FPGA_CAM_USB_CONTROL);
-		else if (machine_is_omap_osk())
-			tps65010_set_gpio_out_value(GPIO1, LOW);
-	} else {
-		if (machine_is_omap_innovator() && cpu_is_omap1510())
-			__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
-				& ~((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
-			       INNOVATOR_FPGA_CAM_USB_CONTROL);
-		else if (machine_is_omap_osk())
-			tps65010_set_gpio_out_value(GPIO1, HIGH);
-	}
-
-	return 0;
-}
-
 #ifdef	CONFIG_USB_OTG
 
 static void start_hnp(struct ohci_hcd *ohci)
@@ -213,7 +188,8 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 	}
 
 	/* FIXME hub_wq hub requests should manage power switching */
-	omap_ohci_transceiver_power(1);
+	if (config->transceiver_power)
+		config->transceiver_power(1);
 
 	/* board init will have already handled HMC and mux setup.
 	 * any external transceiver should already be initialized
diff --git a/include/linux/platform_data/usb-omap1.h b/include/linux/platform_data/usb-omap1.h
index 878e572a78bf..e7b8dc92a269 100644
--- a/include/linux/platform_data/usb-omap1.h
+++ b/include/linux/platform_data/usb-omap1.h
@@ -50,6 +50,8 @@ struct omap_usb_config {
 	int (*ocpi_enable)(void);
 
 	void (*lb_reset)(void);
+
+	int (*transceiver_power)(int on);
 };
 
 #endif /* __LINUX_USB_OMAP1_H */
-- 
2.20.0

