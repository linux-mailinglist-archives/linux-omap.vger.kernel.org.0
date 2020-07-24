Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8725B22BFD2
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgGXHmt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:42:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:36752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgGXHmt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:42:49 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1CDF20768;
        Fri, 24 Jul 2020 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576568;
        bh=T1+HENTJZwZC4mvFiOB0VKpTwI3d/Ish/a/v0tYcd9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ti4wY681h4IQgSVClvqN+HtZ9rKV3ye2e5SYJVH2HSzU7OMxfVUXtuMMaxdGUI2l3
         HAsg8hxeIjptKf8VScrGSzgx9OPvp6raGP5x9dm0ckVWKLl444D+H84mdev/xiOJWZ
         4BcpG422GdCnPFFphmmx69+KsHPW2zEGGS2rvkmE=
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
Subject: [RFT v2 20/29] memory: omap-gpmc: Return meaningful error codes in gpmc_cs_set_timings()
Date:   Fri, 24 Jul 2020 09:40:29 +0200
Message-Id: <20200724074038.5597-21-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The callers of gpmc_cs_set_timings() expect to receive -ERRNO on errors
and they pass further what they have received.

However gpmc_cs_set_timings() was returning -1 (equal to -EPERM) which
does not make sense in this context.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested

Changes since v1:
1. New patch
---
 drivers/memory/omap-gpmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index c158b6cae9a9..1e370142dfca 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -638,7 +638,7 @@ static int set_gpmc_timing_reg(int cs, int reg, int st_bit, int end_bit, int max
 #define GPMC_SET_ONE_CD_MAX(reg, st, end, max, field, cd)  \
 	if (set_gpmc_timing_reg(cs, (reg), (st), (end), (max), \
 	    t->field, (cd), #field) < 0)                       \
-		return -1
+		return -ENXIO
 
 #define GPMC_SET_ONE(reg, st, end, field) \
 	GPMC_SET_ONE_CD_MAX(reg, st, end, 0, field, GPMC_CD_FCLK)
@@ -708,7 +708,7 @@ int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t,
 
 	div = gpmc_calc_divider(t->sync_clk);
 	if (div < 0)
-		return div;
+		return -EINVAL;
 
 	/*
 	 * See if we need to change the divider for waitmonitoringtime.
@@ -733,7 +733,7 @@ int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t,
 			       __func__,
 			       t->wait_monitoring
 			       );
-			return -1;
+			return -ENXIO;
 		}
 	}
 
-- 
2.17.1

