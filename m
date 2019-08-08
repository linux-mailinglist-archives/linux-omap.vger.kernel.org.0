Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7305486C94
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390340AbfHHVnN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:43:13 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:46923 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733295AbfHHVnM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:43:12 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MA88C-1i31ze2V7C-00BeaO; Thu, 08 Aug 2019 23:42:40 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Paul Walmsley <paul@pwsan.com>,
        Kevin Hilman <khilman@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 15/22] ARM: omap1: move mach/*.h into mach directory
Date:   Thu,  8 Aug 2019 23:41:25 +0200
Message-Id: <20190808214232.2798396-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0NtHFICYaisIsOL4SLfQ5PnSC40jDWA56cpBCTEaGu/+fYmGvz3
 Q0HsNoC6tgm755p1Z8c/MAYXN+ogEOBUuDidEX4OW4EQDv8Z6e0vEsEendSnrGUojWa0giR
 z2v+fBbyBakCeDbzJ+YvCHVmhWYBuimycrt6wpGFT5ObxSG/Ls8EA3pcgf8ly6USL2qcVdQ
 nGxjOmzSwBI5jNV5U6w6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FzN6doZzEkw=:5I1+kCwLJe+7dA7XZWRopu
 x9RqtUOyw6Y0BEKvCWromcwYw6UXXLVRm6MrFZKKlGA8KsqSB/2WPHd5RbpwBW67uMeXprX7p
 EDSXSfaXmMGbkvxole5mupFF0ruwLn2pPMFdoQgEb33dXyH51qNGdIPFdvcb6agYk2hPbndgL
 TfEl5sTpPE9CofTZ8xWi7qm4S4zcySAPm/lH5/hXiRAZuAXsTfqEcd6lphZiF2nbZ+hBeW+Uq
 z6+NCbmeu5nf/KUHjYa4md897ggNyJwAA29mcCHTyf2uUXFItvMS0bQBl9vn20RFaBVH1dnRd
 irNbYB+rBK6/KcM9hHR6poviIGz40+omkfKQmDNeabRxkLlqCoKWzcQQ4oPTbUaeDgYr9WKxF
 23llxRDIQAU5CxTsKu8OAujDZIuN+/y7OypunV8j0HifMLEQ/VCPUD+GrurND1ZQlsZdT9z2B
 ERUyOgq5mZL0/WjYl528/HWiwwRCJomSTi1QtAeI+M4q0MdNg0LXNsVvPeHJHVmupxLa9GIgN
 nBGTqc5hMdKYWCer+AGyE9YhpDYw2ZGxXdL83pZbl4NZuWWbYHKEtYT0axvKgLovDDZvr9YVI
 RIuVihZkIzErp/TY/nnnGQzAjD7hJvLKi8RgGxv8F6QW1jhWlKGv1z2wJXtJaYzayzDJZAMzh
 sES9P7LZO5z8Bp9RQZpX6gkgkyn6A6mgU5U4N8xG9mw+l74TD1rKY6+/JkYx+tDaOCphndfrb
 5GVrAdcwvEaW+4yGPkqUTirFj37akcP9HHqenQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Most of the header files are no longer referenced from outside
arch/arm/mach-omap1, so move them all to that place directly
and change their users to use the new location.

The exceptions are:

- mach/tc.h is used by arch/arm/plat-omap/dma.c
- mach/compress.h is used by the core architecture code
- mach/serial.h is used by mach/compress.h

The mach/memory.h is empty and gets removed in the process,
avoiding the need for CONFIG_NEED_MACH_MEMORY_H.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                              |  1 -
 arch/arm/mach-omap1/ams-delta-fiq-handler.S   |  3 ++-
 arch/arm/mach-omap1/ams-delta-fiq.c           |  2 ++
 arch/arm/mach-omap1/ams-delta-fiq.h           |  2 +-
 arch/arm/mach-omap1/board-ams-delta.c         |  5 ++---
 arch/arm/mach-omap1/board-fsample.c           | 10 ++++-----
 arch/arm/mach-omap1/board-generic.c           |  6 ++----
 arch/arm/mach-omap1/board-h2.c                | 10 ++++-----
 arch/arm/mach-omap1/board-h3.c                | 12 +++++------
 arch/arm/mach-omap1/board-htcherald.c         |  8 +++----
 arch/arm/mach-omap1/board-innovator.c         | 10 ++++-----
 arch/arm/mach-omap1/board-nokia770.c          |  6 ++----
 arch/arm/mach-omap1/board-osk.c               |  9 ++++----
 arch/arm/mach-omap1/board-palmte.c            | 12 +++++------
 arch/arm/mach-omap1/board-palmtt.c            | 12 +++++------
 arch/arm/mach-omap1/board-palmz71.c           | 12 +++++------
 arch/arm/mach-omap1/board-perseus2.c          |  7 +++----
 arch/arm/mach-omap1/board-sx1-mmc.c           |  3 +--
 arch/arm/mach-omap1/board-sx1.c               | 10 ++++-----
 arch/arm/mach-omap1/clock.c                   |  4 ++--
 arch/arm/mach-omap1/clock_data.c              |  5 ++---
 arch/arm/mach-omap1/common.h                  |  3 +--
 arch/arm/mach-omap1/devices.c                 |  8 +++----
 arch/arm/mach-omap1/fb.c                      |  2 +-
 arch/arm/mach-omap1/flash.c                   |  3 ++-
 arch/arm/mach-omap1/fpga.c                    |  3 +--
 arch/arm/mach-omap1/gpio15xx.c                |  3 ++-
 arch/arm/mach-omap1/gpio16xx.c                |  5 +++--
 arch/arm/mach-omap1/gpio7xx.c                 |  3 +--
 .../mach-omap1/{include/mach => }/hardware.h  |  2 --
 arch/arm/mach-omap1/i2c.c                     |  3 ++-
 arch/arm/mach-omap1/id.c                      |  5 ++---
 arch/arm/mach-omap1/include/mach/memory.h     | 12 -----------
 arch/arm/mach-omap1/io.c                      |  5 ++---
 arch/arm/mach-omap1/irq.c                     |  4 +---
 arch/arm/mach-omap1/{include/mach => }/irqs.h |  2 --
 arch/arm/mach-omap1/mcbsp.c                   |  9 ++++----
 .../mach-omap1/{include/mach => }/mtd-xip.h   |  3 ++-
 arch/arm/mach-omap1/mux.c                     |  6 +++---
 arch/arm/mach-omap1/{include/mach => }/mux.h  |  2 --
 arch/arm/mach-omap1/ocpi.c                    |  4 ++--
 .../mach-omap1/{include/mach => }/omap1510.h  |  0
 .../mach-omap1/{include/mach => }/omap16xx.h  |  0
 .../mach-omap1/{include/mach => }/omap7xx.h   |  0
 arch/arm/mach-omap1/pm.c                      |  7 ++++---
 arch/arm/mach-omap1/pm.h                      |  2 ++
 arch/arm/mach-omap1/reset.c                   |  3 +--
 arch/arm/mach-omap1/serial.c                  |  3 ++-
 arch/arm/mach-omap1/sleep.S                   |  2 +-
 arch/arm/mach-omap1/soc.h                     |  4 ++--
 arch/arm/mach-omap1/sram.S                    |  4 ++--
 arch/arm/mach-omap1/time.c                    |  2 +-
 arch/arm/mach-omap1/timer.c                   |  1 +
 arch/arm/mach-omap1/timer32k.c                |  3 +--
 arch/arm/mach-omap1/usb.c                     |  6 +++---
 arch/arm/plat-omap/dma.c                      |  2 +-
 arch/arm/plat-omap/include/plat/cpu.h         | 21 -------------------
 57 files changed, 118 insertions(+), 178 deletions(-)
 rename arch/arm/mach-omap1/{include/mach => }/hardware.h (99%)
 delete mode 100644 arch/arm/mach-omap1/include/mach/memory.h
 rename arch/arm/mach-omap1/{include/mach => }/irqs.h (99%)
 rename arch/arm/mach-omap1/{include/mach => }/mtd-xip.h (97%)
 rename arch/arm/mach-omap1/{include/mach => }/mux.h (98%)
 rename arch/arm/mach-omap1/{include/mach => }/omap1510.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/omap16xx.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/omap7xx.h (100%)
 delete mode 100644 arch/arm/plat-omap/include/plat/cpu.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8263fe7a5e64..0febd7a1d65f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -503,7 +503,6 @@ config ARCH_OMAP1
 	select GPIOLIB
 	select HAVE_IDE
 	select IRQ_DOMAIN
-	select NEED_MACH_MEMORY_H
 	select SPARSE_IRQ
 	help
 	  Support for older TI OMAP1 (omap7xx, omap15xx or omap16xx)
diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
index 81159af44862..d2c9481aadba 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
+++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
@@ -15,11 +15,12 @@
 #include <linux/platform_data/gpio-omap.h>
 
 #include <asm/assembler.h>
+#include <linux/soc/ti/omap1-io.h>
 
+#include "hardware.h"
 #include "ams-delta-fiq.h"
 #include "board-ams-delta.h"
 #include "iomap.h"
-#include "soc.h"
 
 /*
  * OMAP1510 GPIO related symbol copied from arch/arm/mach-omap1/gpio15xx.c.
diff --git a/arch/arm/mach-omap1/ams-delta-fiq.c b/arch/arm/mach-omap1/ams-delta-fiq.c
index 43899fa56674..1f62b3de4f87 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq.c
+++ b/arch/arm/mach-omap1/ams-delta-fiq.c
@@ -21,7 +21,9 @@
 #include <linux/platform_device.h>
 
 #include <asm/fiq.h>
+#include <linux/soc/ti/omap1-io.h>
 
+#include "hardware.h"
 #include "ams-delta-fiq.h"
 #include "board-ams-delta.h"
 
diff --git a/arch/arm/mach-omap1/ams-delta-fiq.h b/arch/arm/mach-omap1/ams-delta-fiq.h
index fd76df3cce37..7f843caedb7c 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq.h
+++ b/arch/arm/mach-omap1/ams-delta-fiq.h
@@ -16,7 +16,7 @@
 #ifndef __AMS_DELTA_FIQ_H
 #define __AMS_DELTA_FIQ_H
 
-#include <mach/irqs.h>
+#include "irqs.h"
 
 /*
  * Interrupt number used for passing control from FIQ to IRQ.
diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 2d63db557792..c937b2f3204b 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -35,12 +35,11 @@
 #include <asm/mach/map.h>
 
 #include <linux/platform_data/keypad-omap.h>
-#include <mach/mux.h>
 
-#include <mach/hardware.h>
+#include "mux.h"
+#include "hardware.h"
 #include "camera.h"
 #include "usb.h"
-
 #include "ams-delta-fiq.h"
 #include "board-ams-delta.h"
 #include "iomap.h"
diff --git a/arch/arm/mach-omap1/board-fsample.c b/arch/arm/mach-omap1/board-fsample.c
index c3aa6f2e5546..501567930a37 100644
--- a/arch/arm/mach-omap1/board-fsample.c
+++ b/arch/arm/mach-omap1/board-fsample.c
@@ -23,13 +23,13 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/tc.h>
-#include <mach/mux.h>
-#include "flash.h"
+#include <linux/soc/ti/omap1-io.h>
 #include <linux/platform_data/keypad-omap.h>
+#include <mach/tc.h>
 
-#include <mach/hardware.h>
-
+#include "mux.h"
+#include "flash.h"
+#include "hardware.h"
 #include "iomap.h"
 #include "common.h"
 #include "fpga.h"
diff --git a/arch/arm/mach-omap1/board-generic.c b/arch/arm/mach-omap1/board-generic.c
index 8ef0a9b17e92..3b2bcaf4bb01 100644
--- a/arch/arm/mach-omap1/board-generic.c
+++ b/arch/arm/mach-omap1/board-generic.c
@@ -14,15 +14,13 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 
-#include <mach/hardware.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/mux.h>
-
+#include "hardware.h"
+#include "mux.h"
 #include "usb.h"
-
 #include "common.h"
 
 /* assume no Mini-AB port */
diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
index 92a31727a069..3dcb50aff749 100644
--- a/arch/arm/mach-omap1/board-h2.c
+++ b/arch/arm/mach-omap1/board-h2.c
@@ -27,22 +27,20 @@
 #include <linux/mfd/tps65010.h>
 #include <linux/smc91x.h>
 #include <linux/omapfb.h>
+#include <linux/omap-dma.h>
 #include <linux/platform_data/gpio-omap.h>
+#include <linux/platform_data/keypad-omap.h>
 #include <linux/leds.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/mux.h>
-#include <linux/omap-dma.h>
 #include <mach/tc.h>
-#include <linux/platform_data/keypad-omap.h>
+#include "mux.h"
 #include "flash.h"
-
-#include <mach/hardware.h>
+#include "hardware.h"
 #include "usb.h"
-
 #include "common.h"
 #include "board-h2.h"
 
diff --git a/arch/arm/mach-omap1/board-h3.c b/arch/arm/mach-omap1/board-h3.c
index 86260498c344..305d17fa2a8a 100644
--- a/arch/arm/mach-omap1/board-h3.c
+++ b/arch/arm/mach-omap1/board-h3.c
@@ -29,6 +29,8 @@
 #include <linux/smc91x.h>
 #include <linux/omapfb.h>
 #include <linux/platform_data/gpio-omap.h>
