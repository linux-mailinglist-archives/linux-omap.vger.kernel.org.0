Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C309216666
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 08:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgGGGci (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 02:32:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:60876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgGGGci (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 02:32:38 -0400
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr [109.242.21.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82EAC206DF;
        Tue,  7 Jul 2020 06:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594103557;
        bh=T2rWa4fD1AY+zpGBQeUredv454FS3kKUfTbRuHDYTuY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wy8ccvQiIITbSNEZ9EJgIo1g+ohBogOVvibhKZ26IyvCHjqKoIVPAODS7npQg9KKX
         /N7qTX8wmZY1+SKloQxb9dT8vM5RoLeecMf+vAS15CKt1AMAzgtgrNfp0AUUg6mxd8
         vQTFJXY2+xw6lvA4RtV3DyhRu0EikgHVAXj1fAM8=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>,
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
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH v4 01/13] crypto: amlogic-gxl - default to build as module
Date:   Tue,  7 Jul 2020 09:31:51 +0300
Message-Id: <20200707063203.5018-2-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
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
Tested-by: Corentin Labbe <clabbe@baylibre.com>
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
2.17.1

