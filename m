Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF229AAE1D
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 23:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732629AbfIEVyB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 17:54:01 -0400
Received: from muru.com ([72.249.23.125]:59862 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731215AbfIEVyB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Sep 2019 17:54:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AA813810D;
        Thu,  5 Sep 2019 21:54:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] bus: ti-sysc: Fix handling of invalid clocks
Date:   Thu,  5 Sep 2019 14:53:56 -0700
Message-Id: <20190905215356.8168-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can currently get "Unable to handle kernel paging request at
virtual address" for invalid clocks with dts node but no driver:

(__clk_get_hw) from [<c0138ebc>] (ti_sysc_find_one_clockdomain+0x18/0x34)
(ti_sysc_find_one_clockdomain) from [<c0138f0c>] (ti_sysc_clkdm_init+0x34/0xdc)
(ti_sysc_clkdm_init) from [<c0584660>] (sysc_probe+0xa50/0x10e8)
(sysc_probe) from [<c065c6ac>] (platform_drv_probe+0x58/0xa8)

Let's add IS_ERR checks to ti_sysc_clkdm_init() as And let's start treating
clk_get() with -ENOENT as a proper error. If the clock name is specified
in device tree we must succeed with clk_get() to continue. For modules with
no clock names specified in device tree we will just ignore the clocks.

Fixes: 2b2f7def058a ("bus: ti-sysc: Add support for missing clockdomain handling")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 4 ++--
 drivers/bus/ti-sysc.c              | 5 +----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -491,11 +491,11 @@ static int ti_sysc_clkdm_init(struct device *dev,
 			      struct clk *fck, struct clk *ick,
 			      struct ti_sysc_cookie *cookie)
 {
-	if (fck)
+	if (!IS_ERR(fck))
 		cookie->clkdm = ti_sysc_find_one_clockdomain(fck);
 	if (cookie->clkdm)
 		return 0;
-	if (ick)
+	if (!IS_ERR(ick))
 		cookie->clkdm = ti_sysc_find_one_clockdomain(ick);
 	if (cookie->clkdm)
 		return 0;
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -280,9 +280,6 @@ static int sysc_get_one_clock(struct sysc *ddata, const char *name)
 
 	ddata->clocks[index] = devm_clk_get(ddata->dev, name);
 	if (IS_ERR(ddata->clocks[index])) {
-		if (PTR_ERR(ddata->clocks[index]) == -ENOENT)
-			return 0;
-
 		dev_err(ddata->dev, "clock get error for %s: %li\n",
 			name, PTR_ERR(ddata->clocks[index]));
 
@@ -357,7 +354,7 @@ static int sysc_get_clocks(struct sysc *ddata)
 			continue;
 
 		error = sysc_get_one_clock(ddata, name);
-		if (error && error != -ENOENT)
+		if (error)
 			return error;
 	}
 
-- 
2.23.0
