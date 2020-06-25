Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C003209EAF
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 14:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404765AbgFYMnU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 08:43:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:45714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404285AbgFYMnT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Jun 2020 08:43:19 -0400
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8631F206BE;
        Thu, 25 Jun 2020 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593088999;
        bh=L8fU5fAz7pCpg4HnWH2xhwqLiRr2Tw/EYLrtbhRzhMk=;
        h=From:To:Cc:Subject:Date:From;
        b=uLKslSnGx7g/s55qBe761CpJrI854/NuYwG6EgQgXUG+Nia3TSmvkIajhlbPwVPwh
         BDsI+JcTMOAdhdz7XuMWt2k9b9IKTRGM3fyMVcUKxd+ae7hr7JxbqM6DbbNQVMVdPc
         DqzzoonHEA1JiqOmJTfhABgOdbjp7Np/KAAZTk3M=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Ayush Sawal <ayush.sawal@chelsio.com>,
        Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
        Rohit Maheshwari <rohitm@chelsio.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jamie Iles <jamie@jamieiles.com>,
        Eric Biggers <ebiggers@google.com>
Subject: [PATCH 00/12] crypto: permit asynchronous skciphers as driver fallbacks
Date:   Thu, 25 Jun 2020 14:42:41 +0200
Message-Id: <20200625124253.1906557-1-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The drivers for crypto accelerators in drivers/crypto all implement skciphers
of an asynchronous nature, given that they are backed by hardware DMA that
completes asynchronously wrt the execution flow.

However, in many cases, any fallbacks they allocate are limited to the
synchronous variety, which rules out the use of SIMD implementations of
AES in ECB, CBC and XTS modes, given that they are usually built on top
of the asynchronous SIMD helper, which queues requests for asynchronous
completion if they are issued from a context that does not permit the use
of the SIMD register file.

This may result in sub-optimal AES implementations to be selected as
fallbacks, or even less secure ones if the only synchronous alternative
is table based, and therefore not time invariant.

So switch all these cases over to the asynchronous API, by moving the
subrequest into the skcipher request context, and permitting it to
complete asynchronously via the caller provided completion function.

Patch #1 is not related, but touches the same driver as #2 so it is
included anyway.

Only OMAP was tested on actual hardware - the others are build tested only.

Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>
Cc: Rohit Maheshwari <rohitm@chelsio.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Jamie Iles <jamie@jamieiles.com>
Cc: Eric Biggers <ebiggers@google.com>

Ard Biesheuvel (12):
  crypto: amlogic-gxl - default to build as module
  crypto: amlogic-gxl - permit async skcipher as fallback
  crypto: omap-aes - permit asynchronous skcipher as fallback
  crypto: sun4i - permit asynchronous skcipher as fallback
  crypto: sun8i-ce - permit asynchronous skcipher as fallback
  crypto: sun8i-ss - permit asynchronous skcipher as fallback
  crypto: ccp - permit asynchronous skcipher as fallback
  crypto: chelsio - permit asynchronous skcipher as fallback
  crypto: mxs-dcp - permit asynchronous skcipher as fallback
  crypto: picoxcell - permit asynchronous skcipher as fallback
  crypto: qce - permit asynchronous skcipher as fallback
  crypto: sahara - permit asynchronous skcipher as fallback

 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c | 46 +++++-----
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h        |  3 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 41 ++++-----
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        |  3 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 39 ++++----
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h        |  3 +-
 drivers/crypto/amlogic/Kconfig                      |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c         | 27 +++---
 drivers/crypto/amlogic/amlogic-gxl.h                |  3 +-
 drivers/crypto/ccp/ccp-crypto-aes-xts.c             | 31 +++----
 drivers/crypto/ccp/ccp-crypto.h                     |  4 +-
 drivers/crypto/chelsio/chcr_algo.c                  | 57 +++++-------
 drivers/crypto/chelsio/chcr_crypto.h                |  3 +-
 drivers/crypto/mxs-dcp.c                            | 33 +++----
 drivers/crypto/omap-aes.c                           | 35 ++++---
 drivers/crypto/omap-aes.h                           |  3 +-
 drivers/crypto/picoxcell_crypto.c                   | 34 ++++---
 drivers/crypto/qce/cipher.h                         |  3 +-
 drivers/crypto/qce/skcipher.c                       | 27 +++---
 drivers/crypto/sahara.c                             | 96 +++++++++-----------
 20 files changed, 244 insertions(+), 249 deletions(-)

-- 
2.27.0

