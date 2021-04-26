Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC95436B48D
	for <lists+linux-omap@lfdr.de>; Mon, 26 Apr 2021 16:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbhDZONf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Apr 2021 10:13:35 -0400
Received: from muru.com ([72.249.23.125]:48822 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233637AbhDZONf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Apr 2021 10:13:35 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E448A80C0;
        Mon, 26 Apr 2021 14:12:52 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: [PATCH] drm/omap: Fix issue with clocks left on after resume
Date:   Mon, 26 Apr 2021 17:12:41 +0300
Message-Id: <20210426141241.51985-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On resume, dispc pm_runtime_force_resume() is not enabling the hardware
as we pass the pm_runtime_need_not_resume() test as the device is suspended
with no child devices.

As the resume continues, omap_atomic_comit_tail() calls dispc_runtime_get()
that calls rpm_resume() enabling the hardware, and increasing child_count
for it's parent device.

But at this point device_complete() has not yet been called for dispc. So
when omap_atomic_comit_tail() calls dispc_runtime_get(), it won't idle
the hardware, and the clocks are left on after resume.

This can be easily seen for example after suspending Beagleboard-X15 with
no displays connected, and by reading the CM_DSS_DSS_CLKCTRL register at
0x4a009120 after resume. After a suspend and resume cycle, it shows a
value of 0x00040102 instead of 0x00070000 like it should.

Let's fix the issue by calling dispc_runtime_suspend() and
dispc_runtime_resume() directly from dispc_suspend() and dispc_resume().
This leaves out the PM runtime related issues for system suspend.

See also earlier commit 88d26136a256 ("PM: Prevent runtime suspend during
system resume") and commit ca8199f13498 ("drm/msm/dpu: ensure device
suspend happens during PM sleep") for more information.

Fixes: ecfdedd7da5d ("drm/omap: force runtime PM suspend on system suspend")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -182,6 +182,7 @@ struct dispc_device {
 	const struct dispc_features *feat;
 
 	bool is_enabled;
+	bool needs_resume;
 
 	struct regmap *syscon_pol;
 	u32 syscon_pol_offset;
@@ -4887,10 +4888,34 @@ static int dispc_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int dispc_suspend(struct device *dev)
+{
+	struct dispc_device *dispc = dev_get_drvdata(dev);
+
+	if (!dispc->is_enabled)
+		return 0;
+
+	dispc->needs_resume = true;
+
+	return dispc_runtime_suspend(dev);
+}
+
+static int dispc_resume(struct device *dev)
+{
+	struct dispc_device *dispc = dev_get_drvdata(dev);
+
+	if (!dispc->needs_resume)
+		return 0;
+
+	dispc->needs_resume = false;
+
+	return dispc_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops dispc_pm_ops = {
 	.runtime_suspend = dispc_runtime_suspend,
 	.runtime_resume = dispc_runtime_resume,
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(dispc_suspend, dispc_resume)
 };
 
 struct platform_driver omap_dispchw_driver = {
-- 
2.31.1
