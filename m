Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA9930F40
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 15:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfEaNrc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 May 2019 09:47:32 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35038 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfEaNrb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 May 2019 09:47:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id a25so7970914lfg.2
        for <linux-omap@vger.kernel.org>; Fri, 31 May 2019 06:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=DiLJ6JnRCJJ3neCk5RdmZrESJ3I9QLujeCJngur/rJE=;
        b=sHCqvooDv0728QzeNQ1TedqmihQUeuFTkHyBB6ZslHvYDAeqSvTbKX7zsghL88Sz5r
         CXmKtLjoM+fsXBob4SGzSK9wKa9V9mo1gY3Bemb2T3r2q3zubXW18qQRRE1lH5rl5jRT
         IWSk7/hkb/UgSvczaG4qG1J70uBFM/w4kXU+WM6kNN+yvAjNV+N/S9GyGuaH4bihmDU1
         uzA/0uI9Qkk6lCTUJA1tEg3ocjLfox5qpAhXMhzcJqjCFCEflgCK0DJrjavwTkE/IQx7
         IlaIDGkNutbTyTrzLklrfkYdcF1+vAmuCv+hSoAF9ezEr0XR5cGr8rpvOX7RwlaN5ucV
         1YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DiLJ6JnRCJJ3neCk5RdmZrESJ3I9QLujeCJngur/rJE=;
        b=IK16+TMOgVRq56Y1x7o84T1Zd0nZVDDqJ8NsOlrTbEo6nFcac/IUnDHSUF9NpLTtbH
         afpVVLj/VKRxe2ENVFMtA+nkJw6pe7F7uAaLDluywdH1SQbHx2+sFa/tNG/moNcKevSn
         60Qed+EbhOhgT4/DvkdYTzd3wxk8vy1tseSgFiFtUfHkFU5rw9P/Yok5oI0xRrMv3mHF
         0GsYKxNqTvmYz/4FgmofBa9RHA8rhDoAx4RdJ7uJinadVVvNTMa/sBkT0HcbauJar0ah
         FZsY7I/Kw/HwhhWe9PC+SXLy0gufgNteZrEUEWuhb9z1yVgVN8cmCaZko2YLErEh/oxZ
         MreA==
X-Gm-Message-State: APjAAAXuzeAFNgkcWzdX0Pf4eGr9bLXiZOUZRjMMniV/A4fX7elzN99A
        F8tNt0EC0C6jVmA/IXioQ1o2qxNR48E=
X-Google-Smtp-Source: APXvYqwC1pymNebqSNI5Xz7H904bYIZfvu4+23N51FSzNZ2bfFeqLsCF8jO7esorxvBZxziQI2RVjA==
X-Received: by 2002:a19:3f16:: with SMTP id m22mr5601760lfa.104.1559310449908;
        Fri, 31 May 2019 06:47:29 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id s20sm763312lfb.95.2019.05.31.06.47.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 06:47:29 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2] net: ethernet: ti: cpsw_ethtool: fix ethtool ring param set
Date:   Fri, 31 May 2019 16:47:25 +0300
Message-Id: <20190531134725.2054-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix ability to set RX descriptor number, the reason - initially
"tx_max_pending" was set incorrectly, but the issue appears after
adding sanity check, so fix is for "sanity" patch.

Fixes: 37e2d99b59c476 ("ethtool: Ensure new ring parameters are within bounds during SRINGPARAM")
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
Based on net/master

 drivers/net/ethernet/ti/cpsw_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index a4a7ec0d2531..6d1c9ebae7cc 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -643,7 +643,7 @@ void cpsw_get_ringparam(struct net_device *ndev,
 	struct cpsw_common *cpsw = priv->cpsw;
 
 	/* not supported */
-	ering->tx_max_pending = 0;
+	ering->tx_max_pending = cpsw->descs_pool_size - CPSW_MAX_QUEUES;
 	ering->tx_pending = cpdma_get_num_tx_descs(cpsw->dma);
 	ering->rx_max_pending = cpsw->descs_pool_size - CPSW_MAX_QUEUES;
 	ering->rx_pending = cpdma_get_num_rx_descs(cpsw->dma);
-- 
2.17.1

