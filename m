Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471B8412FA6
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 09:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhIUHtG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 03:49:06 -0400
Received: from muru.com ([72.249.23.125]:35266 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230172AbhIUHtG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 03:49:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8CB4580A8;
        Tue, 21 Sep 2021 07:48:05 +0000 (UTC)
Date:   Tue, 21 Sep 2021 10:47:36 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
Message-ID: <YUmOGFUFONR/ynfW@atomide.com>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Matti Vaittinen <mazziesaccount@gmail.com> [210920 08:23]:
> Finally, adding the udelay(100); (as Tony suggested) at the end of the
> omap_reset_deassert() did make the oops go away even when pruss_tm was
> enabled. I don't know what would be a proper fix though.

The following patch works for me on bbb with the following test script:

#!/bin/sh

module="4a326000.target-module"
driver="/sys/bus/platform/drivers/ti-sysc"

while true; do
	echo ${module} > ${driver}/bind
	echo ${module} > ${driver}/unbind
done

It also allows leaving out the udelay for dra7 iva reset. Care to try
this and see if it helps?

Regards,

Tony

8< -----------------
diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -825,26 +825,29 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
 	spin_unlock_irqrestore(&reset->lock, flags);
 
-	if (!has_rstst)
-		goto exit;
-
-	/* wait for the status to be set */
-	ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
+	if (has_rstst) {
+		/* wait for the status to be set */
+		ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
 						 reset->prm->data->rstst,
 						 v, v & BIT(st_bit), 1,
 						 OMAP_RESET_MAX_WAIT);
-	if (ret)
-		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
-		       reset->prm->data->name, id);
-
-exit:
-	if (reset->clkdm) {
-		/* At least dra7 iva needs a delay before clkdm idle */
-		if (has_rstst)
-			udelay(1);
-		pdata->clkdm_allow_idle(reset->clkdm);
+		if (ret)
+			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
+			       reset->prm->data->name, id);
+	} else {
+		/* wait for the reset bit to cleaar */
+		ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
+						reset->prm->data->rstctrl,
+						v, !(v & BIT(id)), 1,
+						OMAP_RESET_MAX_WAIT);
+		if (ret)
+			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
+			       reset->prm->data->name, id);
 	}
 
+	if (reset->clkdm)
+		pdata->clkdm_allow_idle(reset->clkdm);
+
 	return ret;
 }
 
-- 
2.33.0
