Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC725E5DC7
	for <lists+linux-omap@lfdr.de>; Sat, 26 Oct 2019 16:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfJZOx5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Oct 2019 10:53:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:37202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfJZOx4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 26 Oct 2019 10:53:56 -0400
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7675214DA;
        Sat, 26 Oct 2019 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572101636;
        bh=j38MFIQEBmGfRoLFXgH4RHB1dhx3cVtIlDkdUFYfEFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f2nlrQLd3AXZWCOemwMdpaWBvIC8A3BLvhrdNTBwUFUQi4oXtklPKvn08J968usOU
         Ym6F1ddQwHPsZooC5YAJX1ZyQ7C0g58QxSYZUrlIhq1uSaS9/IyWLAUC2CIygG5U2O
         mq5aLysPjkEluGmNPFBwQGnrdOUZwcLFfzjVSGxc=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>,
        linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 4/6] crypto: omap-aes-gcm - add missing .setauthsize hooks
Date:   Sat, 26 Oct 2019 16:52:57 +0200
Message-Id: <20191026145259.16040-5-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026145259.16040-1-ardb@kernel.org>
References: <20191026145259.16040-1-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

GCM only permits certain tag lengths, so populate the .setauthsize
hooks which ensure that only permitted sizes are accepted by the
implementation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
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

