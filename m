Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DE93A3B91
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 08:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhFKGE0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 02:04:26 -0400
Received: from muru.com ([72.249.23.125]:41672 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230216AbhFKGE0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 02:04:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8B9F080E1;
        Fri, 11 Jun 2021 06:02:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [PATCH] bus: ti-sysc: Fix gpt12 system timer issue with reserved status
Date:   Fri, 11 Jun 2021 09:02:24 +0300
Message-Id: <20210611060224.36769-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Jarkko Nikula <jarkko.nikula@bitmer.com> reported that Beagleboard
revision c2 stopped booting. Jarkko bisected the issue down to
commit 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend
and resume for am3 and am4").

Let's fix the issue by tagging system timers as reserved rather than
ignoring them. And let's not probe any interconnect target module child
devices for reserved modules.

This allows PM runtime to keep track of clocks and clockdomains for
the interconnect target module, and prevent the system timer from idling
as we already have SYSC_QUIRK_NO_IDLE and SYSC_QUIRK_NO_IDLE_ON_INIT
flags set for system timers.

Fixes: 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4")
Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -100,6 +100,7 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @cookie: data used by legacy platform callbacks
  * @name: name if available
  * @revision: interconnect target module revision
+ * @reserved: target module is reserved and already in use
  * @enabled: sysc runtime enabled status
  * @needs_resume: runtime resume needed on resume from suspend
  * @child_needs_resume: runtime resume needed for child on resume from suspend
@@ -130,6 +131,7 @@ struct sysc {
 	struct ti_sysc_cookie cookie;
 	const char *name;
 	u32 revision;
+	unsigned int reserved:1;
 	unsigned int enabled:1;
 	unsigned int needs_resume:1;
 	unsigned int child_needs_resume:1;
@@ -3093,8 +3095,8 @@ static int sysc_probe(struct platform_device *pdev)
 		return error;
 
 	error = sysc_check_active_timer(ddata);
-	if (error)
-		return error;
+	if (error == -EBUSY)
+		ddata->reserved = true;
 
 	error = sysc_get_clocks(ddata);
 	if (error)
@@ -3130,11 +3132,15 @@ static int sysc_probe(struct platform_device *pdev)
 	sysc_show_registers(ddata);
 
 	ddata->dev->type = &sysc_device_type;
-	error = of_platform_populate(ddata->dev->of_node, sysc_match_table,
-				     pdata ? pdata->auxdata : NULL,
-				     ddata->dev);
-	if (error)
-		goto err;
+
+	if (!ddata->reserved) {
+		error = of_platform_populate(ddata->dev->of_node,
+					     sysc_match_table,
+					     pdata ? pdata->auxdata : NULL,
+					     ddata->dev);
+		if (error)
+			goto err;
+	}
 
 	INIT_DELAYED_WORK(&ddata->idle_work, ti_sysc_idle);
 
-- 
2.31.1
