Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E5CB2D01
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 23:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfINVDK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 17:03:10 -0400
Received: from muru.com ([72.249.23.125]:32914 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726912AbfINVDK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Sep 2019 17:03:10 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1E9518167;
        Sat, 14 Sep 2019 21:03:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 3/7] hwrng: omap3-rom - Call clk_disable_unprepare() on exit only if not idled
Date:   Sat, 14 Sep 2019 14:02:56 -0700
Message-Id: <20190914210300.15836-4-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190914210300.15836-1-tony@atomide.com>
References: <20190914210300.15836-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When unloading omap3-rom-rng, we'll get the following:

WARNING: CPU: 0 PID: 100 at drivers/clk/clk.c:948 clk_core_disable

This is because the clock may be already disabled by omap3_rom_rng_idle().
Let's fix the issue by checking for rng_idle on exit.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Adam Ford <aford173@gmail.com>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Fixes: 1c6b7c2108bd ("hwrng: OMAP3 ROM Random Number Generator support")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/char/hw_random/omap3-rom-rng.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -127,7 +127,8 @@ static int omap3_rom_rng_remove(struct platform_device *pdev)
 {
 	cancel_delayed_work_sync(&idle_work);
 	hwrng_unregister(&omap3_rom_rng_ops);
-	clk_disable_unprepare(rng_clk);
+	if (!rng_idle)
+		clk_disable_unprepare(rng_clk);
 	return 0;
 }
 
-- 
2.23.0
