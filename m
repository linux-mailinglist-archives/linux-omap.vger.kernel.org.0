Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E8F86C55
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403970AbfHHV1f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:27:35 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:59993 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732609AbfHHV1f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:27:35 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mae7u-1iTFkD13hS-00cAUB; Thu, 08 Aug 2019 23:27:11 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Paul Walmsley <paul@pwsan.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 05/22] ARM: omap1: move mach/usb.h to include/linux/soc
Date:   Thu,  8 Aug 2019 23:22:14 +0200
Message-Id: <20190808212234.2213262-6-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7EGvG9MpSe9Tat/1OUNribL9cDQ0sxKW61daPJqVL1gxJb8OEBR
 SI9Y51w8PPLJpodpTJzERNyjlfay9T96WdETvnRYbl3xr/qBnhKa1ZWca43USmz9o3DJyVu
 t9C+a53+DEZl/FsNdTps8DotMHx1K7ibwXsZ1KMj0eQ2DvfiVGdgJ4Yiml3uxHEe3+uWfvu
 V3X2angRNbQEMC+psMg9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6raSuf2fSPs=:wswGz7TSCdp6+NKQAd3LV+
 1VzQqn6TcE2KeXFsiXfm75ict2KWKFcc6yl3Ir3rT+HVMJrO85712goOOhgyZTJtuKb8uARXw
 9HfSp8RAx72pMfVXkksS0T6Wmw46KXBsf1lcvSEjdorAxfdtdrhBC2BjbmXLQiZRnQokICoc4
 SVXx44owCJP7eULDbmM7wsX/0eapZUGoxY25crfKSsnoYfpFwjZK9nlv1j4n1eymS65qreupi
 RpbBgCS3eRRpm25/7VpOsxve1pH9xPOtL5enxzwBMgciTGHFqCEgLmjM37wEqzcJjuwGZ6P6I
 m/Tu3FO2B1riROySQq5FcVBB7kwaeouWw/TC3EX5FYsoGG3e+sfR9zQilXVte/kD/ywuYPek0
 othyya7ws7YFE3z0XOzoISXPnur06nOn+yExHUkP2y7YlDmLMOmQHiNh2cLcsIOT0WThemZko
 L2vgYD4B6H9fWGoo5w5loHqFbgxH1HqjhSYSmYCHk8qbNhSEGVZKuC/+hVdoSJUWPV8WqbwHo
 uTcqWydcd7e83PJbXkdbXIOltuNTahVYFI5CA65z+3/6QYbOk0eaWA8kGvkAeHVtygRQH04e7
 PFBaApAuDBMpA9BjMdmO0w1H8idanXAettibgGtEPp4S5toAxksUz1IOg8WMg2UMdAg+RCZHx
 Vgep4U5+Oy0SUR3XxbDD+8HnOfOHsU2HbUeg9mg1gcAOJweqOeKfDNU/k9hVT90G1qQdQGWCP
 m0CuqU4ZOuQzLsFfxbMJfT3g/Bum8mX6oacmhA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The register definitions in this header are used in at least four
different places, with little hope of completely cleaning that up.

Split up the file into a portion that becomes a linux-wide header
under include/linux/soc/ti/, and the parts that are actually only
needed by board files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-ams-delta.c         |  2 +-
 arch/arm/mach-omap1/board-generic.c           |  2 +-
 arch/arm/mach-omap1/board-h2.c                |  2 +-
 arch/arm/mach-omap1/board-h3.c                |  2 +-
 arch/arm/mach-omap1/board-htcherald.c         |  2 +-
 arch/arm/mach-omap1/board-innovator.c         |  2 +-
 arch/arm/mach-omap1/board-nokia770.c          |  2 +-
 arch/arm/mach-omap1/board-osk.c               |  2 +-
 arch/arm/mach-omap1/board-palmte.c            |  2 +-
 arch/arm/mach-omap1/board-palmtt.c            |  2 +-
 arch/arm/mach-omap1/board-palmz71.c           |  2 +-
 arch/arm/mach-omap1/board-sx1.c               |  2 +-
 arch/arm/mach-omap1/clock_data.c              |  2 +-
 arch/arm/mach-omap1/usb.c                     |  2 +-
 arch/arm/mach-omap1/usb.h                     | 25 +++++++++++++++++
 drivers/usb/gadget/udc/omap_udc.c             |  3 +-
 drivers/usb/host/ohci-omap.c                  |  4 +--
 drivers/usb/phy/phy-isp1301-omap.c            |  2 +-
 .../usb.h => include/linux/soc/ti/omap1-usb.h | 28 ++++++-------------
 19 files changed, 52 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm/mach-omap1/usb.h
 rename arch/arm/mach-omap1/include/mach/usb.h => include/linux/soc/ti/omap1-usb.h (86%)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index e47a6fbcfd6e..2d63db557792 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -39,7 +39,7 @@
 
 #include <mach/hardware.h>
 #include "camera.h"
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "ams-delta-fiq.h"
 #include "board-ams-delta.h"
