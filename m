Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CCE24605A
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgHQIgA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgHQIf5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:35:57 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB52AC061388;
        Mon, 17 Aug 2020 01:35:56 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g33so7777748pgb.4;
        Mon, 17 Aug 2020 01:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EXTHOugKC7WcTyd29mBOhii65zA6nCGdQ46/CEABzfM=;
        b=KK+MLFHF8XZ4V5//pKO3B2MUptSmZ02kxeqix4cEQdwGDIuupQTYk4MV2iUy63dRvk
         BRSyDhvWiQGN6DuDg/ZYhEupr/fy2P3wtMUHvR59AlXgERg6L1lPSDVVO58NFnwmjbrl
         KAVdPjl9EuuJoJMQ+hAT4wDt0s0o+HR7exIsYHWhRjFmRFFLZG2K2LBav92cprDbBGT0
         JgKpG9S+Ps7xbQkMiAtRdPEl/mDRz0VQEvbwXUczyHmEePAFzLNkmAYOJ98mOI9A3PyI
         hKnQFrOsyCZM9nPFivZH8PHJAZHLTlS+xnqhKIXWpTLuknIzNgYVjez3mqoovQd2vHW0
         X0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EXTHOugKC7WcTyd29mBOhii65zA6nCGdQ46/CEABzfM=;
        b=IHT7Y64xBH5S90nhSkkllcBMCuCYjPeSbx1v9A+P1fJJLwd09rgsO7pxUeWKWhKpo6
         uYe0rPi9+ktzAS5QAUbCBbC/Sbmkg81jbeIeBtF/elA2Pk3koyMYuVeBqxSfbYR5Qxjp
         gPYsSIrrT9Ib5gDp+pxD7klyEweDP9ha+UZq7OgxMfR5pEck+0hHAsBXXKpzB51WxwwU
         LH9gPKuczN8lmaab3b0iEZXqREcZp+Jvh6TeDU4IUR/aify2GkUnyQVbq3ujkPfl30Yx
         H0q3GJs6iz3TKc1iedtX9d2IN2UY1k+WrhjikWO6hmcrQOk+GCPowg5XJUuliN/P+1xa
         JIRQ==
X-Gm-Message-State: AOAM533Pwe7JTi2mU+Bp0f/GX+t0LzKttUKqsV2aMj/YCHUk2fHOMiSm
        yx1eCYzmocmTqNbQV0RDXXk=
X-Google-Smtp-Source: ABdhPJyRrFejCwuMRT4Xi+PdRIHIHc/YJ7utE/Qd53sctwPliCDJV+TjdjCkNXaEqtKVQVUDrD4xdw==
X-Received: by 2002:a63:7505:: with SMTP id q5mr8919463pgc.312.1597653356453;
        Mon, 17 Aug 2020 01:35:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:35:55 -0700 (PDT)
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
Subject: [PATCH 07/10] mmc: s3cmci: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:05:05 +0530
Message-Id: <20200817083508.22657-8-allen.lkml@gmail.com>
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
 drivers/mmc/host/s3cmci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
index 444b2769ae2c..7540221d402d 100644
--- a/drivers/mmc/host/s3cmci.c
+++ b/drivers/mmc/host/s3cmci.c
@@ -549,9 +549,9 @@ static void do_pio_write(struct s3cmci_host *host)
 	enable_imask(host, S3C2410_SDIIMSK_TXFIFOHALF);
 }
 
-static void pio_tasklet(unsigned long data)
+static void pio_tasklet(struct tasklet_struct *t)
 {
-	struct s3cmci_host *host = (struct s3cmci_host *) data;
+	struct s3cmci_host *host = from_tasklet(host, t, pio_tasklet);
 
 	s3cmci_disable_irq(host, true);
 
@@ -1565,7 +1565,7 @@ static int s3cmci_probe(struct platform_device *pdev)
 	host->pdata = pdev->dev.platform_data;
 
 	spin_lock_init(&host->complete_lock);
-	tasklet_init(&host->pio_tasklet, pio_tasklet, (unsigned long) host);
+	tasklet_setup(&host->pio_tasklet, pio_tasklet);
 
 	if (host->is2440) {
 		host->sdiimsk	= S3C2440_SDIIMSK;
-- 
2.17.1

