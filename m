Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63140E5DC6
	for <lists+linux-omap@lfdr.de>; Sat, 26 Oct 2019 16:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfJZOxy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Oct 2019 10:53:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:37186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfJZOxy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 26 Oct 2019 10:53:54 -0400
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABDB92070B;
        Sat, 26 Oct 2019 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572101634;
        bh=SmDraQe5IZLOG+WLxMhmI/EhoYeINysU8csTg6xa8F4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xcZ3QJDuPTu5jFBkBWRXTkOUoHLsDsflyjB+t4Tf2Pvx+x3kKyMX1HDiNdUudjAYx
         r1+vibniNvBkRxcUiHQYaNTOVhd2PnOI+UbF0IQ5WP10C/2xivvAOyzypFvf1qVggE
         fkjZyrqwzn7oenlDWxG+8onGKC5Aiyw/UMoB0ckU=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>,
        linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 3/6] crypto: omap-aes-gcm - deal with memory allocation failure
Date:   Sat, 26 Oct 2019 16:52:56 +0200
Message-Id: <20191026145259.16040-4-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026145259.16040-1-ardb@kernel.org>
References: <20191026145259.16040-1-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP gcm(aes) driver invokes omap_crypto_align_sg() without
dealing with the errors it may return, resulting in a crash if
the routine fails in a __get_free_pages(GFP_ATOMIC) call. So
bail and return the error rather than limping on if one occurs.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/omap-aes-gcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index dfd4d1cac421..05d2fe78b105 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -120,6 +120,8 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 					   OMAP_CRYPTO_FORCE_SINGLE_ENTRY,
 					   FLAGS_ASSOC_DATA_ST_SHIFT,
 					   &dd->flags);
+		if (ret)
+			return ret;
 	}
 
 	if (cryptlen) {
@@ -132,6 +134,8 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 					   OMAP_CRYPTO_FORCE_SINGLE_ENTRY,
 					   FLAGS_IN_DATA_ST_SHIFT,
 					   &dd->flags);
+		if (ret)
+			return ret;
 	}
 
 	dd->in_sg = dd->in_sgl;
-- 
2.17.1

