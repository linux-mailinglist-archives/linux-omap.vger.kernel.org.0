Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316761AE2A1
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 18:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgDQQzo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 12:55:44 -0400
Received: from muru.com ([72.249.23.125]:50064 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbgDQQzn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 12:55:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C80A58160;
        Fri, 17 Apr 2020 16:56:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] bus: ti-sysc: Ignore timer12 on secure omap3
Date:   Fri, 17 Apr 2020 09:55:09 -0700
Message-Id: <20200417165519.4979-5-tony@atomide.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417165519.4979-1-tony@atomide.com>
References: <20200417165519.4979-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some early omap3 boards use timer12 for system timer, but for secure
SoCs like on n900 it's not accessible. Likely we will be configuring
unavailable devices for other SoCs too based on runtime SoC detection,
so let's use a switch to start with.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2744,6 +2744,17 @@ static int sysc_init_soc(struct sysc *ddata)
 	if (match && match->data)
 		sysc_soc->soc = (int)match->data;
 
+	/* Ignore devices that are not available on HS and EMU SoCs */
+	if (!sysc_soc->general_purpose) {
+		switch (sysc_soc->soc) {
+		case SOC_3430 ... SOC_3630:
+			sysc_add_disabled(0x48304000);	/* timer12 */
+			break;
+		default:
+			break;
+		};
+	}
+
 	match = soc_device_match(sysc_soc_feat_match);
 	if (!match)
 		return 0;
-- 
2.26.1
