Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1591230B602
	for <lists+linux-omap@lfdr.de>; Tue,  2 Feb 2021 04:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbhBBDo0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Feb 2021 22:44:26 -0500
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:53557 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229819AbhBBDoZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 Feb 2021 22:44:25 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UNeCW-d_1612237412;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UNeCW-d_1612237412)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 02 Feb 2021 11:43:40 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     khilman@kernel.org
Cc:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] arm: omap2: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Tue,  2 Feb 2021 11:43:31 +0800
Message-Id: <1612237411-115179-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following coccicheck warning:

./arch/arm/mach-omap2/pm-debug.c:171:0-23: WARNING: pwrdm_suspend_fops
should be defined with DEFINE_DEBUGFS_ATTRIBUTE.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/arm/mach-omap2/pm-debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/pm-debug.c b/arch/arm/mach-omap2/pm-debug.c
index 919d35d..b43eab9 100644
--- a/arch/arm/mach-omap2/pm-debug.c
+++ b/arch/arm/mach-omap2/pm-debug.c
@@ -168,8 +168,8 @@ static int pwrdm_suspend_set(void *data, u64 val)
 	return -EINVAL;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(pwrdm_suspend_fops, pwrdm_suspend_get,
-			pwrdm_suspend_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(pwrdm_suspend_fops, pwrdm_suspend_get,
+			  pwrdm_suspend_set, "%llu\n");
 
 static int __init pwrdms_setup(struct powerdomain *pwrdm, void *dir)
 {
-- 
1.8.3.1

