Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536AB1C977C
	for <lists+linux-omap@lfdr.de>; Thu,  7 May 2020 19:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgEGRXy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 May 2020 13:23:54 -0400
Received: from muru.com ([72.249.23.125]:53228 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727972AbgEGRXv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 May 2020 13:23:51 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5B87F80CD;
        Thu,  7 May 2020 17:24:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 05/14] ARM: OMAP2+: Add omap_init_time_of()
Date:   Thu,  7 May 2020 10:23:21 -0700
Message-Id: <20200507172330.18679-6-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507172330.18679-1-tony@atomide.com>
References: <20200507172330.18679-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This allows us to move the SoCs to probe system timers one SoC
at at time. As arch/arm/mach-omap2/timer.c will be eventually gone,
let's just add omap_init_time_of() to board-generic.c directly.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/board-generic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -12,6 +12,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/irqdomain.h>
+#include <linux/clocksource.h>
 
 #include <asm/setup.h>
 #include <asm/mach/arch.h>
@@ -31,6 +32,13 @@ static void __init __maybe_unused omap_generic_init(void)
 	omap_soc_device_init();
 }
 
+/* Clocks are needed early, see drivers/clocksource for the rest */
+void __init __maybe_unused omap_init_time_of(void)
+{
+	omap_clk_init();
+	timer_probe();
+}
+
 #ifdef CONFIG_SOC_OMAP2420
 static const char *const omap242x_boards_compat[] __initconst = {
 	"ti,omap2420",
-- 
2.26.2
