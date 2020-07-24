Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE3922BFB4
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgGXHmJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:42:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727784AbgGXHmJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:42:09 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 719C22078A;
        Fri, 24 Jul 2020 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576529;
        bh=kEeIY8BXwH4Tiy+sCCMu4cX9Ql2lsKEB0G7hN7yh/jc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gGqvmiMIMc+BWLuSynac+DnMFSxTasZbTQyOR/ROP8MfQJD3HkyMr2NUgz/zPaquT
         LGr49gWEFmtHr/1Y4bVbuBbA44SjLuFaqz5lYpIJPwwB7N/X+AUy9MehCggdEAINF5
         SrCWge1DBaZ8RXeQgHREc9kpwMvP9joGbpqnQGjM=
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
Subject: [PATCH v2 12/29] memory: emif: Put constant in comparison on the right side
Date:   Fri, 24 Jul 2020 09:40:21 +0200
Message-Id: <20200724074038.5597-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes checkpatch warning:

    WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/emif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 58a82eea5850..97bad1588bba 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -282,7 +282,7 @@ static void set_lpmode(struct emif_data *emif, u8 lpmode)
 	 * the EMIF_PWR_MGMT_CTRL[10:8] REG_LP_MODE bit field to 0x4.
 	 */
 	if ((emif->plat_data->ip_rev == EMIF_4D) &&
-	    (EMIF_LP_MODE_PWR_DN == lpmode)) {
+	    (lpmode == EMIF_LP_MODE_PWR_DN)) {
 		WARN_ONCE(1,
 			  "REG_LP_MODE = LP_MODE_PWR_DN(4) is prohibited by"
 			  "erratum i743 switch to LP_MODE_SELF_REFRESH(2)\n");
-- 
2.17.1

