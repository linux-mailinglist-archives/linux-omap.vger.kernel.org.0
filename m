Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0B24F76E5
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 09:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbiDGHMW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 03:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236662AbiDGHMU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 03:12:20 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2831612AD8;
        Thu,  7 Apr 2022 00:10:20 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 55B7F8153;
        Thu,  7 Apr 2022 07:07:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 3/4] clocksource/drivers/timer-ti-dm: Add compatible for am6
Date:   Thu,  7 Apr 2022 10:10:05 +0300
Message-Id: <20220407071006.37031-3-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407071006.37031-1-tony@atomide.com>
References: <20220407071006.37031-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add compatible for am6 to support the timers. For example, am654 has
four timers in the MCU domain and 12 timers in the MAIN domain.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -922,6 +922,10 @@ static const struct dmtimer_platform_data omap3plus_pdata = {
 	.timer_ops = &dmtimer_ops,
 };
 
+static const struct dmtimer_platform_data am6_pdata = {
+	.timer_ops = &dmtimer_ops,
+};
+
 static const struct of_device_id omap_timer_match[] = {
 	{
 		.compatible = "ti,omap2420-timer",
@@ -950,6 +954,10 @@ static const struct of_device_id omap_timer_match[] = {
 		.compatible = "ti,dm816-timer",
 		.data = &omap3plus_pdata,
 	},
+	{
+		.compatible = "ti,am6-timer",
+		.data = &am6_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, omap_timer_match);
-- 
2.35.1
