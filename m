Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FC221CD61
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jul 2020 04:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgGMCtu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 12 Jul 2020 22:49:50 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:42528 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725892AbgGMCtr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 12 Jul 2020 22:49:47 -0400
Received: from localhost (unknown [159.226.5.99])
        by APP-05 (Coremail) with SMTP id zQCowAAHpwzNygtfHw9aAA--.18071S2;
        Mon, 13 Jul 2020 10:45:33 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Xu Wang <vulab@iscas.ac.cn>
Subject: [PATCH] arm: omap-iommu: fix return value check in _get_pwrdm()
Date:   Mon, 13 Jul 2020 02:45:27 +0000
Message-Id: <20200713024527.17892-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAAHpwzNygtfHw9aAA--.18071S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWxWw1xtrW8Jw1fWF45Wrg_yoW3Xwb_A3
        Z2qwn3Wr18tFs29a4UCw4rGrsxt3WUCrs3WrW8twnxKayDWr13Ar9Yyrsayry7Ww40kFW5
        Ars7Ar4Skw13AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb4xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK
        6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
        JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUk5rcUUU
        UU=
X-Originating-IP: [159.226.5.99]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCAMPA18J9ey8twABsC
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In case of error, function of_clk_get() returns ERR_PTR()
and never returns NULL. The NULL test in the return value
check should be replaced with IS_ERR().

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 arch/arm/mach-omap2/omap-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap-iommu.c b/arch/arm/mach-omap2/omap-iommu.c
index 54aff33e55e6..bfa5e1b8dba7 100644
--- a/arch/arm/mach-omap2/omap-iommu.c
+++ b/arch/arm/mach-omap2/omap-iommu.c
@@ -74,7 +74,7 @@ static struct powerdomain *_get_pwrdm(struct device *dev)
 		return pwrdm;
 
 	clk = of_clk_get(dev->of_node->parent, 0);
-	if (!clk) {
+	if (IS_ERR(clk)) {
 		dev_err(dev, "no fck found\n");
 		return NULL;
 	}
-- 
2.17.1

