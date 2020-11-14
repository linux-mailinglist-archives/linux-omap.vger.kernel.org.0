Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54AE2B2B3C
	for <lists+linux-omap@lfdr.de>; Sat, 14 Nov 2020 05:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgKNEH3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Nov 2020 23:07:29 -0500
Received: from mail.loongson.cn ([114.242.206.163]:36428 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726116AbgKNEH3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Nov 2020 23:07:29 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9L4V69f1h8OAA--.34910S2;
        Sat, 14 Nov 2020 12:07:20 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm: Fix kfree NULL pointer in omap2xxx_clkt_vps_init
Date:   Sat, 14 Nov 2020 12:07:20 +0800
Message-Id: <1605326840-13896-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx_9L4V69f1h8OAA--.34910S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW5WFWkGw15tw17JF4xJFb_yoWfurc_Xa
        s3tw1DGrySka1Ykw1Fkr43GrW2v390k3Z3XFW3JF4akF1YgrnrZ3y8ArZFqr47GayF9FWf
        W34UJF15Zwn2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7kYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
        80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gryl42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
        vE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
        6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxPEfUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The returns pointer is NULL when kzalloc fails to apply for space, so fix
kfree NULL pointer.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
index 70892b3..edf046b 100644
--- a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
+++ b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
@@ -235,7 +235,7 @@ void omap2xxx_clkt_vps_init(void)
 
 	hw = kzalloc(sizeof(*hw), GFP_KERNEL);
 	if (!hw)
-		goto cleanup;
+		return;
 	init.name = "virt_prcm_set";
 	init.ops = &virt_prcm_set_ops;
 	init.parent_names = &parent_name;
@@ -251,8 +251,5 @@ void omap2xxx_clkt_vps_init(void)
 	}
 
 	clkdev_create(clk, "cpufreq_ck", NULL);
-	return;
-cleanup:
-	kfree(hw);
 }
 #endif
-- 
2.1.0

