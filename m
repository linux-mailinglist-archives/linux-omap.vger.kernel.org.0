Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD537330D58
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 13:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhCHMVz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 07:21:55 -0500
Received: from muru.com ([72.249.23.125]:40780 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231653AbhCHMVb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 07:21:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8DBBF8117;
        Mon,  8 Mar 2021 12:22:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 1/4] ARM: OMAP2+: Init both prm and prcm nodes early for clocks
Date:   Mon,  8 Mar 2021 14:21:15 +0200
Message-Id: <20210308122118.62460-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122118.62460-1-tony@atomide.com>
References: <20210308122118.62460-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to probe both prm and prcm nodes early for clocks
as they are needed by system timers.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -569,10 +569,29 @@ static void pdata_quirks_check(struct pdata_init *quirks)
 	}
 }
 
-void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
+static const char * const pdata_quirks_init_nodes[] = {
+	"prcm",
+	"prm",
+};
+
+void __init
+pdata_quirks_init_clocks(const struct of_device_id *omap_dt_match_table)
 {
 	struct device_node *np;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pdata_quirks_init_nodes); i++) {
+		np = of_find_node_by_name(NULL, pdata_quirks_init_nodes[i]);
+		if (!np)
+			continue;
 
+		of_platform_populate(np, omap_dt_match_table,
+				     omap_auxdata_lookup, NULL);
+	}
+}
+
+void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
+{
 	/*
 	 * We still need this for omap2420 and omap3 PM to work, others are
 	 * using drivers/misc/sram.c already.
@@ -585,13 +604,7 @@ void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
 		omap3_mcbsp_init();
 	pdata_quirks_check(auxdata_quirks);
 
-	/* Populate always-on PRCM in l4_wkup to probe l4_wkup */
-	np = of_find_node_by_name(NULL, "prcm");
-	if (!np)
-		np = of_find_node_by_name(NULL, "prm");
-	if (np)
-		of_platform_populate(np, omap_dt_match_table,
-				     omap_auxdata_lookup, NULL);
+	pdata_quirks_init_clocks(omap_dt_match_table);
 
 	of_platform_populate(NULL, omap_dt_match_table,
 			     omap_auxdata_lookup, NULL);
-- 
2.30.1
