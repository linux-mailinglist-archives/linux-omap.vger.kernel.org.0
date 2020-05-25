Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF241E096F
	for <lists+linux-omap@lfdr.de>; Mon, 25 May 2020 10:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388669AbgEYI7M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 May 2020 04:59:12 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:52128 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388437AbgEYI7L (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 25 May 2020 04:59:11 -0400
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app4 (Coremail) with SMTP id cS_KCgB3EATJiMteScwEAA--.13210S4;
        Mon, 25 May 2020 16:58:52 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] ASoC: ti: Fix runtime PM imbalance in omap2_mcbsp_set_clks_src
Date:   Mon, 25 May 2020 16:58:48 +0800
Message-Id: <20200525085848.4227-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgB3EATJiMteScwEAA--.13210S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4UCw4UCF45tryfWFWkXrb_yoWDXFXE9a
        1Durn8Zr9Fyr42k3yjya909a4SvFWDCr1DGrZ2qr47tFWUCr1rKF1rAFnxur43W3y8uryU
        JwnY9F9xAFyjkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb-xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280
        aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
        x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15
        McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
        1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAF
        wVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4I
        kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
        WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
        0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWr
        Jr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
        4UJbIYCTnIWIevJa73UjIFyTuYvjfUOnmRUUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgEJBlZdtORShQA4s4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When clk_set_parent() returns an error code, a pairing
runtime PM usage counter increment is needed to keep the
counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Fix this in a cleaner way.
---
 sound/soc/ti/omap-mcbsp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 3d41ca2238d4..d7406cc3c2a5 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -77,18 +77,15 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
 	pm_runtime_put_sync(mcbsp->dev);
 
 	r = clk_set_parent(mcbsp->fclk, fck_src);
-	if (r) {
+	if (r)
 		dev_err(mcbsp->dev, "CLKS: could not clk_set_parent() to %s\n",
 			src);
-		clk_put(fck_src);
-		return r;
-	}
 
 	pm_runtime_get_sync(mcbsp->dev);
 
 	clk_put(fck_src);
 
-	return 0;
+	return r;
 }
 
 static irqreturn_t omap_mcbsp_irq_handler(int irq, void *data)
-- 
2.17.1

