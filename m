Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B1C30F623
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 16:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237240AbhBDPWX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 10:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237232AbhBDPVD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:21:03 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20960C061797;
        Thu,  4 Feb 2021 07:19:20 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id w2so5853182ejk.13;
        Thu, 04 Feb 2021 07:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N2WmQEa3BjX3ncRzYIQrV88zAWNTStgvbrnt2gC25ds=;
        b=pLrqpZXobX/BN7V31Gin+rlULIYKilZRzPSg2xhaB7QQRja338SqRQYtB6sGduQR6t
         SpkFueZqQlQUV7s0D3t+VDoe2OSx3ZQ0jF8NNjnVGSKhdjjt3tv39fLJ6FokgRPf6MDH
         HIYJ4A1t11mjke3xCrDwNitdGe8s5t7C0rF+tmMcLoAFmsI0NHv3u1paYz6DizW7Dcee
         qJoPTnP501IOro5fX5d8YLp6cRf4/vCXxKn13ukVgCE97I6qboXn70vSgi53QRPGiG2P
         N3+dVCm3EcSc/1p1hABKXa0ZdSbboQHX9IAigI+SaCiwDVU4Pn7GcYbT3dGKlebfQsU7
         Jk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=N2WmQEa3BjX3ncRzYIQrV88zAWNTStgvbrnt2gC25ds=;
        b=GT6wxKKAUTT7B1HpFmRqa4qQkaNY/aatj0nixyL/E9yeUIGaZ8iYCy2lrta7lM97aK
         8cN8cqDf9rBx4FsMX8sxXZAZ6usnLCtU9SktG0AnqDj42+0E3ETTASbQ55ab6NXCliKP
         nkfjrPxnDO3S+o4gyBDxWm8H8BsTY2Mmq80viwfEEuMeJ+9NI7fwInnjwSAKY0dUpLHj
         vR6thRO+jqjIYg6zwwhs1ElWsge2F6nWrPg3H4AYC9l4DzNdfCJukiQ5KWjvQUY6yez4
         N1pAeFmTyShJsaujGKKeb1r25wjQjFqvz+G5HeNuluXqVfCV38Iv1SpwAVAGBFUmw+Jq
         s87g==
X-Gm-Message-State: AOAM531MCXLY4vnGMgnHjt1wL/QHcVWaqG42rVc1Xuiw0jUOSdVCFskO
        QAVHuVi57YKeXAFik1j4J6IPid5lqC+GjyCE
X-Google-Smtp-Source: ABdhPJwiILFpv5ahW61oLwlmasbtA/F6ia/OU2V3dbtBa3foPSZ6iMEwvO2Wb0/LY/T3k2+HMO4nDw==
X-Received: by 2002:a17:906:43d7:: with SMTP id j23mr4464993ejn.519.1612451958882;
        Thu, 04 Feb 2021 07:19:18 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:18 -0800 (PST)
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
Subject: [PATCH 8/9] mmc: via-sdmmc: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:46 +0100
Message-Id: <20210204151847.91353-9-kernel@esmil.dk>
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
 drivers/mmc/host/via-sdmmc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/via-sdmmc.c b/drivers/mmc/host/via-sdmmc.c
index 9b755ea0fa03..4f4c0813f9fd 100644
--- a/drivers/mmc/host/via-sdmmc.c
+++ b/drivers/mmc/host/via-sdmmc.c
@@ -959,14 +959,12 @@ static void via_sdc_timeout(struct timer_list *t)
 	spin_unlock_irqrestore(&sdhost->lock, flags);
 }
 
-static void via_sdc_tasklet_finish(unsigned long param)
+static void via_sdc_tasklet_finish(struct tasklet_struct *t)
 {
-	struct via_crdr_mmc_host *host;
+	struct via_crdr_mmc_host *host = from_tasklet(host, t, finish_tasklet);
 	unsigned long flags;
 	struct mmc_request *mrq;
 
-	host = (struct via_crdr_mmc_host *)param;
-
 	spin_lock_irqsave(&host->lock, flags);
 
 	del_timer(&host->timer);
@@ -1050,8 +1048,7 @@ static void via_init_mmc_host(struct via_crdr_mmc_host *host)
 
 	INIT_WORK(&host->carddet_work, via_sdc_card_detect);
 
-	tasklet_init(&host->finish_tasklet, via_sdc_tasklet_finish,
-		     (unsigned long)host);
+	tasklet_setup(&host->finish_tasklet, via_sdc_tasklet_finish);
 
 	addrbase = host->sdhc_mmiobase;
 	writel(0x0, addrbase + VIA_CRDR_SDINTMASK);
-- 
2.30.0

