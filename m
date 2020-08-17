Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E56A246051
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgHQIfg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgHQIfe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:35:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D5DC061388;
        Mon, 17 Aug 2020 01:35:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id m8so7889972pfh.3;
        Mon, 17 Aug 2020 01:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rAOJk5hAnNSTtMtpLoIzCa/FRMXNkXbdNwc80PFZokA=;
        b=mQOBeB8ChJKLfDqljKxvSwd0PnjUQ/BzQtjNW+Vy75CCx4C8fMgCLCTYVvx/9Cssvt
         4IhjIHcRFPRfhqSTsByu9w1sXrC1wCtZPqNOH8l5wzsu8DPA90RejbEjRGB7ut04Sf4m
         SEPe1a7Ht+NnKbrgDuwpX/nUCHWdaJ7cUbsp296LU8v14szu29bMbAI2UJQD22WPN8z3
         OexS3K8eSgQcvQjFlrTQjviBQHPP9tPz+6F6qvMEHI54ffXhMnySJ5b3xCkYcd73RpBY
         yleGz36hUmGZ6IWL9gBoLqXA38kJsqBg34drXD/z5c32bzwi2Ijer3Vs2pCrHCwOXWd2
         71qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rAOJk5hAnNSTtMtpLoIzCa/FRMXNkXbdNwc80PFZokA=;
        b=MgG9+2g5y2a47zzOs2OLrlDQuZcL/YPGRXNwB0ahXkYlbAkBXdszZUPgjZzM/8ONo4
         DcdfVfNWNPhuA1n3DOu1so2nUXZ98cQg6QusjyPqzHSKY6qEISmTQBrtmrl+KhDTaUKt
         lj7x8HIAsVebbIVxp9yC3a/PtKyylkzXt0kLA0Uw8NllSKghM/7AIANGXN8WEBe+2f2j
         q/hDJctaghBd5kwpFWT08jg+kUWUCB42Oh2Weizl66512WlcGoqYDQ60jYk70OnkaV3Y
         OlaMZ30gjf5xKUwuW3ol5IfDjThLpk++jWgcG5mlgYXDm9HPpWYn5/K/FnxnnmbRJTub
         vwlA==
X-Gm-Message-State: AOAM530fj5NFQMNnHU1ybONH8nv+lPNWsZ/B0Bld5nO0MezPdZkfJ9Wl
        XIZgO+Pli2JhZNOq7zHbzQ0=
X-Google-Smtp-Source: ABdhPJwX90Sf9NZvTGYZLIPY9xPs/XEZFGxusM3axVnX2JhCX2YL40nrZXPNmTB/JCWj3HS3vwJg1g==
X-Received: by 2002:a62:7c97:: with SMTP id x145mr10750592pfc.155.1597653332809;
        Mon, 17 Aug 2020 01:35:32 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:35:32 -0700 (PDT)
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
Subject: [PATCH 02/10] mmc: au1xmmc: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:05:00 +0530
Message-Id: <20200817083508.22657-3-allen.lkml@gmail.com>
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
 drivers/mmc/host/au1xmmc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
index 9bb1910268ca..f9b1d69290a3 100644
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
@@ -1037,11 +1037,8 @@ static int au1xmmc_probe(struct platform_device *pdev)
 	if (host->platdata)
 		mmc->caps &= ~(host->platdata->mask_host_caps);
 
-	tasklet_init(&host->data_task, au1xmmc_tasklet_data,
-			(unsigned long)host);
-
-	tasklet_init(&host->finish_task, au1xmmc_tasklet_finish,
-			(unsigned long)host);
+	tasklet_setup(&host->data_task, au1xmmc_tasklet_data);
+	tasklet_setup(&host->finish_task, au1xmmc_tasklet_finish);
 
 	if (has_dbdma()) {
 		ret = au1xmmc_dbdma_init(host);
-- 
2.17.1

