Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C736EFF43
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389419AbfKEOBw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:52 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35170 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389416AbfKEOBw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:52 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1jvW038208;
        Tue, 5 Nov 2019 08:01:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962505;
        bh=x+b6VIJEL39omp1au72B8HOV7pXjNXoHA6sjkn0go0s=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Sx1fjDQKGS9ANr8iPshkNdtkEVEZIPcQk5ZSG8XYJBelHSbgkV3vY0VPylj8hpSiu
         u2CzNgDhXdcR7arBUwiTuzfsiT9r94bNryxDq5HEaCINm8uI5heog3Bo6dvMvuuvgu
         yfTAPIsHbbTr1WEwuo0imQyiqwk3+wdr5ldXdd+Q=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1j0p008088
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:45 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 08:01:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:30 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFp068289;
        Tue, 5 Nov 2019 08:01:43 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCHv2 12/22] crypto: omap-aes-ctr - set blocksize to 1
Date:   Tue, 5 Nov 2019 16:01:01 +0200
Message-ID: <20191105140111.20285-13-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105140111.20285-1-t-kristo@ti.com>
References: <20191105140111.20285-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ard Biesheuvel <ardb@kernel.org>

CTR is a streamcipher mode of AES, so set the blocksize accordingly.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 067f4cd7c005..33cba7a2d6df 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -747,7 +747,7 @@ static struct skcipher_alg algs_ctr[] = {
 	.base.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
 				  CRYPTO_ALG_ASYNC |
 				  CRYPTO_ALG_NEED_FALLBACK,
-	.base.cra_blocksize	= AES_BLOCK_SIZE,
+	.base.cra_blocksize	= 1,
 	.base.cra_ctxsize	= sizeof(struct omap_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
