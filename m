Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F54417BE
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2019 23:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407814AbfFKV7o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Jun 2019 17:59:44 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35901 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407784AbfFKV7o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Jun 2019 17:59:44 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so10483840lfc.3
        for <linux-omap@vger.kernel.org>; Tue, 11 Jun 2019 14:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Zzu+iigGnljTNLpw4PV21/NpwXZqBVj44MZDZpMBu9k=;
        b=PobiPbYcny3WgIyxrQehAN1nsvHHczEh4rKLhjhpRUHi5oP2JXevAQTzCNmyXPtkOJ
         uAD+t9JOexPIFCh64sfCV9FtaD6iUetrcyogT28F7NvlRqrI6n2zAqm4dtu+VlvIBR3a
         gyZvO2JwZbHansH5cVDh6Z6jYRq3yM/oVxR9BYZ8JrW69pUHdF4W/B5Ql4r1Gr80X/AJ
         IdOD3Ocdd6FDE87CL1PtMIcDU97zcS2vEGZ1mLJkzAjczvHpU3Cy7iQUTaPL38rNU5Pa
         aLUFeipC7MS8JcjaqgSjwUMQmDg5p17vONbyE1a+ivXjuxvCaaxKfcTEQFHNk9jrBrVZ
         Km5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Zzu+iigGnljTNLpw4PV21/NpwXZqBVj44MZDZpMBu9k=;
        b=i2lad+To+Zm4dT4qu5UFKTmjsZNKlGcz+WuazYIxBlVke2dFaOaEQ8J1aq9bStB5eK
         EN94SlNuZttH6Xd24w8s6uz7CSzwRxlO4APB9uTCTZSTk03+0T5eAstRfNvqNLEsYXRx
         JXsf5KJfYMByLWQB0Yeoqrgmv8eMxXBlcFBT4dM9r7QISZ9z2h8EYJLkDKvSiZMN00Fr
         GaOi1PX+GVzN0mSRsOK4CkHAO+ciZNZC2cbhIK9/5YiMVibzFP1ONv1vYbOGsFd4prrO
         heo1fJHCCPaACIdAliLDdmNm4PtsfiPu/m1ozJ0GKpNnSwXN7WeGRRtCHP77HjH3CuC2
         SSLQ==
X-Gm-Message-State: APjAAAUe5BfoqGGhxo7rYHRXPSXUQ2H7ebExkVSfs2fQZBMQf0DTJfdY
        bdby4m+uW/B/ENqlvsbYJZFO1Q==
X-Google-Smtp-Source: APXvYqxROsgLEagJ8cL2DRxT+ztHYQ7QT2V+4OlXJGcsDDWEq6cv4mqxmOimauuTlNjm9dvfY5hkxQ==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr11979289lfl.0.1560290382773;
        Tue, 11 Jun 2019 14:59:42 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id u10sm3339653lfu.18.2019.06.11.14.59.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 14:59:42 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next] net: ethernet: ti: cpsw_ethtool: simplify slave loops
Date:   Wed, 12 Jun 2019 00:59:40 +0300
Message-Id: <20190611215940.32359-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Only for consistency reasons, do it like in main cpsw.c module
and use ndev reference but not by means of slave.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---

