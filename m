Return-Path: <linux-omap+bounces-3266-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C92A28B3E
	for <lists+linux-omap@lfdr.de>; Wed,  5 Feb 2025 14:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64103A717E
	for <lists+linux-omap@lfdr.de>; Wed,  5 Feb 2025 13:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AAB524B0;
	Wed,  5 Feb 2025 13:10:59 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696710A3E
	for <linux-omap@vger.kernel.org>; Wed,  5 Feb 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738761058; cv=none; b=g9dVBI2icvVUZ0FUw8/+9bINiP3POD+SJnt7C+DHowru6UQ3AdH0f0dLaQA8aB+kO+zPniniimkJ6EuynZdUZBVlAQg+d8JxrTKROIWVrRrM9/B9dU+V6ohb7KvjUpDqA8jKVrTPYiJmkRWD2gELIK24CKodekVwpD8UxBFX4kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738761058; c=relaxed/simple;
	bh=UW4vifzm9dK7PfgtyUA+yHCYk90qPhir9yw0Dk0X//Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iaHObILxCe4KgdItOXfJk49HEyV56Brh4aP4JuKyxHNGMLH4eSc5lShwvy61bx6CqTVRMILxhglgAERuyipdkqbAbbzmMNENndW92hgBbXE7DPKkwV2hCSG1gKWccgxMEtvmoQNsOMvWHU//zKFBpuevujRv5sLDKSPfzFjAJEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by albert.telenet-ops.be with cmsmtp
	id 9pAn2E0063f221S06pAnbB; Wed, 05 Feb 2025 14:10:47 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tffAp-0000000Fva6-0B9f;
	Wed, 05 Feb 2025 14:10:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tffB1-00000006Q4S-0QzP;
	Wed, 05 Feb 2025 14:10:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dominik Brodowski <linux@dominikbrodowski.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pcmcia: omap_cf: Mark driver struct with __refdata to prevent section mismatch
Date: Wed,  5 Feb 2025 14:10:44 +0100
Message-ID: <06d57da75b583822a541b2eb9f28b172b3487183.1738760740.git.geert+renesas@glider.be>
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
index f0ccf479f36e5223..9bb80b47f0c453fb 100644
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


