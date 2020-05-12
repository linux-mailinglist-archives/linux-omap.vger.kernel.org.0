Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A1C1CF607
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 15:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729519AbgELNne (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 09:43:34 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:28277 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729570AbgELNnd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 May 2020 09:43:33 -0400
Received: from localhost.localdomain ([93.22.148.175])
        by mwinf5d15 with ME
        id dpjT2200B3nHaxZ03pjT5r; Tue, 12 May 2020 15:43:31 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 12 May 2020 15:43:31 +0200
X-ME-IP: 93.22.148.175
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     peter.ujfalusi@ti.com, jarkko.nikula@bitmer.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-omap@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ASoC: ti: omap-mcbsp: Fix an error handling path in 'asoc_mcbsp_probe()'
Date:   Tue, 12 May 2020 15:43:25 +0200
Message-Id: <20200512134325.252073-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If an error occurs after the call to 'omap_mcbsp_init()', the reference to
'mcbsp->fclk' must be decremented, as already done in the remove function.

This can be achieved easily by using the devm_ variant of 'clk_get()'
when the reference is taken in 'omap_mcbsp_init()'

This fixes the leak in the probe and has the side effect to simplify both
the error handling path of 'omap_mcbsp_init()' and the remove function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I've not been able to identify the when the issue has been introduced, so
no Fixes: tag.
---
 sound/soc/ti/omap-mcbsp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 0348963f4df7..6c83b9888467 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -686,7 +686,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 	mcbsp->dma_data[1].addr = omap_mcbsp_dma_reg_params(mcbsp,
 						SNDRV_PCM_STREAM_CAPTURE);
 
-	mcbsp->fclk = clk_get(&pdev->dev, "fck");
+	mcbsp->fclk = devm_clk_get(&pdev->dev, "fck");
 	if (IS_ERR(mcbsp->fclk)) {
 		ret = PTR_ERR(mcbsp->fclk);
 		dev_err(mcbsp->dev, "unable to get fck: %d\n", ret);
@@ -711,7 +711,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 		if (ret) {
 			dev_err(mcbsp->dev,
 				"Unable to create additional controls\n");
-			goto err_thres;
+			return ret;
 		}
 	}
 
@@ -724,8 +724,6 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 err_st:
 	if (mcbsp->pdata->buffer_size)
 		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
-err_thres:
-	clk_put(mcbsp->fclk);
 	return ret;
 }
 
@@ -1442,8 +1440,6 @@ static int asoc_mcbsp_remove(struct platform_device *pdev)
 
 	omap_mcbsp_st_cleanup(pdev);
 
-	clk_put(mcbsp->fclk);
-
 	return 0;
 }
 
-- 
2.25.1

