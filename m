Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C839631ECC2
	for <lists+linux-omap@lfdr.de>; Thu, 18 Feb 2021 18:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhBRQ7z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Feb 2021 11:59:55 -0500
Received: from muru.com ([72.249.23.125]:35026 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233526AbhBRNZi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Feb 2021 08:25:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BD83880AA;
        Thu, 18 Feb 2021 13:24:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] bus: ti-sysc: Fix warning on unbind if reset is not deasserted
Date:   Thu, 18 Feb 2021 15:23:57 +0200
Message-Id: <20210218132357.46074-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We currently get thefollowing on driver unbind if a reset is configured
and asserted:

WARNING: CPU: 0 PID: 993 at drivers/reset/core.c:432 reset_control_assert
...
(reset_control_assert) from [<c0fecda8>] (sysc_remove+0x190/0x1e4)
(sysc_remove) from [<c0a2bb58>] (platform_remove+0x24/0x3c)
(platform_remove) from [<c0a292fc>] (__device_release_driver+0x154/0x214)
(__device_release_driver) from [<c0a2a210>] (device_driver_detach+0x3c/0x8c)
(device_driver_detach) from [<c0a27d64>] (unbind_store+0x60/0xd4)
(unbind_store) from [<c0546bec>] (kernfs_fop_write_iter+0x10c/0x1cc)

Let's fix it by checking the reset status.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3053,7 +3053,9 @@ static int sysc_remove(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	reset_control_assert(ddata->rsts);
+
+	if (!reset_control_status(ddata->rsts))
+		reset_control_assert(ddata->rsts);
 
 unprepare:
 	sysc_unprepare(ddata);
-- 
2.30.1
