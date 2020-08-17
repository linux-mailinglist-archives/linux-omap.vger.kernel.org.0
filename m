Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD4724605D
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgHQIgI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgHQIgG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:36:06 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F482C061388;
        Mon, 17 Aug 2020 01:36:06 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id r11so7861482pfl.11;
        Mon, 17 Aug 2020 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=USxZmhIvAjMlSK/u/36V0VU77WjN451bESJJHVsL8wA=;
        b=qv7mQq3HvH/j9rO0ouzEgyfVi87JqUW2V4QAEydvCAbx2LQUKNcMXXgzySavPZqUj1
         Ins64ROl4iTDAUvGdBA8KNLD+qJ/t3xoKL2bXmmDz5j5zNWkxsTNK2mzPi4cq8w4HysR
         qB91AJnJHOV6Dde1l3Zb4nVFb6yI5mMdYAxNbA6LQHMd/EO4U9zXKzCy7hR1yeo82Iqd
         /DBuYxjqUcNRlAfliC/SW47TbY/h4Ti/9Wzv2s7Zhfx+kFOkNFOjjKq6qZneTjwh/B/+
         f1SWPbJG/98XE5yYyQRkSbXpN+KiMeDSwutkcFl9MLsZkE2xUQIj+HBAOxNRzYkv3mKd
         rdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=USxZmhIvAjMlSK/u/36V0VU77WjN451bESJJHVsL8wA=;
        b=Ejstgtz9CPBhnoiNZI4Ik3/UghXlNudedLnfgxc9eYd7WcGaYT86h21uEA6o3waA5h
         J5RCWyV9OkU9oxv/Y+JveXsE2XtEOld7M2Hx8H5LzNNlc1V0pqXcbHOrh/21iaJGn9my
         lTU5ESfqqiQbA3NnUgRXicMbIgt+XnqcFy7hh3ziWcAfrKBBCu2eZXxrG9pF7MmMzj+Q
         1S8EmifpbstpUZ3cIQrl/AFqXw2Ivnkd3l3zGc3PJ5cUGvc3+GTNDg52ZLI49NGnIxLi
         ySaNpmuIzPoqqfPOlp9wKzlSx3F8yfzv48jV1g1Inv7fj1azrzA9UG/50ywtbLxyGwj1
         Lbmg==
X-Gm-Message-State: AOAM530yJhpTV/6wUtb9Rx20e0tXtv20ey1doOms7+8KnUWphHyIou2f
        d39ldV5zoOCAuQAEU3uH8Qw=
X-Google-Smtp-Source: ABdhPJx2KGwGED3Yc15krTxgUP+AmeFkGxZajP9xEdKcSOvV/rUk8mcmkjNLqknBvXOL5Fwv0WnNrQ==
X-Received: by 2002:a63:6e4f:: with SMTP id j76mr8967691pgc.449.1597653365932;
        Mon, 17 Aug 2020 01:36:05 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:36:05 -0700 (PDT)
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
Subject: [PATCH 09/10] mmc: uniphier: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:05:07 +0530
Message-Id: <20200817083508.22657-10-allen.lkml@gmail.com>
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
 drivers/mmc/host/uniphier-sd.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index f82baf99fd69..c822bb7beaca 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -81,9 +81,9 @@ static void uniphier_sd_dma_endisable(struct tmio_mmc_host *host, int enable)
 }
 
 /* external DMA engine */
-static void uniphier_sd_external_dma_issue(unsigned long arg)
+static void uniphier_sd_external_dma_issue(struct tasklet_struct *t)
 {
-	struct tmio_mmc_host *host = (void *)arg;
+	struct tmio_mmc_host *host = from_tasklet(host, t, dma_issue);
 	struct uniphier_sd_priv *priv = uniphier_sd_priv(host);
 
 	uniphier_sd_dma_endisable(host, 1);
@@ -190,8 +190,7 @@ static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
 	host->chan_rx = chan;
 	host->chan_tx = chan;
 
-	tasklet_init(&host->dma_issue, uniphier_sd_external_dma_issue,
-		     (unsigned long)host);
+	tasklet_setup(&host->dma_issue, uniphier_sd_external_dma_issue);
 }
 
 static void uniphier_sd_external_dma_release(struct tmio_mmc_host *host)
@@ -228,9 +227,9 @@ static const struct tmio_mmc_dma_ops uniphier_sd_external_dma_ops = {
 	.dataend = uniphier_sd_external_dma_dataend,
 };
 
-static void uniphier_sd_internal_dma_issue(unsigned long arg)
+static void uniphier_sd_internal_dma_issue(struct tasklet_struct *t)
 {
-	struct tmio_mmc_host *host = (void *)arg;
+	struct tmio_mmc_host *host = from_tasklet(host, t, dma_issue);
 	unsigned long flags;
 
 	spin_lock_irqsave(&host->lock, flags);
@@ -309,8 +308,7 @@ static void uniphier_sd_internal_dma_request(struct tmio_mmc_host *host,
 
 	host->chan_tx = (void *)0xdeadbeaf;
 
-	tasklet_init(&host->dma_issue, uniphier_sd_internal_dma_issue,
-		     (unsigned long)host);
+	tasklet_setup(&host->dma_issue, uniphier_sd_internal_dma_issue);
 }
 
 static void uniphier_sd_internal_dma_release(struct tmio_mmc_host *host)
-- 
2.17.1

