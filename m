Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1305E1DA
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2019 12:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfGCKTc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Jul 2019 06:19:32 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:34178 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfGCKTN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 Jul 2019 06:19:13 -0400
Received: by mail-lf1-f52.google.com with SMTP id b29so1395919lfq.1
        for <linux-omap@vger.kernel.org>; Wed, 03 Jul 2019 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NO88iVnC5CJGavQX1+oifd5FyeZJrmYwPjjZG7dx1kY=;
        b=xWYBTfuK3oxbaw2ihXoCR1u2W/q6BAnSu9cuBDvpQcBnRxJrqDr3icL3pTOdlndgs+
         QXqo/j3RtvVa44pp6toHXNoIlGVhbRYMfCOW8QQO2ghQ06fy4ypjGdNgj7T9Gi5S4nOH
         fDFkAFjhlOlGDQMVULlWzD8KpUv90CS0+hkcx7poj8wdLN0h+GvIUWY7wWwFh/2e/zKZ
         Th5PGNeqgL0oopeVwiQuJfIXZrkJ/8ZHoOdgNR+0vdq+sL/bAraUeu0UcPNrBlJaB9XP
         8/dgRutS7yeilCIy6OCRqECJt9lk/TMVy8V9XXmgTQE9iCu5K6dIjLmym3X+11dbFgqG
         0OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NO88iVnC5CJGavQX1+oifd5FyeZJrmYwPjjZG7dx1kY=;
        b=UrwcIDRPWUmhZBpyneEcYV/6CzE5DoOBWC5EgBXz7vaMcFhbijcTQiwhY9XLe2EbDn
         e1Te5t6STXJN/1xElBlYzDAhDxQavHOLL6AaAsdlSGW4Kz09WcXNQrSaZ1Bnu1A3PDvW
         TOOunQaUXeB+2369XL9SfqvMu/Lpy13ng2ug8SHlMpW5Ur6K9vVY6jlo+FtkLsW2RwRl
         XPy61eCAuhHylWJIa/wwAQph/sa1vIOD0WBLPcylULM4nWJ+LmgnHktxPbMuA1GosdUl
         Ig8FA/THuQoRvJcEHcW1oreM5PwMOr4Ep7hH4VtlGUTwbqRkEs3atbQZT5HViZ+1e7uH
         QIGQ==
X-Gm-Message-State: APjAAAV3FJ8GFcaxWVDhHl10TZJGEpNAWAJrttTVAr7IYAP5i0BpeoYo
        EEr08SBXXPYvjO4a4mhZRyjqcgdYVZQ=
X-Google-Smtp-Source: APXvYqxC06UjWw2SW6NYQYT0yijU13JSgMPdhUYpNUqdexFnLlc+oZSHl50a1BIfRBYkHx0LORdolw==
X-Received: by 2002:ac2:419a:: with SMTP id z26mr14069127lfh.21.1562149150989;
        Wed, 03 Jul 2019 03:19:10 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id i9sm67267lfl.10.2019.07.03.03.19.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 03:19:10 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v6 net-next 3/5] net: ethernet: ti: davinci_cpdma: allow desc split while down
Date:   Wed,  3 Jul 2019 13:19:01 +0300
Message-Id: <20190703101903.8411-4-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
References: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

That's possible to set ring params while interfaces are down. When
interface gets up it uses number of descs to fill rx queue and on
later on changes to create rx pools. Usually, this resplit can happen
after phy is up, but it can be needed before this, so allow it to
happen while setting number of rx descs, when interfaces are down.
Also, if no dependency on intf state, move it to cpdma layer, where
it should be.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw_ethtool.c  |  9 ++++-----
 drivers/net/ethernet/ti/davinci_cpdma.c | 10 +++++++++-
 drivers/net/ethernet/ti/davinci_cpdma.h |  3 +--
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index f60dc1dfc443..08d7aaee8299 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -664,15 +664,14 @@ int cpsw_set_ringparam(struct net_device *ndev,
 
 	cpsw_suspend_data_pass(ndev);
 
-	cpdma_set_num_rx_descs(cpsw->dma, ering->rx_pending);
-
-	if (cpsw->usage_count)
-		cpdma_chan_split_pool(cpsw->dma);
+	ret = cpdma_set_num_rx_descs(cpsw->dma, ering->rx_pending);
+	if (ret)
+		goto err;
 
 	ret = cpsw_resume_data_pass(ndev);
 	if (!ret)
 		return 0;
-
+err:
 	dev_err(cpsw->dev, "cannot set ring params, closing device\n");
 	dev_close(ndev);
 	return ret;
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index 8da46394c0e7..4167b0b77c8e 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -1423,8 +1423,16 @@ int cpdma_get_num_tx_descs(struct cpdma_ctlr *ctlr)
 	return ctlr->num_tx_desc;
 }
 
-void cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc)
+int cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc)
 {
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ctlr->lock, flags);
 	ctlr->num_rx_desc = num_rx_desc;
 	ctlr->num_tx_desc = ctlr->pool->num_desc - ctlr->num_rx_desc;
+	ret = cpdma_chan_split_pool(ctlr);
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
+	return ret;
 }
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.h b/drivers/net/ethernet/ti/davinci_cpdma.h
index 0271a20c2e09..d3cfe234d16a 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.h
+++ b/drivers/net/ethernet/ti/davinci_cpdma.h
@@ -116,8 +116,7 @@ enum cpdma_control {
 int cpdma_control_get(struct cpdma_ctlr *ctlr, int control);
 int cpdma_control_set(struct cpdma_ctlr *ctlr, int control, int value);
 int cpdma_get_num_rx_descs(struct cpdma_ctlr *ctlr);
-void cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc);
+int cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc);
 int cpdma_get_num_tx_descs(struct cpdma_ctlr *ctlr);
-int cpdma_chan_split_pool(struct cpdma_ctlr *ctlr);
 
 #endif
-- 
2.17.1

