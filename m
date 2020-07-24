Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85CA22BFB6
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgGXHmQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:42:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727784AbgGXHmO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:42:14 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A749320786;
        Fri, 24 Jul 2020 07:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576534;
        bh=ggEflJqSV8AjFjySy+bubvW5KGNlQOK8sPbHABZ405A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EHELftLCj+2DfN3TztQ+R2i8XMm1XwovbnnuS857MFtFqshUqy7UgevVgjQio3/DO
         6/mOeaUk2WBK/26Mxp/2LAch181FKkX0IvRx5GBqcGeWoYvb7fVoxHps0UYe4GWObO
         w3V/RMwuYeRfvFeSOCrp+pxcPM0nEodFxSCffDjU=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 13/29] memory: emif: Fix whitespace coding style violations
Date:   Fri, 24 Jul 2020 09:40:22 +0200
Message-Id: <20200724074038.5597-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Make the code and printed messages slightly more readable.  Fixes
checkpatch warnings:

    WARNING: quoted string split across lines
    ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/emif.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 97bad1588bba..1241a87081f8 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -284,8 +284,7 @@ static void set_lpmode(struct emif_data *emif, u8 lpmode)
 	if ((emif->plat_data->ip_rev == EMIF_4D) &&
 	    (lpmode == EMIF_LP_MODE_PWR_DN)) {
 		WARN_ONCE(1,
-			  "REG_LP_MODE = LP_MODE_PWR_DN(4) is prohibited by"
-			  "erratum i743 switch to LP_MODE_SELF_REFRESH(2)\n");
+			  "REG_LP_MODE = LP_MODE_PWR_DN(4) is prohibited by erratum i743 switch to LP_MODE_SELF_REFRESH(2)\n");
 		/* rollback LP_MODE to Self-refresh mode */
 		lpmode = EMIF_LP_MODE_SELF_REFRESH;
 	}
@@ -714,7 +713,7 @@ static u32 get_ext_phy_ctrl_2_intelliphy_4d5(void)
 	u32 fifo_we_slave_ratio;
 
 	fifo_we_slave_ratio =  DIV_ROUND_CLOSEST(
-		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256 , t_ck);
+		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256, t_ck);
 
 	return fifo_we_slave_ratio | fifo_we_slave_ratio << 11 |
 		fifo_we_slave_ratio << 22;
@@ -725,7 +724,7 @@ static u32 get_ext_phy_ctrl_3_intelliphy_4d5(void)
 	u32 fifo_we_slave_ratio;
 
 	fifo_we_slave_ratio =  DIV_ROUND_CLOSEST(
-		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256 , t_ck);
+		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256, t_ck);
 
 	return fifo_we_slave_ratio >> 10 | fifo_we_slave_ratio << 1 |
 		fifo_we_slave_ratio << 12 | fifo_we_slave_ratio << 23;
@@ -736,7 +735,7 @@ static u32 get_ext_phy_ctrl_4_intelliphy_4d5(void)
 	u32 fifo_we_slave_ratio;
 
 	fifo_we_slave_ratio =  DIV_ROUND_CLOSEST(
-		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256 , t_ck);
+		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256, t_ck);
 
 	return fifo_we_slave_ratio >> 9 | fifo_we_slave_ratio << 2 |
 		fifo_we_slave_ratio << 13;
@@ -975,8 +974,7 @@ static irqreturn_t handle_temp_alert(void __iomem *base, struct emif_data *emif)
 				EMIF_CUSTOM_CONFIG_EXTENDED_TEMP_PART)) {
 		if (emif->temperature_level >= SDRAM_TEMP_HIGH_DERATE_REFRESH) {
 			dev_err(emif->dev,
-				"%s:NOT Extended temperature capable memory."
-				"Converting MR4=0x%02x as shutdown event\n",
+				"%s:NOT Extended temperature capable memory. Converting MR4=0x%02x as shutdown event\n",
 				__func__, emif->temperature_level);
 			/*
 			 * Temperature far too high - do kernel_power_off()
@@ -1318,9 +1316,9 @@ static void __init_or_module of_get_ddr_info(struct device_node *np_emif,
 	if (of_find_property(np_emif, "cal-resistor-per-cs", &len))
 		dev_info->cal_resistors_per_cs = true;
 
-	if (of_device_is_compatible(np_ddr , "jedec,lpddr2-s4"))
+	if (of_device_is_compatible(np_ddr, "jedec,lpddr2-s4"))
 		dev_info->type = DDR_TYPE_LPDDR2_S4;
-	else if (of_device_is_compatible(np_ddr , "jedec,lpddr2-s2"))
+	else if (of_device_is_compatible(np_ddr, "jedec,lpddr2-s2"))
 		dev_info->type = DDR_TYPE_LPDDR2_S2;
 
 	of_property_read_u32(np_ddr, "density", &density);
-- 
2.17.1

