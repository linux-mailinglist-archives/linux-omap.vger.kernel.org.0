Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A963D730D
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhG0KYr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:24:47 -0400
Received: from muru.com ([72.249.23.125]:55834 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236275AbhG0KX6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:23:58 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 37ED380F0;
        Tue, 27 Jul 2021 10:24:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 4/6] crypto: omap-sham - drop old hw_init and unused FLAGS_INIT
Date:   Tue, 27 Jul 2021 13:23:37 +0300
Message-Id: <20210727102339.49141-4-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727102339.49141-1-tony@atomide.com>
References: <20210727102339.49141-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

FLAGS_INIT is now unused and we can just use standard runtime PM
functions instead.

Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/crypto/omap-sham.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -105,7 +105,6 @@
 #define FLAGS_FINAL		1
 #define FLAGS_DMA_ACTIVE	2
 #define FLAGS_OUTPUT_READY	3
-#define FLAGS_INIT		4
 #define FLAGS_CPU		5
 #define FLAGS_DMA_READY		6
 #define FLAGS_AUTO_XOR		7
@@ -368,24 +367,6 @@ static void omap_sham_copy_ready_hash(struct ahash_request *req)
 			hash[i] = le32_to_cpup((__le32 *)in + i);
 }
 
-static int omap_sham_hw_init(struct omap_sham_dev *dd)
-{
-	int err;
-
-	err = pm_runtime_resume_and_get(dd->dev);
-	if (err < 0) {
-		dev_err(dd->dev, "failed to get sync: %d\n", err);
-		return err;
-	}
-
-	if (!test_bit(FLAGS_INIT, &dd->flags)) {
-		set_bit(FLAGS_INIT, &dd->flags);
-		dd->err = 0;
-	}
-
-	return 0;
-}
-
 static void omap_sham_write_ctrl_omap2(struct omap_sham_dev *dd, size_t length,
 				 int final, int dma)
 {
@@ -1093,10 +1074,13 @@ static int omap_sham_hash_one_req(struct crypto_engine *engine, void *areq)
 	dev_dbg(dd->dev, "hash-one: op: %u, total: %u, digcnt: %zd, final: %d",
 		ctx->op, ctx->total, ctx->digcnt, final);
 
-	err = omap_sham_hw_init(dd);
-	if (err)
+	err = pm_runtime_resume_and_get(dd->dev);
+	if (err < 0) {
+		dev_err(dd->dev, "failed to get sync: %d\n", err);
 		return err;
+	}
 
+	dd->err = 0;
 	dd->req = req;
 
 	if (ctx->digcnt)
-- 
2.32.0
