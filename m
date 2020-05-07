Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE541C979C
	for <lists+linux-omap@lfdr.de>; Thu,  7 May 2020 19:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgEGRYV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 May 2020 13:24:21 -0400
Received: from muru.com ([72.249.23.125]:53438 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726778AbgEGRYU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 May 2020 13:24:20 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7E4FB80CD;
        Thu,  7 May 2020 17:25:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 14/14] bus: ti-sysc: Timers no longer need legacy quirk handling
Date:   Thu,  7 May 2020 10:23:30 -0700
Message-Id: <20200507172330.18679-15-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507172330.18679-1-tony@atomide.com>
References: <20200507172330.18679-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As timers no longer need legacy quirk handling, let's move them to
the CONFIG_DEBUG section to make it easier to see which drivers still
need more work.

Let's also add detection for few more older timer revisions while at
it as that makes CONFIG_DEBUG output easier to read with proper names.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1275,13 +1275,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("smartreflex", 0, -ENODEV, 0x38, -ENODEV, 0x00000000, 0xffffffff,
 		   SYSC_QUIRK_LEGACY_IDLE),
-	SYSC_QUIRK("timer", 0, 0, 0x10, 0x14, 0x00000015, 0xffffffff,
-		   0),
-	/* Some timers on omap4 and later */
-	SYSC_QUIRK("timer", 0, 0, 0x10, -ENODEV, 0x50002100, 0xffffffff,
-		   0),
-	SYSC_QUIRK("timer", 0, 0, 0x10, -ENODEV, 0x4fff1301, 0xffff00ff,
-		   0),
 	SYSC_QUIRK("uart", 0, 0x50, 0x54, 0x58, 0x00000046, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("uart", 0, 0x50, 0x54, 0x58, 0x00000052, 0xffffffff,
@@ -1404,6 +1397,13 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("slimbus", 0, 0, 0x10, -ENODEV, 0x40002903, 0xffffffff, 0),
 	SYSC_QUIRK("spinlock", 0, 0, 0x10, -ENODEV, 0x50020000, 0xffffffff, 0),
 	SYSC_QUIRK("rng", 0, 0x1fe0, 0x1fe4, -ENODEV, 0x00000020, 0xffffffff, 0),
+	SYSC_QUIRK("timer", 0, 0, 0x10, 0x14, 0x00000013, 0xffffffff, 0),
+	SYSC_QUIRK("timer", 0, 0, 0x10, 0x14, 0x00000015, 0xffffffff, 0),
+	/* Some timers on omap4 and later */
+	SYSC_QUIRK("timer", 0, 0, 0x10, -ENODEV, 0x50002100, 0xffffffff, 0),
+	SYSC_QUIRK("timer", 0, 0, 0x10, -ENODEV, 0x4fff1301, 0xffff00ff, 0),
+	SYSC_QUIRK("timer32k", 0, 0, 0x4, -ENODEV, 0x00000040, 0xffffffff, 0),
+	SYSC_QUIRK("timer32k", 0, 0, 0x4, -ENODEV, 0x00000011, 0xffffffff, 0),
 	SYSC_QUIRK("timer32k", 0, 0, 0x4, -ENODEV, 0x00000060, 0xffffffff, 0),
 	SYSC_QUIRK("tpcc", 0, 0, -ENODEV, -ENODEV, 0x40014c00, 0xffffffff, 0),
 	SYSC_QUIRK("usbhstll", 0, 0, 0x10, 0x14, 0x00000004, 0xffffffff, 0),
-- 
2.26.2
