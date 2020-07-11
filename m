Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33B721C490
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jul 2020 15:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgGKN6Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Jul 2020 09:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbgGKN6P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Jul 2020 09:58:15 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0A7C08C5DD;
        Sat, 11 Jul 2020 06:58:15 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 2845FBC0CA;
        Sat, 11 Jul 2020 13:58:10 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] usb: dwc3: Replace HTTP links with HTTPS ones
Date:   Sat, 11 Jul 2020 15:58:04 +0200
Message-Id: <20200711135804.19735-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 drivers/usb/dwc3/core.c           | 2 +-
 drivers/usb/dwc3/core.h           | 2 +-
 drivers/usb/dwc3/debug.h          | 2 +-
 drivers/usb/dwc3/debugfs.c        | 2 +-
 drivers/usb/dwc3/drd.c            | 2 +-
 drivers/usb/dwc3/dwc3-keystone.c  | 2 +-
 drivers/usb/dwc3/dwc3-of-simple.c | 2 +-
 drivers/usb/dwc3/dwc3-omap.c      | 2 +-
 drivers/usb/dwc3/dwc3-pci.c       | 2 +-
 drivers/usb/dwc3/ep0.c            | 2 +-
 drivers/usb/dwc3/gadget.c         | 2 +-
 drivers/usb/dwc3/gadget.h         | 2 +-
 drivers/usb/dwc3/host.c           | 2 +-
 drivers/usb/dwc3/io.h             | 2 +-
 drivers/usb/dwc3/trace.c          | 2 +-
 drivers/usb/dwc3/trace.h          | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 25c686a752b0..422aea24afcd 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2,7 +2,7 @@
 /**
  * core.c - DesignWare USB3 DRD Controller Core file
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 013f42a2b5dc..2f04b3e42bf1 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -2,7 +2,7 @@
 /*
  * core.h - DesignWare USB3 DRD Core Header
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index d8f600e0e88f..3d16dac4e5cc 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -2,7 +2,7 @@
 /**
  * debug.h - DesignWare USB3 DRD Controller Debug Header
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 6d9de334e46a..4abee42841ee 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -2,7 +2,7 @@
 /**
  * debugfs.c - DesignWare USB3 DRD Controller DebugFS file
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 2e483448d695..eff05ca41d6d 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -2,7 +2,7 @@
 /**
  * drd.c - DesignWare USB3 DRD Controller Dual-role support
  *
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Roger Quadros <rogerq@ti.com>
  */
diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 6505f7bd69e2..9a99253d5ba3 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -2,7 +2,7 @@
 /**
  * dwc3-keystone.c - Keystone Specific Glue layer
  *
- * Copyright (C) 2010-2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: WingMan Kwok <w-kwok2@ti.com>
  */
diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 8852fbfdead4..37e9faf8c75a 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -2,7 +2,7 @@
 /**
  * dwc3-of-simple.c - OF glue layer for simple integrations
  *
- * Copyright (c) 2015 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (c) 2015 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Felipe Balbi <balbi@ti.com>
  *
diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 8c3de2d258bf..98d2693a7fdd 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -2,7 +2,7 @@
 /**
  * dwc3-omap.c - OMAP Specific Glue layer
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 96c05b121fac..519302b34154 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -2,7 +2,7 @@
 /**
  * dwc3-pci.c - PCI Specific glue layer
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 6dee4dabc0a4..198f9e4aaf52 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -2,7 +2,7 @@
 /*
  * ep0.c - DesignWare USB3 DRD Controller Endpoint 0 Handling
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 80c3ef134e41..afce2f8988a7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2,7 +2,7 @@
 /*
  * gadget.c - DesignWare USB3 DRD Controller Gadget Framework Link
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index 24dca3872022..42907dd89212 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -2,7 +2,7 @@
 /*
  * gadget.h - DesignWare USB3 DRD Gadget Header
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index bef1c1ac2067..e195176580de 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -2,7 +2,7 @@
 /*
  * host.c - DesignWare USB3 DRD Controller Host Glue
  *
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  */
diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
index 9bbe5d4bf076..76b73b116862 100644
--- a/drivers/usb/dwc3/io.h
+++ b/drivers/usb/dwc3/io.h
@@ -2,7 +2,7 @@
 /**
  * io.h - DesignWare USB3 DRD IO Header
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors: Felipe Balbi <balbi@ti.com>,
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
diff --git a/drivers/usb/dwc3/trace.c b/drivers/usb/dwc3/trace.c
index f8886f3f3c9e..1b45a9723eeb 100644
--- a/drivers/usb/dwc3/trace.c
+++ b/drivers/usb/dwc3/trace.c
@@ -2,7 +2,7 @@
 /**
  * trace.c - DesignWare USB3 DRD Controller Trace Support
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Felipe Balbi <balbi@ti.com>
  */
diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index 4c4fc6c41d9b..da1be01637c8 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -2,7 +2,7 @@
 /**
  * trace.h - DesignWare USB3 DRD Controller Trace Support
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Felipe Balbi <balbi@ti.com>
  */
-- 
2.27.0