+#include <linux/platform_data/keypad-omap.h>
+#include <linux/omap-dma.h>
 #include <linux/leds.h>
 
 #include <asm/setup.h>
@@ -37,16 +39,12 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/mux.h>
 #include <mach/tc.h>
-#include <linux/platform_data/keypad-omap.h>
-#include <linux/omap-dma.h>
+#include "mux.h"
 #include "flash.h"
-
-#include <mach/hardware.h>
-#include <mach/irqs.h>
+#include "hardware.h"
+#include "irqs.h"
 #include "usb.h"
-
 #include "common.h"
 #include "board-h3.h"
 
diff --git a/arch/arm/mach-omap1/board-htcherald.c b/arch/arm/mach-omap1/board-htcherald.c
index f7220b60eb61..f8d93d79d5fb 100644
--- a/arch/arm/mach-omap1/board-htcherald.c
+++ b/arch/arm/mach-omap1/board-htcherald.c
@@ -23,16 +23,16 @@
 #include <linux/spi/ads7846.h>
 #include <linux/omapfb.h>
 #include <linux/platform_data/keypad-omap.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 
-#include <mach/omap7xx.h>
+#include "hardware.h"
+#include "omap7xx.h"
 #include "mmc.h"
-
-#include <mach/irqs.h>
+#include "irqs.h"
 #include "usb.h"
-
 #include "common.h"
 
 /* LCD register definition */
diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
index f169e172421d..ab5f5fc9fa36 100644
--- a/arch/arm/mach-omap1/board-innovator.c
+++ b/arch/arm/mach-omap1/board-innovator.c
@@ -23,19 +23,17 @@
 #include <linux/input.h>
 #include <linux/smc91x.h>
 #include <linux/omapfb.h>
