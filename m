Return-Path: <linux-omap+bounces-2236-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E119843C0
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 12:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5966B22CA8
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 10:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0054719B59D;
	Tue, 24 Sep 2024 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="hv/RTq5m"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4D319B3DA;
	Tue, 24 Sep 2024 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174185; cv=none; b=EzMh3ZU67ajzatUb+pA9ceGeK/LWL+9QhZXr90e5aeLvpPuR8ePC7kLjB1RE9sHcBrVGtKrQ3SQ+uFWZiI0cajnBZpziNwTftR2y6BAdSW/61Y9dV8iPehPcRqsbs+2om1t+7CZqcD9Luh/ff2TnwJQwxa9ZI4WWBd1t9FggIqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174185; c=relaxed/simple;
	bh=1BN+w4icsJqnSoeyr3f4t8JijwHW52VeRpA3xYQUpW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GLJdOg8L1yAZAE2FgYETR/80Bws20xDt405BbWuO6CMgpuGiPuFByrFujOtew+kFeXR3ed5S7kriEYrG7W3wEbta0KkwZGys3EqIdtyPhaQTtz71kr27KDr6udS/Dhnqs7BPEGo9r8Gb6ZwPr4RW26xS2zPh5aIeFIqk8RvSB2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=hv/RTq5m; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vZXYny9/seDB8PSOeqkyiTWjYP0lrEzG+TN6Gq6usMc=; b=hv/RTq5mGd7izDMnSrsR0PrNXb
	cbbqXnGe5N8Myzm62FXsHyC1wsXnD+AXjvVI+vcT8PXDfVXgxpzYo7DkjU4J74UkurhOPUsVQoJ2z
	jmbOHK6AtTsRzlzZ2aWAjkx9IFy67ePeLNM2wakpo1dM4tr7EPEY4Ntsdi35TkuMrg3e+SXe9rRZy
	LTKFeRHbZMsCkKkb822k0lqRAcXGPrcOAg5BJm2bHfRs0HxhZxQ91NXpsG5C2I0T3eeENa4H5pQOl
	GOiTcRP2g9PmuwLjg8Raj6WwvRlXacR9cew0vFdEz3CbjYH8Ks0ay+9Q4QumhwN9SJObyT3SEHeC9
	tQRp4Iag==;
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
Subject: [PATCH 1/2] mfd: twl-core: Add a clock subdevice for the TWL6030
Date: Tue, 24 Sep 2024 12:36:08 +0200
Message-Id: <20240924103609.12513-2-andreas@kemnade.info>
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

Also the TWL6030 has some clocks, so add a subdevice for that.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
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


