Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2612C695
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 14:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfE1Md6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 08:33:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46620 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbfE1Md5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 08:33:57 -0400
Received: by mail-lj1-f196.google.com with SMTP id m15so2697962ljg.13
        for <linux-omap@vger.kernel.org>; Tue, 28 May 2019 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=p6KdJeiH86xgZo1O+1oE/uG9And6c5wGK5T3gqfY/Xo=;
        b=Bzdfa6+SY9BtK9NQo8gyteSgCIx5YWOdqoxK2BqFQ36uCyO8H8Afo1OyBE3Asf6tR1
         ECLkWPcB+CABwlIM3oYkUYAK2AXvqNg4ZByJroQbuW6Je5hSqjFQNFLPg4afIVlSF2Lh
         2YWcPYfVMLFPYI3fBZ6WurO7Ua4cCfuy7BBxdj6w9meNfhIrueMfnPx/LU9ORY9hICR/
         DQ1oiufcthmcCqA1PZAIf0EFNlwH/7/TGJ+JK7LciN844pvc6dTKPKarjiR046byN8N8
         nMsX8SBKdOWAckmbMmfBBQd81xA3hyvnPru7j5IJu+2DLxrhK0VUosmjdEGO+kgOOOOq
         Gu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=p6KdJeiH86xgZo1O+1oE/uG9And6c5wGK5T3gqfY/Xo=;
        b=VnEWvQIYkZSwbAoa+8wlv2dD8y2Ua4PdWgILlNhqUpaZYjU0UnlMFq6/IQqRkifa7G
         h3l3lRyjOExMGra5pw8KLXmkmAjBN5tGuwi3Oosc1uHk6Yae4/vaIR412ZABpGO+8fvx
         GoGjYKMSi7id1wL/wa9kSSCQqR7kOGp77z15bjVb0ntPTuW01DUqI2Jr7L6B1uuqhKa8
         RSxyMTIv3y9N9VsKj5BjHyVw58n8K8QpdLsCEcDRkLSfuYl4Na3U/0OC6pWXGx4zZeTH
         nudYAGR1EjJdNi6UFldH2/mnpJVh02GYQbfib3GcvU1sQJR34t9AZqguHfywi6X0PUUU
         yKCw==
X-Gm-Message-State: APjAAAWVYCqRo54Bz6hbN4fYWE7wxVcnT8NO1oMaI9BNxsMiUdknAFTO
        j9QlL7kzS/I2O3tNNF1oLyrIovI2ZBI=
X-Google-Smtp-Source: APXvYqzJ+0rB51Qa07OsbyNptlPHB5eRfiy8UqDDQS7y2JlFBlJFdKgzpmI0REFejzLZXr8nSaO2Rg==
X-Received: by 2002:a2e:6c0b:: with SMTP id h11mr29242008ljc.15.1559046835818;
        Tue, 28 May 2019 05:33:55 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id y14sm2905662ljh.60.2019.05.28.05.33.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 05:33:55 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com
Cc:     davem@davemloft.net, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next] net: ethernet: ti: cpsw: correct .ndo_open error path
Date:   Tue, 28 May 2019 15:33:52 +0300
Message-Id: <20190528123352.21505-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

It's found while review and probably never happens, but real number
of queues is set per device, and error path should be per device.
Also correct label name for shared error path.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 634fc484a0b3..473d25ed59e3 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1399,7 +1399,7 @@ static int cpsw_ndo_open(struct net_device *ndev)
 
 		ret = cpsw_fill_rx_channels(priv);
 		if (ret < 0)
-			goto err_cleanup;
+			goto err_shared_cleanup;
 
 		if (cpts_register(cpsw->cpts))
 			dev_err(priv->dev, "error registering cpts device\n");
@@ -1422,9 +1422,10 @@ static int cpsw_ndo_open(struct net_device *ndev)
 
 	return 0;
 
-err_cleanup:
+err_shared_cleanup:
 	cpdma_ctlr_stop(cpsw->dma);
 	for_each_slave(priv, cpsw_slave_stop, cpsw);
+err_cleanup:
 	pm_runtime_put_sync(cpsw->dev);
 	netif_carrier_off(priv->ndev);
 	return ret;
-- 
2.17.1