+#include <linux/platform_data/keypad-omap.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/mux.h>
-#include "flash.h"
 #include <mach/tc.h>
-#include <linux/platform_data/keypad-omap.h>
-
-#include <mach/hardware.h>
+#include "mux.h"
+#include "flash.h"
+#include "hardware.h"
 #include "usb.h"
-
 #include "iomap.h"
 #include "common.h"
 #include "mmc.h"
diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index e43c852103f5..8e0e58495023 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -28,11 +28,9 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/mux.h>
-
-#include <mach/hardware.h>
+#include "mux.h"
+#include "hardware.h"
 #include "usb.h"
-
 #include "common.h"
 #include "clock.h"
 #include "mmc.h"
diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 38d73da5d13d..627f44350c36 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -41,18 +41,17 @@
 #include <linux/mfd/tps65010.h>
 #include <linux/platform_data/gpio-omap.h>
 #include <linux/platform_data/omap1_bl.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include "flash.h"
-#include <mach/mux.h>
 #include <mach/tc.h>
-
-#include <mach/hardware.h>
+#include "flash.h"
+#include "mux.h"
+#include "hardware.h"
 #include "usb.h"
-
 #include "common.h"
 
 /* At OMAP5912 OSK the Ethernet is directly connected to CS1 */
diff --git a/arch/arm/mach-omap1/board-palmte.c b/arch/arm/mach-omap1/board-palmte.c
index 4ac981c5cf74..0a54cfc2f78d 100644
--- a/arch/arm/mach-omap1/board-palmte.c
+++ b/arch/arm/mach-omap1/board-palmte.c
@@ -25,21 +25,19 @@
 #include <linux/interrupt.h>
 #include <linux/apm-emulation.h>
 #include <linux/omapfb.h>
+#include <linux/omap-dma.h>
+#include <linux/platform_data/keypad-omap.h>
 #include <linux/platform_data/omap1_bl.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include "flash.h"
-#include <mach/mux.h>
 #include <mach/tc.h>
-#include <linux/omap-dma.h>
-#include <linux/platform_data/keypad-omap.h>
-
-#include <mach/hardware.h>
+#include "flash.h"
+#include "mux.h"
+#include "hardware.h"
 #include "usb.h"
-
 #include "mmc.h"
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-palmtt.c b/arch/arm/mach-omap1/board-palmtt.c
index e48ae5fbe1b1..b0e64915f103 100644
--- a/arch/arm/mach-omap1/board-palmtt.c
+++ b/arch/arm/mach-omap1/board-palmtt.c
@@ -24,22 +24,20 @@
 #include <linux/omapfb.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
+#include <linux/omap-dma.h>
 #include <linux/platform_data/omap1_bl.h>
 #include <linux/platform_data/leds-omap.h>
+#include <linux/platform_data/keypad-omap.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include "flash.h"
-#include <mach/mux.h>
-#include <linux/omap-dma.h>
 #include <mach/tc.h>
-#include <linux/platform_data/keypad-omap.h>
-
-#include <mach/hardware.h>
+#include "flash.h"
+#include "mux.h"
+#include "hardware.h"
 #include "usb.h"
-
 #include "common.h"
 
 #define PALMTT_USBDETECT_GPIO	0
diff --git a/arch/arm/mach-omap1/board-palmz71.c b/arch/arm/mach-omap1/board-palmz71.c
index 37db0ab31528..f6ff582eda2e 100644
--- a/arch/arm/mach-omap1/board-palmz71.c
+++ b/arch/arm/mach-omap1/board-palmz71.c
@@ -28,20 +28,18 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
 #include <linux/platform_data/omap1_bl.h>
+#include <linux/platform_data/keypad-omap.h>
+#include <linux/omap-dma.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include "flash.h"
-#include <mach/mux.h>
-#include <linux/omap-dma.h>
 #include <mach/tc.h>
-#include <linux/platform_data/keypad-omap.h>
-
-#include <mach/hardware.h>
+#include "flash.h"
+#include "mux.h"
+#include "hardware.h"
 #include "usb.h"
-
 #include "common.h"
 
 #define PALMZ71_USBDETECT_GPIO	0
diff --git a/arch/arm/mach-omap1/board-perseus2.c b/arch/arm/mach-omap1/board-perseus2.c
index da0155107d85..a91775c62b7b 100644
--- a/arch/arm/mach-omap1/board-perseus2.c
+++ b/arch/arm/mach-omap1/board-perseus2.c
@@ -19,17 +19,16 @@
 #include <linux/smc91x.h>
 #include <linux/omapfb.h>
 #include <linux/platform_data/keypad-omap.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
 #include <mach/tc.h>
-#include <mach/mux.h>
+#include "mux.h"
 #include "flash.h"
-
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "iomap.h"
 #include "common.h"
 #include "fpga.h"
diff --git a/arch/arm/mach-omap1/board-sx1-mmc.c b/arch/arm/mach-omap1/board-sx1-mmc.c
index 6192b1da75cb..f1c160924dfe 100644
--- a/arch/arm/mach-omap1/board-sx1-mmc.c
+++ b/arch/arm/mach-omap1/board-sx1-mmc.c
@@ -12,9 +12,8 @@
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
 
