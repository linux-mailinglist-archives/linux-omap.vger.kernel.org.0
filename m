Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1FD44AC1E
	for <lists+linux-omap@lfdr.de>; Tue,  9 Nov 2021 11:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245526AbhKILCL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Nov 2021 06:02:11 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:35143 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245515AbhKILCK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Nov 2021 06:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636455552;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Uqnxx80FjURagoMKSCCsXpe0WBFasnf3OQMszPGS01Q=;
    b=eScPnUOxN/ee71CjMBaOc4g73ovcTF+cr88tTE9Jl5xGgKBYey+88hGOOqrGMC6JGO
    hxQ0P0VAXBC/AIwEE7We+pppezMgVMAxp5Qcndtw62Ix9VWfhmVw9vIOs/2woiO8dWHK
    7wYAUfa4oa9BmUPuUnPaYaNxVXdxdteHvGBMzUolJjLzyLuSZOoGBGDlrHEoNNj9/UbY
    anjMYJbQ6MgoIAKhoSqLBBJSfDwsaXICETmreo/GUj+U4P/etrsL1tlpTGKRgOcBenuj
    gcbMcZPcB3FLvlY117MHAUziCBSVNQ7of//RSv9nxqM+BNGUKxYjbEbFdSICcjTVj89g
    lfvg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFoCL4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id 902c63xA9AxBOW6
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 9 Nov 2021 11:59:11 +0100 (CET)
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
Subject: [PATCH 4/5] mmc: core: transplant ti,wl1251 quirks from to be retired omap_hsmmc
Date:   Tue,  9 Nov 2021 11:59:07 +0100
Message-Id: <2d46adc580330788df1c7ef2a45be1e003387e0b.1636455548.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636455548.git.hns@goldelico.com>
References: <cover.1636455548.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The TiWi WL1251 WiFi chip needs special setup of the sdio
interface before it can be probed.

So far, this is done in omap_hsmmc_init_card() in omap_hsmmc.c
which makes it useable only if connected to omap devices
which use the omap_hsmmc. The OpenPandora is the most promient
example.

There are plans to switch to a newer sdhci-omap driver and
retire omap_hsmmc. Hence this quirk must be reworked or moved
somewhere else. Ideally to some location that is not dependent
on the specific SoC mmc host driver.

This is achieved by the new mmc_fixup_device() option introduced
by ("mmc: allow to match the device tree to apply quirks") to match
through device tree compatible string.

This quirk will be called early right after where host->ops->init_card()
and thus omap_hsmmc_init_card() was previously called.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/mmc/core/card.h   | 19 +++++++++++++++++++
 drivers/mmc/core/quirks.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/mmc/core/card.h b/drivers/mmc/core/card.h
index 216faf5ad1021..1695ce827d512 100644
--- a/drivers/mmc/core/card.h
+++ b/drivers/mmc/core/card.h
@@ -168,6 +168,25 @@ static inline void __maybe_unused add_limit_rate_quirk(struct mmc_card *card,
 	card->quirk_max_rate = data;
 }
 
+static inline void __maybe_unused wl1251_quirk(struct mmc_card *card,
+					       int data)
+{
+	/*
+	 * We have TI wl1251 attached to this mmc. Pass this
+	 * information to the SDIO core because it can't be
+	 * probed by normal methods.
+	 */
+
+	dev_info(card->host->parent, "found wl1251\n");
+	card->quirks |= MMC_QUIRK_NONSTD_SDIO;
+	card->cccr.wide_bus = 1;
+	card->cis.vendor = 0x104c;
+	card->cis.device = 0x9066;
+	card->cis.blksize = 512;
+	card->cis.max_dtr = 24000000;
+	card->ocr = 0x80;
+}
+
 /*
  * Quirk add/remove for MMC products.
  */
diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index a23df65332cdf..20f5687272778 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -147,6 +147,8 @@ static const struct mmc_fixup __maybe_unused sdio_fixup_methods[] = {
 };
 
 static const struct mmc_fixup __maybe_unused sdio_card_init_methods[] = {
+	SDIO_FIXUP_COMPATIBLE("ti,wl1251", wl1251_quirk, 0),
+
 	END_FIXUP
 };
 
-- 
2.33.0

