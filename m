Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B0B20C037
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jun 2020 10:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgF0Igg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Jun 2020 04:36:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbgF0Igg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 27 Jun 2020 04:36:36 -0400
Received: from dogfood.home (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEEE8207FC;
        Sat, 27 Jun 2020 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593246995;
        bh=AGJG6MRW6cS+GBuTXX6phwza1LeF4svVTU7KsEF6MYI=;
        h=From:To:Cc:Subject:Date:From;
        b=V0a7lTRjEUQv8fjsdrmREWQ//7dF9YdyaOSIvGCntd9GuVSJ62WMT+FxlUURR1N6r
         pwc7iS6iY1yLdMX+8PdelNbEFf/urdbydvE3rINSugP05HXJO8cM+bFqTKn5yETVq6
         MqCS4dGIJHmr6gmEUAjU9SAS5P0xXEeni9No7eE8=
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
        Eric Biggers <ebiggers@google.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 00/13] crypto: permit asynchronous skciphers as driver fallbacks
Date:   Sat, 27 Jun 2020 10:36:10 +0200
Message-Id: <20200627083623.2428333-1-ardb@kernel.org>
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
included anyway. Patch #13 removes another sync skcipher allocation by
switching to the AES library interface.

Only OMAP was tested on actual hardware - the others are build tested only.

v2:
- address issue found by build robot in patch #7
- add patch #13
- rebase onto cryptodev/master

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
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>

Ard Biesheuvel (13):
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
  crypto: mediatek - use AES library for GCM key derivation

 drivers/crypto/Kconfig                              |  3 +-
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c | 46 +++++-----
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h        |  3 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 41 ++++-----
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        |  3 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 39 ++++----
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h        |  3 +-
 drivers/crypto/amlogic/Kconfig                      |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c         | 27 +++---
 drivers/crypto/amlogic/amlogic-gxl.h                |  3 +-
 drivers/crypto/ccp/ccp-crypto-aes-xts.c             | 33 ++++---
 drivers/crypto/ccp/ccp-crypto.h                     |  4 +-
 drivers/crypto/chelsio/chcr_algo.c                  | 57 +++++-------
 drivers/crypto/chelsio/chcr_crypto.h                |  3 +-
 drivers/crypto/mediatek/mtk-aes.c                   | 63 ++-----------
 drivers/crypto/mxs-dcp.c                            | 33 +++----
 drivers/crypto/omap-aes.c                           | 35 ++++---
 drivers/crypto/omap-aes.h                           |  3 +-
 drivers/crypto/picoxcell_crypto.c                   | 34 ++++---
 drivers/crypto/qce/cipher.h                         |  3 +-
 drivers/crypto/qce/skcipher.c                       | 27 +++---
 drivers/crypto/sahara.c                             | 96 +++++++++-----------
 22 files changed, 254 insertions(+), 307 deletions(-)

-- 
2.27.0

