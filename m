Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202D044C5D2
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 18:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhKJRUI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 12:20:08 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:13151 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbhKJRUH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 12:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636564635;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=OzCoVJYxglf1y8GP+J0FWzWTGQYuFXTicqOEQEZRkXM=;
    b=MXkk1EQBq2K67AfpJSaFYHO8T2BNsRr3F9holWpMYKPnF+u9zRZzTUzIBFNLjBbn6o
    zWlolbBU+kKCjAY8mlnUOMhuRSLjo3DCAkWvSjIVfD+PKkbRr1Vc9kvNBmdCNVxG/VJr
    9bYY2puVxjxPjC3QB8/JSwS/uaHOzBcYxTQ/ynTVZu9Og+72D1NOFos3BnDXYAF2Iywm
    TJTKOcL+9lJdlFyI0fntsNnOxPhElH/A4ZGFiCSl7410aATdT7adtMpd3UcUaUVgcFtJ
    w1r0tjsCS/UmZQHxdb/0RYjUVo39o0nzSM1YafswDV7BvzBn3a9A6XCDhMqbXK0wAK4l
    Q9+Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdfLlf0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id Y02aa4xAAHHE51e
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 10 Nov 2021 18:17:14 +0100 (CET)
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
Subject: [PATCH v2 2/6] mmc: core: allow to match the device tree to apply quirks
Date:   Wed, 10 Nov 2021 18:17:07 +0100
Message-Id: <9e68e3d23e62a78527aabc1281f89e15200c7d09.1636564631.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636564631.git.hns@goldelico.com>
References: <cover.1636564631.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Jérôme Pouiller <jerome.pouiller@silabs.com>

MMC subsystem provides a way to apply quirks when a device match some
properties (VID, PID, etc...) Unfortunately, some SDIO devices do not
comply with the SDIO specification and does not provide reliable VID/PID
(eg. Silabs WF200).

So, the drivers for these devices rely on device tree to identify the
device.

This patch allows the MMC to also rely on the device tree to apply a
quirk.

Signed-off-by: Jérôme Pouiller <jerome.pouiller@silabs.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/mmc/core/card.h   |  3 +++
 drivers/mmc/core/quirks.h | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/mmc/core/card.h b/drivers/mmc/core/card.h
index 7bd392d55cfa5..483e7f2f1039e 100644
--- a/drivers/mmc/core/card.h
+++ b/drivers/mmc/core/card.h
@@ -59,6 +59,9 @@ struct mmc_fixup {
 	/* for MMC cards */
 	unsigned int ext_csd_rev;
 
+	/* Match against functions declared in device tree */
+	const char *of_compatible;
+
 	void (*vendor_fixup)(struct mmc_card *card, int data);
 	int data;
 };
diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index c7ef2d14b359f..4a767f2fbaaaa 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -10,6 +10,7 @@
  *
  */
 
+#include <linux/of.h>
 #include <linux/mmc/sdio_ids.h>
 
 #include "card.h"
@@ -145,6 +146,19 @@ static const struct mmc_fixup __maybe_unused sdio_fixup_methods[] = {
 	END_FIXUP
 };
 
+static inline bool mmc_fixup_of_compatible_match(struct mmc_card *card,
+						 const char *compatible)
+{
+	struct device_node *np;
+
+	for_each_child_of_node(mmc_dev(card->host)->of_node, np) {
+		if (of_device_is_compatible(np, compatible))
+			return true;
+	}
+
+	return false;
+}
+
 static inline void mmc_fixup_device(struct mmc_card *card,
 				    const struct mmc_fixup *table)
 {
@@ -173,6 +187,9 @@ static inline void mmc_fixup_device(struct mmc_card *card,
 			continue;
 		if (rev < f->rev_start || rev > f->rev_end)
 			continue;
+		if (f->of_compatible &&
+		    !mmc_fixup_of_compatible_match(card, f->of_compatible))
+			continue;
 
 		dev_dbg(&card->dev, "calling %ps\n", f->vendor_fixup);
 		f->vendor_fixup(card, f->data);
-- 
2.33.0

