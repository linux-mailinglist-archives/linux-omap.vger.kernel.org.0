Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA1430F61C
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 16:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237242AbhBDPVS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 10:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237111AbhBDPVA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:21:00 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A974C061793;
        Thu,  4 Feb 2021 07:19:17 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id l12so4617357edt.3;
        Thu, 04 Feb 2021 07:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4t6PsBrxLZ5UTEGPBoOEAai2ONn3/gIQgFeqq55RME0=;
        b=dl7XayJ5ZZtlj2NxoVsVvbvmImyaVKnGXuxpCPR+o9CYjyWD/tFlLmIIf3GkKH6iNf
         nuRX7RpF+nb9qOBAJova7MSSQ2cadUwIhSKNBxhXu4Xyewmn5KXnx/WfSbwyo3hSB4sw
         ufSFB2d0KutTspXPxf7PukV/mRlpu5bBa64UkJHC2rv0sBsPPJfvKKUIIRGvRoucwoWm
         4kGU/8xWYMXMupMpO9I8MeseYxgIkMKHrOu6VX9IylQV0RSbLpHSzuiV/jGQn2fcQS/7
         sfMucw4Z+YxC0G+Iil/LqohjxbaLkO/miES8JKc4SoeFgVIJ0C2CbBe9YrfkYbPtzB6d
         kqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=4t6PsBrxLZ5UTEGPBoOEAai2ONn3/gIQgFeqq55RME0=;
        b=qsAxvGzj+jcpebynKR9oGUQF/fFFceJyqXxw7XDGu4+HkNSXMP44EElaiaUBYcREje
         tuXIfkHeV/K1SDNHthmmT4/RMMEtykfxhN1uSp/Es2H5KdhY346hLqCsmh7rudYcC3Xo
         c1lw3QjQgRv2ZjOwiALJMnXmmhPW+h49qBOTFI3axYHdkuFeGm1LVC9CjzIZuOmMVwAV
         52a8cX/7bFq5/2lao+WC847OHshJjQGDjYEDgPPhxKqy2rR6JB/ciNXcE3+EFW58r9Mo
         mkoTXkA4cKcF1YDeer98LSdDFaelxm32RsNI65x7rNhNN59lcs1n/WdWWLBNoNpaiNTy
         qeIA==
X-Gm-Message-State: AOAM5306UXhDi/5lcRY0RfAtTxzG9p2FlXkRa+eVWjSxuCdurIJdzg1B
        QW0YLyMxss0cX7f8pVP266+DXAYXZm3/AZlR
X-Google-Smtp-Source: ABdhPJzjyf4iJXj0C/1GfT9PvnICS23k9kQYo+BRNVNiF2+Upy/bNN6K1UgKwUZ3NJV9xENOVOzYQQ==
X-Received: by 2002:a05:6402:208:: with SMTP id t8mr8345346edv.189.1612451956240;
        Thu, 04 Feb 2021 07:19:16 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:15 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Ben Dooks <ben-linux@fluff.org>, Alex Dubov <oakad@yahoo.com>,
        Bruce Chang <brucechang@via.com.tw>,
        Harald Welte <HaraldWelte@viatech.com>,
        Pierre Ossman <pierre@ossman.eu>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] mmc: tifm_sd: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:44 +0100
Message-Id: <20210204151847.91353-7-kernel@esmil.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204151847.91353-1-kernel@esmil.dk>
References: <20210204151847.91353-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This converts the driver to use the new tasklet API introduced in
commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/mmc/host/tifm_sd.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
index fd8b72d3e02c..9fdf7ea06e3f 100644
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
2.30.0

