Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACDD5BE694
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 15:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiITNBR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 09:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiITNBP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 09:01:15 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376184056A
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 06:01:14 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MX1lx4xBYzmVdl;
        Tue, 20 Sep 2022 20:57:17 +0800 (CST)
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
Subject: [PATCH 2/3] ARM: OMAP2+: clock: Remove orphan declarations from arch/arm/mach-omap2/clock.h
Date:   Tue, 20 Sep 2022 21:01:09 +0800
Message-ID: <20220920130110.1104272-3-cuigaosheng1@huawei.com>
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

clkops_omap2_dflt and clkops_omap2_dflt_wait have
been removed since commit f9ae32a74f02 ("ARM: OMAP2+: clock:
Cleanup !CONFIG_COMMON_CLK parts"), so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-omap2/clock.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-omap2/clock.h b/arch/arm/mach-omap2/clock.h
index bbe4b32891bb..46c4e35e568f 100644
--- a/arch/arm/mach-omap2/clock.h
+++ b/arch/arm/mach-omap2/clock.h
@@ -65,9 +65,6 @@ extern struct ti_clk_ll_ops omap_clk_ll_ops;
 
 extern u16 cpu_mask;
 
-extern const struct clkops clkops_omap2_dflt_wait;
-extern const struct clkops clkops_omap2_dflt;
-
 extern struct clk_functions omap2_clk_functions;
 
 int __init omap2_clk_setup_ll_ops(void);
-- 
2.25.1

