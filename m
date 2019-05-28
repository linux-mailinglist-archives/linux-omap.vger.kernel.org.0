Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47CD62BF41
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 08:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbfE1GYn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 02:24:43 -0400
Received: from muru.com ([72.249.23.125]:51442 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727609AbfE1GYn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 02:24:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5460580F3;
        Tue, 28 May 2019 06:25:01 +0000 (UTC)
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
Subject: [PATCH 10/13] bus: ti-sysc: Do rstctrl reset handling in two phases
Date:   Mon, 27 May 2019 23:24:11 -0700
Message-Id: <20190528062414.27192-11-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528062414.27192-1-tony@atomide.com>
References: <20190528062414.27192-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to deassert rstctrl resets before enabling clocks to avoid clock
"failed to enable" errors. For asserting rstctrl reset, the clocks need
to be enabled.

As the reset controller status is not available for arrays, let's use
devm_reset_control_get_optional() so we can get the status after reset.

Note that depends on a proper PRM rstctrl driver, so far I've only
tested this with earlier reset-simple patches.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -483,7 +483,7 @@ static void sysc_clkdm_allow_idle(struct sysc *ddata)
 static int sysc_init_resets(struct sysc *ddata)
 {
 	ddata->rsts =
-		devm_reset_control_array_get_optional_exclusive(ddata->dev);
+		devm_reset_control_get_optional(ddata->dev, "rstctrl");
 	if (IS_ERR(ddata->rsts))
 		return PTR_ERR(ddata->rsts);
 
@@ -1407,7 +1407,7 @@ static int sysc_legacy_init(struct sysc *ddata)
  */
 static int sysc_rstctrl_reset_deassert(struct sysc *ddata, bool reset)
 {
-	int error;
+	int error, val;
 
 	if (!ddata->rsts)
 		return 0;
@@ -1418,7 +1418,14 @@ static int sysc_rstctrl_reset_deassert(struct sysc *ddata, bool reset)
 			return error;
 	}
 
-	return reset_control_deassert(ddata->rsts);
+	error = reset_control_deassert(ddata->rsts);
+	if (error == -EEXIST)
+		return 0;
+
+	error = readx_poll_timeout(reset_control_status, ddata->rsts, val,
+				   val == 0, 100, MAX_MODULE_SOFTRESET_WAIT);
+
+	return error;
 }
 
 /*
@@ -1476,12 +1483,8 @@ static int sysc_init_module(struct sysc *ddata)
 {
 	int error = 0;
 	bool manage_clocks = true;
-	bool reset = true;
 
-	if (ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)
-		reset = false;
-
-	error = sysc_rstctrl_reset_deassert(ddata, reset);
+	error = sysc_rstctrl_reset_deassert(ddata, false);
 	if (error)
 		return error;
 
@@ -1505,6 +1508,12 @@ static int sysc_init_module(struct sysc *ddata)
 			goto err_opt_clocks;
 	}
 
+	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
+		error = sysc_rstctrl_reset_deassert(ddata, true);
+		if (error)
+			goto err_main_clocks;
+	}
+
 	ddata->revision = sysc_read_revision(ddata);
 	sysc_init_revision_quirks(ddata);
 
-- 
2.21.0
