Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68C930F60F
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 16:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237177AbhBDPUg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 10:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237223AbhBDPTt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:19:49 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD41C061788;
        Thu,  4 Feb 2021 07:19:09 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id y18so4522479edw.13;
        Thu, 04 Feb 2021 07:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kA7iM6G+tHsHX5qw3wt51wVo7E+zCJZCLkoKnrDKq4Y=;
        b=W4cfV5/0dL0av9SOsoeYkRGZsmBPL2hqK42EOZerpGQsi95XPA4dnspkZkdpAAMxSV
         pkb1zX3XZmCCxKcJYAZ2QT8iUpEbAXozdkFoXAcgvC9vCHP4mWtSdBjYteMEQnpxQ+M9
         4ZT7Rg5fFI+ziKmlcRx3AE9wuiTaZhQWlslkBkfz1JdfvwAbG7AQI2EHg/hs1LRkYx2u
         9QZF+bsyZ8HOUIeZ/32EINf43pmwMmIJgv6ilOFsU4JRaLTuQn2Dt2b5AgSzB9U0aKUy
         +lMc95NaqxZwzHg/4lAZl7JAeQQeoXe7gxLfXRs2NfoDKGIMeqn5fXKbcBHPfZRRvmQ5
         jTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=kA7iM6G+tHsHX5qw3wt51wVo7E+zCJZCLkoKnrDKq4Y=;
        b=cwLATTB/HNGus3jX8HnhtK7QSpeTlVw2TrfjC5SiLcOeFUKfaliKb6RuMUWuvl50Nk
         nHGPrp4e1i5SbF97osWvrprGL1Fc/FITTyvjlGO4EuA5qG7HR0PKnZActLC5SfMLRZsn
         BwJY69lAKrpqD8HD6OKBFhSU84PMucmRHU65d0BuA5LeIMU2oVuKaa1q22Ww9T+egh9y
         fQ+AHRwtT3+TJBjAejI8pAtm0nLuLH1VjCOFujoT4IT7IBZVL1DhVZWAopOj3CGptbWG
         mdIzKYEIUDTXvAJlfuuz1dtT3QhLU7hpkLWDDx4Fxn7zxa7+bLxn2rDD2PvtUea72q2y
         fn6Q==
X-Gm-Message-State: AOAM530nt6kpuXA3+oUw6D5JOiEWn+OI5RS7DINnRWA9pIZulbVPhXrc
        Fp63U0SCwL9R/iH0yhTLrrMsKiRhYAhPu+Kn
X-Google-Smtp-Source: ABdhPJwfG3Ce99XsaCXs91f6lfYXHfdV7XQFeKGSYxh2mMSowdr1KYmIsT98CTsuVcyOQJJGG9coHQ==
X-Received: by 2002:a05:6402:3487:: with SMTP id v7mr8562518edc.68.1612451948549;
        Thu, 04 Feb 2021 07:19:08 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:08 -0800 (PST)
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
Subject: [PATCH 2/9] mmc: au1xmmc: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:40 +0100
Message-Id: <20210204151847.91353-3-kernel@esmil.dk>
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
 drivers/mmc/host/au1xmmc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
index bd00515fbaba..0acc237843f7 100644
--- a/drivers/mmc/host/au1xmmc.c
+++ b/drivers/mmc/host/au1xmmc.c
@@ -253,9 +253,9 @@ static void au1xmmc_finish_request(struct au1xmmc_host *host)
 	mmc_request_done(host->mmc, mrq);
 }
 
-static void au1xmmc_tasklet_finish(unsigned long param)
+static void au1xmmc_tasklet_finish(struct tasklet_struct *t)
 {
-	struct au1xmmc_host *host = (struct au1xmmc_host *) param;
+	struct au1xmmc_host *host = from_tasklet(host, t, finish_task);
 	au1xmmc_finish_request(host);
 }
 
@@ -363,9 +363,9 @@ static void au1xmmc_data_complete(struct au1xmmc_host *host, u32 status)
 	au1xmmc_finish_request(host);
 }
 
-static void au1xmmc_tasklet_data(unsigned long param)
+static void au1xmmc_tasklet_data(struct tasklet_struct *t)
 {
-	struct au1xmmc_host *host = (struct au1xmmc_host *)param;
+	struct au1xmmc_host *host = from_tasklet(host, t, data_task);
 
 	u32 status = __raw_readl(HOST_STATUS(host));
 	au1xmmc_data_complete(host, status);
@@ -1037,11 +1037,9 @@ static int au1xmmc_probe(struct platform_device *pdev)
 	if (host->platdata)
 		mmc->caps &= ~(host->platdata->mask_host_caps);
 
-	tasklet_init(&host->data_task, au1xmmc_tasklet_data,
-			(unsigned long)host);
+	tasklet_setup(&host->data_task, au1xmmc_tasklet_data);
 
-	tasklet_init(&host->finish_task, au1xmmc_tasklet_finish,
-			(unsigned long)host);
+	tasklet_setup(&host->finish_task, au1xmmc_tasklet_finish);
 
 	if (has_dbdma()) {
 		ret = au1xmmc_dbdma_init(host);
-- 
2.30.0

