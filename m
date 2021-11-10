Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F67F44C5D6
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 18:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbhKJRUI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 12:20:08 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:9000 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbhKJRUH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 12:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636564634;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rfHhgGu+rg+elNFlFNuaURtWhhkpzMlWnoVXeLgI82s=;
    b=Br2pG8waLTXhsj/nN5LDDWWYcMO6nIh2JeaFwpTbFT6Zu8ExHvbaUxfnDv9Wfxxav0
    EkSHSxMFdCtkiSJL1pq8kt5FKeeVADCme/kojBfso5YweOGqRtixTjzccRP5cRjpUFjQ
    gztfd0QqB1ShWI4qkW0Z/P3ZY0aYolho9qD9AR8SehYyPbKwyY5oif7yfrCZyaYaLDRk
    C+J5+DuOi9tXYlG8psAgFE7wqq/OXtfJ2Xl2+CZw11SyHts7hX5n2bGMY/SQ7tPKfi7l
    TEE/c/ycTCY61b0PVX7PLr8hPGo6+FxKy1VweXzrlrRuqm/Qz4uiPfwkTBrtxqUPbD75
    8esA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdfLlf0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id Y02aa4xAAHHE51d
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
Subject: [PATCH v2 1/6] mmc: core: rewrite mmc_fixup_device()
Date:   Wed, 10 Nov 2021 18:17:06 +0100
Message-Id: <6515c1e8b3aa69ad273726f6e877d85c20f286ad.1636564631.git.hns@goldelico.com>
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

Currently, mmc_fixup_device() is a bit difficult to read because of
particularly long condition.

Signed-off-by: Jérôme Pouiller <jerome.pouiller@silabs.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/mmc/core/quirks.h | 41 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index d68e6e513a4f4..c7ef2d14b359f 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -152,22 +152,29 @@ static inline void mmc_fixup_device(struct mmc_card *card,
 	u64 rev = cid_rev_card(card);
 
 	for (f = table; f->vendor_fixup; f++) {
-		if ((f->manfid == CID_MANFID_ANY ||
-		     f->manfid == card->cid.manfid) &&
-		    (f->oemid == CID_OEMID_ANY ||
-		     f->oemid == card->cid.oemid) &&
-		    (f->name == CID_NAME_ANY ||
-		     !strncmp(f->name, card->cid.prod_name,
-			      sizeof(card->cid.prod_name))) &&
-		    (f->cis_vendor == card->cis.vendor ||
-		     f->cis_vendor == (u16) SDIO_ANY_ID) &&
-		    (f->cis_device == card->cis.device ||
-		     f->cis_device == (u16) SDIO_ANY_ID) &&
-		    (f->ext_csd_rev == EXT_CSD_REV_ANY ||
-		     f->ext_csd_rev == card->ext_csd.rev) &&
-		    rev >= f->rev_start && rev <= f->rev_end) {
-			dev_dbg(&card->dev, "calling %ps\n", f->vendor_fixup);
-			f->vendor_fixup(card, f->data);
-		}
+		if (f->manfid != CID_MANFID_ANY &&
+		    f->manfid != card->cid.manfid)
+			continue;
+		if (f->oemid != CID_OEMID_ANY &&
+		    f->oemid != card->cid.oemid)
+			continue;
+		if (f->name != CID_NAME_ANY &&
+		    strncmp(f->name, card->cid.prod_name,
+			    sizeof(card->cid.prod_name)))
+			continue;
+		if (f->cis_vendor != (u16)SDIO_ANY_ID &&
+		    f->cis_vendor != card->cis.vendor)
+			continue;
+		if (f->cis_device != (u16)SDIO_ANY_ID &&
+		    f->cis_device != card->cis.device)
+			continue;
+		if (f->ext_csd_rev != EXT_CSD_REV_ANY &&
+		    f->ext_csd_rev != card->ext_csd.rev)
+			continue;
+		if (rev < f->rev_start || rev > f->rev_end)
+			continue;
+
+		dev_dbg(&card->dev, "calling %ps\n", f->vendor_fixup);
+		f->vendor_fixup(card, f->data);
 	}
 }
-- 
2.33.0

