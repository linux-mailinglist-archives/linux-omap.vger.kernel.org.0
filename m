Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C402B1BE166
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgD2Ome (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:42:34 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55344 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgD2Ome (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:42:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgRqQ101686;
        Wed, 29 Apr 2020 09:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588171347;
        bh=ri+/lIeSNOTM3l+FNff6gZorR0Kh5OVSvczQZBkHThk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UqK22JWWrlA2aOJc7U9UqwD4vGTMHLikpFgdmyFz3FCCi9KBRNMHAq42jzT0H0dRo
         bJxru1BLo3QM4R2s7QkRrWNjnTx1KDLmRVMw7sZ4zYGE/CMaKWvRA89gosJJjB6SXw
         Bsc6iWfe0uQZ95dvPhWNNs4w8rbgt7A4GwqnMJLc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgRRr009946;
        Wed, 29 Apr 2020 09:42:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:42:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:42:27 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgHjQ103561;
        Wed, 29 Apr 2020 09:42:26 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH 6/6] crypto: omap-aes: prevent unregistering algorithms twice
Date:   Wed, 29 Apr 2020 17:42:05 +0300
Message-ID: <20200429144205.5291-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429144205.5291-1-t-kristo@ti.com>
References: <20200429144205.5291-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Most of the OMAP family SoCs contain two instances for AES core, which
causes the remove callbacks to be also done twice when driver is
removed. Fix the algorithm unregister callbacks to take into account the
number of algorithms still registered to avoid removing these twice.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 824ddf2a66ff..b5aff20c5900 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -1269,13 +1269,17 @@ static int omap_aes_remove(struct platform_device *pdev)
 	spin_unlock(&list_lock);
 
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
-		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
+		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--) {
 			crypto_unregister_skcipher(
 					&dd->pdata->algs_info[i].algs_list[j]);
+			dd->pdata->algs_info[i].registered--;
+		}
 
-	for (i = dd->pdata->aead_algs_info->size - 1; i >= 0; i--) {
+	for (i = dd->pdata->aead_algs_info->registered - 1; i >= 0; i--) {
 		aalg = &dd->pdata->aead_algs_info->algs_list[i];
 		crypto_unregister_aead(aalg);
+		dd->pdata->aead_algs_info->registered--;
+
 	}
 
 	crypto_engine_exit(dd->engine);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
