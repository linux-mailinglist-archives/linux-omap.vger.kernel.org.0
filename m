Return-Path: <linux-omap+bounces-2290-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6498D1F4
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 13:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E8781F2247A
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 11:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03CE1E7666;
	Wed,  2 Oct 2024 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="UKNTM0/L"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC9F19409C;
	Wed,  2 Oct 2024 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727867256; cv=none; b=E/fAHDFrY8gGW85h3BeMT/ZIWQBnzHItwiK1lBCiwG4mUntNMCyvHQ/1k+t7jJXJfwj2tcNeHpuf4+2QumX/b1igd4E8gre/vUcGvowM98+KXEwVNcq6BIuQ/xa1EXw8wMsLafVVPMaYBoTVZ/xy21Ye88nGgSrl6ZeK9fxXQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727867256; c=relaxed/simple;
	bh=ORTJRm22ddAJfzALidDTq04r5FAZBeXSdbCkuCvQ3Ss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gVOY66Hm5ubm3CO4mI7C5aoi9gNIFIydamvTaSa5/SEQaAj5IwZYgK0oKU2PI4JfxEwV2LpP4LidT4SWWyFzEW89bUCugyLi98KWHqbxHaicXIq34nALFBdFnLM4mf97TDJdWjYfkSpQ4kAxfXhZS0SngcAJRupgF8UR8ABPQ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=UKNTM0/L; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=O3KKzCLh21dqde597mGqNjSl+BqkXtinmSgN7o8hns4=; b=UKNTM0/Ly52uyCJzEhybtOcEFZ
	Sxxk9Ue+UGaD+vXL56VcczmLCp9kLfHH/XMJKnm1E84dYQmNmiC/5UMmz/274OJT7gRxUN1eAtd0a
	4eA9RyvtMC+X+dBu4ikQHPeNbbHRklWuisCTZLCa5496NPkF/OEVcp0r+FJANE4uXYxrcKdiaxihH
	HnmpSvSutJ3PG3yC3z69TEftYckkChgzaDtrbbJv45mKBaxGQnRlobOWLoulxqdfZfEP7RA8a7tcw
	9X1w2dJpZ4Ds2McZa+HbPe7lsyCoykONx/MZduR5L94keppmcRDTWBhUZSV/idpGcmErw6MjeYxab
	4d+U9qbw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Stephen Boyd <sboyd@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-omap@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/3] clk: twl: add TWL6030 support
Date: Wed,  2 Oct 2024 13:07:18 +0200
Message-Id: <20241002110718.528337-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002110718.528337-1-andreas@kemnade.info>
References: <20241002110718.528337-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TWL6030 has similar clocks, so add support for it. Take care of the
resource grouping handling needed.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/clk/Kconfig   |  2 +-
 drivers/clk/clk-twl.c | 54 +++++++++++++++++++++++++++++++++----------
 2 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 299bc678ed1b..82ec12f9b82c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -291,7 +291,7 @@ config CLK_TWL
 	help
 	  Enable support for controlling the clock resources on TWL family
 	  PMICs. These devices have some 32K clock outputs which can be
-	  controlled by software. For now, only the TWL6032 clocks are
+	  controlled by software. For now, the TWL6032 and TWL6030 clocks are
 	  supported.
 
 config CLK_TWL6040
diff --git a/drivers/clk/clk-twl.c b/drivers/clk/clk-twl.c
index 1d684b358401..f3a52f568887 100644
--- a/drivers/clk/clk-twl.c
+++ b/drivers/clk/clk-twl.c
@@ -11,13 +11,26 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define VREG_STATE              2
+#define VREG_STATE		2
+#define VREG_GRP		0
 #define TWL6030_CFG_STATE_OFF   0x00
 #define TWL6030_CFG_STATE_ON    0x01
 #define TWL6030_CFG_STATE_MASK  0x03
+#define TWL6030_CFG_STATE_GRP_SHIFT	5
+#define TWL6030_CFG_STATE_APP_SHIFT	2
+#define TWL6030_CFG_STATE_APP_MASK	(0x03 << TWL6030_CFG_STATE_APP_SHIFT)
+#define TWL6030_CFG_STATE_APP(v)	(((v) & TWL6030_CFG_STATE_APP_MASK) >>\
+						TWL6030_CFG_STATE_APP_SHIFT)
+#define P1_GRP BIT(0) /* processor power group */
+#define P2_GRP BIT(1)
+#define P3_GRP BIT(2)
+#define ALL_GRP (P1_GRP | P2_GRP | P3_GRP)
+
+#define DRIVER_DATA_TWL6030 0
+#define DRIVER_DATA_TWL6032 1
 
 struct twl_clock_info {
-	struct device *dev;
+	struct platform_device *pdev;
 	u8 base;
 	struct clk_hw hw;
 };
@@ -56,14 +69,21 @@ static unsigned long twl_clks_recalc_rate(struct clk_hw *hw,
 static int twl6032_clks_prepare(struct clk_hw *hw)
 {
 	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
-	int ret;
 
-	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
-			   TWL6030_CFG_STATE_ON);
-	if (ret < 0)
-		dev_err(cinfo->dev, "clk prepare failed\n");
+	if (platform_get_device_id(cinfo->pdev)->driver_data == DRIVER_DATA_TWL6030) {
+		int grp;
 
-	return ret;
+		grp = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
+		if (grp < 0)
+			return grp;
+
+		return twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+				    grp << TWL6030_CFG_STATE_GRP_SHIFT |
+				    TWL6030_CFG_STATE_ON);
+	}
+
+	return twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+			    TWL6030_CFG_STATE_ON);
 }
 
 static void twl6032_clks_unprepare(struct clk_hw *hw)
@@ -71,10 +91,16 @@ static void twl6032_clks_unprepare(struct clk_hw *hw)
 	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
 	int ret;
 
-	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
-			   TWL6030_CFG_STATE_OFF);
+	if (platform_get_device_id(cinfo->pdev)->driver_data == DRIVER_DATA_TWL6030)
+		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+				   ALL_GRP << TWL6030_CFG_STATE_GRP_SHIFT |
+				   TWL6030_CFG_STATE_OFF);
+	else
+		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+				   TWL6030_CFG_STATE_OFF);
+
 	if (ret < 0)
-		dev_err(cinfo->dev, "clk unprepare failed\n");
+		dev_err(&cinfo->pdev->dev, "clk unprepare failed\n");
 }
 
 static const struct clk_ops twl6032_clks_ops = {
@@ -137,7 +163,7 @@ static int twl_clks_probe(struct platform_device *pdev)
 
 	for (i = 0; i < count; i++) {
 		cinfo[i].base = hw_data[i].base;
-		cinfo[i].dev = &pdev->dev;
+		cinfo[i].pdev = pdev;
 		cinfo[i].hw.init = &hw_data[i].init;
 		ret = devm_clk_hw_register(&pdev->dev, &cinfo[i].hw);
 		if (ret) {
@@ -159,7 +185,11 @@ static int twl_clks_probe(struct platform_device *pdev)
 
 static const struct platform_device_id twl_clks_id[] = {
 	{
+		.name = "twl6030-clk",
+		.driver_data = DRIVER_DATA_TWL6030,
+	}, {
 		.name = "twl6032-clk",
+		.driver_data = DRIVER_DATA_TWL6032,
 	}, {
 		/* sentinel */
 	}
-- 
2.39.5


