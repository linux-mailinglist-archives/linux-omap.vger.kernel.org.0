Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B525E22BFDA
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgGXHm7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:42:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:36998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgGXHm6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:42:58 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2EB720768;
        Fri, 24 Jul 2020 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576577;
        bh=GJgQRG3YQ8ioaOa9xxhYIJQBikr3KReGS0guhEEKk+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BdIk/H8GUSHjr/HovDw6Pq4dLSFg6A0UTNKZtpqe4RMs2ZkyJgMwNp3flKxbbFHJn
         GQhvMmI39tdeLKtURHZ8kGVOF1mBvnEz19Kbxj5tOJ0wsaJdnzYyr23x9SnFtJcy4t
         MEftBJI/4aILINjqDmn4f51iLHrAbseDrqVlJKmQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 22/29] memory: omap-gpmc: Fix whitespace issue
Date:   Fri, 24 Jul 2020 09:40:31 +0200
Message-Id: <20200724074038.5597-23-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix minor whitespace and comment issues.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Adjust entire comment, as suggested by Arnd.
---
 drivers/memory/omap-gpmc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 2a2d0297e071..2675ea4e37fe 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1005,7 +1005,7 @@ static int gpmc_cs_remap(int cs, u32 base)
 	 * Make sure we ignore any device offsets from the GPMC partition
 	 * allocated for the chip select and that the new base confirms
 	 * to the GPMC 16MB minimum granularity.
-	 */ 
+	 */
 	base &= ~(SZ_16M - 1);
 
 	gpmc_cs_get_memconf(cs, &old_base, &size);
@@ -1800,10 +1800,11 @@ static int gpmc_calc_common_timings(struct gpmc_timings *gpmc_t,
 	return 0;
 }
 
-/* TODO: remove this function once all peripherals are confirmed to
+/*
+ * TODO: remove this function once all peripherals are confirmed to
  * work with generic timing. Simultaneously gpmc_cs_set_timings()
  * has to be modified to handle timings in ps instead of ns
-*/
+ */
 static void gpmc_convert_ps_to_ns(struct gpmc_timings *t)
 {
 	t->cs_on /= 1000;
-- 
2.17.1

