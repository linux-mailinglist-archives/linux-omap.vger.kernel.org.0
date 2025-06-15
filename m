Return-Path: <linux-omap+bounces-3882-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9DEADA21E
	for <lists+linux-omap@lfdr.de>; Sun, 15 Jun 2025 16:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98943B1AA5
	for <lists+linux-omap@lfdr.de>; Sun, 15 Jun 2025 14:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A1E18C034;
	Sun, 15 Jun 2025 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="I8WjhMMo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0F2E11CC
	for <linux-omap@vger.kernel.org>; Sun, 15 Jun 2025 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749998626; cv=none; b=R4cLF/oi8aPlCjnYQEPqLuol7ddsGvUw7W7hrCMVE8hsIwua5nEcbCXLegotGZwnWfsonOuIoOrV5fHM6r/GLQN0HKLBxbpdWvrjJy2qTVIyU8NBNgEtD/J+VVI1rmYrfrwvwf6n5pjr+XV92MOrk943Ef+T6OV39mp9nM2lqhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749998626; c=relaxed/simple;
	bh=fN/4D9KNEY1A4dUjx3qSg5ehtlm/LYqYjbPkXvN9BsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4ck2FcVudHlOYnCTmoApaa+URbz888GX32EHpEL4JiGcrwWRhXnf5+bkwAvHOylaHeR5cAIPFGL0xss3TvdZA2SfMm7A7f7YBTo0Cq75Kwmk27WcrsiqcmLIGoECs7GffUwrNV0gvfZHrgXRdT4tpHC7nX8W4uoNFXhi9O2T6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=I8WjhMMo; arc=none smtp.client-ip=80.12.242.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id QoZ6uGCgjmPDOQoZ6uOiyE; Sun, 15 Jun 2025 16:42:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749998554;
	bh=cwWk346lUaBuGbguyfcH5aUN2Z+loYZlD8bqgpSsoXs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=I8WjhMMo583sTRRFc/4P1l2xMIr/Y10NPRRusHVxv7Zf+/2C39kN4N4ukuPbKa8Hq
	 doG1h+6dQmEAaanBvhk9Na0PCHukTPF3wgIQuqGPnP/1+fMdrA5jeCZhyhCI743ENd
	 xG36x74YurvSXHdcwprfSTqQTXqiFk5OrK+k1chmIpWqSDoZOSarUPd8j3KNJIoXcS
	 3bYbPXhOO1xqGFVi2jo2lU27tzenC8UprqAf/blOR85Dltvt4FReJp56cyUxiB50jq
	 oapTEVqoEMoWhj90zD/554NEOt8Ha9oWpgmYqATiImx+tP40AIqzsJZLDcBABsYVZv
	 qSWp0xADG8hVQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 15 Jun 2025 16:42:34 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	Lee Jones <lee@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/3] mfd: tps65219: Remove an unused field from 'struct tps65219'
Date: Sun, 15 Jun 2025 16:42:18 +0200
Message-ID: <1f5e2e582ad97e9863ed5885266ae271f2be32bc.1749998382.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>
References: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3df4c6367520 ("mfd: tps65219: Add support for soft shutdown
via sys-off API"), the 'nb' field from 'struct tps65219' is unused.
Remove it.

Also remove the now useless #include <linux/notifier.h> for the same
reason.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 include/linux/mfd/tps65219.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 3e8d29189267..690002932377 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -10,7 +10,6 @@
 #define MFD_TPS65219_H
 
 #include <linux/bitops.h>
-#include <linux/notifier.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 
@@ -440,7 +439,6 @@ enum tps65219_irqs {
  * @regmap: Regmap for accessing the device registers
  * @chip_id: Chip ID
  * @irq_data: Regmap irq data used for the irq chip
- * @nb: notifier block for the restart handler
  */
 struct tps65219 {
 	struct device *dev;
@@ -448,7 +446,6 @@ struct tps65219 {
 
 	unsigned int chip_id;
 	struct regmap_irq_chip_data *irq_data;
-	struct notifier_block nb;
 };
 
 #endif /* MFD_TPS65219_H */
-- 
2.49.0


