Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5F572BF56
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 08:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfE1GYo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 02:24:44 -0400
Received: from muru.com ([72.249.23.125]:51434 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727521AbfE1GYk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 02:24:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E9BDE8148;
        Tue, 28 May 2019 06:24:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 09/13] bus: ti-sysc: Add support for disabling module without legacy mode
Date:   Mon, 27 May 2019 23:24:10 -0700
Message-Id: <20190528062414.27192-10-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528062414.27192-1-tony@atomide.com>
References: <20190528062414.27192-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We must not assert reset for modules with no child device drivers
until in runtime_suspend. Otherwise register access will fail without
legacy mode helping us.

Let's add a flag for disable_on_idle and move the reset driver
handling to runtime suspend and resume. We can then also use the
disable_on_idle flag to reconfigure sysconfig register for PM
modes requesting it.

Let's also make the other flags use bitfield while at it instead of
bool.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -89,9 +89,10 @@ struct sysc {
 	struct ti_sysc_cookie cookie;
 	const char *name;
 	u32 revision;
-	bool enabled;
-	bool needs_resume;
-	bool child_needs_resume;
+	unsigned int enabled:1;
+	unsigned int needs_resume:1;
+	unsigned int child_needs_resume:1;
+	unsigned int disable_on_idle:1;
 	struct delayed_work idle_work;
 };
 
@@ -1007,6 +1008,9 @@ static int __maybe_unused sysc_runtime_suspend_legacy(struct device *dev,
 		dev_err(dev, "%s: could not idle: %i\n",
 			__func__, error);
 
+	if (ddata->disable_on_idle)
+		reset_control_assert(ddata->rsts);
+
 	return 0;
 }
 
@@ -1016,6 +1020,9 @@ static int __maybe_unused sysc_runtime_resume_legacy(struct device *dev,
 	struct ti_sysc_platform_data *pdata;
 	int error;
 
+	if (ddata->disable_on_idle)
+		reset_control_deassert(ddata->rsts);
+
 	pdata = dev_get_platdata(ddata->dev);
 	if (!pdata)
 		return 0;
@@ -1063,6 +1070,9 @@ static int __maybe_unused sysc_runtime_suspend(struct device *dev)
 err_allow_idle:
 	sysc_clkdm_allow_idle(ddata);
 
+	if (ddata->disable_on_idle)
+		reset_control_assert(ddata->rsts);
+
 	return error;
 }
 
@@ -1076,6 +1086,9 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 	if (ddata->enabled)
 		return 0;
 
+	if (ddata->disable_on_idle)
+		reset_control_deassert(ddata->rsts);
+
 	sysc_clkdm_deny_idle(ddata);
 
 	if (sysc_opt_clks_needed(ddata)) {
@@ -2293,7 +2306,7 @@ static int sysc_probe(struct platform_device *pdev)
 	}
 
 	if (!of_get_available_child_count(ddata->dev->of_node))
-		reset_control_assert(ddata->rsts);
+		ddata->disable_on_idle = true;
 
 	return 0;
 
-- 
2.21.0
