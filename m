Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15282B2B3A
	for <lists+linux-omap@lfdr.de>; Sat, 14 Nov 2020 05:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgKNEHQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Nov 2020 23:07:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:36378 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726116AbgKNEHP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Nov 2020 23:07:15 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxatHiV69fzR8OAA--.30292S2;
        Sat, 14 Nov 2020 12:06:59 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm: Fix memleak in omap2xxx_clkt_vps_init
Date:   Sat, 14 Nov 2020 12:06:58 +0800
Message-Id: <1605326818-13823-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxatHiV69fzR8OAA--.30292S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw18Cr1DJF4xAF4UCw4Uurg_yoW3urgEqr
        97ta4DGr93Ka1Y9wn0kr43GrW2vwn0kws3Xa9xJFs0k3WjqFnxX3y0yr92yF17GayF9FW3
        Ja4UCF13uwnakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
        80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gryl42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jcyCJUUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If the clk_register fails, we should free hw before function returns to
prevent memleak.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
index 2a3e722..70892b3 100644
--- a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
+++ b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
@@ -244,6 +244,12 @@ void omap2xxx_clkt_vps_init(void)
 	hw->hw.init = &init;
 
 	clk = clk_register(NULL, &hw->hw);
+	if (IS_ERR(clk)) {
+		printk(KERN_ERR "Failed to register clock\n");
+		kfree(hw);
+		return;
+	}
+
 	clkdev_create(clk, "cpufreq_ck", NULL);
 	return;
 cleanup:
-- 
2.1.0

