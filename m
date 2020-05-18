Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C341B1D6F7A
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 05:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgERD6Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 May 2020 23:58:16 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:59494 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726675AbgERD6P (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 17 May 2020 23:58:15 -0400
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 May 2020 23:54:18 EDT
Received: from localhost.localdomain (unknown [159.226.5.100])
        by APP-03 (Coremail) with SMTP id rQCowABnSCE0BcJeMpsbAg--.55868S3;
        Mon, 18 May 2020 11:47:01 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     t-kristo@ti.com, mturquette@baylibre.com, sboyd@kernel.org,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] clk/ti/adpll: Add a NULL check for devm_kasprintf()
Date:   Mon, 18 May 2020 03:46:58 +0000
Message-Id: <1589773618-3658-1-git-send-email-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: rQCowABnSCE0BcJeMpsbAg--.55868S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYn7k0a2IF6FyUM7kC6x804xWl14x267AK
        xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
        A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj
        6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
        4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY
        62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7V
        C2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkI
        ecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
        Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
        xUxjjgDUUUU
X-Originating-IP: [159.226.5.100]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCwETA1z4jSkDjQABsV
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

devm_kasprintf() may fail, so we should better add a NULL check
and propagate an error on failure.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/clk/ti/adpll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
index bb2f283..f18a672 100644
--- a/drivers/clk/ti/adpll.c
+++ b/drivers/clk/ti/adpll.c
@@ -196,6 +196,8 @@ static const char *ti_adpll_clk_get_name(struct ti_adpll_data *d,
 	} else {
 		name = devm_kasprintf(d->dev, GFP_KERNEL, "%08lx.adpll.%s",
 				      d->pa, postfix);
+		if (!name)
+			return -ENOMEM;
 	}
 
 	return name;
-- 
2.7.4

