Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D2644C5DB
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 18:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbhKJRUR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 12:20:17 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103]:16480 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbhKJRUP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 12:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636564635;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3WxCiJju1Jj7ObO+gVh3oAZ8JmxUqs06i+MBBHM9dzs=;
    b=AeVdW1Q0pCbUftpgf15jDxLMxSCRP3MAPfueigMWE+AlXTqxvM+Lfs0fDPivU1P+J+
    uVfn3Kj2iZuH6ltpUw4lOur8fSw8fIcOu81mB26lIcRC85y0Vq4XIYDd/RxaOPfLKL1l
    ce1mWNkuSp3H+naK5uuTYnzdVUtaqRmbvrnzPfj/gcXyeZseC24H/5oes0bkYtUIqAl3
    0tZw0LPA6VjZt/SLcQSptMBXu8LMvnOFobfdEGV4EEFPRufyh7fs4aR/GVz0037l9WtE
    ji1JzfJ6j1iZez6ZHy6RivXGC/7yo6GMa0+JlEP0Kg37CSZFgUGXvk92RKhGmu9kae4x
    M6Nw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdfLlf0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id Y02aa4xAAHHF51f
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 10 Nov 2021 18:17:15 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= 
        <jerome.pouiller@silabs.com>, Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Bean Huo <beanhuo@micron.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Yang Li <abaci-bugfix@linux.alibaba.com>
Cc:     notasas@gmail.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: [PATCH v2 3/6] mmc: core: provide macro and table to match the device tree to apply quirks
Date:   Wed, 10 Nov 2021 18:17:08 +0100
Message-Id: <b13fd8b3eebc3c23b6816b254a518c224cbdcfd4.1636564631.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636564631.git.hns@goldelico.com>
References: <cover.1636564631.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This (initially empty) table allows to match quirks early based
on .compatible of the child node of some mmc/sdio interface.

This allows to add quirks based on device tree instead of having
card specific code in the host ops.

A new macro SDIO_FIXUP_COMPATIBLE makes the definition readable.

And we call mmc_fixup_device(sdio_card_init_methods) just after
where host->ops->init_card() can be optionally called.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/mmc/core/card.h   | 15 +++++++++++++++
 drivers/mmc/core/quirks.h |  4 ++++
 drivers/mmc/core/sdio.c   |  1 +
 3 files changed, 20 insertions(+)

diff --git a/drivers/mmc/core/card.h b/drivers/mmc/core/card.h
index 483e7f2f1039e..216faf5ad1021 100644
--- a/drivers/mmc/core/card.h
+++ b/drivers/mmc/core/card.h
@@ -122,6 +122,21 @@ struct mmc_fixup {
 		   _vendor, _device,					\
 		   _fixup, _data, EXT_CSD_REV_ANY)			\
 
+#define SDIO_FIXUP_COMPATIBLE(_compatible, _fixup, _data)		\
+	{						\
+		.name = CID_NAME_ANY,			\
+		.manfid = CID_MANFID_ANY,		\
+		.oemid = CID_OEMID_ANY,			\
+		.rev_start = 0,				\
+		.rev_end = -1ull,			\
+		.cis_vendor = SDIO_ANY_ID,		\
+		.cis_device = SDIO_ANY_ID,		\
+		.vendor_fixup = (_fixup),		\
+		.data = (_data),			\
+		.ext_csd_rev = EXT_CSD_REV_ANY,		\
+		.of_compatible = _compatible,	\
+	}
+
 #define cid_rev(hwrev, fwrev, year, month)	\
 	(((u64) hwrev) << 40 |			\
 	 ((u64) fwrev) << 32 |			\
diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index 4a767f2fbaaaa..a23df65332cdf 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -146,6 +146,10 @@ static const struct mmc_fixup __maybe_unused sdio_fixup_methods[] = {
 	END_FIXUP
 };
 
+static const struct mmc_fixup __maybe_unused sdio_card_init_methods[] = {
+	END_FIXUP
+};
+
 static inline bool mmc_fixup_of_compatible_match(struct mmc_card *card,
 						 const char *compatible)
 {
diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index 68edf7a615be5..cf8ee66990508 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -707,6 +707,7 @@ static int mmc_sdio_init_card(struct mmc_host *host, u32 ocr,
 	 */
 	if (host->ops->init_card)
 		host->ops->init_card(host, card);
+	mmc_fixup_device(card, sdio_card_init_methods);
 
 	/*
 	 * If the host and card support UHS-I mode request the card
-- 
2.33.0

