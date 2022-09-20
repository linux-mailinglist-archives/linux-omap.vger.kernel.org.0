Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00CF45BE692
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 15:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiITNBQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 09:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiITNBP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 09:01:15 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22CA3A14F
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 06:01:13 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MX1ny6q1nzHp9W;
        Tue, 20 Sep 2022 20:59:02 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 21:01:11 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <paul@pwsan.com>, <tony@atomide.com>, <linux@armlinux.org.uk>,
        <khilman@kernel.org>, <daniel@zonque.org>,
        <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
        <cuigaosheng1@huawei.com>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/3] ARM: OMAP2+: Remove orphan declarations from arch/arm/mach-omap2/pm.h
Date:   Tue, 20 Sep 2022 21:01:08 +0800
Message-ID: <20220920130110.1104272-2-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920130110.1104272-1-cuigaosheng1@huawei.com>
References: <20220920130110.1104272-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

omap24xx_idle_loop_suspend() and omap24xx_idle_loop_suspend_sz have
been removed since commit 088e8806c411 ("ARM: OMAP2xxx: PM: enter
WFI via inline asm if CORE stays active"), so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-omap2/pm.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-omap2/pm.h b/arch/arm/mach-omap2/pm.h
index 80e84ae66aee..e7af528653a2 100644
--- a/arch/arm/mach-omap2/pm.h
+++ b/arch/arm/mach-omap2/pm.h
@@ -58,9 +58,6 @@ extern void pm_dbg_update_time(struct powerdomain *pwrdm, int prev);
 #endif /* CONFIG_PM_DEBUG */
 
 /* 24xx */
-extern void omap24xx_idle_loop_suspend(void);
-extern unsigned int omap24xx_idle_loop_suspend_sz;
-
 extern void omap24xx_cpu_suspend(u32 dll_ctrl, void __iomem *sdrc_dlla_ctrl,
 					void __iomem *sdrc_power);
 extern unsigned int omap24xx_cpu_suspend_sz;
-- 
2.25.1

