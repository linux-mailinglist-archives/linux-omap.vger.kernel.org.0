Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE653D730A
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236251AbhG0KX7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:23:59 -0400
Received: from muru.com ([72.249.23.125]:55814 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236186AbhG0KXv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:23:51 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5F2208106;
        Tue, 27 Jul 2021 10:24:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 2/6] crypto: omap-sham - initialize req only after omap_sham_hw_init()
Date:   Tue, 27 Jul 2021 13:23:35 +0300
Message-Id: <20210727102339.49141-2-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727102339.49141-1-tony@atomide.com>
References: <20210727102339.49141-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's only initialize dd->req after omap_sham_hw_init() in case of
errors.

Looks like leaving dd->req initialized on omap_sham_hw_init() errors is
is not causing issues though as we return on errors. So this patch can be
applied as clean-up.

Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/crypto/omap-sham.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -1093,12 +1093,12 @@ static int omap_sham_hash_one_req(struct crypto_engine *engine, void *areq)
 	dev_dbg(dd->dev, "hash-one: op: %u, total: %u, digcnt: %zd, final: %d",
 		ctx->op, ctx->total, ctx->digcnt, final);
 
-	dd->req = req;
-
 	err = omap_sham_hw_init(dd);
 	if (err)
 		return err;
 
+	dd->req = req;
+
 	if (ctx->digcnt)
 		dd->pdata->copy_hash(req, 0);
 
-- 
2.32.0
