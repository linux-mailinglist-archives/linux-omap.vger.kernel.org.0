Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2E9212B81
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 19:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgGBRtd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 13:49:33 -0400
Received: from muru.com ([72.249.23.125]:60458 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726754AbgGBRtc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jul 2020 13:49:32 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9DD418062;
        Thu,  2 Jul 2020 17:50:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] bus: ti-sysc: Fix wakeirq sleeping function called from invalid context
Date:   Thu,  2 Jul 2020 10:49:28 -0700
Message-Id: <20200702174929.26506-1-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With CONFIG_DEBUG_ATOMIC_SLEEP enabled we can see the following with
wakeirqs and serial console idled:

BUG: sleeping function called from invalid context at drivers/bus/ti-sysc.c:242
...
(sysc_wait_softreset) from [<c0606894>] (sysc_enable_module+0x48/0x274)
(sysc_enable_module) from [<c0606c5c>] (sysc_runtime_resume+0x19c/0x1d8)
(sysc_runtime_resume) from [<c0606cf0>] (sysc_child_runtime_resume+0x58/0x84)
(sysc_child_runtime_resume) from [<c06eb7bc>] (__rpm_callback+0x30/0x12c)
(__rpm_callback) from [<c06eb8d8>] (rpm_callback+0x20/0x80)
(rpm_callback) from [<c06eb434>] (rpm_resume+0x638/0x7fc)
(rpm_resume) from [<c06eb658>] (__pm_runtime_resume+0x60/0x9c)
(__pm_runtime_resume) from [<c06edc08>] (handle_threaded_wake_irq+0x24/0x60)
(handle_threaded_wake_irq) from [<c01befec>] (irq_thread_fn+0x1c/0x78)
(irq_thread_fn) from [<c01bf30c>] (irq_thread+0x140/0x26c)

We have __pm_runtime_resume() call the sysc_runtime_resume() with spinlock
held and interrupts disabled.

Fixes: d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -236,15 +236,14 @@ static int sysc_wait_softreset(struct sysc *ddata)
 		syss_done = ddata->cfg.syss_mask;
 
 	if (syss_offset >= 0) {
-		error = readx_poll_timeout(sysc_read_sysstatus, ddata, rstval,
-					   (rstval & ddata->cfg.syss_mask) ==
-					   syss_done,
-					   100, MAX_MODULE_SOFTRESET_WAIT);
+		error = readx_poll_timeout_atomic(sysc_read_sysstatus, ddata,
+				rstval, (rstval & ddata->cfg.syss_mask) ==
+				syss_done, 100, MAX_MODULE_SOFTRESET_WAIT);
 
 	} else if (ddata->cfg.quirks & SYSC_QUIRK_RESET_STATUS) {
-		error = readx_poll_timeout(sysc_read_sysconfig, ddata, rstval,
-					   !(rstval & sysc_mask),
-					   100, MAX_MODULE_SOFTRESET_WAIT);
+		error = readx_poll_timeout_atomic(sysc_read_sysconfig, ddata,
+				rstval, !(rstval & sysc_mask),
+				100, MAX_MODULE_SOFTRESET_WAIT);
 	}
 
 	return error;
-- 
2.27.0
