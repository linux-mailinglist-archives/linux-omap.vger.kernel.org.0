Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41450EFF49
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389430AbfKEOB7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:59 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35218 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389429AbfKEOB7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:59 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1p61038233;
        Tue, 5 Nov 2019 08:01:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962511;
        bh=Fy9RhC6tUOYLCrTUDsYzuh5bXy3NK5kpC2mGjoRFUPE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UNqbLGfv9bGDddhm5a4GJv8q80u7GytwMr0iExRzM9KlBZo0iiVQFiHtRDHCrP4uH
         Vv72P50cbKn6kgxj87MkEy3X3w19lQZRwSPW7uCJj5mpAsscKPtw+FlduXvhreXL82
         mV1z4IAELVUNcguLboAslizdSvf/jZR594yyDY3k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1pol059894
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:51 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:34 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFr068289;
        Tue, 5 Nov 2019 08:01:47 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCHv2 14/22] crypto: omap-aes-gcm - add missing .setauthsize hooks
Date:   Tue, 5 Nov 2019 16:01:03 +0200
Message-ID: <20191105140111.20285-15-t-kristo@ti.com>
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

GCM only permits certain tag lengths, so populate the .setauthsize
hooks which ensure that only permitted sizes are accepted by the
implementation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes-gcm.c | 11 +++++++++++
 drivers/crypto/omap-aes.c     |  2 ++
 drivers/crypto/omap-aes.h     |  3 +++
 3 files changed, 16 insertions(+)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 05d2fe78b105..70398fbd669d 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -413,3 +413,14 @@ int omap_aes_4106gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 
 	return 0;
 }
+
+int omap_aes_gcm_setauthsize(struct crypto_aead *tfm, unsigned int authsize)
+{
+	return crypto_gcm_check_authsize(authsize);
+}
+
+int omap_aes_4106gcm_setauthsize(struct crypto_aead *parent,
+				 unsigned int authsize)
+{
+	return crypto_rfc4106_check_authsize(authsize);
+}
diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 33cba7a2d6df..161af3bf667c 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -787,6 +787,7 @@ static struct aead_alg algs_aead_gcm[] = {
 	.ivsize		= GCM_AES_IV_SIZE,
 	.maxauthsize	= AES_BLOCK_SIZE,
 	.setkey		= omap_aes_gcm_setkey,
+	.setauthsize	= omap_aes_gcm_setauthsize,
 	.encrypt	= omap_aes_gcm_encrypt,
 	.decrypt	= omap_aes_gcm_decrypt,
 },
@@ -807,6 +808,7 @@ static struct aead_alg algs_aead_gcm[] = {
 	.maxauthsize	= AES_BLOCK_SIZE,
 	.ivsize		= GCM_RFC4106_IV_SIZE,
 	.setkey		= omap_aes_4106gcm_setkey,
+	.setauthsize	= omap_aes_4106gcm_setauthsize,
 	.encrypt	= omap_aes_4106gcm_encrypt,
 	.decrypt	= omap_aes_4106gcm_decrypt,
 },
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index 2d3575231e31..1bcca7957e92 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -202,8 +202,11 @@ int omap_aes_4106gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 			    unsigned int keylen);
 int omap_aes_gcm_encrypt(struct aead_request *req);
 int omap_aes_gcm_decrypt(struct aead_request *req);
+int omap_aes_gcm_setauthsize(struct crypto_aead *tfm, unsigned int authsize);
 int omap_aes_4106gcm_encrypt(struct aead_request *req);
 int omap_aes_4106gcm_decrypt(struct aead_request *req);
+int omap_aes_4106gcm_setauthsize(struct crypto_aead *parent,
+				 unsigned int authsize);
 int omap_aes_write_ctrl(struct omap_aes_dev *dd);
 int omap_aes_crypt_dma_start(struct omap_aes_dev *dd);
 int omap_aes_crypt_dma_stop(struct omap_aes_dev *dd);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
