Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA97F413108
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhIUKC4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:02:56 -0400
Received: from muru.com ([72.249.23.125]:35408 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhIUKCz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:02:55 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4A5138127;
        Tue, 21 Sep 2021 10:01:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/9] bus: ti-sysc: Fix timekeeping_suspended warning on resume
Date:   Tue, 21 Sep 2021 13:01:07 +0300
Message-Id: <20210921100115.59865-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921100115.59865-1-tony@atomide.com>
References: <20210921100115.59865-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On resume we can get a warning at kernel/time/timekeeping.c:824 for
timekeeping_suspended.

Let's fix this by adding separate functions for sysc_poll_reset_sysstatus()
and sysc_poll_reset_sysconfig() and have the new functions handle also
timekeeping_suspended.

If iopoll at some point supports timekeeping_suspended, we can just drop
the custom handling from these functions.

Fixes: d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 65 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -17,6 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
+#include <linux/timekeeping.h>
 #include <linux/iopoll.h>
 
 #include <linux/platform_data/ti-sysc.h>
@@ -223,37 +224,77 @@ static u32 sysc_read_sysstatus(struct sysc *ddata)
 	return sysc_read(ddata, offset);
 }
 
-/* Poll on reset status */
-static int sysc_wait_softreset(struct sysc *ddata)
+static int sysc_poll_reset_sysstatus(struct sysc *ddata)
 {
-	u32 sysc_mask, syss_done, rstval;
-	int syss_offset, error = 0;
-
-	if (ddata->cap->regbits->srst_shift < 0)
-		return 0;
-
-	syss_offset = ddata->offsets[SYSC_SYSSTATUS];
-	sysc_mask = BIT(ddata->cap->regbits->srst_shift);
+	int error, retries;
+	u32 syss_done, rstval;
 
 	if (ddata->cfg.quirks & SYSS_QUIRK_RESETDONE_INVERTED)
 		syss_done = 0;
 	else
 		syss_done = ddata->cfg.syss_mask;
 
-	if (syss_offset >= 0) {
+	if (likely(!timekeeping_suspended)) {
 		error = readx_poll_timeout_atomic(sysc_read_sysstatus, ddata,
 				rstval, (rstval & ddata->cfg.syss_mask) ==
 				syss_done, 100, MAX_MODULE_SOFTRESET_WAIT);
+	} else {
+		retries = MAX_MODULE_SOFTRESET_WAIT;
+		while (retries--) {
+			rstval = sysc_read_sysstatus(ddata);
+			if ((rstval & ddata->cfg.syss_mask) == syss_done)
+				return 0;
+			udelay(2); /* Account for udelay flakeyness */
+		}
+		error = -ETIMEDOUT;
+	}
 
-	} else if (ddata->cfg.quirks & SYSC_QUIRK_RESET_STATUS) {
+	return error;
+}
+
+static int sysc_poll_reset_sysconfig(struct sysc *ddata)
+{
+	int error, retries;
+	u32 sysc_mask, rstval;
+
+	sysc_mask = BIT(ddata->cap->regbits->srst_shift);
+
+	if (likely(!timekeeping_suspended)) {
 		error = readx_poll_timeout_atomic(sysc_read_sysconfig, ddata,
 				rstval, !(rstval & sysc_mask),
 				100, MAX_MODULE_SOFTRESET_WAIT);
+	} else {
+		retries = MAX_MODULE_SOFTRESET_WAIT;
+		while (retries--) {
+			rstval = sysc_read_sysconfig(ddata);
+			if (!(rstval & sysc_mask))
+				return 0;
+			udelay(2); /* Account for udelay flakeyness */
+		}
+		error = -ETIMEDOUT;
 	}
 
 	return error;
 }
 
+/* Poll on reset status */
+static int sysc_wait_softreset(struct sysc *ddata)
+{
+	int syss_offset, error = 0;
+
+	if (ddata->cap->regbits->srst_shift < 0)
+		return 0;
+
+	syss_offset = ddata->offsets[SYSC_SYSSTATUS];
+
+	if (syss_offset >= 0)
+		error = sysc_poll_reset_sysstatus(ddata);
+	else if (ddata->cfg.quirks & SYSC_QUIRK_RESET_STATUS)
+		error = sysc_poll_reset_sysconfig(ddata);
+
+	return error;
+}
+
 static int sysc_add_named_clock_from_child(struct sysc *ddata,
 					   const char *name,
 					   const char *optfck_name)
-- 
2.33.0