Based on net-next/master

 drivers/net/ethernet/ti/cpsw_ethtool.c | 40 ++++++++++++++------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index 6d1c9ebae7cc..86697b32194d 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -458,7 +458,6 @@ int cpsw_nway_reset(struct net_device *ndev)
 static void cpsw_suspend_data_pass(struct net_device *ndev)
 {
 	struct cpsw_common *cpsw = ndev_to_cpsw(ndev);
-	struct cpsw_slave *slave;
 	int i;
 
 	/* Disable NAPI scheduling */
@@ -467,12 +466,13 @@ static void cpsw_suspend_data_pass(struct net_device *ndev)
 	/* Stop all transmit queues for every network device.
 	 * Disable re-using rx descriptors with dormant_on.
 	 */
-	for (i = cpsw->data.slaves, slave = cpsw->slaves; i; i--, slave++) {
-		if (!(slave->ndev && netif_running(slave->ndev)))
+	for (i = 0; i < cpsw->data.slaves; i++) {
+		ndev = cpsw->slaves[i].ndev;
+		if (!(ndev && netif_running(ndev)))
 			continue;
 
-		netif_tx_stop_all_queues(slave->ndev);
-		netif_dormant_on(slave->ndev);
+		netif_tx_stop_all_queues(ndev);
+		netif_dormant_on(ndev);
 	}
 
 	/* Handle rest of tx packets and stop cpdma channels */
@@ -483,13 +483,14 @@ static int cpsw_resume_data_pass(struct net_device *ndev)
 {
 	struct cpsw_priv *priv = netdev_priv(ndev);
 	struct cpsw_common *cpsw = priv->cpsw;
-	struct cpsw_slave *slave;
 	int i, ret;
 
 	/* Allow rx packets handling */
-	for (i = cpsw->data.slaves, slave = cpsw->slaves; i; i--, slave++)
-		if (slave->ndev && netif_running(slave->ndev))
-			netif_dormant_off(slave->ndev);
+	for (i = 0; i < cpsw->data.slaves; i++) {
+		ndev = cpsw->slaves[i].ndev;
+		if (ndev && netif_running(ndev))
+			netif_dormant_off(ndev);
+	}
 
 	/* After this receive is started */
 	if (cpsw->usage_count) {
@@ -502,9 +503,11 @@ static int cpsw_resume_data_pass(struct net_device *ndev)
 	}
 
 	/* Resume transmit for every affected interface */
-	for (i = cpsw->data.slaves, slave = cpsw->slaves; i; i--, slave++)
-		if (slave->ndev && netif_running(slave->ndev))
-			netif_tx_start_all_queues(slave->ndev);
+	for (i = 0; i < cpsw->data.slaves; i++) {
+		ndev = cpsw->slaves[i].ndev;
+		if (ndev && netif_running(ndev))
+			netif_tx_start_all_queues(ndev);
+	}
 
 	return 0;
 }
@@ -587,7 +590,7 @@ int cpsw_set_channels_common(struct net_device *ndev,
 {
 	struct cpsw_priv *priv = netdev_priv(ndev);
 	struct cpsw_common *cpsw = priv->cpsw;
-	struct cpsw_slave *slave;
+	struct net_device *sl_ndev;
 	int i, ret;
 
 	ret = cpsw_check_ch_settings(cpsw, chs);
@@ -604,20 +607,19 @@ int cpsw_set_channels_common(struct net_device *ndev,
 	if (ret)
 		goto err;
 
-	for (i = cpsw->data.slaves, slave = cpsw->slaves; i; i--, slave++) {
-		if (!(slave->ndev && netif_running(slave->ndev)))
+	for (i = 0; i < cpsw->data.slaves; i++) {
+		sl_ndev = cpsw->slaves[i].ndev;
+		if (!(sl_ndev && netif_running(sl_ndev)))
 			continue;
 
 		/* Inform stack about new count of queues */
-		ret = netif_set_real_num_tx_queues(slave->ndev,
-						   cpsw->tx_ch_num);
+		ret = netif_set_real_num_tx_queues(sl_ndev, cpsw->tx_ch_num);
 		if (ret) {
 			dev_err(priv->dev, "cannot set real number of tx queues\n");
 			goto err;
 		}
 
-		ret = netif_set_real_num_rx_queues(slave->ndev,
-						   cpsw->rx_ch_num);
+		ret = netif_set_real_num_rx_queues(sl_ndev, cpsw->rx_ch_num);
 		if (ret) {
 			dev_err(priv->dev, "cannot set real number of rx queues\n");
 			goto err;
-- 
2.17.1

