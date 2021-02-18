Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE76031ECC3
	for <lists+linux-omap@lfdr.de>; Thu, 18 Feb 2021 18:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhBRRA1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Feb 2021 12:00:27 -0500
Received: from muru.com ([72.249.23.125]:35044 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231764AbhBRN05 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Feb 2021 08:26:57 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CBEA2814A;
        Thu, 18 Feb 2021 13:24:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Yongqin Liu <yongqin.liu@linaro.org>
Subject: [PATCH] soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva
Date:   Thu, 18 Feb 2021 15:24:26 +0200
Message-Id: <20210218132426.46155-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On reset deassert, we must wait a bit after the rstst bit change before
we allow clockdomain autoidle again. Otherwise we get the following oops
sometimes on dra7 with iva:

Unhandled fault: imprecise external abort (0x1406) at 0x00000000
44000000.ocp:L3 Standard Error: MASTER MPU TARGET IVA_CONFIG (Read Link):
At Address: 0x0005A410 : Data Access in User mode during Functional access
Internal error: : 1406 [#1] SMP ARM
...
(sysc_write_sysconfig) from [<c0782cb0>] (sysc_enable_module+0xcc/0x260)
(sysc_enable_module) from [<c0782f0c>] (sysc_runtime_resume+0xc8/0x174)
(sysc_runtime_resume) from [<c0a3e1ac>] (genpd_runtime_resume+0x94/0x224)
(genpd_runtime_resume) from [<c0a33f0c>] (__rpm_callback+0xd8/0x180)

It is unclear what all devices this might affect, but presumably other
devices with the rstst bit too can be affected. So let's just enable the
delay for all the devices with rstst bit for now. Later on we may want to
limit the list to the know affected devices if needed.

Fixes: d30cd83f6853 ("soc: ti: omap-prm: add support for denying idle for reset clockdomain")
Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -830,8 +830,12 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 		       reset->prm->data->name, id);
 
 exit:
-	if (reset->clkdm)
+	if (reset->clkdm) {
+		/* At least dra7 iva needs a delay before clkdm idle */
+		if (has_rstst)
+			udelay(1);
 		pdata->clkdm_allow_idle(reset->clkdm);
+	}
 
 	return ret;
 }
-- 
2.30.1
