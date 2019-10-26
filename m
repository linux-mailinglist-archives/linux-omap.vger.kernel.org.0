Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09FEFE5DC3
	for <lists+linux-omap@lfdr.de>; Sat, 26 Oct 2019 16:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbfJZOxw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Oct 2019 10:53:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:37170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfJZOxw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 26 Oct 2019 10:53:52 -0400
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DE9F214DA;
        Sat, 26 Oct 2019 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572101632;
        bh=nJSqzffn18xs1Qhu2a2UoMrbK1GaidB+6eMn6G00Sto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0m2bIK18yNnYhKWdZes8TPmAes4FUNRfUbqqEYiWckg9hTENNM2oJmx4ZaOTxQfO3
         9Eml5PPUh30XS5NvAHEZQOXEgyDaS2YClEUdXfWUPziIDQUBlVYrvkY0PnoSWLNODG
         NBJRGYushXYi9dzFmCQhYFvMAaBwJHumH//1BNaQ=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>,
        linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 2/6] crypto: omap-aes-ctr - set blocksize to 1
Date:   Sat, 26 Oct 2019 16:52:55 +0200
Message-Id: <20191026145259.16040-3-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026145259.16040-1-ardb@kernel.org>
References: <20191026145259.16040-1-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

CTR is a streamcipher mode of AES, so set the blocksize accordingly.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
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