diff --git a/arch/arm/mach-omap1/board-generic.c b/arch/arm/mach-omap1/board-generic.c
index c62554990115..8ef0a9b17e92 100644
--- a/arch/arm/mach-omap1/board-generic.c
+++ b/arch/arm/mach-omap1/board-generic.c
@@ -21,7 +21,7 @@
 
 #include <mach/mux.h>
 
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
index cb7ce627ffe8..92a31727a069 100644
--- a/arch/arm/mach-omap1/board-h2.c
+++ b/arch/arm/mach-omap1/board-h2.c
@@ -41,7 +41,7 @@
 #include "flash.h"
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 #include "board-h2.h"
diff --git a/arch/arm/mach-omap1/board-h3.c b/arch/arm/mach-omap1/board-h3.c
index 4249984f9c30..86260498c344 100644
--- a/arch/arm/mach-omap1/board-h3.c
+++ b/arch/arm/mach-omap1/board-h3.c
@@ -45,7 +45,7 @@
 
 #include <mach/hardware.h>
 #include <mach/irqs.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 #include "board-h3.h"
diff --git a/arch/arm/mach-omap1/board-htcherald.c b/arch/arm/mach-omap1/board-htcherald.c
index 258304edf23e..f7220b60eb61 100644
--- a/arch/arm/mach-omap1/board-htcherald.c
+++ b/arch/arm/mach-omap1/board-htcherald.c
@@ -31,7 +31,7 @@
 #include "mmc.h"
 
 #include <mach/irqs.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
index 653af63320a8..f169e172421d 100644
--- a/arch/arm/mach-omap1/board-innovator.c
+++ b/arch/arm/mach-omap1/board-innovator.c
@@ -34,7 +34,7 @@
 #include <linux/platform_data/keypad-omap.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "iomap.h"
 #include "common.h"
diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 11511ae2e0a2..e43c852103f5 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -31,7 +31,7 @@
 #include <mach/mux.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 #include "clock.h"
diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 3be7b3b580d3..99ebe4503787 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -51,7 +51,7 @@
 #include <mach/tc.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-palmte.c b/arch/arm/mach-omap1/board-palmte.c
index ce6f0fcd9d12..4ac981c5cf74 100644
--- a/arch/arm/mach-omap1/board-palmte.c
+++ b/arch/arm/mach-omap1/board-palmte.c
@@ -38,7 +38,7 @@
 #include <linux/platform_data/keypad-omap.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "mmc.h"
 #include "common.h"
diff --git a/arch/arm/mach-omap1/board-palmtt.c b/arch/arm/mach-omap1/board-palmtt.c
index 8a08311c4e05..e48ae5fbe1b1 100644
--- a/arch/arm/mach-omap1/board-palmtt.c
+++ b/arch/arm/mach-omap1/board-palmtt.c
@@ -38,7 +38,7 @@
 #include <linux/platform_data/keypad-omap.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-palmz71.c b/arch/arm/mach-omap1/board-palmz71.c
index 034e5bc6a029..37db0ab31528 100644
--- a/arch/arm/mach-omap1/board-palmz71.c
+++ b/arch/arm/mach-omap1/board-palmz71.c
@@ -40,7 +40,7 @@
 #include <linux/platform_data/keypad-omap.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-sx1.c b/arch/arm/mach-omap1/board-sx1.c
index bb9ec345e204..0965b1b689ec 100644
--- a/arch/arm/mach-omap1/board-sx1.c
+++ b/arch/arm/mach-omap1/board-sx1.c
@@ -38,7 +38,7 @@
 #include "board-sx1.h"
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index 3ebcd96efbff..ef46c5f67cf9 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -22,7 +22,7 @@
 #include "soc.h"
 
 #include <mach/hardware.h>
-#include <mach/usb.h>   /* for OTG_BASE */
+#include "usb.h"   /* for OTG_BASE */
 
 #include "iomap.h"
 #include "clock.h"
