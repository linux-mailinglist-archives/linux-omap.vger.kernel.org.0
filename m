Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A686324604F
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgHQIfd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgHQIf2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:35:28 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBDAC061388;
        Mon, 17 Aug 2020 01:35:28 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f9so7349135pju.4;
        Mon, 17 Aug 2020 01:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4nhWNM41f6BjKWP46DMIjPsIWGEGdOxdBi1jSC7XG8s=;
        b=mGaGN7JDJGgy/1WQUsKWaFTCgtC3rJsf9uTrL9370PCWKVjEpcQy9EI/xP8rVxFxDN
         DQIhtVNRxYd5wR3QuC/KZMts9WZPnoOmndIBmz7t+lB5n2DbwECCodBm/tqN8abCMd6W
         fKb81wMBVASTh9+YpvzvixeJADKQDAghKJ6T+AfCHs0fJnmHRSROgh+427SAETCDabE0
         wt/mq0Z0DSqoHRUV9ZP3QzDHRLfplHZASTF3VWCHLT91w/d4h9XdXJm3+VCD5/vN2Jgn
         oEVypkDuBgsJrkHGE34tWKfqOJ3q+LX0nQ533oYNCTnFYVd4RZwp3maByR+ZeuvpmDue
         63Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4nhWNM41f6BjKWP46DMIjPsIWGEGdOxdBi1jSC7XG8s=;
        b=cOcz8LI3ZNLbzvBXzBQpF8pkCXEjI3Iz/SY/8Kntp0/NWTADnATiP3/wC7Y/WV1D8z
         +0tXbNxjR+na0JJQOkgfv1NL/gNSDbF0PdPTiaWt5JUEjhOl/VSQK8YLGiTqzRo2zVT2
         2y4kAKmW+EpO22+pZvy+42BHhPxVRzCmNLTIY+ylIOkQ6m3x/GRUVFSn9Tl9Ddm4KDIl
         t79Id1944dMl0YX0zZnulkvFs89QV+8GhgQ5Xo3EifwCFL9SNF2Ei33nyBsHvZHcHcF/
         S7jmd/kFyraq0ESy4eM1tSytljV3NPRxII9UlmrdVzK5iWVrQoQo351XZFgO8Mt+6ypZ
         Z7qg==
X-Gm-Message-State: AOAM532c6GInJdGUKMJNd8lWWePkCr8PHfFeQcN+waWGMyGmNeSO2I6s
        CuaT8Hwu0jn0b2mBXf0E2UU=
X-Google-Smtp-Source: ABdhPJwpxyd4w90B/LHzc3wDMjJl+AoxneVsdWqfIUr98hR55sv5bW17uf9nyFyU9tMklV2BSez1zg==
X-Received: by 2002:a17:90a:ce94:: with SMTP id g20mr11462006pju.61.1597653327838;
        Mon, 17 Aug 2020 01:35:27 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id h5sm18434068pfq.146.2020.08.17.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:35:27 -0700 (PDT)
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
Subject: [PATCH 01/10] mmc: atmel-mci: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:04:59 +0530
Message-Id: <20200817083508.22657-2-allen.lkml@gmail.com>
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
 drivers/mmc/host/atmel-mci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 300901415aa2..562cf8eb993f 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -1719,9 +1719,9 @@ static void atmci_detect_change(struct timer_list *t)
 	}
 }
 
-static void atmci_tasklet_func(unsigned long priv)
+static void atmci_tasklet_func(struct tasklet_struct *t)
 {
-	struct atmel_mci	*host = (struct atmel_mci *)priv;
+	struct atmel_mci	*host = from_tasklet(host, t, tasklet);
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
2.17.1

