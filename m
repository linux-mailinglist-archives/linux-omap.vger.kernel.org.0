Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6648541D4EF
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 10:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348912AbhI3IC4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 04:02:56 -0400
Received: from muru.com ([72.249.23.125]:39032 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348885AbhI3ICz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 04:02:55 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3EC918050;
        Thu, 30 Sep 2021 08:01:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Drew Fustini <pdp7pdp7@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH] soc: ti: omap-prm: Fix external abort for am335x pruss
Date:   Thu, 30 Sep 2021 11:01:00 +0300
Message-Id: <20210930080100.56820-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Starting with v5.15-rc1, we may now see some am335x beaglebone black
device produce the following error on pruss probe:

Unhandled fault: external abort on non-linefetch (0x1008) at 0xe0326000

This has started with the enabling of pruss for am335x in the dts files.

Turns out the is caused by the PRM reset handling not waiting for the
reset bit to clear. To fix the issue, let's always wait for the reset
bit to clear, even if there is a separate reset status register.

We attempted to fix a similar issue for dra7 iva with a udelay() in
commit effe89e40037 ("soc: ti: omap-prm: Fix occasional abort on reset
deassert for dra7 iva"). There is no longer a need for the udelay()
for dra7 iva reset either with the check added for reset bit clearing.

Cc: Drew Fustini <pdp7pdp7@gmail.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Reported-by: Matti Vaittinen <mazziesaccount@gmail.com>
Fixes: effe89e40037 ("soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -825,25 +825,28 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
 	spin_unlock_irqrestore(&reset->lock, flags);
 
-	if (!has_rstst)
-		goto exit;
+	/* wait for the reset bit to clear */
+	ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
+						reset->prm->data->rstctrl,
+						v, !(v & BIT(id)), 1,
+						OMAP_RESET_MAX_WAIT);
+	if (ret)
+		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
+		       reset->prm->data->name, id);
 
 	/* wait for the status to be set */
-	ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
+	if (has_rstst) {
+		ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
 						 reset->prm->data->rstst,
 						 v, v & BIT(st_bit), 1,
 						 OMAP_RESET_MAX_WAIT);
-	if (ret)
-		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
-		       reset->prm->data->name, id);
+		if (ret)
+			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
+			       reset->prm->data->name, id);
+	}
 
-exit:
-	if (reset->clkdm) {
-		/* At least dra7 iva needs a delay before clkdm idle */
-		if (has_rstst)
-			udelay(1);
+	if (reset->clkdm)
 		pdata->clkdm_allow_idle(reset->clkdm);
-	}
 
 	return ret;
 }
-- 
2.33.0
