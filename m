Return-Path: <linux-omap+bounces-2292-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79498D1FA
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 13:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E8711F22446
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 11:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBB21EC01F;
	Wed,  2 Oct 2024 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qUNOTZxA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834A1940AA;
	Wed,  2 Oct 2024 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727867258; cv=none; b=hjXgHsZOTy7h7XCPEJm8wXCLYMtqXE5i0SbwASSbpTWG6Ar0H1GvUzopRy6Ul/3fF8UsmTihTJL22JiMsjqc0EXCCJMqJe9N3nY8l70wqma48K06WSppBAA6nR1YsGy4rihirRgycjy17CnOCqKOQ/l3lYLh2/YUtWI5DozAUrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727867258; c=relaxed/simple;
	bh=w6NUHNgk5fQy3ZvEAcTfcWJZZNi43o1KIpFRTO+yMN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LtHllCgLDCRAi2ucUdD1llr5yH1WfDZ361kFa4sIVNGEIyquBKRqg+k7VtpvjthKDqjBTIl7JItLizjlM3p1c2qVaCoVpp9oLYzQr3mahVxJh3KpI+QowCWVGpLDbDN55o6DFeIPriOr1TAoW7c4AKqIzQdCaYLCYIq8uYOokvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qUNOTZxA; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gvgKHqill5h7LNCZgWlTthTr5OPqrMhJylEvVsoYuv8=; b=qUNOTZxAlaT1aNDiDa0FFJZt0d
	S+Wzt10YiS94ztjaoL7QAU2sfSTtxhxRklhhW8RNYsCresPnsFrdSA1kTCK4p/Ti4K+cKxA9iDhQ0
	ukPU3xd42JfmVFSQ7/L9r3I0Wb41+/CDZ6AVOk619Eu6G5QiGkDAYTfPKBRs3xSQYVpjC1eX7RTek
	RwYvgU5FsCYkDJ8IpFnOkHf5FKfADxipVE478g8wmhdBwIiUOHAVQaIyz11XCemATPxJWc2IQ0BsD
	tTnOZkAaDSHhRmwMIx1L/M4pLyRBUad2pSEnb6YP57dgrNzwwLJSXUzMdsYSrfTYXxr2eii8rk869
	pWeoEYcQ==;
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
Subject: [PATCH v2 1/3] mfd: twl-core: Add a clock subdevice for the TWL6030
Date: Wed,  2 Oct 2024 13:07:16 +0200
Message-Id: <20241002110718.528337-2-andreas@kemnade.info>
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


