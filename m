Return-Path: <linux-omap+bounces-2323-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24759916DD
	for <lists+linux-omap@lfdr.de>; Sat,  5 Oct 2024 14:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FE881C212FB
	for <lists+linux-omap@lfdr.de>; Sat,  5 Oct 2024 12:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BF015278E;
	Sat,  5 Oct 2024 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="pst2N2Gi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9852F88;
	Sat,  5 Oct 2024 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728132445; cv=none; b=lhbG3A3FnrjJlWqGpDRkMWV2K7j/OCIs8NaGe5pPDaXfosvFWxULf544x94rO6MU0zo2t0hocuM5utS8m2eMOVOr+41RheNmXSBL//opajcV5vIO6J1EMC8NXy36DuIZszanUDjHbRUA+JDDjPPDnknUZeagThOX3d9mKkoC8bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728132445; c=relaxed/simple;
	bh=w6NUHNgk5fQy3ZvEAcTfcWJZZNi43o1KIpFRTO+yMN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DXd2c5N7DF6hyv92kx+Rs56vcO8ybmwHSF2h0HoVvRyhfA4ElrJA4klZSnfpvkusve28tJc6XGlTBd+BxtVn063H/opQv0QgsbEdJ2ibwDXRCLX3S8vBj7yNpLZ/JZuchsz9A3eo6WfolR/+jrG0lroQ98+oKTOdGj2seokNmz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=pst2N2Gi; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gvgKHqill5h7LNCZgWlTthTr5OPqrMhJylEvVsoYuv8=; b=pst2N2GifES2vgewrkfGsirNmu
	MuAr4Ym1dCiOk/fcHZI4YYEiGeXCRcVRqiBr1R3jS79NvvulWDQpAKDfBkKTGhSrVxJKuM2xAJDGj
	K/4pcvLCVMmlBNsQ+Z4evjd1qv/nGt2IU83V918k8f/wQOBXws9r4eN4OB9XfyA5BV9Aqa3mNSC8T
	e+R/q3zZorS1QMjaGbhoJwIOKQoynjRthnutEBmDomYpT2TRckj3eaOkW2uqM73pWGcoDyr3EcFLb
	oeIRsgXy85v83qwhG6J5vncX9l0Ztca9xMHbcyOZVH7b9KV53UMkQBkBJDN4+mQUn2jb4dYZNwtqf
	g3W0ghKA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Lee Jones <lee@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 1/3] mfd: twl-core: Add a clock subdevice for the TWL6030
Date: Sat,  5 Oct 2024 14:47:04 +0200
Message-Id: <20241005124706.601393-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241005124706.601393-1-andreas@kemnade.info>
References: <20241005124706.601393-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also the TWL6030 has some clocks, so add a subdevice for that.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mfd/twl-core.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index c130ffef182f..c981922f62d5 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -711,6 +711,10 @@ static struct of_dev_auxdata twl_auxdata_lookup[] = {
 	{ /* sentinel */ },
 };
 
+static const struct mfd_cell twl6030_cells[] = {
+	{ .name = "twl6030-clk" },
+};
+
 static const struct mfd_cell twl6032_cells[] = {
 	{ .name = "twl6032-clk" },
 };
@@ -861,17 +865,25 @@ twl_probe(struct i2c_client *client)
 				 TWL4030_DCDC_GLOBAL_CFG);
 	}
 
-	if (id->driver_data == (TWL6030_CLASS | TWL6032_SUBCLASS)) {
-		status = devm_mfd_add_devices(&client->dev,
-					      PLATFORM_DEVID_NONE,
-					      twl6032_cells,
-					      ARRAY_SIZE(twl6032_cells),
-					      NULL, 0, NULL);
-		if (status < 0)
-			goto free;
-	}
-
 	if (twl_class_is_6030()) {
+		if (id->driver_data & TWL6032_SUBCLASS) {
+			status = devm_mfd_add_devices(&client->dev,
+						      PLATFORM_DEVID_NONE,
+						      twl6032_cells,
+						      ARRAY_SIZE(twl6032_cells),
+						      NULL, 0, NULL);
+			if (status < 0)
+				goto free;
+		} else {
+			status = devm_mfd_add_devices(&client->dev,
+						      PLATFORM_DEVID_NONE,
+						      twl6030_cells,
+						      ARRAY_SIZE(twl6030_cells),
+						      NULL, 0, NULL);
+			if (status < 0)
+				goto free;
+		}
+
 		if (of_device_is_system_power_controller(node)) {
 			if (!pm_power_off)
 				pm_power_off = twl6030_power_off;
-- 
2.39.5


