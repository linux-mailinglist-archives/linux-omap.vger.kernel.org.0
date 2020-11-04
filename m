Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01E02A5E39
	for <lists+linux-omap@lfdr.de>; Wed,  4 Nov 2020 07:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgKDGpb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Nov 2020 01:45:31 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:56952 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725926AbgKDGpb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Nov 2020 01:45:31 -0500
Received: from localhost.localdomain (unknown [124.16.141.241])
        by APP-05 (Coremail) with SMTP id zQCowACXh1DzTaJfb3v7AA--.33898S2;
        Wed, 04 Nov 2020 14:45:08 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: Remove redundant null check before clk_prepare_enable/clk_disable_unprepare
Date:   Wed,  4 Nov 2020 06:45:05 +0000
Message-Id: <20201104064505.5737-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowACXh1DzTaJfb3v7AA--.33898S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy8CFyfJFyxWr4xXr4UXFb_yoWkGrXEva
        n7Kw4kWr4rAwnav3yUKF4Dur4qgw4kAry7W3s2yF15KFy3uanFyrZ2yan3AF4xXa9FkrW7
        Aw10yr1fArsavjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2AYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F4j6r
        4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r47MxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bYBTrUUUUU=
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQYKA102Zr6PwwAAs5
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Because clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter, so the additional checks are unnecessary, just
remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 arch/arm/mach-omap2/display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/display.c b/arch/arm/mach-omap2/display.c
index 2000fca6bd4e..6daaa645ae5d 100644
--- a/arch/arm/mach-omap2/display.c
+++ b/arch/arm/mach-omap2/display.c
@@ -385,8 +385,7 @@ int omap_dss_reset(struct omap_hwmod *oh)
 	}
 
 	for (i = oh->opt_clks_cnt, oc = oh->opt_clks; i > 0; i--, oc++)
-		if (oc->_clk)
-			clk_prepare_enable(oc->_clk);
+		clk_prepare_enable(oc->_clk);
 
 	dispc_disable_outputs();
 
@@ -412,8 +411,7 @@ int omap_dss_reset(struct omap_hwmod *oh)
 		pr_debug("dss_core: softreset done\n");
 
 	for (i = oh->opt_clks_cnt, oc = oh->opt_clks; i > 0; i--, oc++)
-		if (oc->_clk)
-			clk_disable_unprepare(oc->_clk);
+		clk_disable_unprepare(oc->_clk);
 
 	r = (c == MAX_MODULE_SOFTRESET_WAIT) ? -ETIMEDOUT : 0;
 
-- 
2.17.1

