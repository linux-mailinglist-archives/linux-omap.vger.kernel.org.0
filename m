Return-Path: <linux-omap+bounces-2374-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC7997FB9
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 10:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E92801F28AD3
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 08:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5721FAC32;
	Thu, 10 Oct 2024 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="G+IhLX+n"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96CC1BCA11;
	Thu, 10 Oct 2024 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546254; cv=none; b=mTn1hdvaV8woI0niR45KE13nx9fh7vL4FhLu0Bc2i7SMGgo+iwt0NhuWnDF3G+NObKu686/F8foZVvWQUYWkfPcpm/OzzteteCneeg59+lndN5o/MCB2ykgbaFGTcTXbvR23PJ04UTgvQw/CLKPRv2lakN1DT50wGFvjNOT8hIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546254; c=relaxed/simple;
	bh=x5FhYGi0PCWOfztI/IQyaGgm3sDuZ7lLD3ZhEv6wc7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NfCvG/4dzrtAuiBOkc5BKfPi6ZzhKg5oLAuN93N2f7d7OgNPL9Ui/UqrLWV5T+hwDKMFtW69Yg5Vk9JqF2Bq1ImUCFDL9Ej8Y1cg6UD4bXH9Xf+sBoR4EjdI0IFFiYrUHFkbLA2JjtdeSEkUN0+S5HX1JaQSXXAQAl0PH/10tZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=G+IhLX+n; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7tN5cZxpEROorCLkrxgCiTuqn2sXTFFrUxuWOjArPwI=; b=G+IhLX+n58SIUp70ZTrLN+BR9y
	voqN52PrXemM1U5GHmQBCO6+PlcrBLOZgsJbZyLLK2LJzQSHyX/Ny6pOasFVaBq0fwI6J9SFwuHFn
	pQA1WFyAnPShXCL85IKrUQQRw+S9sLfHAv02Yh2nXl54tkrZiS4ElsqLLSFfhdvPeaTFAVcDnU5NP
	b/4X+vIHOIDwPNOQkQEEooxnpv54FY0uhMY/Nv/JC86Um/kexlJSEaICWh0Hb7bcHrvzfsCGo6lz+
	61mCe/yX8Q8SqScIPiSt5muyH8edQsmnKJoByK3xEWpBkicVvs6dmR9ARkfsmkHelxZnVQNPewa8n
	1wX7oAOg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	linux-clk@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 3/3] clk: twl: add TWL6030 support
Date: Thu, 10 Oct 2024 09:43:55 +0200
Message-Id: <20241010074355.58161-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010074355.58161-1-andreas@kemnade.info>
References: <20241010074355.58161-1-andreas@kemnade.info>
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
 drivers/clk/clk-twl.c | 52 +++++++++++++++++++++++++++++++++++--------
 2 files changed, 44 insertions(+), 10 deletions(-)

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
index 1d684b358401..c04bcb61e260 100644
--- a/drivers/clk/clk-twl.c
+++ b/drivers/clk/clk-twl.c
@@ -11,13 +11,29 @@
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
+enum twl_type {
+	TWL_TYPE_6030,
+	TWL_TYPE_6032,
+};
 
 struct twl_clock_info {
 	struct device *dev;
+	enum twl_type type;
 	u8 base;
 	struct clk_hw hw;
 };
@@ -56,14 +72,21 @@ static unsigned long twl_clks_recalc_rate(struct clk_hw *hw,
 static int twl6032_clks_prepare(struct clk_hw *hw)
 {
 	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
-	int ret;
 
-	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
-			   TWL6030_CFG_STATE_ON);
-	if (ret < 0)
-		dev_err(cinfo->dev, "clk prepare failed\n");
+	if (cinfo->type == TWL_TYPE_6030) {
+		int grp;
+
+		grp = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
+		if (grp < 0)
+			return grp;
 
-	return ret;
+		return twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+				    grp << TWL6030_CFG_STATE_GRP_SHIFT |
+				    TWL6030_CFG_STATE_ON);
+	}
+
+	return twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+			    TWL6030_CFG_STATE_ON);
 }
 
 static void twl6032_clks_unprepare(struct clk_hw *hw)
@@ -71,8 +94,14 @@ static void twl6032_clks_unprepare(struct clk_hw *hw)
 	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
 	int ret;
 
-	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
-			   TWL6030_CFG_STATE_OFF);
+	if (cinfo->type == TWL_TYPE_6032)
+		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+				   ALL_GRP << TWL6030_CFG_STATE_GRP_SHIFT |
+				   TWL6030_CFG_STATE_OFF);
+	else
+		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+				   TWL6030_CFG_STATE_OFF);
+
 	if (ret < 0)
 		dev_err(cinfo->dev, "clk unprepare failed\n");
 }
@@ -138,6 +167,7 @@ static int twl_clks_probe(struct platform_device *pdev)
 	for (i = 0; i < count; i++) {
 		cinfo[i].base = hw_data[i].base;
 		cinfo[i].dev = &pdev->dev;
+		cinfo[i].type = platform_get_device_id(pdev)->driver_data;
 		cinfo[i].hw.init = &hw_data[i].init;
 		ret = devm_clk_hw_register(&pdev->dev, &cinfo[i].hw);
 		if (ret) {
@@ -159,7 +189,11 @@ static int twl_clks_probe(struct platform_device *pdev)
 
 static const struct platform_device_id twl_clks_id[] = {
 	{
+		.name = "twl6030-clk",
+		.driver_data = TWL_TYPE_6030,
+	}, {
 		.name = "twl6032-clk",
+		.driver_data = TWL_TYPE_6032,
 	}, {
 		/* sentinel */
 	}
-- 
2.39.5


