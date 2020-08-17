Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2395F24605C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgHQIgH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728033AbgHQIgC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:36:02 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4557C061388;
        Mon, 17 Aug 2020 01:36:01 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id l60so7464961pjb.3;
        Mon, 17 Aug 2020 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j1L+zCWhXn/joke0t0DEH3dC8tZXKifv8sB6Zyw25w8=;
        b=DhF6t+2YP62P4iucghZREd6z6ii87qeNjWHRLa58Jly/lbHh+MMjkxFsuXMKCdVKde
         kkL81Q/PjVnVxhRvGnr1pvI6akB26SaQsHG6Ocnaxgwn7vQhln4IJulE+Wg0ydo/JF2u
         rN0GW9sq70mmhZTq76lKYkveUQcW2GAQ/anH/cMJQRrs1tcybAyNp42almY/4uh9qMTh
         m0ECMMuhXMSDd+WhuP3ivVXLJGxVOiPeJeH7s6d6wlbzSL5XsTVxfeucrbrhR2trt0SA
         BvCYDOR/jscEP/NpGfw3GcyasWS8W6zkCLzDlAA9Cm+CtxDsdq+P6lqZ//Dngkveu/6R
         hg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j1L+zCWhXn/joke0t0DEH3dC8tZXKifv8sB6Zyw25w8=;
        b=p1Dlzuw/qC4cRDkA1JsvSNzo18z8HsNRxAXLdHmxXg4XmibGNavzLy4Z0TB2Puw8kl
         ylsMpU7YBeSObSQEyDT9lkFK9wQvhOKHGAIx2dbK7Uxdu5ScvM05pcBYFEdPnKQNgF+V
         uR8GtdT54K4H6HnZm4I473/iwTdNumaqspMzktuvP0mIAT2NqFJBvHLu3fUugR457f9m
         vQmWKFh/t1ZoQ6mAI2bfiAVA0FvBhYENljyhaP9X9BOoF33NkUt4eQKlRy8M8zxCQciN
         IsbQaeMH07ufW+5asg8PEdbjkaY3MK6Tk/JO2c6Lcs6M3e0bxpqQzDY9sNQU+Vb7o0iY
         giOA==
X-Gm-Message-State: AOAM532kFaqem2PHy4CnICV3v1yiTpQS6jqbnACig8Yogl61+8ZFd42W
        qVavMBepQ6z+5fYUN0vwdBs=
X-Google-Smtp-Source: ABdhPJyc0TiP72f7uRdnYv6rQAyV9Lbfk3OCsMGXPxXNPAnOT6Q+GGj6oLVMmyApEYWY9WFadWlkig==
X-Received: by 2002:a17:902:d90e:: with SMTP id c14mr10225733plz.37.1597653361223;
        Mon, 17 Aug 2020 01:36:01 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:36:00 -0700 (PDT)
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
Subject: [PATCH 08/10] mmc: tifm_sd: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:05:06 +0530
Message-Id: <20200817083508.22657-9-allen.lkml@gmail.com>
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
 drivers/mmc/host/tifm_sd.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
index 5987656e0474..c64cf12b117a 100644
--- a/drivers/mmc/host/tifm_sd.c
+++ b/drivers/mmc/host/tifm_sd.c
@@ -731,9 +731,9 @@ static void tifm_sd_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	mmc_request_done(mmc, mrq);
 }
 
-static void tifm_sd_end_cmd(unsigned long data)
+static void tifm_sd_end_cmd(struct tasklet_struct *t)
 {
-	struct tifm_sd *host = (struct tifm_sd*)data;
+	struct tifm_sd *host = from_tasklet(host, t, finish_tasklet);
 	struct tifm_dev *sock = host->dev;
 	struct mmc_host *mmc = tifm_get_drvdata(sock);
 	struct mmc_request *mrq;
@@ -968,8 +968,7 @@ static int tifm_sd_probe(struct tifm_dev *sock)
 	 */
 	mmc->max_busy_timeout = TIFM_MMCSD_REQ_TIMEOUT_MS;
 
-	tasklet_init(&host->finish_tasklet, tifm_sd_end_cmd,
-		     (unsigned long)host);
+	tasklet_setup(&host->finish_tasklet, tifm_sd_end_cmd);
 	timer_setup(&host->timer, tifm_sd_abort, 0);
 
 	mmc->ops = &tifm_sd_ops;
-- 
2.17.1

