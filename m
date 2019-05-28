Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D00F2CDD9
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 19:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfE1RpZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 13:45:25 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36020 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbfE1RpZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 13:45:25 -0400
Received: by mail-lj1-f193.google.com with SMTP id w16so925792ljd.3
        for <linux-omap@vger.kernel.org>; Tue, 28 May 2019 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=RXcKDhl1/lg8QsNl5iEDoBd0XtlOjaQwgqCDwv2KMDg=;
        b=QHdeLAVsj/k0xgjOu78MvnPoW0OGewTnKPEDc6yXnK0I0QMUhgvXkVtehPtfqq3rQp
         z/jVEBJOswzVIzCI5f4daULX+2taP8XtYqpBQbCZUm/7rQiwCUFaNxFcyENCEG7wNGQZ
         vKrx8mtFPGGuhdhDpK6WiHcdSbeJDEvD4EHpRVGXbo6VURcLKZvlJMrijPkYvY0NYULd
         YOxG03EVdbngWJOFUTgQr7B4wbxDuN7shGI7Yd5anwxniD8fYYabJm7eJfm7RyEzJaM3
         cE/X9qFpQi9Dxeag62dTbnizFN3F3F5g+eMhSxVYvotkEy+dkYpVRC4s8ORlN6wr/qRo
         tTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RXcKDhl1/lg8QsNl5iEDoBd0XtlOjaQwgqCDwv2KMDg=;
        b=S22BlOkBnnlxHcFJMQIbZRX946lFzr5VSv0GBR1A4iFHUIisbjiwUM9fjU4LVNtRqY
         6thxxzwKwZIYvNivLi8FyPLy1I0WqevqB/zj3kFooUP1wjvTRSOQ5+2/EEMEHKi2KA3c
         evPzoO5Ob5jBKi98GUBL5iDdyovvGgTFKToSza1xe6WEpwKKR2wxQ2jb9uOiYU3v9OJg
         RbkJ7XDVmdpeudpbX13J7SwObZDwfY69MNlXu0iqhhj8+KERiagXU2ePsVqzzB7ThjYA
         IXA15F+xIkit9luGDhuAJLKwKbcA3zfklr71eJu/YuTPj3Xyr3H/9mg9UY5fNQHVmZVq
         Td6A==
X-Gm-Message-State: APjAAAVGNSGMdyHhvOfnXjk7Oy128we8ksBsZvyJ2V/h4o8RtQY4sR/D
        rk6ownejqR9JBL6cpC0VnQJEaA==
X-Google-Smtp-Source: APXvYqxGDMDd1MvOGsC1hoUoR7O9APfjgGZ+8m5LRtBxrC4Ox+HpuKvb+njET9x+zDuYeLOqcrp32Q==
X-Received: by 2002:a2e:9410:: with SMTP id i16mr36430055ljh.152.1559065523333;
        Tue, 28 May 2019 10:45:23 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id x16sm3042049lji.3.2019.05.28.10.45.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 10:45:22 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com
Cc:     davem@davemloft.net, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next] net: ethernet: ti: cpsw: correct .ndo_open error path
Date:   Tue, 28 May 2019 20:45:19 +0300
Message-Id: <20190528174519.7370-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

It's found while review and probably never happens, but real number
of queues is set per device, and error path should be per device.
So split error path based on usage_count.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 634fc484a0b3..6d3f1f3f90cb 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1423,8 +1423,11 @@ static int cpsw_ndo_open(struct net_device *ndev)
 	return 0;
 
 err_cleanup:
-	cpdma_ctlr_stop(cpsw->dma);
-	for_each_slave(priv, cpsw_slave_stop, cpsw);
+	if (!cpsw->usage_count) {
+		cpdma_ctlr_stop(cpsw->dma);
+		for_each_slave(priv, cpsw_slave_stop, cpsw);
+	}
+
 	pm_runtime_put_sync(cpsw->dev);
 	netif_carrier_off(priv->ndev);
 	return ret;
-- 
2.17.1