-#include <mach/hardware.h>
+#include "hardware.h"
 #include "board-sx1.h"
-
 #include "mmc.h"
 
 #if IS_ENABLED(CONFIG_MMC_OMAP)
diff --git a/arch/arm/mach-omap1/board-sx1.c b/arch/arm/mach-omap1/board-sx1.c
index 0965b1b689ec..01a47fc68a55 100644
--- a/arch/arm/mach-omap1/board-sx1.c
+++ b/arch/arm/mach-omap1/board-sx1.c
@@ -26,20 +26,18 @@
 #include <linux/export.h>
 #include <linux/omapfb.h>
 #include <linux/platform_data/keypad-omap.h>
+#include <linux/omap-dma.h>
+#include <mach/tc.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
 #include "flash.h"
-#include <mach/mux.h>
-#include <linux/omap-dma.h>
-#include <mach/tc.h>
+#include "mux.h"
 #include "board-sx1.h"
-
-#include <mach/hardware.h>
+#include "hardware.h"
 #include "usb.h"
-
 #include "common.h"
 
 /* Write to I2C device */
diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index bd5be82101f3..24db9b723a6f 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -16,11 +16,11 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <asm/mach-types.h>
 
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "soc.h"
 #include "iomap.h"
 #include "clock.h"
diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index ef46c5f67cf9..36f04da4b939 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -16,14 +16,13 @@
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
 #include <linux/delay.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <asm/mach-types.h>  /* for machine_is_* */
 
 #include "soc.h"
-
-#include <mach/hardware.h>
+#include "hardware.h"
 #include "usb.h"   /* for OTG_BASE */
-
 #include "iomap.h"
 #include "clock.h"
 #include "sram.h"
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 504b959ba5cf..5ceff05e15c0 100644
--- a/arch/arm/mach-omap1/common.h
+++ b/arch/arm/mach-omap1/common.h
@@ -31,8 +31,7 @@
 
 #include <asm/exception.h>
 
-#include <mach/irqs.h>
-
+#include "irqs.h"
 #include "soc.h"
 #include "i2c.h"
 
diff --git a/arch/arm/mach-omap1/devices.c b/arch/arm/mach-omap1/devices.c
index 3c4900ac72fc..36b03410b210 100644
--- a/arch/arm/mach-omap1/devices.c
+++ b/arch/arm/mach-omap1/devices.c
@@ -14,16 +14,16 @@
 #include <linux/spi/spi.h>
 
 #include <linux/platform_data/omap-wd-timer.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <asm/mach/map.h>
 
 #include <mach/tc.h>
-#include <mach/mux.h>
+#include "mux.h"
 
-#include <mach/omap7xx.h>
+#include "omap7xx.h"
 #include "camera.h"
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "common.h"
 #include "clock.h"
 #include "mmc.h"
diff --git a/arch/arm/mach-omap1/fb.c b/arch/arm/mach-omap1/fb.c
index b093375afc27..a4538c231f66 100644
--- a/arch/arm/mach-omap1/fb.c
+++ b/arch/arm/mach-omap1/fb.c
@@ -21,7 +21,7 @@
 
 #include <asm/mach/map.h>
 
-#include <mach/irqs.h>
+#include "irqs.h"
 
 #if IS_ENABLED(CONFIG_FB_OMAP)
 
diff --git a/arch/arm/mach-omap1/flash.c b/arch/arm/mach-omap1/flash.c
index 40e43ce5329f..5e5b20f73c1b 100644
--- a/arch/arm/mach-omap1/flash.c
+++ b/arch/arm/mach-omap1/flash.c
@@ -6,11 +6,12 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <mach/tc.h>
+
 #include "flash.h"
 
