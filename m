Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90824EFF48
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389425AbfKEOB6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:58 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45296 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389421AbfKEOB6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:58 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1qZg101208;
        Tue, 5 Nov 2019 08:01:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962513;
        bh=x6mnPZEAweuMt7UUUU0v9RH245BYNKQW3yqgTHTHW8g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jj+l/hj+ItZh11o8chsD2acLLs142KzZqbRjjonBUFgpf265NAPyDtZgy2v0jR6dl
         hL5hnXxsBWZGX7F30uEurimcaME82uM0QucKHZRB3V0ZVVUa6Bgm/D2KR1V8fVXz7Z
         jIZQfUWhTLrVL5AXOFysXNwDNVaA64v81AZzxunw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1qas008211
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:52 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:36 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFs068289;
        Tue, 5 Nov 2019 08:01:49 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCHv2 15/22] crypto: omap-aes-gcm - check length of assocdata in RFC4106 mode
Date:   Tue, 5 Nov 2019 16:01:04 +0200
Message-ID: <20191105140111.20285-16-t-kristo@ti.com>
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

RFC4106 requires the associated data to be a certain size, so reject
inputs that are wrong. This also prevents crashes or other problems due
to assoclen becoming negative after subtracting 8 bytes.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes-gcm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 70398fbd669d..1aabf9a72066 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -365,7 +365,8 @@ int omap_aes_4106gcm_encrypt(struct aead_request *req)
 
 	memcpy(rctx->iv, ctx->nonce, 4);
 	memcpy(rctx->iv + 4, req->iv, 8);
-	return omap_aes_gcm_crypt(req, FLAGS_ENCRYPT | FLAGS_GCM |
+	return crypto_ipsec_check_assoclen(req->assoclen) ?:
+	       omap_aes_gcm_crypt(req, FLAGS_ENCRYPT | FLAGS_GCM |
 				  FLAGS_RFC4106_GCM);
 }
 
@@ -376,7 +377,8 @@ int omap_aes_4106gcm_decrypt(struct aead_request *req)
 
 	memcpy(rctx->iv, ctx->nonce, 4);
 	memcpy(rctx->iv + 4, req->iv, 8);
-	return omap_aes_gcm_crypt(req, FLAGS_GCM | FLAGS_RFC4106_GCM);
+	return crypto_ipsec_check_assoclen(req->assoclen) ?:
+	       omap_aes_gcm_crypt(req, FLAGS_GCM | FLAGS_RFC4106_GCM);
 }
 
 int omap_aes_gcm_setkey(struct crypto_aead *tfm, const u8 *key,
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
