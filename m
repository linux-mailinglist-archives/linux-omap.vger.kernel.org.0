Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C264F0101
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 13:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236766AbiDBLW1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 07:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbiDBLW1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 07:22:27 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF4AE38B9;
        Sat,  2 Apr 2022 04:20:35 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h11so7013262ljb.2;
        Sat, 02 Apr 2022 04:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LE1C7bPCwmocX2Jk7j/NquH+3JTypXuxOj7TXI5vU9I=;
        b=hcgPcH2+ExDAf6mzTPE0R+5UTzK9Ngusd5sxGG2Bbt6pkx/MoPiHOpDa8a0Cbbfuws
         HwGRGN34pZAJtLlC16xfEWzxObj0ueJzO1bpGkgyK75oyMP4LXcQ6/2Un/f1Fisp65z8
         Gu6465n+JClVI9pctXy05qkORCYDPfVKDe9CiP7R5BDWE/Qxzd6udl5U8yDDr7VkSKLH
         2fhLxoPViEpHUjHeS/Rl3Xgpv8uJu6ANl8UGelhNyHxqx/Z6SUCObsdFcrXcFb9aJrwW
         sqlad+0C23mzrVWFZy8Seo5ocMbgfD8RaFod9UjFe84XD2jb6E7x0hnR1FyUAWoJxWGg
         K9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LE1C7bPCwmocX2Jk7j/NquH+3JTypXuxOj7TXI5vU9I=;
        b=l5G42t+tAExKY7MswNax8qy1Cs6HPZ9ZuX9Lr0LG4miBWnaGbQPC8WGS+f8Im+nJiQ
         Fxq3DQXMLoZ3CrHXWJ7cbDoEDR1FzmGd3vRDWU/3CHETf7xFqC+mquEMLINs1wbjwQNq
         i2PS51RHkcmRULFq94aMH1EJIySFMjA+MBNdJ2zkCGcrH2AGRd4baTATE/iPN9uwhM1g
         tD3y/7H2lRraoUZ2tkIt4nvUoBxscxnFgplCEZSXUG0fc09uUxWFeBO8d5KIAESNRzJ5
         ++Jokl7rBVbGPdfBzuhvULZQAKtiOJBuE2N9mEmKRW7GTnWcJQoH/MArdQTGepOkfB+k
         N0vA==
X-Gm-Message-State: AOAM5319olYCNYFtPtjlxFQGgwJiWq/IKh2HMChlrxnc/HXklx30h8E4
        +Wd4XUPFhBiMBUFLrHZTBf8=
X-Google-Smtp-Source: ABdhPJzjv/Bd+QpRRB8+f99TNDmbOYlgxDziRmFHK3purSARf9lY+p0iR0poAfoFC3PRTKszaL1rbA==
X-Received: by 2002:a2e:a554:0:b0:249:8dd1:9da9 with SMTP id e20-20020a2ea554000000b002498dd19da9mr15927494ljn.341.1648898433918;
        Sat, 02 Apr 2022 04:20:33 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id v1-20020a2e7a01000000b0024ac272d727sm435352ljc.79.2022.04.02.04.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:20:33 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>, linux-mmc@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] mmc: omap: Make it CCF clk API compatible
Date:   Sat,  2 Apr 2022 13:20:04 +0200
Message-Id: <20220402112004.129886-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver, OMAP specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mmc/host/omap.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 5e5af34090f1..57d39283924d 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1374,7 +1374,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
 	host->iclk = clk_get(&pdev->dev, "ick");
 	if (IS_ERR(host->iclk))
 		return PTR_ERR(host->iclk);
-	clk_enable(host->iclk);
+	clk_prepare_enable(host->iclk);
 
 	host->fclk = clk_get(&pdev->dev, "fck");
 	if (IS_ERR(host->fclk)) {
@@ -1382,16 +1382,18 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		goto err_free_iclk;
 	}
 
+	ret = clk_prepare(host->fclk);
+	if (ret)
+		goto err_put_fclk;
+
 	host->dma_tx_burst = -1;
 	host->dma_rx_burst = -1;
 
 	host->dma_tx = dma_request_chan(&pdev->dev, "tx");
 	if (IS_ERR(host->dma_tx)) {
 		ret = PTR_ERR(host->dma_tx);
-		if (ret == -EPROBE_DEFER) {
-			clk_put(host->fclk);
-			goto err_free_iclk;
-		}
+		if (ret == -EPROBE_DEFER)
+			goto err_free_fclk;
 
 		host->dma_tx = NULL;
 		dev_warn(host->dev, "TX DMA channel request failed\n");
@@ -1403,8 +1405,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		if (ret == -EPROBE_DEFER) {
 			if (host->dma_tx)
 				dma_release_channel(host->dma_tx);
-			clk_put(host->fclk);
-			goto err_free_iclk;
+			goto err_free_fclk;
 		}
 
 		host->dma_rx = NULL;
@@ -1454,9 +1455,12 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		dma_release_channel(host->dma_tx);
 	if (host->dma_rx)
 		dma_release_channel(host->dma_rx);
+err_free_fclk:
+	clk_unprepare(host->fclk);
+err_put_fclk:
 	clk_put(host->fclk);
 err_free_iclk:
-	clk_disable(host->iclk);
+	clk_disable_unprepare(host->iclk);
 	clk_put(host->iclk);
 	return ret;
 }
@@ -1476,8 +1480,9 @@ static int mmc_omap_remove(struct platform_device *pdev)
 
 	mmc_omap_fclk_enable(host, 0);
 	free_irq(host->irq, host);
+	clk_unprepare(host->fclk);
 	clk_put(host->fclk);
-	clk_disable(host->iclk);
+	clk_disable_unprepare(host->iclk);
 	clk_put(host->iclk);
 
 	if (host->dma_tx)
-- 
2.35.1