-#include <mach/hardware.h>
 
 void omap1_set_vpp(struct platform_device *pdev, int enable)
 {
diff --git a/arch/arm/mach-omap1/fpga.c b/arch/arm/mach-omap1/fpga.c
index f03ed523f20f..4c71a195969f 100644
--- a/arch/arm/mach-omap1/fpga.c
+++ b/arch/arm/mach-omap1/fpga.c
@@ -24,8 +24,7 @@
 #include <asm/irq.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "iomap.h"
 #include "common.h"
 #include "fpga.h"
diff --git a/arch/arm/mach-omap1/gpio15xx.c b/arch/arm/mach-omap1/gpio15xx.c
index 312a0924d786..fa0a285c40b4 100644
--- a/arch/arm/mach-omap1/gpio15xx.c
+++ b/arch/arm/mach-omap1/gpio15xx.c
@@ -18,8 +18,9 @@
 
 #include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
+#include <linux/soc/ti/omap1-soc.h>
 
-#include <mach/irqs.h>
+#include "irqs.h"
 
 #define OMAP1_MPUIO_VBASE		OMAP1_MPUIO_BASE
 #define OMAP1510_GPIO_BASE		0xFFFCE000
diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 5b7a29b294d4..4787bf281eae 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -18,9 +18,10 @@
 
 #include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
+#include <linux/soc/ti/omap1-io.h>
 
-#include <mach/irqs.h>
-
+#include "hardware.h"
+#include "irqs.h"
 #include "soc.h"
 
 #define OMAP1610_GPIO1_BASE		0xfffbe400
diff --git a/arch/arm/mach-omap1/gpio7xx.c b/arch/arm/mach-omap1/gpio7xx.c
index 0e5f68de23bf..c97c74aa8756 100644
--- a/arch/arm/mach-omap1/gpio7xx.c
+++ b/arch/arm/mach-omap1/gpio7xx.c
@@ -19,8 +19,7 @@
 #include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
 
-#include <mach/irqs.h>
-
+#include "irqs.h"
 #include "soc.h"
 
 #define OMAP7XX_GPIO1_BASE		0xfffbc000
diff --git a/arch/arm/mach-omap1/include/mach/hardware.h b/arch/arm/mach-omap1/hardware.h
similarity index 99%
rename from arch/arm/mach-omap1/include/mach/hardware.h
rename to arch/arm/mach-omap1/hardware.h
index 05c5cd3e95f4..2cfc342c069c 100644
--- a/arch/arm/mach-omap1/include/mach/hardware.h
+++ b/arch/arm/mach-omap1/hardware.h
@@ -1,6 +1,4 @@
 /*
- * arch/arm/mach-omap1/include/mach/hardware.h
- *
  * Hardware definitions for TI OMAP processors and boards
  *
  * NOTE: Please put device driver specific defines into a separate header
diff --git a/arch/arm/mach-omap1/i2c.c b/arch/arm/mach-omap1/i2c.c
index 5e6d81b1624c..f574eb0bcc0b 100644
--- a/arch/arm/mach-omap1/i2c.c
+++ b/arch/arm/mach-omap1/i2c.c
@@ -7,7 +7,8 @@
 
 #include <linux/i2c.h>
 #include <linux/platform_data/i2c-omap.h>
-#include <mach/mux.h>
+
+#include "mux.h"
 #include "soc.h"
 
 #define OMAP_I2C_SIZE		0x3f
diff --git a/arch/arm/mach-omap1/id.c b/arch/arm/mach-omap1/id.c
index 91556e374152..c3bb1b71fdf3 100644
--- a/arch/arm/mach-omap1/id.c
+++ b/arch/arm/mach-omap1/id.c
@@ -12,12 +12,11 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/soc/ti/omap1-io.h>
 #include <asm/system_info.h>
 
 #include "soc.h"
-
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "common.h"
 
 #define OMAP_DIE_ID_0		0xfffe1800
diff --git a/arch/arm/mach-omap1/include/mach/memory.h b/arch/arm/mach-omap1/include/mach/memory.h
deleted file mode 100644
index ee91a6cb548d..000000000000
--- a/arch/arm/mach-omap1/include/mach/memory.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * arch/arm/mach-omap1/include/mach/memory.h
- */
-
-#ifndef __ASM_ARCH_MEMORY_H
-#define __ASM_ARCH_MEMORY_H
-
-/* REVISIT: omap1 legacy drivers still rely on this */
-#include <mach/hardware.h>
-
-#endif
diff --git a/arch/arm/mach-omap1/io.c b/arch/arm/mach-omap1/io.c
index 5a173fc2a1ca..cf425aeeb240 100644
--- a/arch/arm/mach-omap1/io.c
+++ b/arch/arm/mach-omap1/io.c
@@ -9,14 +9,13 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/omap-dma.h>
 
 #include <asm/tlb.h>
 #include <asm/mach/map.h>
 
-#include <mach/mux.h>
 #include <mach/tc.h>
-#include <linux/omap-dma.h>
-
+#include "mux.h"
 #include "iomap.h"
 #include "common.h"
 #include "clock.h"
diff --git a/arch/arm/mach-omap1/irq.c b/arch/arm/mach-omap1/irq.c
index b11edc8a46f0..6b51387b27ac 100644
--- a/arch/arm/mach-omap1/irq.c
+++ b/arch/arm/mach-omap1/irq.c
@@ -47,9 +47,7 @@
 #include <asm/mach/irq.h>
 
 #include "soc.h"
-
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "common.h"
 
 #define IRQ_BANK(irq) ((irq) >> 5)
diff --git a/arch/arm/mach-omap1/include/mach/irqs.h b/arch/arm/mach-omap1/irqs.h
similarity index 99%
rename from arch/arm/mach-omap1/include/mach/irqs.h
rename to arch/arm/mach-omap1/irqs.h
index 30bf007700cf..2851acfe5ff3 100644
--- a/arch/arm/mach-omap1/include/mach/irqs.h
+++ b/arch/arm/mach-omap1/irqs.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- *  arch/arm/plat-omap/include/mach/irqs.h
- *
  *  Copyright (C) Greg Lonnon 2001
  *  Updated for OMAP-1610 by Tony Lindgren <tony@atomide.com>
  *
diff --git a/arch/arm/mach-omap1/mcbsp.c b/arch/arm/mach-omap1/mcbsp.c
index f36c34f47f11..b7bc7e4b426c 100644
--- a/arch/arm/mach-omap1/mcbsp.c
+++ b/arch/arm/mach-omap1/mcbsp.c
@@ -15,14 +15,13 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-
 #include <linux/omap-dma.h>
-#include <mach/mux.h>
-#include "soc.h"
+#include <linux/soc/ti/omap1-io.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
-#include <mach/irqs.h>
-
+#include "mux.h"
+#include "soc.h"
+#include "irqs.h"
 #include "iomap.h"
 
 #define DPS_RSTCT2_PER_EN	(1 << 0)
diff --git a/arch/arm/mach-omap1/include/mach/mtd-xip.h b/arch/arm/mach-omap1/mtd-xip.h
similarity index 97%
rename from arch/arm/mach-omap1/include/mach/mtd-xip.h
rename to arch/arm/mach-omap1/mtd-xip.h
index d09b2bc4920f..b675d501b13d 100644
--- a/arch/arm/mach-omap1/include/mach/mtd-xip.h
+++ b/arch/arm/mach-omap1/mtd-xip.h
@@ -14,7 +14,8 @@
 #ifndef __ARCH_OMAP_MTD_XIP_H__
 #define __ARCH_OMAP_MTD_XIP_H__
 
-#include <mach/hardware.h>
+#include "hardware.h"
+#include <linux/soc/ti/omap1-io.h>
 #define OMAP_MPU_TIMER_BASE	(0xfffec500)
 #define OMAP_MPU_TIMER_OFFSET	0x100
 
diff --git a/arch/arm/mach-omap1/mux.c b/arch/arm/mach-omap1/mux.c
index 972665bf52d6..2d9458ff1d29 100644
--- a/arch/arm/mach-omap1/mux.c
+++ b/arch/arm/mach-omap1/mux.c
@@ -12,10 +12,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/spinlock.h>
+#include <linux/soc/ti/omap1-io.h>
 
-#include <mach/hardware.h>
-
-#include <mach/mux.h>
+#include "hardware.h"
+#include "mux.h"
 
 #ifdef CONFIG_OMAP_MUX
 
diff --git a/arch/arm/mach-omap1/include/mach/mux.h b/arch/arm/mach-omap1/mux.h
similarity index 98%
rename from arch/arm/mach-omap1/include/mach/mux.h
rename to arch/arm/mach-omap1/mux.h
index 362abb9f1dcf..46e5b94e27a2 100644
--- a/arch/arm/mach-omap1/include/mach/mux.h
+++ b/arch/arm/mach-omap1/mux.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * arch/arm/plat-omap/include/mach/mux.h
- *
  * Table of the Omap register configurations for the FUNC_MUX and
  * PULL_DWN combinations.
  *
diff --git a/arch/arm/mach-omap1/ocpi.c b/arch/arm/mach-omap1/ocpi.c
index 380ea2de58c1..c4a33ace4a8b 100644
--- a/arch/arm/mach-omap1/ocpi.c
+++ b/arch/arm/mach-omap1/ocpi.c
@@ -20,9 +20,9 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/soc/ti/omap1-io.h>
 
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "common.h"
 
 #define OCPI_BASE		0xfffec320
diff --git a/arch/arm/mach-omap1/include/mach/omap1510.h b/arch/arm/mach-omap1/omap1510.h
similarity index 100%
rename from arch/arm/mach-omap1/include/mach/omap1510.h
rename to arch/arm/mach-omap1/omap1510.h
diff --git a/arch/arm/mach-omap1/include/mach/omap16xx.h b/arch/arm/mach-omap1/omap16xx.h
similarity index 100%
rename from arch/arm/mach-omap1/include/mach/omap16xx.h
rename to arch/arm/mach-omap1/omap16xx.h
diff --git a/arch/arm/mach-omap1/include/mach/omap7xx.h b/arch/arm/mach-omap1/omap7xx.h
similarity index 100%
rename from arch/arm/mach-omap1/include/mach/omap7xx.h
rename to arch/arm/mach-omap1/omap7xx.h
diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index d068958d6f8a..dd3743c891b7 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -52,13 +52,14 @@
 #include <asm/mach/time.h>
 #include <asm/mach/irq.h>
 
+#include <linux/soc/ti/omap1-io.h>
 #include <mach/tc.h>
-#include <mach/mux.h>
 #include <linux/omap-dma.h>
 #include <clocksource/timer-ti-dm.h>
 
-#include <mach/irqs.h>
-
+#include "hardware.h"
+#include "mux.h"
+#include "irqs.h"
 #include "iomap.h"
 #include "clock.h"
 #include "pm.h"
diff --git a/arch/arm/mach-omap1/pm.h b/arch/arm/mach-omap1/pm.h
index cd926dcb5e7f..d9165709c532 100644
--- a/arch/arm/mach-omap1/pm.h
+++ b/arch/arm/mach-omap1/pm.h
@@ -34,6 +34,8 @@
 #ifndef __ARCH_ARM_MACH_OMAP1_PM_H
 #define __ARCH_ARM_MACH_OMAP1_PM_H
 
+#include <linux/soc/ti/omap1-io.h>
+
 /*
  * ----------------------------------------------------------------------------
  * Register and offset definitions to be used in PM assembler code
diff --git a/arch/arm/mach-omap1/reset.c b/arch/arm/mach-omap1/reset.c
index af2c120b0c4e..2eee6a6965ff 100644
--- a/arch/arm/mach-omap1/reset.c
+++ b/arch/arm/mach-omap1/reset.c
@@ -6,8 +6,7 @@
 #include <linux/io.h>
 #include <linux/reboot.h>
 
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "iomap.h"
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index 9eb591fbfd89..d6d1843337a5 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -19,8 +19,9 @@
 
 #include <asm/mach-types.h>
 
-#include <mach/mux.h>
+#include <mach/serial.h>
 
+#include "mux.h"
 #include "pm.h"
 #include "soc.h"
 
diff --git a/arch/arm/mach-omap1/sleep.S b/arch/arm/mach-omap1/sleep.S
index a908c51839a4..f111b79512ce 100644
--- a/arch/arm/mach-omap1/sleep.S
+++ b/arch/arm/mach-omap1/sleep.S
@@ -36,7 +36,7 @@
 
 #include <asm/assembler.h>
 
-#include <mach/hardware.h>
+#include "hardware.h"
 
 #include "iomap.h"
 #include "pm.h"
diff --git a/arch/arm/mach-omap1/soc.h b/arch/arm/mach-omap1/soc.h
index 22931839a666..5fb57fdd9c2b 100644
--- a/arch/arm/mach-omap1/soc.h
+++ b/arch/arm/mach-omap1/soc.h
@@ -1,6 +1,6 @@
 /*
  * We can move linux/soc/ti/omap1-soc.h here once the drivers are fixed
  */
-#include <mach/hardware.h>
-#include <mach/irqs.h>
+#include "hardware.h"
+#include "irqs.h"
 #include <asm/irq.h>
diff --git a/arch/arm/mach-omap1/sram.S b/arch/arm/mach-omap1/sram.S
index 37f34fcd65fb..89f4dc1b70f0 100644
--- a/arch/arm/mach-omap1/sram.S
+++ b/arch/arm/mach-omap1/sram.S
@@ -6,11 +6,11 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <asm/assembler.h>
 
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "iomap.h"
 
 	.text
diff --git a/arch/arm/mach-omap1/time.c b/arch/arm/mach-omap1/time.c
index 524977a31a49..7cc1a968230e 100644
--- a/arch/arm/mach-omap1/time.c
+++ b/arch/arm/mach-omap1/time.c
@@ -47,10 +47,10 @@
 
 #include <asm/irq.h>
 
-#include <mach/hardware.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
+#include "hardware.h"
 #include "iomap.h"
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/timer.c b/arch/arm/mach-omap1/timer.c
index 4447210c9b0d..39e40ca40246 100644
--- a/arch/arm/mach-omap1/timer.c
+++ b/arch/arm/mach-omap1/timer.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/dmtimer-omap.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <clocksource/timer-ti-dm.h>
 
diff --git a/arch/arm/mach-omap1/timer32k.c b/arch/arm/mach-omap1/timer32k.c
index 0ae6c52a7d70..c884508a8c9f 100644
--- a/arch/arm/mach-omap1/timer32k.c
+++ b/arch/arm/mach-omap1/timer32k.c
@@ -52,8 +52,7 @@
 
 #include <plat/counter-32k.h>
 
-#include <mach/hardware.h>
-
+#include "hardware.h"
 #include "common.h"
 
 /*
diff --git a/arch/arm/mach-omap1/usb.c b/arch/arm/mach-omap1/usb.c
index a9deda073822..fda1322bcc1b 100644
--- a/arch/arm/mach-omap1/usb.c
+++ b/arch/arm/mach-omap1/usb.c
@@ -11,13 +11,13 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include <asm/irq.h>
 
-#include <mach/mux.h>
-
+#include "hardware.h"
+#include "mux.h"
 #include "usb.h"
-
 #include "common.h"
 
 /* These routines should handle the standard chip-specific modes
diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 749d3cae15c0..38e5773fbb86 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -35,9 +35,9 @@
 #include <linux/omap-dma.h>
 
 #ifdef CONFIG_ARCH_OMAP1
-#include <mach/hardware.h>
 #include <linux/soc/ti/omap1-io.h>
 #include <linux/soc/ti/omap1-soc.h>
+#include <mach/tc.h>
 #endif
 
 /*
diff --git a/arch/arm/plat-omap/include/plat/cpu.h b/arch/arm/plat-omap/include/plat/cpu.h
deleted file mode 100644
index 36f4c352cc66..000000000000
--- a/arch/arm/plat-omap/include/plat/cpu.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * OMAP cpu type detection
- *
- * Copyright (C) 2004, 2008 Nokia Corporation
- *
- * Copyright (C) 2009-11 Texas Instruments.
- *
- * Written by Tony Lindgren <tony.lindgren@nokia.com>
- *
- * Added OMAP4/5 specific defines - Santosh Shilimkar<santosh.shilimkar@ti.com>
- */
-
-#ifndef __ASM_ARCH_OMAP_CPU_H
-#define __ASM_ARCH_OMAP_CPU_H
-
-#ifdef CONFIG_ARCH_OMAP1
-#include <mach/soc.h>
-#endif
-
-#endif
-- 
2.20.0

