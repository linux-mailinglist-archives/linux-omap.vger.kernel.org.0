Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE76A246058
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgHQIf4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbgHQIfx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:35:53 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83129C061388;
        Mon, 17 Aug 2020 01:35:53 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u10so7146225plr.7;
        Mon, 17 Aug 2020 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PEGr9s6HGNxR8mzsZcOi/x3TsiaJrj80ASltnmxTvts=;
        b=fgRJUvQ3c3dalXzfHwldW9gKnPepaFA36zwdwrOZRVqh2L6fA7py884ow8ug8OqjqD
         IXYG9u/RrsV/s3xQ+UtY82VEU38rTrg+lft/fF/mpTS54rK52fJcjKB0l0ghXLKb4LCO
         9sPEQaWI0f8zNAJKjS03gBFwlFydMubz7ANuiB7h4WQRIYodmWW+08YmTS71hS2rp8Yn
         x1rwTpfTLlJTc0/0g1OvBEG/3Aj/fMkhVmbWXG6++VzeLX3NB6j0OXsItgc0qt47e86T
         9G75ApMOq/zQD0jYL1rAMJXvsAFKLzTt7c6zwSqIuun1oDe3PY9LC24MvWdX0yidyK9d
         7KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PEGr9s6HGNxR8mzsZcOi/x3TsiaJrj80ASltnmxTvts=;
        b=TvDqkug+VMz3jZfn3vDZsZ492FulXD0J9EL6VWa1P4FP6WmWQYlaTGyTvwQ2ekhDae
         mx4fs4ApEeWcYHkJceLuzdjrmAnmri4lIzPlKSXdzKfmpvXJzplaLpxSGlishY+ovPX9
         5FFNPIWJzr2uYD2s2y+XFc0AVkB9Nf7bL3grbp8oDHk7nptoXuMRoqncTGtd2lnxVnHA
         dFHwI2v/XlHwLxIych0L2EoPQMileNqJI0m2TtHecayz0YkEI0eO+6O6WbMNG/7XblZl
         B2RKrfSuaAUocPsEn7ZByDwG7VHWpdXIAGbDaV2hnxa/Hhu0iakk1dHAoUaw4DlOlrXj
         oFWQ==
X-Gm-Message-State: AOAM532QR0FUc4frhtCOV4iRm06YpDcSf2DJtKGwzOl0A901G58OP6aY
        XXcBPzSUDkLOyvF3Q004EVk=
X-Google-Smtp-Source: ABdhPJxHHjf2l9lVu7pUt2dTiicTOD/n6pAnbvbGFIvNk9geL9SzW87cnZs77W7gkbYWLQTahXgzUQ==
X-Received: by 2002:a17:902:9a09:: with SMTP id v9mr10140335plp.331.1597653351613;
        Mon, 17 Aug 2020 01:35:51 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:35:51 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     ludovic.desroches@microchip.com, ulf.hansson@linaro.org,
        manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl,
        jh80.chung@samsung.com, oakad@yahoo.com,
        yamada.masahiro@socionext.com, brucechang@via.com.tw,
        HaraldWelte@viatech.com
Cc:     keescook@chromium.org, inux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 06/10] mmc: renesas: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:05:04 +0530
Message-Id: <20200817083508.22657-7-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817083508.22657-1-allen.lkml@gmail.com>
References: <20200817083508.22657-1-allen.lkml@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_core.c          |  2 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 20 +++++++++----------
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  9 ++++-----
 4 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 14c64caefc64..79a86bccc0ec 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -48,6 +48,7 @@ struct tmio_mmc_dma {
 };
 
 struct renesas_sdhi {
+	struct platform_device *pdev;
 	struct clk *clk;
 	struct clk *clk_cd;
 	struct tmio_mmc_data mmc_data;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 15e21894bd44..4a9319743eb6 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -975,6 +975,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 			goto eirq;
 	}
 
+	priv->pdev = pdev;
+
 	dev_info(&pdev->dev, "%s base at %pa, max clock rate %u MHz\n",
 		 mmc_hostname(host->mmc), &res->start, host->mmc->f_max / 1000000);
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 32ab991544ef..3d8866581043 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -218,9 +218,9 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
 }
 
-static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
+static void renesas_sdhi_internal_dmac_issue_tasklet_fn(struct tasklet_struct *t)
 {
-	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
+	struct tmio_mmc_host *host = from_tasklet(host, t, dma_issue);
 
 	tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_DATAEND);
 
@@ -255,9 +255,11 @@ static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
 	return true;
 }
 
-static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
+static void renesas_sdhi_internal_dmac_complete_tasklet_fn(struct tasklet_struct *t)
 {
-	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
+	struct renesas_sdhi *priv = from_tasklet(priv, t,
+						 dma_priv.dma_complete);
+	struct tmio_mmc_host *host = platform_get_drvdata(priv->pdev);
 
 	spin_lock_irq(&host->lock);
 	if (!renesas_sdhi_internal_dmac_complete(host))
@@ -289,12 +291,10 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
 	/* Each value is set to non-zero to assume "enabling" each DMA */
 	host->chan_rx = host->chan_tx = (void *)0xdeadbeaf;
 
-	tasklet_init(&priv->dma_priv.dma_complete,
-		     renesas_sdhi_internal_dmac_complete_tasklet_fn,
-		     (unsigned long)host);
-	tasklet_init(&host->dma_issue,
-		     renesas_sdhi_internal_dmac_issue_tasklet_fn,
-		     (unsigned long)host);
+	tasklet_setup(&priv->dma_priv.dma_complete,
+		     renesas_sdhi_internal_dmac_complete_tasklet_fn);
+	tasklet_setup(&host->dma_issue,
+		     renesas_sdhi_internal_dmac_issue_tasklet_fn);
 }
 
 static void
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 13ff023fbee9..cd638e638db6 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -310,9 +310,9 @@ static void renesas_sdhi_sys_dmac_start_dma(struct tmio_mmc_host *host,
 	}
 }
 
-static void renesas_sdhi_sys_dmac_issue_tasklet_fn(unsigned long priv)
+static void renesas_sdhi_sys_dmac_issue_tasklet_fn(struct tasklet_struct *t)
 {
-	struct tmio_mmc_host *host = (struct tmio_mmc_host *)priv;
+	struct tmio_mmc_host *host = from_tasklet(host, t, dma_issue);
 	struct dma_chan *chan = NULL;
 
 	spin_lock_irq(&host->lock);
@@ -399,9 +399,8 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
 			goto ebouncebuf;
 
 		init_completion(&priv->dma_priv.dma_dataend);
-		tasklet_init(&host->dma_issue,
-			     renesas_sdhi_sys_dmac_issue_tasklet_fn,
-			     (unsigned long)host);
+		tasklet_setup(&host->dma_issue,
+			     renesas_sdhi_sys_dmac_issue_tasklet_fn);
 	}
 
 	renesas_sdhi_sys_dmac_enable_dma(host, true);
-- 
2.17.1