diff --git a/arch/arm/mach-omap1/usb.c b/arch/arm/mach-omap1/usb.c
index 740c876ae46b..a9deda073822 100644
--- a/arch/arm/mach-omap1/usb.c
+++ b/arch/arm/mach-omap1/usb.c
@@ -16,7 +16,7 @@
 
 #include <mach/mux.h>
 
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/usb.h b/arch/arm/mach-omap1/usb.h
new file mode 100644
index 000000000000..08c9344c46e3
--- /dev/null
+++ b/arch/arm/mach-omap1/usb.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * fixme correct answer depends on hmc_mode,
+ * as does (on omap1) any nonzero value for config->otg port number
+ */
+#include <linux/platform_data/usb-omap1.h>
+#include <linux/soc/ti/omap1-usb.h>
+
+#if IS_ENABLED(CONFIG_USB_OMAP)
+#define	is_usb0_device(config)	1
+#else
+#define	is_usb0_device(config)	0
+#endif
+
+#if IS_ENABLED(CONFIG_USB_SUPPORT)
+void omap1_usb_init(struct omap_usb_config *pdata);
+#else
+static inline void omap1_usb_init(struct omap_usb_config *pdata)
+{
+}
+#endif
+
+#define OMAP1_OHCI_BASE			0xfffba000
+#define OMAP2_OHCI_BASE			0x4805e000
+#define OMAP_OHCI_BASE			OMAP1_OHCI_BASE
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index f36f0730afab..721c9c3fe5a7 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -40,8 +40,9 @@
 #include <asm/mach-types.h>
 
 #include <linux/omap-dma.h>
+#include <linux/platform_data/usb-omap1.h>
 
-#include <mach/usb.h>
+#include <linux/soc/ti/omap1-usb.h>
 
 #include "omap_udc.h"
 
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index e92ef3231f2c..841563fba20d 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -25,6 +25,8 @@
 #include <linux/module.h>
 #include <linux/usb/otg.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/usb-omap1.h>
+#include <linux/soc/ti/omap1-usb.h>
 #include <linux/signal.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -37,8 +39,6 @@
 #include <mach/mux.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
-
 
 #define DRIVER_DESC "OHCI OMAP driver"
 
diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index 7041ba030052..18cf87dcc21f 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -25,7 +25,7 @@
 
 #include <mach/mux.h>
 
-#include <mach/usb.h>
+#include <linux/soc/ti/omap1-usb.h>
 
 #undef VERBOSE
 
diff --git a/arch/arm/mach-omap1/include/mach/usb.h b/include/linux/soc/ti/omap1-usb.h
similarity index 86%
rename from arch/arm/mach-omap1/include/mach/usb.h
rename to include/linux/soc/ti/omap1-usb.h
index 5429d86c7190..67488698601a 100644
--- a/arch/arm/mach-omap1/include/mach/usb.h
+++ b/include/linux/soc/ti/omap1-usb.h
@@ -1,34 +1,20 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_TI_OMAP1_USB
+#define __SOC_TI_OMAP1_USB
 /*
- * FIXME correct answer depends on hmc_mode,
- * as does (on omap1) any nonzero value for config->otg port number
+ * Constants in this file are used all over the place, in platform
+ * code, as well as the udc, phy and ohci drivers.
+ * This is not a great design, but unlikely to get fixed after
+ * such a long time. Don't do this elsewhere.
  */
-#if IS_ENABLED(CONFIG_USB_OMAP)
-#define	is_usb0_device(config)	1
-#else
-#define	is_usb0_device(config)	0
-#endif
-
-#include <linux/platform_data/usb-omap1.h>
-
-#if IS_ENABLED(CONFIG_USB_SUPPORT)
-void omap1_usb_init(struct omap_usb_config *pdata);
-#else
-static inline void omap1_usb_init(struct omap_usb_config *pdata)
-{
-}
-#endif
 
 #define OMAP1_OTG_BASE			0xfffb0400
 #define OMAP1_UDC_BASE			0xfffb4000
-#define OMAP1_OHCI_BASE			0xfffba000
 
-#define OMAP2_OHCI_BASE			0x4805e000
 #define OMAP2_UDC_BASE			0x4805e200
 #define OMAP2_OTG_BASE			0x4805e300
 #define OTG_BASE			OMAP1_OTG_BASE
 #define UDC_BASE			OMAP1_UDC_BASE
-#define OMAP_OHCI_BASE			OMAP1_OHCI_BASE
 
 /*
  * OTG and transceiver registers, for OMAPs starting with ARM926
@@ -126,3 +112,5 @@ static inline void omap1_usb_init(struct omap_usb_config *pdata)
 #	define	CONF_USB0_ISOLATE_R	(1 << 3)
 #	define	CONF_USB_PWRDN_DM_R	(1 << 2)
 #	define	CONF_USB_PWRDN_DP_R	(1 << 1)
+
+#endif
-- 
2.20.0

