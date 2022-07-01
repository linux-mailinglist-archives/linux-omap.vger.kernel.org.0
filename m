Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B76B56328E
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 13:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234586AbiGAL2q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 07:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbiGAL2o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 07:28:44 -0400
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8998B13DEF
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 04:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HK0Ux
        GmbKcMBQFG6B2BMlrbdPZBNhKOypZTXeCTRJho=; b=gw0JN7l815K03g0p2koyb
        c+eUXP9sl9DIr11ol7BlUK2SiR+vfeabhaDhSpmCntvIJEudNmyyf5CtbXnIPI1I
        3uHNOj9cw21Mzt6lgu8BEhDt1sbcMyo62kQLUW3dgg72uDFKbn25IssjMgy05Ilp
        syF8PvsyKrq751TmwdiBvA=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp9 (Coremail) with SMTP id NeRpCgAHJtD62b5ibZSuFw--.17397S3;
        Fri, 01 Jul 2022 19:26:53 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, windhl@126.com
Subject: [PATCH 2/3] arm: omap2: pm33xx-core: Fix missing of_node_put() in amx3_idle_init()
Date:   Fri,  1 Jul 2022 19:26:48 +0800
Message-Id: <20220701112649.233322-2-windhl@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701112649.233322-1-windhl@126.com>
References: <20220701112649.233322-1-windhl@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgAHJtD62b5ibZSuFw--.17397S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry7Cr4rCw4UZFyxKFWDtwb_yoWktrc_Ww
        1I9397Jr4rtw10gFZ8uan5WwnYywn7GrZrXryIkF4qkayjvFW7X39xW34xKFWUWFWYkrW3
        trs7Xw129w15tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRAHUDDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3B0xF1pED1yKCAAAso
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

To keep refcount balance, we need to call of_node_put() for the
reference 'state_node' returned by of_parse_phandle() in fail
path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/arm/mach-omap2/pm33xx-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
index bf0d25fd2cea..58b98a17746c 100644
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -393,12 +393,15 @@ static int __init amx3_idle_init(struct device_node *cpu_node, int cpu)
 		if (!state_node)
 			break;
 
-		if (!of_device_is_available(state_node))
+		if (!of_device_is_available(state_node)) {
+			of_node_put(state_node);
 			continue;
+		}
 
 		if (i == CPUIDLE_STATE_MAX) {
 			pr_warn("%s: cpuidle states reached max possible\n",
 				__func__);
+			of_node_put(state_node);
 			break;
 		}
 
@@ -408,6 +411,7 @@ static int __init amx3_idle_init(struct device_node *cpu_node, int cpu)
 			states[state_count].wfi_flags |= WFI_FLAG_WAKE_M3 |
 							 WFI_FLAG_FLUSH_CACHE;
 
+		of_node_put(state_node);
 		state_count++;
 	}
 
-- 
2.25.1

