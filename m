Return-Path: <linux-omap+bounces-4214-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B157B24E99
	for <lists+linux-omap@lfdr.de>; Wed, 13 Aug 2025 18:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6A97684C31
	for <lists+linux-omap@lfdr.de>; Wed, 13 Aug 2025 15:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E96270559;
	Wed, 13 Aug 2025 15:50:21 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EFC27A917;
	Wed, 13 Aug 2025 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100221; cv=none; b=Eg4YSNrHhC/Gf+QeYjAd573rd05yJCHJawbU7PDta/FAvn5A9ukzBsNq5W199eZF0zm/PtYJEb/11AKzSW14NnM/Y+OfLRsdGUuOBYNb9g2McgH8u76X8zo5j60SudvjGf+Pq8SZd3ATo6qSAvXdtiFDvEC7ew6hjFUUDO0nqUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100221; c=relaxed/simple;
	bh=INO0e+95m814MiMb9A8+q4AgvnEWYksO78DocadJanc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmvgjcrYlUk2jW3QNnbcpXeW2NCg658hWs/fhiDt3qg2f2KSV0Ijnt+/vwKo3y63vQh4lFtiJwIwawpeMWrlcA5l3NFvdWXdGVwlM1bmh2RzCPEPl7dZKn4TmmLizLa1Vq9h2ofeRwG4l78fOupxDlAqQarnjjbAzVpzd/nLrQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C136C4CEEB;
	Wed, 13 Aug 2025 15:50:18 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dominik Brodowski <linux@dominikbrodowski.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 resend] pcmcia: omap_cf: Mark driver struct with __refdata to prevent section mismatch
Date: Wed, 13 Aug 2025 17:50:14 +0200
Message-ID: <4937807c9d70644fae705459f36574bd24846d31.1755099931.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via platform_driver_probe().  Make this explicit
to prevent the following section mismatch warning

    WARNING: modpost: drivers/pcmcia/omap_cf: section mismatch in reference: omap_cf_driver+0x4 (section: .data) -> omap_cf_remove (section: .exit.text)

that triggers on an omap1_defconfig + CONFIG_OMAP_CF=m build.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
v2:
  - Add Acked-by.
---
 drivers/pcmcia/omap_cf.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index 1b1dff56ec7b11f3..733777367c3b4505 100644
--- a/drivers/pcmcia/omap_cf.c
+++ b/drivers/pcmcia/omap_cf.c
@@ -302,7 +302,13 @@ static void __exit omap_cf_remove(struct platform_device *pdev)
 	kfree(cf);
 }
 
-static struct platform_driver omap_cf_driver = {
+/*
+ * omap_cf_remove() lives in .exit.text. For drivers registered via
+ * platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver omap_cf_driver __refdata = {
 	.driver = {
 		.name	= driver_name,
 	},
-- 
2.43.0


