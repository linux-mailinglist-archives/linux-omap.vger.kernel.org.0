Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A69C30F72E
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 17:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237627AbhBDQD6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 11:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236966AbhBDPTy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:19:54 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B92C06178B;
        Thu,  4 Feb 2021 07:19:14 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id t5so4531753eds.12;
        Thu, 04 Feb 2021 07:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MXxWaP3OMD24RnZ/OSVIIbiGQ1wOqMXQ3YDzBvlfZKc=;
        b=Y9ukjEkFtjspHv5gHEuPAtYlxRPD5EcQz/cPxJRYXU/NRBX67UiJU5GQZr03n9ZZ6e
         OR3+LT9H5tAY7svvli7sOSAIQttxbqbYnxgPNG4uXWN41N/2uzVwv0PRfk/eGdFT/iVV
         Dhuyv/lB2naVSMm2OgKyCBEUzzlmPj/726yvckg6V7Yo2pB646XbBBQu1DUnSS6p/Nrx
         CxgGIfCQ8zmqp0qBvlPf8nvIuzIoxmM9wEML2s5TtE30SW5tZVzuakVPAJF/ZO/irGzD
         YaEVCAJ0HvEB3dRMmugCdgLSN+rsab8QoclToeqBkUQcEnv1Yko17CQRNZuN8KMklPZR
         Rvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=MXxWaP3OMD24RnZ/OSVIIbiGQ1wOqMXQ3YDzBvlfZKc=;
        b=C4r84de4kvcZ1wD0aqAoEoyDSRzK/enHfObdeTub2ciEWiG5B7w+ZxD/UtTO9qcmpM
         EXCVdXPysqfUA9T6p6t2TJDvSJjLQpT9RcVdaxSQJE1Z8kgiM0M7JWVF/1XadHN7c60V
         1BB2A4xoYha3xOuEhtMUh66ZgfGgXhT+xviMuxCDZzPKUBGQfezkUOzkly2Ok9qpm/91
         tBBsBrakXYQrEXNJRrOC+jcPuvUWAw3DzvSpOhBxIbkgTmkx3rgslaj4wUKhC9cDfv2w
         cPJzK3hcs7t0AoKJw3sE7gzBDnKVWjq86Iv2oXU2Svly3n2VICiO4bkkh9wdn01PkXIY
         Y3YQ==
X-Gm-Message-State: AOAM532PEGMXny1TTVdelF/GCehL8u+u6vI5lK8SfNZY5ABwpgtMo/Ko
        jdNN+AyQrtMyqZhKla48bLZlglnYNafdKoDX
X-Google-Smtp-Source: ABdhPJyPq3p6MXw+NKWx1K05eqiXDRYZGsAJgrrr++6DtWr4V3jzMLDk8+xPLi3Fi+f7Z1ImdeULrA==
X-Received: by 2002:a50:8466:: with SMTP id 93mr8342762edp.55.1612451951546;
        Thu, 04 Feb 2021 07:19:11 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:10 -0800 (PST)
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
Subject: [PATCH 4/9] mmc: omap: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:42 +0100
Message-Id: <20210204151847.91353-5-kernel@esmil.dk>
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
 drivers/mmc/host/omap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 6aa0537f1f84..5e5af34090f1 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -878,9 +878,9 @@ static void mmc_omap_cover_timer(struct timer_list *t)
 	tasklet_schedule(&slot->cover_tasklet);
 }
 
-static void mmc_omap_cover_handler(unsigned long param)
+static void mmc_omap_cover_handler(struct tasklet_struct *t)
 {
-	struct mmc_omap_slot *slot = (struct mmc_omap_slot *)param;
+	struct mmc_omap_slot *slot = from_tasklet(slot, t, cover_tasklet);
 	int cover_open = mmc_omap_cover_is_open(slot);
 
 	mmc_detect_change(slot->mmc, 0);
@@ -1269,8 +1269,7 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
 
 	if (slot->pdata->get_cover_state != NULL) {
 		timer_setup(&slot->cover_timer, mmc_omap_cover_timer, 0);
-		tasklet_init(&slot->cover_tasklet, mmc_omap_cover_handler,
-			     (unsigned long)slot);
+		tasklet_setup(&slot->cover_tasklet, mmc_omap_cover_handler);
 	}
 
 	r = mmc_add_host(mmc);
-- 
2.30.0

