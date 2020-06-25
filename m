Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED2B209EB2
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 14:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404779AbgFYMnX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 08:43:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:45774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404285AbgFYMnX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Jun 2020 08:43:23 -0400
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9368A207E8;
        Thu, 25 Jun 2020 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593089003;
        bh=c+inIYObGSZUVYp7oF5MvXqUUSrjOBVfIrZv9HY3hO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XHnxyn+umL7xjsWbcPaEEpz9fmEaU36nRZlbaYhyeyHyJ7svn/xv3pTucjhOHQT/U
         W+0kAGtDwk48a+grcEYWi2/HaF3cgvOlAoPQtbXsUYqHoQzI1yQ8pRlCLjoSgWsjq+
         SdGtX6T3Kq7hMNPi6uenO6mm5dmnvaEpgDvgDbdw=
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
Subject: [PATCH 01/12] crypto: amlogic-gxl - default to build as module
Date:   Thu, 25 Jun 2020 14:42:42 +0200
Message-Id: <20200625124253.1906557-2-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625124253.1906557-1-ardb@kernel.org>
References: <20200625124253.1906557-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The AmLogic GXL crypto accelerator driver is built into the kernel if
ARCH_MESON is set. However, given the single image policy of arm64, its
defconfig enables all platforms by default, and so ARCH_MESON is usually
enabled.

This means that the AmLogic driver causes the arm64 defconfig build to
pull in a huge chunk of the crypto stack as a builtin as well, which is
undesirable, so let's make the amlogic GXL driver default to 'm' instead.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/amlogic/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/amlogic/Kconfig b/drivers/crypto/amlogic/Kconfig
index cf9547602670..cf2c676a7093 100644
--- a/drivers/crypto/amlogic/Kconfig
+++ b/drivers/crypto/amlogic/Kconfig
@@ -1,7 +1,7 @@
 config CRYPTO_DEV_AMLOGIC_GXL
 	tristate "Support for amlogic cryptographic offloader"
 	depends on HAS_IOMEM
-	default y if ARCH_MESON
+	default m if ARCH_MESON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ENGINE
 	select CRYPTO_ECB
-- 
2.27.0

