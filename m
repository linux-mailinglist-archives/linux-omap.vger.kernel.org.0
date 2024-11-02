Return-Path: <linux-omap+bounces-2560-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6159B9E57
	for <lists+linux-omap@lfdr.de>; Sat,  2 Nov 2024 10:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2631C20BA0
	for <lists+linux-omap@lfdr.de>; Sat,  2 Nov 2024 09:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A84B170822;
	Sat,  2 Nov 2024 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="c8YjrpZm"
X-Original-To: linux-omap@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-215.smtpout.orange.fr [193.252.23.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABF516F858;
	Sat,  2 Nov 2024 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730540215; cv=none; b=I7Hqx0QFW05f8FpGDh8tEKbDJsFIJ+uguQelOh+Usenvjw3wmaYOZlHoP3v+xHX3W2guPbOX86n3+iz/uwsPV/5VWxPYBtUUaZhcvGa2JKrT1Y4r0Db2rSaV209OstYQjAPNgPgDM68iv4/ybHQxVgGhgcoV+ZDeFprnEAITIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730540215; c=relaxed/simple;
	bh=pD9cojqUe+KJn35bihc4SauN478RJaUcb4L87yKECgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2+bynv+zj4au7FtRbKCBAKX/bcuWNZpBrMym+PkRKaitptq+oHFHwUyYKeYS3nCRWrUESB6wamDK9DO51OHFsAgowCtgglHDY2QSTIXpoyQXu4ek6hNyMNxvihkNFq2NhaBuy5V24DVTlsjVScLcjnpTZ5JbXVONFaB2E/e02M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=c8YjrpZm; arc=none smtp.client-ip=193.252.23.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 7AQMtOujKH3SU7AQMtmj7y; Sat, 02 Nov 2024 10:28:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730539684;
	bh=rRLq5/V3PO4gXtH6o+mulzRrZWABZdF58Y31jxMMc3U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=c8YjrpZmsvFwBnjpwxrFAdK7mea3CIj0+tWGaxX0Vg+oIh4RU5q7Cjn/7OuTP1MVy
	 3e4BJ4uuxxtV6pQgXorppHZ8imyXiQZRhgH8yFKH436BRBM5y4WrQkReeqGEOk6Aab
	 2g1hHEawaAZBWTuNmAy4Li+9Pe2KZsT/7gTXD2VtKllM6pxSIuocblVarY7BrRy4LQ
	 k453TwuhuiRZllLCXz80bZfXpwNU51OR+mIq7MwxHEA1P19Km2vPlUIxePV132FH6y
	 rgT+KJHkaLCazdwlPsizGrA8E8a9M9MzRD37Wm42oG/cEk+63ly8KIW71ZyRJYCMV7
	 4LD0iV2UEry+g==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Nov 2024 10:28:04 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: Fix a typo
Date: Sat,  2 Nov 2024 10:27:51 +0100
Message-ID: <ec20fd5c347bf74963532e95282f850d209d84d5.1730539664.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 'a' is missing in "powerdomin".
Add it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm/mach-omap2/powerdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/powerdomain.c b/arch/arm/mach-omap2/powerdomain.c
index 2441d96b7144..a4785302b7ae 100644
--- a/arch/arm/mach-omap2/powerdomain.c
+++ b/arch/arm/mach-omap2/powerdomain.c
@@ -523,7 +523,7 @@ int pwrdm_get_mem_bank_count(struct powerdomain *pwrdm)
  * Set the powerdomain @pwrdm's next power state to @pwrst.  The powerdomain
  * may not enter this state immediately if the preconditions for this state
  * have not been satisfied.  Returns -EINVAL if the powerdomain pointer is
- * null or if the power state is invalid for the powerdomin, or returns 0
+ * null or if the power state is invalid for the powerdomain, or returns 0
  * upon success.
  */
 int pwrdm_set_next_pwrst(struct powerdomain *pwrdm, u8 pwrst)
-- 
2.47.0


