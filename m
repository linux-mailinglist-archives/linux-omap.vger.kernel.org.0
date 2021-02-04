Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F2630F736
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 17:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237724AbhBDQF7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 11:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237218AbhBDPTv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:19:51 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA26C06178A;
        Thu,  4 Feb 2021 07:19:11 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id sa23so6008768ejb.0;
        Thu, 04 Feb 2021 07:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Ztwrmsm6gQAgLIEitmcEoJqCpEXF+Q5ciHAZ3tgDxw=;
        b=mRQ5xqodp26jOz8LqunuNzwLU0YL/YgEsvxJ+8kuNGzv1/OpnND4QdHXcQNNDxcw9o
         bEZEdkHyFB5+BpvmAYasq/PQT18rC5R+kJzCWUJcOaldouyP1Mdei0NoNgBcXTDURzBm
         2fcHnfwWQqTX66Bq7FOuhVJzdy2xul+opPhrhjhnTCfW57yGCfU8ivQfj1/X6xXlc3pr
         k0P4ci138hfwrSgoD+ZI7mx1cimo5n03oWhPKfsLDxlsiPQRXVqzHAemYdiSGWZH7n5I
         ZA1Bog1w1xuqeP+POAgwULTiLa/aCibA1g0GT4Xupxe4i1CrNZ8vDOcaKrjJUfhjBNNM
         PXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=4Ztwrmsm6gQAgLIEitmcEoJqCpEXF+Q5ciHAZ3tgDxw=;
        b=XkwFS3w6Llg4vntQkSFY2SvXWyqQyilYnA4RNfRNEqG0fCb6+b2y0e0KF1wYR/HD+2
         22E3Uj9OejlbL0jpJjYvFs5Ct4+kvpdK46beWH6kh2Pd5h5qvMoa2HV/gu7+hI+G1CJ3
         TW+VuhB5znY6cytcIWTL/m8WgjegggyE4OVTaL7EDLRmGDnSnEh9AP5tTo2uWpFDUXOq
         +ITov45AHmj5DFUe13S6d9olhYyYuZzis0Gv0iWjUr3grK7nBnPeDEW9utOEqngD8SoL
         NOVdAhdqXs9rMiTQy0Mue1u26gmP8LuIZtnuHK4QgCXzRuYM1ly17uJvZHNTnlghBnlz
         /4bw==
X-Gm-Message-State: AOAM532gbS2DPn6UH/r9fI21fdUGYfuMfv78XdQRrNUBE7w2UlYMlVT2
        IG7pEsKCozPDvOHrnppVh+fQ2uiGQoPVK/Lq
X-Google-Smtp-Source: ABdhPJwIDsLfmE8dMsrsBsSwNtKWXrU7ViHCPtARzRsAkMyD6j9j9GkqDwtVUArnOtFintcqgVRILw==
X-Received: by 2002:a17:906:6dc6:: with SMTP id j6mr8261860ejt.88.1612451950067;
        Thu, 04 Feb 2021 07:19:10 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:09 -0800 (PST)
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
Subject: [PATCH 3/9] mmc: dw_mmc: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:41 +0100
Message-Id: <20210204151847.91353-4-kernel@esmil.dk>
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
 drivers/mmc/host/dw_mmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index a5244435556b..2f4de30f650b 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1952,9 +1952,9 @@ static bool dw_mci_clear_pending_data_complete(struct dw_mci *host)
 	return true;
 }
 
-static void dw_mci_tasklet_func(unsigned long priv)
+static void dw_mci_tasklet_func(struct tasklet_struct *t)
 {
-	struct dw_mci *host = (struct dw_mci *)priv;
+	struct dw_mci *host = from_tasklet(host, t, tasklet);
 	struct mmc_data	*data;
 	struct mmc_command *cmd;
 	struct mmc_request *mrq;
@@ -3308,7 +3308,7 @@ int dw_mci_probe(struct dw_mci *host)
 	else
 		host->fifo_reg = host->regs + DATA_240A_OFFSET;
 
-	tasklet_init(&host->tasklet, dw_mci_tasklet_func, (unsigned long)host);
+	tasklet_setup(&host->tasklet, dw_mci_tasklet_func);
 	ret = devm_request_irq(host->dev, host->irq, dw_mci_interrupt,
 			       host->irq_flags, "dw-mci", host);
 	if (ret)
-- 
2.30.0

