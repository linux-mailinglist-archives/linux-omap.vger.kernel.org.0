Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC037246055
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgHQIfu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgHQIfn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:35:43 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F7AC061388;
        Mon, 17 Aug 2020 01:35:42 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k13so7132165plk.13;
        Mon, 17 Aug 2020 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jhwHA9iT6gG9p11YNGvMfQK3PrAipcXrN5ECqFQlHWA=;
        b=gulnIYNfT0Y3CUDDfpjFjMeTf1Vv4n2l9IELuyJwpgh/sK6hHAB9WSl4g1yK+dN++o
         niutqyw7Mv7WRnHhuP22dgamV6479B8guvy56zDjbSVfSsbQwpGDZb+B117fGn+dvabP
         0Jp6eR0JwsH1EHtBoUf1a0JE0x0Z01+H0kSMahkxo75Vu6CVg+CYUE24ehpKXvEuGlLS
         ufpqKFXZMNhIwLB1bPwGtxn8gQD2J2deloI2HP/mKeQLgwF+LspuhdRE4EDZsLtNzQ81
         +wSfasi/h8GuN8f48tx8G0hp44NQTWzT4nejdhxLYmHMEvc/7DdCD3oQwYN9ZLcArqSU
         LZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jhwHA9iT6gG9p11YNGvMfQK3PrAipcXrN5ECqFQlHWA=;
        b=pWEArk775/zlkNtsXC2gF9WtbtEt0JEFRcbbTfPdbuDStbhqTjEOP/z7fR6KeyM7qa
         keN0R9u+tXRg+HnxwPAYIx3obIulRLuBf3HUd1vRwK6DMMrWg/NsvQQbFVPGXTp1aypm
         B+pa2uSXEyj8RAaVfM+MKLizmBqkl0bmFt8X7Ij/JOoVLUBabnrjhTLUDW06S6ghclXm
         wV1P9kldeLSJPGbsJj/iYfqyxdOsEwDJfCQFSLks265AgPRlgChQz38BtAnKl03ZaBKK
         5SKIL2hWx8PE3eN/XN1qifiFHVa+7qpqlaRR8qXgPqsH62fZ9kQL1er/EBMH5n+bPa4P
         /BMg==
X-Gm-Message-State: AOAM531QF6x33ByINvgI3kQ0knXGA6KY0R4/xBzOQubK8ElGtPmUI+zW
        3kVrHNEQNn4/fpzmNIfNeSAJsGZIja03Aw==
X-Google-Smtp-Source: ABdhPJy9zElavpxqpBa2OrUYgtVBBx6wLtQaG23S5v8ec764n5rq7zXO2QFHjt/Y25P4vXHVCORDUQ==
X-Received: by 2002:a17:90a:ff92:: with SMTP id hf18mr11858868pjb.107.1597653342408;
        Mon, 17 Aug 2020 01:35:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:35:41 -0700 (PDT)
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
Subject: [PATCH 04/10] mmc: dw_mmc: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:05:02 +0530
Message-Id: <20200817083508.22657-5-allen.lkml@gmail.com>
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
 drivers/mmc/host/dw_mmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 35ae5737c622..574e5a7a697c 100644
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
@@ -3312,7 +3312,7 @@ int dw_mci_probe(struct dw_mci *host)
 	else
 		host->fifo_reg = host->regs + DATA_240A_OFFSET;
 
-	tasklet_init(&host->tasklet, dw_mci_tasklet_func, (unsigned long)host);
+	tasklet_setup(&host->tasklet, dw_mci_tasklet_func);
 	ret = devm_request_irq(host->dev, host->irq, dw_mci_interrupt,
 			       host->irq_flags, "dw-mci", host);
 	if (ret)
-- 
2.17.1

