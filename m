Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC830DD01C
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 22:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443456AbfJRU1A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 16:27:00 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:22974 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443433AbfJRU07 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 16:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571430353;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=pAxH9f29zcPugwqQv3xhHDmS2G58xh9b8drWdUkj6h0=;
        b=ptKipoEsJQVnJYfAkSLfH+eD9ZOHlJk+AaMZuQR8CCb+K8NFGSWzzCj3uru67M2ItZ
        cko7RPa8LdJ7V7yb+d6ftGglmTcOiAh+y2yfhvmznNGF6E/bFLsTmdaXDfNOFPmle/+a
        wgkrtEGXZyQvG10s1OUfbtIwa9mzVl+UrU716Ce/+K5FKy5w3zPfG0NI++7PZ3q4PLbn
        g2nJK1k1x6vkGaSPb+rdalKLGnup+s2huyAR3zZVojjAFz7nWMu/7eZAn9XhsuUucSVq
        zX+vI4Dpvc22ORSq2SBVyzdfuMJl+OxrgV2GoHU23XNAvCqqWns/XNpni9aaomvbhP3x
        Jb9g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IKPdDUv
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Oct 2019 22:25:39 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        David Sterba <dsterba@suse.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, stable@vger.kernel.org
Subject: [PATCH 9/9] net: wireless: ti: remove local VENDOR_ID and DEVICE_ID definitions
Date:   Fri, 18 Oct 2019 22:25:30 +0200
Message-Id: <f6d3ef06531cbbb366df7b5a4771084de59cd54b.1571430329.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571430329.git.hns@goldelico.com>
References: <cover.1571430329.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

They are already included from mmc/sdio_ids.h and do not need
a local definition.

Fixes: 884f38607897 ("mmc: core: move some sdio IDs out of quirks file")

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: <stable@vger.kernel.org> # 4.11.0
---
 drivers/net/wireless/ti/wl1251/sdio.c | 8 --------
 drivers/net/wireless/ti/wlcore/sdio.c | 8 --------
 2 files changed, 16 deletions(-)

diff --git a/drivers/net/wireless/ti/wl1251/sdio.c b/drivers/net/wireless/ti/wl1251/sdio.c
index 42b55f3a50df..3c4d5e38c66c 100644
--- a/drivers/net/wireless/ti/wl1251/sdio.c
+++ b/drivers/net/wireless/ti/wl1251/sdio.c
@@ -22,14 +22,6 @@
 
 #include "wl1251.h"
 
-#ifndef SDIO_VENDOR_ID_TI
-#define SDIO_VENDOR_ID_TI		0x104c
-#endif
-
-#ifndef SDIO_DEVICE_ID_TI_WL1251
-#define SDIO_DEVICE_ID_TI_WL1251	0x9066
-#endif
-
 struct wl1251_sdio {
 	struct sdio_func *func;
 	u32 elp_val;
diff --git a/drivers/net/wireless/ti/wlcore/sdio.c b/drivers/net/wireless/ti/wlcore/sdio.c
index 7afaf35f2453..9fd8cf2d270c 100644
--- a/drivers/net/wireless/ti/wlcore/sdio.c
+++ b/drivers/net/wireless/ti/wlcore/sdio.c
@@ -26,14 +26,6 @@
 #include "wl12xx_80211.h"
 #include "io.h"
 
-#ifndef SDIO_VENDOR_ID_TI
-#define SDIO_VENDOR_ID_TI		0x0097
-#endif
-
-#ifndef SDIO_DEVICE_ID_TI_WL1271
-#define SDIO_DEVICE_ID_TI_WL1271	0x4076
-#endif
-
 static bool dump = false;
 
 struct wl12xx_sdio_glue {
-- 
2.19.1

