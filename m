Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B974430F60D
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 16:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237141AbhBDPU3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 10:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237047AbhBDPTs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:19:48 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FE9C061786;
        Thu,  4 Feb 2021 07:19:08 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id bl23so5939410ejb.5;
        Thu, 04 Feb 2021 07:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M0B41tZ9BhfpLW130tpoMukMFanCubX5mUQuKs1xFi0=;
        b=iYWnQw3hSsJEBErHWKDUIRMWHyND3VAfFPvB7gVkyB8D18b3eaWSt3iNjvjvrbHWQM
         75Vdxp1oU1adk5KW22osTw+ituLWAmeQZ2m08qmG77wDsF0+nVY+IUxgrk9JjbLp6EM/
         /Kf+nWKF1Bvd3a/oDHc2dxC+025HVLbw979OaCKqQpQUDOcbohLmO/PA/YqbcL8Jd33S
         ubUuQ95FsYX8UhwW7TJSqjN4SbxPeKoDFJXIFxi6zEbW1jS+Em2KWNOCjy6whR7BhlEq
         /QDuWCX6ldtTobr44tD7LVzn0l9ECAftuz5mpgLeUQkUUMFPrf9nPHpHp2toJ9qhwaVM
         YNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=M0B41tZ9BhfpLW130tpoMukMFanCubX5mUQuKs1xFi0=;
        b=AvyRVf7/FwzhIq0jP6OOI3FH6xhxCEXclnCftNIpDg0E/liZ249MSPx1Srai8R4tKO
         fAM+plP1fLvO7bp7i9ltP0aolzCLPghIkEXEwXQmvGdRgonguIt0V54LryFQsA/n7HN5
         sQgoLr+T6kUPwA0P89KvZqhbmUlzAskqSZeAwUJLoglmLV/ESF5ZRxGHGLhoRE1CcrlU
         98jJQfM4AWH1er1hE9vzmqedzksLRIj5rNbSgHDLF/70SQWT46Ej/29eCJTU6sD75aLB
         u3DaYWOB1ASt9icWOrDkSOhFKDz4SHhRX/tAsHQlzHEiSKkYo7WtZdT8tBfQQbw/dXtL
         WbBg==
X-Gm-Message-State: AOAM5316jOaJbJViX0VkxFHON9pFVG+QuObfPO7YIXnmaIO2n0G9dsDs
        0EkGfTkfFaKqOp6OM3XmrZdmJA83EVqObt43
X-Google-Smtp-Source: ABdhPJyM0C+Whgrs7E27chcilpw2rTGgXyVbl/SoxO+o6Bj9uU3gr7yZUEbUSLYC1hmFrOCVw36NEg==
X-Received: by 2002:a17:907:7289:: with SMTP id dt9mr8477022ejc.446.1612451947555;
        Thu, 04 Feb 2021 07:19:07 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:07 -0800 (PST)
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
Subject: [PATCH 1/9] mmc: atmel-mci: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:39 +0100
Message-Id: <20210204151847.91353-2-kernel@esmil.dk>
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
 drivers/mmc/host/atmel-mci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 632412066eda..807177c953f3 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -1719,9 +1719,9 @@ static void atmci_detect_change(struct timer_list *t)
 	}
 }
 
-static void atmci_tasklet_func(unsigned long priv)
+static void atmci_tasklet_func(struct tasklet_struct *t)
 {
-	struct atmel_mci	*host = (struct atmel_mci *)priv;
+	struct atmel_mci        *host = from_tasklet(host, t, tasklet);
 	struct mmc_request	*mrq = host->mrq;
 	struct mmc_data		*data = host->data;
 	enum atmel_mci_state	state = host->state;
@@ -2496,7 +2496,7 @@ static int atmci_probe(struct platform_device *pdev)
 
 	host->mapbase = regs->start;
 
-	tasklet_init(&host->tasklet, atmci_tasklet_func, (unsigned long)host);
+	tasklet_setup(&host->tasklet, atmci_tasklet_func);
 
 	ret = request_irq(irq, atmci_interrupt, 0, dev_name(&pdev->dev), host);
 	if (ret) {
-- 
2.30.0

