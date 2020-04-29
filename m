Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5708C1BE15B
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgD2Om3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:42:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55314 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgD2Om3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:42:29 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgLRG101667;
        Wed, 29 Apr 2020 09:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588171341;
        bh=gNPn50pxUfawldLhCux6x7Fp2+dqpJBz1HTS7H4u3SU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ptsm6TgX5PorJJTxg3iEoxHvc5b7bPZnVevvKke4pluo2/t2FzVxo+GXXVNdAT/4M
         RxVOvbKpGs0A5G/qgUhDvOjMMa+BIwf2STsxcSI7pmsQbWAHDjBUvmSENVhqA7xs1m
         vVcZmUxnLyaCLRZ4aJaPGWif0wasVfwCPNvpKnKo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TEgLNO012392
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 09:42:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:42:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:42:21 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgHjM103561;
        Wed, 29 Apr 2020 09:42:20 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH 2/6] crypto: omap-sham: force kernel driver usage for sha algos
Date:   Wed, 29 Apr 2020 17:42:01 +0300
Message-ID: <20200429144205.5291-3-t-kristo@ti.com>
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

As the hardware acceleration for the omap-sham algos is not available
from userspace, force kernel driver usage. Without this flag in place,
openssl 1.1 implementation thinks it can accelerate sha algorithms on
omap devices directly from userspace.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index e4072cd38585..0c837bbd8f0c 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -1584,7 +1584,8 @@ static struct ahash_alg algs_sha224_sha256[] = {
 		.cra_name		= "sha224",
 		.cra_driver_name	= "omap-sha224",
 		.cra_priority		= 400,
-		.cra_flags		= CRYPTO_ALG_ASYNC |
+		.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_ASYNC |
 						CRYPTO_ALG_NEED_FALLBACK,
 		.cra_blocksize		= SHA224_BLOCK_SIZE,
 		.cra_ctxsize		= sizeof(struct omap_sham_ctx),
@@ -1605,7 +1606,8 @@ static struct ahash_alg algs_sha224_sha256[] = {
 		.cra_name		= "sha256",
 		.cra_driver_name	= "omap-sha256",
 		.cra_priority		= 400,
-		.cra_flags		= CRYPTO_ALG_ASYNC |
+		.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_ASYNC |
 						CRYPTO_ALG_NEED_FALLBACK,
 		.cra_blocksize		= SHA256_BLOCK_SIZE,
 		.cra_ctxsize		= sizeof(struct omap_sham_ctx),
@@ -1627,7 +1629,8 @@ static struct ahash_alg algs_sha224_sha256[] = {
 		.cra_name		= "hmac(sha224)",
 		.cra_driver_name	= "omap-hmac-sha224",
 		.cra_priority		= 400,
-		.cra_flags		= CRYPTO_ALG_ASYNC |
+		.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_ASYNC |
 						CRYPTO_ALG_NEED_FALLBACK,
 		.cra_blocksize		= SHA224_BLOCK_SIZE,
 		.cra_ctxsize		= sizeof(struct omap_sham_ctx) +
@@ -1650,7 +1653,8 @@ static struct ahash_alg algs_sha224_sha256[] = {
 		.cra_name		= "hmac(sha256)",
 		.cra_driver_name	= "omap-hmac-sha256",
 		.cra_priority		= 400,
-		.cra_flags		= CRYPTO_ALG_ASYNC |
+		.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_ASYNC |
 						CRYPTO_ALG_NEED_FALLBACK,
 		.cra_blocksize		= SHA256_BLOCK_SIZE,
 		.cra_ctxsize		= sizeof(struct omap_sham_ctx) +
@@ -1675,7 +1679,8 @@ static struct ahash_alg algs_sha384_sha512[] = {
 		.cra_name		= "sha384",
 		.cra_driver_name	= "omap-sha384",
 		.cra_priority		= 400,
-		.cra_flags		= CRYPTO_ALG_ASYNC |
+		.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_ASYNC |
 						CRYPTO_ALG_NEED_FALLBACK,
 		.cra_blocksize		= SHA384_BLOCK_SIZE,
 		.cra_ctxsize		= sizeof(struct omap_sham_ctx),
@@ -1696,7 +1701,8 @@ static struct ahash_alg algs_sha384_sha512[] = {
 		.cra_name		= "sha512",
 		.cra_driver_name	= "omap-sha512",
 		.cra_priority		= 400,
-		.cra_flags		= CRYPTO_ALG_ASYNC |
+		.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_ASYNC |
 						CRYPTO_ALG_NEED_FALLBACK,
 		.cra_blocksize		= SHA512_BLOCK_SIZE,
 		.cra_ctxsize		= sizeof(struct omap_sham_ctx),
@@ -1718,7 +1724,8 @@ static struct ahash_alg algs_sha384_sha512[] = {
 		.cra_name		= "hmac(sha384)",
 		.cra_driver_name	= "omap-hmac-sha384",
 		.cra_priority		= 400,
-		.cra_flags		= CRYPTO_ALG_ASYNC |
+		.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_ASYNC |
 						CRYPTO_ALG_NEED_FALLBACK,
 		.cra_blocksize		= SHA384_BLOCK_SIZE,
 		.cra_ctxsize		= sizeof(struct omap_sham_ctx) +
@@ -1741,7 +1748,8 @@ static struct ahash_alg algs_sha384_sha512[] = {
 		.cra_name		= "hmac(sha512)",
 		.cra_driver_name	= "omap-hmac-sha512",
 		.cra_priority		= 400,
-		.cra_flags		= CRYPTO_ALG_ASYNC |
+		.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_ASYNC |
 						CRYPTO_ALG_NEED_FALLBACK,
 		.cra_blocksize		= SHA512_BLOCK_SIZE,
 		.cra_ctxsize		= sizeof(struct omap_sham_ctx) +
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
