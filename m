Return-Path: <linux-omap+bounces-2418-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C0899D458
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 18:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A6428953B
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 16:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7F81BFDF4;
	Mon, 14 Oct 2024 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="F8EoOoGN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88A1B4F2B;
	Mon, 14 Oct 2024 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728922284; cv=none; b=q1dEfiWpbMZifbWcVb99jnLuI3qmzgGpYR6SKmg7zswncj2VN8SWUiMD2tqnB3RAUcsG3x5lT938qOsB3TtragBmzBp2mcNwzRijODez6/g4A6QU3tS5N3IXvjcXIJ6TlzPT0JCp8SkelTHDHdPL4Hzg6GVn19CBkCA8SViLk4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728922284; c=relaxed/simple;
	bh=UcH6ZwQpDDpiAPLT6qRi38NHMPG4XswrW05ZPPtVgqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WUEpoJaaScgL9hJZDDT1llQ/QkUXVeg80Zpc7Uifm86Qo+RgPdgXIhdesYCNFZoss++5nqx8n7m+sA5rgbG8DfsYS7sTnHnCDeawKhucwiuLr7gbSQ+b+9JQ8DFs4g/2WMhdjm2ku7HurP/KWh2PJdwTXrqScp5f9GWChrCjaqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=F8EoOoGN; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=spHaL3P3DN7KW+wQRhWKlP9ALzDUk/VvDg6u1f0Em0E=; b=F8EoOoGNRfRTrFI9vmuhf7b4U5
	gPwQyC+1OTy/Imq90xVMyWvSxI0URoPPoquLcWotvvyk3YI9PdpqBtnUYAFKPb70eLgfKq3ysUzCm
	dBmCVxFmZUS6ISnTzx6UULHlpQl1Ji8jiucaweNYU0nJgBYKR9KsUQyI+dnUrBobKn1KV6vgd+0eD
	SToYQA/EQCdpndCp0JLFXu08lWxOHQDz/4hqCqToq21fXm2SKSr9RCmq7gXbFZH8PCH5IVfhVc2en
	6RvCf9hzBM1uIv1Po1VFxcFvSvgegNm7H3lKXW+1Dw4o30dO2e/zagoLgkIx/9n0J4jg/ABwQV/G3
	cWWcKT6g==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Lee Jones <lee@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v5 1/3] mfd: twl-core: Add a clock subdevice for the TWL6030
Date: Mon, 14 Oct 2024 18:11:07 +0200
Message-Id: <20241014161109.2222-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241014161109.2222-1-andreas@kemnade.info>
References: <20241014161109.2222-1-andreas@kemnade.info>
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


