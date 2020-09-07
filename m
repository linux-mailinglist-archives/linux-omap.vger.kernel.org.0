Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5628625F46B
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 09:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgIGH4j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 03:56:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60000 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgIGH4b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 03:56:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0877uREW040328;
        Mon, 7 Sep 2020 02:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599465387;
        bh=+X+OdHMRSBJDgTQJn3KQpINmLrT5Nf4eky2VlZ3tD7w=;
        h=From:To:CC:Subject:Date;
        b=I+ql2TXpNNqaIkRhw3ixdUf7GysxnbY8h7PlW5FMsJQ1xIaHIfRAre+TSBCWhLic3
         /rR6sNinrEhywfuKXTwXO+YAGV0FkDHltsPKuij5atloVASoYUB71Xo5pfrf26Y+QX
         AWRC02Cu+vYqIE4naIyFQz7BpfEFObuwX4/yrL9w=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0877uROH080744;
        Mon, 7 Sep 2020 02:56:27 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 02:56:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 02:56:26 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0877uPAY054757;
        Mon, 7 Sep 2020 02:56:25 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH] crypto: omap-sham: fix digcnt register handling with export/import
Date:   Mon, 7 Sep 2020 10:56:24 +0300
Message-ID: <20200907075624.32379-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Running export/import for hashes in peculiar order (mostly done by
openssl) can mess up the internal book keeping of the OMAP SHA core.
Fix by forcibly writing the correct DIGCNT back to hardware. This issue
was noticed while transitioning to openssl 1.1 support.

Fixes: 0d373d603202 ("crypto: omap-sham - Add OMAP4/AM33XX SHAM Support")
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index b2b930a1fb04..a3b38d2c92e7 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -460,6 +460,9 @@ static void omap_sham_write_ctrl_omap4(struct omap_sham_dev *dd, size_t length,
 	struct omap_sham_reqctx *ctx = ahash_request_ctx(dd->req);
 	u32 val, mask;
 
+	if (likely(ctx->digcnt))
+		omap_sham_write(dd, SHA_REG_DIGCNT(dd), ctx->digcnt);
+
 	/*
 	 * Setting ALGO_CONST only for the first iteration and
 	 * CLOSE_HASH only for the last one. Note that flags mode bits
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
