Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A950256329F
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 13:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbiGALfL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 07:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbiGALfK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 07:35:10 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 40207814AB
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=iXYAj
        Cez7FimfKnHDWkF9EsiI2KXgUtvzxPYj8CxWXE=; b=gy57wLjgHSi/QVmtUbOsS
        WLEpX2KsXFif4f1MOCOrLn3r0znTCiZEjuhxa0vRyP9W24jDSU5k9IqIvyGPKfuu
        hVy9iQDfJY8Zi9suorbQS4FdEH0As0ZBEyvrzUfTXcQwrHYXkfEfWx840413vjjH
        uI/UoMoja16mF0GV/Ezxkw=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp1 (Coremail) with SMTP id C8mowABXNibg275itdsZFw--.42148S2;
        Fri, 01 Jul 2022 19:34:56 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, windhl@126.com
Cc:     Miaoqian Lin <linmq006@gmail.com>
Subject: [PATCH v2] arm: omap2: pm33xx-core: Fix missing of_node_put() in amx3_idle_init()
Date:   Fri,  1 Jul 2022 19:34:55 +0800
Message-Id: <20220701113455.233531-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowABXNibg275itdsZFw--.42148S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr18GrW7CFW7tryrJw1UKFg_yoW8Xr4fpr
        Z8Ca9Yk348Ww1UG3ySqFZavrWq93WqkrWFyr98Ca1xtan3Ja4fAryFvrZ8uw4fJFySq3Wr
        Zw10yryDuayDXrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRYYLPUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7R4xF1pEAUXnRAABst
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

Fixes: 06ee7a950b6a ("ARM: OMAP2+: pm33xx-core: Add cpuidle_ops for am335x/am437x")
Co-authored-by: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:
 
 v2: add Co-authored-by Miaoqian Ling and fix tag
 v1: fix missing of_node_put() bug, but with some error with
'format-patch'

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

