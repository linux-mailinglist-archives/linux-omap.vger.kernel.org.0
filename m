Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3804AB2814
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 00:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390572AbfIMWJd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 18:09:33 -0400
Received: from muru.com ([72.249.23.125]:60742 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390550AbfIMWJd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Sep 2019 18:09:33 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 18DC681A1;
        Fri, 13 Sep 2019 22:10:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 3/6] hwrng: omap3-rom - Call clk_prepare() on init and exit only
Date:   Fri, 13 Sep 2019 15:09:19 -0700
Message-Id: <20190913220922.29501-4-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913220922.29501-1-tony@atomide.com>
References: <20190913220922.29501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When unloading omap3-rom-rng, we'll get the following:

WARNING: CPU: 0 PID: 100 at drivers/clk/clk.c:948 clk_core_disable

This is because the clock is already disabled by omap3_rom_rng_idle().

Also, we should not call prepare and unprepare except during init, and
only call enable and disable during use.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Adam Ford <aford173@gmail.com>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Tero Kristo <t-kristo@ti.com>
Fixes: 1c6b7c2108bd ("hwrng: OMAP3 ROM Random Number Generator support")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/char/hw_random/omap3-rom-rng.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -44,7 +44,7 @@ static void omap3_rom_rng_idle(struct work_struct *work)
 		pr_err("reset failed: %d\n", r);
 		return;
 	}
-	clk_disable_unprepare(rng_clk);
+	clk_disable(rng_clk);
 	rng_idle = 1;
 }
 
@@ -55,13 +55,13 @@ static int omap3_rom_rng_get_random(void *buf, unsigned int count)
 
 	cancel_delayed_work_sync(&idle_work);
 	if (rng_idle) {
-		r = clk_prepare_enable(rng_clk);
+		r = clk_enable(rng_clk);
 		if (r)
 			return r;
 
 		r = omap3_rom_rng_call(0, 0, RNG_GEN_PRNG_HW_INIT);
 		if (r != 0) {
-			clk_disable_unprepare(rng_clk);
+			clk_disable(rng_clk);
 			pr_err("HW init failed: %d\n", r);
 			return -EIO;
 		}
@@ -114,20 +114,32 @@ static int omap3_rom_rng_probe(struct platform_device *pdev)
 		return PTR_ERR(rng_clk);
 	}
 
+	ret = clk_prepare(rng_clk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "clk_prepare failed: %i\n", ret);
+		return ret;
+	}
+
 	/* Leave the RNG in reset state. */
-	ret = clk_prepare_enable(rng_clk);
+	ret = clk_enable(rng_clk);
 	if (ret)
-		return ret;
+		goto err_unprepare;
 	omap3_rom_rng_idle(0);
 
 	return hwrng_register(&omap3_rom_rng_ops);
+
+err_unprepare:
+	clk_unprepare(rng_clk);
+
+	return ret;
 }
 
 static int omap3_rom_rng_remove(struct platform_device *pdev)
 {
 	cancel_delayed_work_sync(&idle_work);
 	hwrng_unregister(&omap3_rom_rng_ops);
-	clk_disable_unprepare(rng_clk);
+	clk_unprepare(rng_clk);
+
 	return 0;
 }
 
-- 
2.23.0
