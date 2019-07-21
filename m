Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F25236F230
	for <lists+linux-omap@lfdr.de>; Sun, 21 Jul 2019 09:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbfGUHrG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 21 Jul 2019 03:47:06 -0400
Received: from condef-07.nifty.com ([202.248.20.72]:50927 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfGUHrF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 21 Jul 2019 03:47:05 -0400
X-Greylist: delayed 370 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Jul 2019 03:47:03 EDT
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-07.nifty.com with ESMTP id x6L7bHGA019038;
        Sun, 21 Jul 2019 16:37:21 +0900
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6L7app4023640;
        Sun, 21 Jul 2019 16:36:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6L7app4023640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563694612;
        bh=wTXJF9fhQh2D0Z3FIBOZ7YbgbP65Cu8NPe1b56CrBY4=;
        h=From:To:Cc:Subject:Date:From;
        b=UUMyY7PdwUXFxgwVA1qrpTAkFxOMkkDnDinMaytewX3bPxk0jzE6ufeO/VW+mpAp1
         0Ba8MmMi3em0cO8j5V2B9pGvZ2jnYzu1uR/faKEOx8HtUAZgjOAa0qxHC7L7wVvDbk
         WSGhCzvCJzvL7/eEvTiVHgFfs6HCKsNbR43VFHef0kRijq7TaUbxO4Pl3LYWz0kql8
         Wpesc1sETHdLpA1mXg6Fj5lprMEXTuoeTRRy74qUwzrD4VfWObDF4IYreuor86ZXVV
         I9XC/dINSs6huiqAQ86CfcBUgkrLOm4mJGTwwQaHN8KsX9r/eJtzy4PeKo3aoBdjxW
         7yCyu7drYPWkg==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH] usb: dwc3: omap: squash include/linux/platform_data/dwc3-omap.h
Date:   Sun, 21 Jul 2019 16:36:49 +0900
Message-Id: <20190721073649.11100-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This enum is only used in drivers/usb/dwc3/dwc3-omap3.c

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/usb/dwc3/dwc3-omap.c            |  7 +++-
 include/linux/platform_data/dwc3-omap.h | 43 -------------------------
 2 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 include/linux/platform_data/dwc3-omap.h

diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index ed8b86517675..4f51523a07ac 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -14,7 +14,6 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/dwc3-omap.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 #include <linux/ioport.h>
@@ -106,6 +105,12 @@
 #define USBOTGSS_UTMI_OTG_CTRL_SESSVALID	BIT(2)
 #define USBOTGSS_UTMI_OTG_CTRL_VBUSVALID	BIT(1)
 
+enum dwc3_omap_utmi_mode {
+	DWC3_OMAP_UTMI_MODE_UNKNOWN = 0,
+	DWC3_OMAP_UTMI_MODE_HW,
+	DWC3_OMAP_UTMI_MODE_SW,
+};
+
 struct dwc3_omap {
 	struct device		*dev;
 
diff --git a/include/linux/platform_data/dwc3-omap.h b/include/linux/platform_data/dwc3-omap.h
deleted file mode 100644
index 1d36ca874cc8..000000000000
--- a/include/linux/platform_data/dwc3-omap.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/**
- * dwc3-omap.h - OMAP Specific Glue layer, header.
- *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
- * All rights reserved.
- *
- * Author: Felipe Balbi <balbi@ti.com>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions, and the following disclaimer,
- *    without modification.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. The names of the above-listed copyright holders may not be used
- *    to endorse or promote products derived from this software without
- *    specific prior written permission.
- *
- * ALTERNATIVELY, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") version 2, as published by the Free
- * Software Foundation.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
- * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
- * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
- * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-enum dwc3_omap_utmi_mode {
-	DWC3_OMAP_UTMI_MODE_UNKNOWN = 0,
-	DWC3_OMAP_UTMI_MODE_HW,
-	DWC3_OMAP_UTMI_MODE_SW,
-};
-- 
2.17.1

