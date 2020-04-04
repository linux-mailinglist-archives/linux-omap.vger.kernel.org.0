Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C935419E49D
	for <lists+linux-omap@lfdr.de>; Sat,  4 Apr 2020 12:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgDDKuH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Apr 2020 06:50:07 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52743 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgDDKuG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 4 Apr 2020 06:50:06 -0400
Received: by mail-pj1-f65.google.com with SMTP id ng8so4256267pjb.2;
        Sat, 04 Apr 2020 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=bLtks/fvQHTXg3jyiqutl/7OQaO4LAo9W4swHgvyYSo=;
        b=qcjfUK7UPV0EhEXd8HS/7cXGbpErwdCZcVWwD2JhF3TAg7kbYhNuF6uB3juL8uU+l3
         clEsFpstvqQQzY+tgEl60cLIQHM69T4ocWf7hBvRwgmbMIkqXQb93XMCIZWKnR0Va0ZB
         jrgYR+6Htc1ERaUMnPkwo3S08QP8JjZ98nBlUYSzwd46Jex+S6LojpnVICSbxSr9t01w
         aj78jvsmrei76hM90KI9GTY/lQ6X/4Tw7kL4HJrCnea1teYv6wL1X5qbHwklN7VMeNr6
         IIrpOZKdsgfZMUxxCabCjmwaDUku/1sbUjSGr90y6Kkrk2/z8HCzltb7yH+JV9ZgSf2p
         VtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=bLtks/fvQHTXg3jyiqutl/7OQaO4LAo9W4swHgvyYSo=;
        b=uBg4B3jBwCIZPgvJ6ZXYQ+gMuXerqwgzm82A56Sf60TnDkYLSJHWlCEKShrk2SV+jI
         QTdntAmglAPznuCmAT0OOQUC9fgMFuXSsz1qbQ3FESDteciGukJC7Ju+9tD5Prfp306d
         FbmVypOd1TTlD39JtZVL6/NGsNbs6N4tQbfWbjoZTq/1UaIZ8zHrMhKO/8LCEJrv0yHD
         WsZxaIQVrKd0AgQhSnppEgjCG4fcQNdqOqPPY1SEQwl/D45OFnzEjbL15T2Jsxd5RF29
         MO6AYJhvncLqnw6c4Rz06FCf2qkWoPuxDPG+ClXlzj/7WDLZ9xR4kelCK2VGMrvPWNKF
         Q5aw==
X-Gm-Message-State: AGi0PuY7BLSJbCt8AnWYvSpYNO6bftYEpJMvAHnErNw8vh4GD3G9auqy
        APRmtRCMfvE1FE1ccduPFhs=
X-Google-Smtp-Source: APiQypJpIeKiIjtvLfp18uOfDhAYzKMn/o1y+TKIM2ftfwkpT7wU+Yclef5SRHjHPEpO5tOMZCey0A==
X-Received: by 2002:a17:902:7c84:: with SMTP id y4mr11140915pll.231.1585997402940;
        Sat, 04 Apr 2020 03:50:02 -0700 (PDT)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id b2sm390804pgg.77.2020.04.04.03.49.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 03:50:02 -0700 (PDT)
Date:   Sat, 4 Apr 2020 16:19:55 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Joe Perches <joe@perches.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] USB: musb: Use the correct style for SPDX License Identifier
Message-ID: <20200404104952.GA6575@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch corrects the SPDX License Identifier style in
header files related to USB Dual Role (OTG-ready) Controller Drivers.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/usb/musb/davinci.h     | 2 +-
 drivers/usb/musb/musb_core.h   | 2 +-
 drivers/usb/musb/musb_debug.h  | 2 +-
 drivers/usb/musb/musb_dma.h    | 2 +-
 drivers/usb/musb/musb_gadget.h | 2 +-
 drivers/usb/musb/musb_host.h   | 2 +-
 drivers/usb/musb/musb_io.h     | 2 +-
 drivers/usb/musb/musb_regs.h   | 2 +-
 drivers/usb/musb/musb_trace.h  | 2 +-
 drivers/usb/musb/omap2430.h    | 2 +-
 drivers/usb/musb/tusb6010.h    | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/musb/davinci.h b/drivers/usb/musb/davinci.h
index e021485c83ae..c8e67d15b510 100644
--- a/drivers/usb/musb/davinci.h
+++ b/drivers/usb/musb/davinci.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2005-2006 by Texas Instruments
  */
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index 290a2bc46606..dbe5623db1e0 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MUSB OTG driver defines
  *
diff --git a/drivers/usb/musb/musb_debug.h b/drivers/usb/musb/musb_debug.h
index c444a80fe1da..e5b3506c7b3f 100644
--- a/drivers/usb/musb/musb_debug.h
+++ b/drivers/usb/musb/musb_debug.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MUSB OTG driver debug defines
  *
diff --git a/drivers/usb/musb/musb_dma.h b/drivers/usb/musb/musb_dma.h
index 4b4d8dc5d3f2..7d67b69df0a0 100644
--- a/drivers/usb/musb/musb_dma.h
+++ b/drivers/usb/musb/musb_dma.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MUSB OTG driver DMA controller abstraction
  *
diff --git a/drivers/usb/musb/musb_gadget.h b/drivers/usb/musb/musb_gadget.h
index d02663660813..f49f25b3bf56 100644
--- a/drivers/usb/musb/musb_gadget.h
+++ b/drivers/usb/musb/musb_gadget.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MUSB OTG driver peripheral defines
  *
diff --git a/drivers/usb/musb/musb_host.h b/drivers/usb/musb/musb_host.h
index 2999845632ce..32336571f05c 100644
--- a/drivers/usb/musb/musb_host.h
+++ b/drivers/usb/musb/musb_host.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MUSB OTG driver host defines
  *
diff --git a/drivers/usb/musb/musb_io.h b/drivers/usb/musb/musb_io.h
index f17aabd95a50..12874d3b2a64 100644
--- a/drivers/usb/musb/musb_io.h
+++ b/drivers/usb/musb/musb_io.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MUSB OTG driver register I/O
  *
diff --git a/drivers/usb/musb/musb_regs.h b/drivers/usb/musb/musb_regs.h
index 5cd7264fc2cb..5fa110978f1a 100644
--- a/drivers/usb/musb/musb_regs.h
+++ b/drivers/usb/musb/musb_regs.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * MUSB OTG driver register defines
  *
diff --git a/drivers/usb/musb/musb_trace.h b/drivers/usb/musb/musb_trace.h
index b193daf69685..380ebc77eab1 100644
--- a/drivers/usb/musb/musb_trace.h
+++ b/drivers/usb/musb/musb_trace.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * musb_trace.h - MUSB Controller Trace Support
  *
diff --git a/drivers/usb/musb/omap2430.h b/drivers/usb/musb/omap2430.h
index 859008fa0e3c..939a0361ae88 100644
--- a/drivers/usb/musb/omap2430.h
+++ b/drivers/usb/musb/omap2430.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2005-2006 by Texas Instruments
  */
diff --git a/drivers/usb/musb/tusb6010.h b/drivers/usb/musb/tusb6010.h
index fd8025bbece7..8a253564fb18 100644
--- a/drivers/usb/musb/tusb6010.h
+++ b/drivers/usb/musb/tusb6010.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Definitions for TUSB6010 USB 2.0 OTG Dual Role controller
  *
-- 
2.17.1

