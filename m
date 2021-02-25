Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5E7324C48
	for <lists+linux-omap@lfdr.de>; Thu, 25 Feb 2021 09:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhBYIzk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Feb 2021 03:55:40 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:51532 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230091AbhBYIzf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Feb 2021 03:55:35 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UPX1XWK_1614243292;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPX1XWK_1614243292)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Feb 2021 16:54:52 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     bcousson@baylibre.com
Cc:     paul@pwsan.com, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] ARM: OMAP2+: add missing call to of_node_put()
Date:   Thu, 25 Feb 2021 16:54:50 +0800
Message-Id: <1614243290-47105-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In one of the error paths of the for_each_child_of_node() loop,
add missing call to of_node_put().

Fix the following coccicheck warning:
./arch/arm/mach-omap2/omap_hwmod.c:2132:1-23: WARNING: Function
"for_each_child_of_node" should have of_node_put() before return around
line 2140.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 2310cd5..007e91e 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -2137,6 +2137,7 @@ static int of_dev_hwmod_lookup(struct device_node *np,
 		if (res == 0) {
 			*found = fc;
 			*index = i;
+			of_node_put(np0);
 			return 0;
 		}
 	}
-- 
1.8.3.1

