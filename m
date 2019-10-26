Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2EB3E5DC2
	for <lists+linux-omap@lfdr.de>; Sat, 26 Oct 2019 16:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfJZOxu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Oct 2019 10:53:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:37128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfJZOxu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 26 Oct 2019 10:53:50 -0400
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6285B21655;
        Sat, 26 Oct 2019 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572101629;
        bh=8sAyKk8mt7SfTyUDT5mY7Ohm9Bw9dXaUue3oAQpCcn0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f3RCdZvD8eCd9S97bhOgYSFCNTMqmdGH4PPrcqdk30i+EcTnfEiLS/Z4GzF0pr6WD
         4T/84YzYVcEuOjuLCYWcobXCwMrRa56KhuUervq4XhdjawWueKmrqiBX7C09+fQt4E
         jWD6oJflb3Icjc4bCmV+UjRgxGb7d2w0UVljnQp4=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>,
        linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 1/6] crypto: omap-aes - reject invalid input sizes for block modes
Date:   Sat, 26 Oct 2019 16:52:54 +0200
Message-Id: <20191026145259.16040-2-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026145259.16040-1-ardb@kernel.org>
References: <20191026145259.16040-1-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Block modes such as ECB and CBC only support input sizes that are
a round multiple of the block size, so align with the generic code
which returns -EINVAL when encountering inputs that violate this
rule.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/omap-aes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index de05b35283bf..067f4cd7c005 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -525,6 +525,9 @@ static int omap_aes_crypt(struct skcipher_request *req, unsigned long mode)
 	struct omap_aes_dev *dd;
 	int ret;
 
+	if ((req->cryptlen % AES_BLOCK_SIZE) && !(mode & FLAGS_CTR))
+		return -EINVAL;
+
 	pr_debug("nbytes: %d, enc: %d, cbc: %d\n", req->cryptlen,
 		  !!(mode & FLAGS_ENCRYPT),
 		  !!(mode & FLAGS_CBC));
-- 
2.17.1

