Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B13B3D7313
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236249AbhG0KYI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:24:08 -0400
Received: from muru.com ([72.249.23.125]:55824 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236262AbhG0KXz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:23:55 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7F045812F;
        Tue, 27 Jul 2021 10:24:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 3/6] crypto: omap-sham - add missing pm_runtime_dontuse_autosuspend()
Date:   Tue, 27 Jul 2021 13:23:36 +0300
Message-Id: <20210727102339.49141-3-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727102339.49141-1-tony@atomide.com>
References: <20210727102339.49141-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We should pair the usage of pm_runtime_use_autosuspend() with
pm_runtime_dont_use_autosuspend().

Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/crypto/omap-sham.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -2198,6 +2198,7 @@ static int omap_sham_probe(struct platform_device *pdev)
 	list_del(&dd->list);
 	spin_unlock(&sham.lock);
 err_pm:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	if (!dd->polling_mode)
 		dma_release_channel(dd->dma_lch);
@@ -2225,6 +2226,7 @@ static int omap_sham_remove(struct platform_device *pdev)
 			dd->pdata->algs_info[i].registered--;
 		}
 	tasklet_kill(&dd->done_task);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	if (!dd->polling_mode)
-- 
2.32.0
