Return-Path: <linux-omap+bounces-2372-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48335997FB2
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 10:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78D941C229E8
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 08:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABED1FA25C;
	Thu, 10 Oct 2024 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="zITA+Jb5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0E31C578E;
	Thu, 10 Oct 2024 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546253; cv=none; b=ReOiEz/5W+gdDFjQcW20lwiEyvUc8Qj65YwOC0kPYiKZ3e0oEiEHq4a/ituiGxs/JNom1wJwcR4hJQPQU/ksLYCBLZ4uonYMTOWe7aQ+I6jnV3xmc5fpeVioleEofK/oPPxJi3FfAdnQsJorVdP6ptEainQYO5QFDwCdFCqQuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546253; c=relaxed/simple;
	bh=UcH6ZwQpDDpiAPLT6qRi38NHMPG4XswrW05ZPPtVgqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P0FS+eUBZ53hrd5BHCCk6xTnDRSzbC+KpAS2LyZar1QyvXqkH5PzpKAohk7iiY5+jxSCZWA1wV01AMWm4pd1rtZAOqIRJEgR+kQV4gvG11XJa1hlHadvsvzR3PUo6B+apEIVnDZsauQInmCEgAJLvpKwR5/qPXsbMxEIIj7B17Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=zITA+Jb5; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=spHaL3P3DN7KW+wQRhWKlP9ALzDUk/VvDg6u1f0Em0E=; b=zITA+Jb5ccN8C5m6aLnbqCUFrc
	8FCH0jOmljsG9BXsr8vj51sbWmKjpAto3sTZdMogC/L0EtJP43GlNIC2rYzKfUHZXOd1Kz/y4CUwg
	bIJbJFrXaBjz9whKMtGNyGWeIeFJetfXmrlj5JAip+XiHYy1P97IaPgo9Rdkdl6VxKVHU9VMdqgRp
	9YoSsBElnRHmWnGsrdyIQy9XOM5kbreszbyu3dawlXN336rGLB3G3H67skqLoTO1SAEuAk3jYagfd
	J5qhitHW7D/JxGAWzNRS3O8agaWreYxK6IXxOA2v70xGx9khjqrtbk7NJJfR4Ba2yRRhrdLyzjB9l
	EE78sdFA==;
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
Subject: [PATCH v4 1/3] mfd: twl-core: Add a clock subdevice for the TWL6030
Date: Thu, 10 Oct 2024 09:43:53 +0200
Message-Id: <20241010074355.58161-2-andreas@kemnade.info>
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

Also the TWL6030 has some clocks, so add a subdevice for that.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mfd/twl-core.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index c130ffef182f..f89eda4a17fe 100644
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
@@ -861,17 +865,23 @@ twl_probe(struct i2c_client *client)
 				 TWL4030_DCDC_GLOBAL_CFG);
 	}
 
-	if (id->driver_data == (TWL6030_CLASS | TWL6032_SUBCLASS)) {
-		status = devm_mfd_add_devices(&client->dev,
-					      PLATFORM_DEVID_NONE,
-					      twl6032_cells,
-					      ARRAY_SIZE(twl6032_cells),
-					      NULL, 0, NULL);
+	if (twl_class_is_6030()) {
+		const struct mfd_cell *cells;
+		int num_cells;
+
+		if (id->driver_data & TWL6032_SUBCLASS) {
+			cells = twl6032_cells;
+			num_cells = ARRAY_SIZE(twl6032_cells);
+		} else {
+			cells = twl6030_cells;
+			num_cells = ARRAY_SIZE(twl6030_cells);
+		}
+
+		status = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+					      cells, num_cells, NULL, 0, NULL);
 		if (status < 0)
 			goto free;
-	}
 
-	if (twl_class_is_6030()) {
 		if (of_device_is_system_power_controller(node)) {
 			if (!pm_power_off)
 				pm_power_off = twl6030_power_off;
-- 
2.39.5


