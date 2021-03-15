Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7619033ABF6
	for <lists+linux-omap@lfdr.de>; Mon, 15 Mar 2021 08:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhCOHGN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Mar 2021 03:06:13 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:44538 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229607AbhCOHFq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Mar 2021 03:05:46 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0URunCVN_1615791943;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0URunCVN_1615791943)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 15 Mar 2021 15:05:44 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     tony@atomide.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] ARM: OMAP2+: use true and false for bool variable
Date:   Mon, 15 Mar 2021 15:05:41 +0800
Message-Id: <1615791941-62388-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

fixed the following coccicheck:
./arch/arm/mach-omap2/powerdomain.c:1205:9-10: WARNING: return of 0/1 in
function 'pwrdm_can_ever_lose_context' with return type bool

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/arm/mach-omap2/powerdomain.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap2/powerdomain.c b/arch/arm/mach-omap2/powerdomain.c
index 1cbac76..0a5b87e 100644
--- a/arch/arm/mach-omap2/powerdomain.c
+++ b/arch/arm/mach-omap2/powerdomain.c
@@ -1202,26 +1202,26 @@ bool pwrdm_can_ever_lose_context(struct powerdomain *pwrdm)
 	if (!pwrdm) {
 		pr_debug("powerdomain: %s: invalid powerdomain pointer\n",
 			 __func__);
-		return 1;
+		return true;
 	}
 
 	if (pwrdm->pwrsts & PWRSTS_OFF)
-		return 1;
+		return true;
 
 	if (pwrdm->pwrsts & PWRSTS_RET) {
 		if (pwrdm->pwrsts_logic_ret & PWRSTS_OFF)
-			return 1;
+			return true;
 
 		for (i = 0; i < pwrdm->banks; i++)
 			if (pwrdm->pwrsts_mem_ret[i] & PWRSTS_OFF)
-				return 1;
+				return true;
 	}
 
 	for (i = 0; i < pwrdm->banks; i++)
 		if (pwrdm->pwrsts_mem_on[i] & PWRSTS_OFF)
-			return 1;
+			return true;
 
-	return 0;
+	return false;
 }
 
 /**
-- 
1.8.3.1

