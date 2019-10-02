Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9C3DC87E5
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 14:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfJBMGc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 08:06:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55706 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfJBMGc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 08:06:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92C6SZi090454;
        Wed, 2 Oct 2019 07:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570017988;
        bh=dT7Uy3f311vV4EnbbU50Iuck2DVayjIxqDPf5QDCe0U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ixPvDhX5b+CdZBSSnsSi/pCriLmAPMbRanR1RLsewwXyHufZtT1aVYitjC4DMKceY
         PyA+c1hshbCyEWxxOXjOAMLbO/0vHBFt3KBNt5tFMyB+y15+uBXvKlwc+OJkDa8jo3
         hT1Y8dOYyMO8q25x8n6rVCyUKRA5++Rqb3sJdT4M=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92C6Swj070879
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:06:28 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:06:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:06:28 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92C6L3j046205;
        Wed, 2 Oct 2019 07:06:26 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>,
        <aford173@gmail.com>, <tomi.valkeinen@ti.com>
Subject: [PATCH 2/4] clk: ti: divider: cleanup ti_clk_parse_divider_data API
Date:   Wed, 2 Oct 2019 15:06:09 +0300
Message-ID: <20191002120611.26121-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002120611.26121-1-t-kristo@ti.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Cleanup the ti_clk_parse_divider_data to pass the divider data struct
directly instead of individual values of it. This makes it easier
to modify the implementation later on.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c |  2 +-
 drivers/clk/ti/clock.h   |  3 +--
 drivers/clk/ti/divider.c | 18 +++++++-----------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 975995eea15c..665dfc5e309a 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -380,7 +380,7 @@ _ti_clkctrl_setup_div(struct omap_clkctrl_provider *provider,
 
 	if (ti_clk_parse_divider_data((int *)div_data->dividers, 0,
 				      div_data->max_div, div_flags,
-				      &div->width, &div->table)) {
+				      div)) {
 		pr_err("%s: Data parsing for %pOF:%04x:%d failed\n", __func__,
 		       node, offset, data->bit);
 		kfree(div);
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index e4b8392ff63c..f6b6876dfdee 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -220,8 +220,7 @@ void ti_clk_latch(struct clk_omap_reg *reg, s8 shift);
 struct clk_hw *ti_clk_build_component_mux(struct ti_clk_mux *setup);
 
 int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
-			      u8 flags, u8 *width,
-			      const struct clk_div_table **table);
+			      u8 flags, struct clk_omap_divider *div);
 
 int ti_clk_get_reg_addr(struct device_node *node, int index,
 			struct clk_omap_reg *reg);
diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 1b181f89ddc6..2c53096b7229 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -338,8 +338,7 @@ static struct clk *_register_divider(struct device_node *node,
 }
 
 int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
-			      u8 flags, u8 *width,
-			      const struct clk_div_table **table)
+			      u8 flags, struct clk_omap_divider *divider)
 {
 	int valid_div = 0;
 	u32 val;
@@ -363,8 +362,7 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 			val++;
 		}
 
-		*width = fls(val);
-		*table = NULL;
+		divider->width = fls(val);
 
 		return 0;
 	}
@@ -382,24 +380,22 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 	num_dividers = i;
 
 	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
-	if (!tmp) {
-		*table = ERR_PTR(-ENOMEM);
+	if (!tmp)
 		return -ENOMEM;
-	}
 
 	valid_div = 0;
-	*width = 0;
+	divider->width = 0;
 
 	for (i = 0; i < num_dividers; i++)
 		if (div_table[i] > 0) {
 			tmp[valid_div].div = div_table[i];
 			tmp[valid_div].val = i;
 			valid_div++;
-			*width = i;
+			divider->width = i;
 		}
 
-	*width = fls(*width);
-	*table = tmp;
+	divider->width = fls(divider->width);
+	divider->table = tmp;
 
 	return 0;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
