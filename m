Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6FCE5DBF
	for <lists+linux-omap@lfdr.de>; Sat, 26 Oct 2019 16:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfJZOxs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Oct 2019 10:53:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:37108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfJZOxs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 26 Oct 2019 10:53:48 -0400
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A12D2070B;
        Sat, 26 Oct 2019 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572101627;
        bh=rLr6DhQ+NRLBECKz8379egB6foucWSVhegyIVgRiXHU=;
        h=From:To:Cc:Subject:Date:From;
        b=JVCrCATbOmcXYC2ISItvmAS9PmtfMwFWVWf4NrcECfU9xcyYW481U+GxVDJYJKcTK
         RG4J1JDWs2BHwgJ+4+t2XI4dXGpPObXkFcrBnP5qtv6kg/fl9x5fK3SuCehFdAti+j
         DAnCZJjgimjktZO8Z4y3WOfdfirv9rrWz0fI5IK0=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>,
        linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/6] crypto: additional fixes for omap-aes
Date:   Sat, 26 Oct 2019 16:52:53 +0200
Message-Id: <20191026145259.16040-1-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series applies onto Tero's series [0], and addresses a number of
additional issues that exist in the omap-aes driver that aren't being
addresses by Tero's fixes.

Note that the resulting code is still not 100% correct: an issue remains
where inputs into GCM consisting solely of assocdata are not being processed
correctly, e.g.,

alg: aead: gcm-aes-omap encryption test failed (wrong result) on test vector
  "random: alen=38 plen=0 authsize=16 klen=32",
   cfg="random: inplace may_sleep use_digest src_divs=[100.0%@+19] iv_offset=31"

I have no idea how to fix this, so I'll leave this to people that know this
hardware and have access to the Sitara TRM.

Note that I also spotted some issues in the SHAM driver, i.e.,

alg: ahash: omap-sha1 test failed (wrong result) on test vector
  "random: psize=7928 ksize=0", cfg="random: inplace use_final 
      src_divs=[5.64%@+13, 59.70%@+18, <flush>31.53%@+4072,
      <flush,nosimd>3.13%@alignmask+263]"
alg: ahash: omap-hmac-sha256 test failed (wrong result) on test vector
  "random: psize=960 ksize=37", cfg="random: inplace use_final
      src_divs=[32.54%@+2449, 17.18%@+4, <flush>50.28%@+1] iv_offset=31"

All of these failures are triggered by CONFIG_CRYPTO_MANAGER_EXTRA_TESTS,
so they will not show up when using the standard set of test vectors.

[0] https://lore.kernel.org/linux-crypto/20191017122549.4634-1-t-kristo@ti.com/

Cc: linux-omap@vger.kernel.org
Cc: Tero Kristo <t-kristo@ti.com>

Ard Biesheuvel (6):
  crypto: omap-aes - reject invalid input sizes for block modes
  crypto: omap-aes-ctr - set blocksize to 1
  crypto: omap-aes-gcm - deal with memory allocation failure
  crypto: omap-aes-gcm - add missing .setauthsize hooks
  crypto: omap-aes-gcm - check length of assocdata in RFC4106 mode
  crypto: omap-aes-gcm - use the AES library to encrypt the tag

 drivers/crypto/omap-aes-gcm.c | 119 ++++++++------------
 drivers/crypto/omap-aes.c     |  33 ++----
 drivers/crypto/omap-aes.h     |  10 +-
 3 files changed, 61 insertions(+), 101 deletions(-)

-- 
2.17.1

