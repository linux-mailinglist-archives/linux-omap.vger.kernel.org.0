Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFF22AD463
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 12:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbgKJLEv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 06:04:51 -0500
Received: from muru.com ([72.249.23.125]:47622 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbgKJLEv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 06:04:51 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8C9E880BA;
        Tue, 10 Nov 2020 11:04:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: ti: omap-prm: Do not check rstst bit on deassert if already deasserted
Date:   Tue, 10 Nov 2020 13:04:46 +0200
Message-Id: <20201110110446.64837-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If a rstctrl reset bit is already deasserted, we can just bail out early
not wait for rstst to clear. Otherwise we can have deassert fail for
already deasserted resets.

Fixes: c5117a78dd88 ("soc: ti: omap-prm: poll for reset complete during de-assert")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

I found this with the genpd conversion, probably can wait for the merge
window and be merged together with the other pending omap_prm.c changes
I have posted.

---
 drivers/soc/ti/omap_prm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -484,6 +484,10 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	struct ti_prm_platform_data *pdata = dev_get_platdata(reset->dev);
 	int ret = 0;
 
+	/* Nothing to do if the reset is already deasserted */
+	if (!omap_reset_status(rcdev, id))
+		return 0;
+
 	has_rstst = reset->prm->data->rstst ||
 		(reset->prm->data->flags & OMAP_PRM_HAS_RSTST);
 
-- 
2.29.2
