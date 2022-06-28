Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D5E55CB0B
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345496AbiF1L3y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 07:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345543AbiF1L3u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 07:29:50 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 268272D1F7
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=sSwjf
        /u59Ji9jEKfnFKnDWT6FE6J3jz3UEfePhmc0mk=; b=f6VLGaUaLLZvXxo2g7G+F
        Xd1+k59GhlfsH6S60YVDHi3CW0oSreGmYV8N4Kv5X9FzKyEE4b0UJnBCU9FLpC4q
        EEsDv40l8YAH9WLYBUG+tQVJUYK0/lkYPBkzw4XHGNAFB1qtJCj4fRwPlebQ+FDu
        2ffzPGR5YYG/0On3H9tUWY=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowAAn9fAj5rpiJexpEA--.47441S2;
        Tue, 28 Jun 2022 19:29:40 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux-omap@vger.kernel.org, windhl@126.com
Subject: [PATCH v3] arm: mach-omap2: omap4-common: Fix refcount leak bug
Date:   Tue, 28 Jun 2022 19:29:39 +0800
Message-Id: <20220628112939.160737-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAAn9fAj5rpiJexpEA--.47441S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyfGr18WFyxAryfuF4DJwb_yoWfXFXEq3
        Z3X39xGr4ftFsag3yDCa15Wr4Dtw15Wr43J3s3Xr15Ka1UJr43GrWqv3s7try7Z3yfKrW3
        ZwsrAr4FkwnIyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRWbyuDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AUuF1pED0ey0wAAsX
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In omap4_sram_init(), of_find_compatible_node() will return a node
pointer with refcount incremented. We should use of_node_put() when
it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v3: change the order of of_node_put() based on tony's advice
 v2: merge similar bugs in omap2 into one commit
 v1: fix missing of_node_put() bugs


 arch/arm/mach-omap2/omap4-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/omap4-common.c b/arch/arm/mach-omap2/omap4-common.c
index 6d1eb4eefefe..d9ed2a5dcd5e 100644
--- a/arch/arm/mach-omap2/omap4-common.c
+++ b/arch/arm/mach-omap2/omap4-common.c
@@ -140,6 +140,7 @@ static int __init omap4_sram_init(void)
 			__func__);
 	else
 		sram_sync = (void __iomem *)gen_pool_alloc(sram_pool, PAGE_SIZE);
+	of_node_put(np);
 
 	return 0;
 }
-- 
2.25.1

