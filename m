Return-Path: <linux-omap+bounces-2235-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA69843BD
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 12:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0496284A6C
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 10:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF51319C544;
	Tue, 24 Sep 2024 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="rov/Wwhq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED319AA53;
	Tue, 24 Sep 2024 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174185; cv=none; b=E+1+K73bO0NujeW37g+h2lW8iPbCjZO1W49/FJePu6qyfD0StC20nidcOxLeAu77+d3fUxzfZKB5bKxc/8djsHmhNkWMk+J8D0ZIQxqsJaPqN+L3kV2HbHSGboZBLIX9g58YjScceYdzpsAj1Cf2vhmsiHMoPcMb9AdbQJ9hP10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174185; c=relaxed/simple;
	bh=vW0P19aA/rIIdX1ImGnej+GSht9aIHupafntyIJlNsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XmAOdUbqWgucJ1yqYgQjElnGPMJOgIH7tBO/olwwuFxcIo8xmKNB41HauKnsi22rpR1fgxXFQYXK1BXTDCg2k23vcXDQoJRT+YjxMocrN5av96x9iWOH6bVHY+fgJ/TsJqm5LePhNLfVbmBfIsRgXGBzYNRBGG+tQyDOYg3YEC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=rov/Wwhq; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=MS82ELjpW2VgTub5lfeSCEOlBHZ2k01XkWgRiHetWnk=; b=rov/Wwhq3jTc5TLiMWGthetR+N
	az8SV3teDNPrWzcuAOJc/3ZkRmOADKOubJvsZ5VZ9y1UDsKTHHdvpF9bv8YXpI9jWxMJ0OwrgaEP7
	LZ+q3EpMOeF5VAjkj608hC9lgA0SxLS4YMFPAhobUHh0L5L0nXOivYooEeD5vOFZfJsGEFOuUG0uf
	rT7rDv6iWuz/73fFDLoM7wzxSA6CDqyJ3UScGzHPyI+ITjcR0ab1DWTYbf4X3XpuJXZweaSuoye56
	0QdcxiItlgnYaEgQ6pmDe1dOhB2zc3Bd5tKJZn7impQnQoADtLMjnZjkU4rs5Ee3CQSIhLYzveU5z
	bbo0R//A==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-clk@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 2/2] clk: twl: add TWL6030 support
Date: Tue, 24 Sep 2024 12:36:09 +0200
Message-Id: <20240924103609.12513-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924103609.12513-1-andreas@kemnade.info>
References: <20240924103609.12513-1-andreas@kemnade.info>
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
 drivers/clk/clk-twl.c | 97 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-twl.c b/drivers/clk/clk-twl.c
index eab9d3c8ed8a..194f11ac5e14 100644
--- a/drivers/clk/clk-twl.c
+++ b/drivers/clk/clk-twl.c
@@ -11,10 +11,22 @@
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
+#define TWL6030_CFG_STATE_MASK		0x03
+#define TWL6030_CFG_STATE_APP_MASK	(0x03 << TWL6030_CFG_STATE_APP_SHIFT)
+#define TWL6030_CFG_STATE_APP(v)	(((v) & TWL6030_CFG_STATE_APP_MASK) >>\
+						TWL6030_CFG_STATE_APP_SHIFT)
+#define P1_GRP BIT(0) /* processor power group */
+#define ALL_GRP (BIT(0) | BIT(1) | BIT(2))
+
+#define DRIVER_DATA_TWL6030 0
+#define DRIVER_DATA_TWL6032 1
 
 struct twl_clock_info {
 	struct device *dev;
@@ -53,6 +65,49 @@ static unsigned long twl_clks_recalc_rate(struct clk_hw *hw,
 	return 32768;
 }
 
+static int twl6030_clks_prepare(struct clk_hw *hw)
+{
+	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
+	int grp;
+
+	grp = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
+	if (grp < 0)
+		return grp;
+
+	return twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+			    grp << TWL6030_CFG_STATE_GRP_SHIFT |
+			    TWL6030_CFG_STATE_ON);
+}
+
+static void twl6030_clks_unprepare(struct clk_hw *hw)
+{
+	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
+
+	twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+		     ALL_GRP << TWL6030_CFG_STATE_GRP_SHIFT |
+		     TWL6030_CFG_STATE_OFF);
+}
+
+static int twl6030_clks_is_prepared(struct clk_hw *hw)
+{
+	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
+	int val;
+
+	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
+	if (val < 0)
+		return val;
+
+	if (!(val & P1_GRP))
+		return 0;
+
+	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE);
+	if (val < 0)
+		return val;
+
+	val = TWL6030_CFG_STATE_APP(val);
+	return val == TWL6030_CFG_STATE_ON;
+}
+
 static int twl6032_clks_prepare(struct clk_hw *hw)
 {
 	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
@@ -93,6 +148,13 @@ static int twl6032_clks_is_prepared(struct clk_hw *hw)
 	return val == TWL6030_CFG_STATE_ON;
 }
 
+static const struct clk_ops twl6030_clks_ops = {
+	.prepare	= twl6030_clks_prepare,
+	.unprepare	= twl6030_clks_unprepare,
+	.is_prepared	= twl6030_clks_is_prepared,
+	.recalc_rate	= twl_clks_recalc_rate,
+};
+
 static const struct clk_ops twl6032_clks_ops = {
 	.prepare	= twl6032_clks_prepare,
 	.unprepare	= twl6032_clks_unprepare,
@@ -105,6 +167,28 @@ struct twl_clks_data {
 	u8 base;
 };
 
+static const struct twl_clks_data twl6030_clks[] = {
+	{
+		.init = {
+			.name = "clk32kg",
+			.ops = &twl6030_clks_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+		.base = 0x8C,
+	},
+	{
+		.init = {
+			.name = "clk32kaudio",
+			.ops = &twl6030_clks_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+		.base = 0x8F,
+	},
+	{
+		/* sentinel */
+	}
+};
+
 static const struct twl_clks_data twl6032_clks[] = {
 	{
 		.init = {
@@ -127,6 +211,11 @@ static const struct twl_clks_data twl6032_clks[] = {
 	}
 };
 
+static const struct twl_clks_data *const twl_clks[] = {
+	[DRIVER_DATA_TWL6030] = twl6030_clks,
+	[DRIVER_DATA_TWL6032] = twl6032_clks,
+};
+
 static int twl_clks_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -137,7 +226,7 @@ static int twl_clks_probe(struct platform_device *pdev)
 	int i;
 	int count;
 
-	hw_data = twl6032_clks;
+	hw_data = twl_clks[platform_get_device_id(pdev)->driver_data];
 	for (count = 0; hw_data[count].init.name; count++)
 		;
 
@@ -176,7 +265,11 @@ static int twl_clks_probe(struct platform_device *pdev)
 
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


