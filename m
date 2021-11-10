Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E98244C5D3
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 18:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbhKJRUI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 12:20:08 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:18396 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbhKJRUH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 12:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636564634;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=BxSWWKTyTSpwkiKaplm50TkH80bkmR2Wjcw/iI6LETA=;
    b=W1MsbpAXkKx5AmUCx8pXbql1Yjo6Iq/iYx2BXBpHYU9NKNLsDNMmPz0io1dZlUZvLE
    ffXIv6JLhpcjALdyP6CnhHGONfhAtF1Jf41FLEV/3yvOFP4mYTQ4c9B37qn5C9esGrEJ
    Z0kFf9GMWL1IxA6QDZvxwre6FzLFA+MXnwCY+KvftJ+FuzKo0DnA54uk11kKRQJr5OsY
    TCMJaFySCNO8k3O0gQmMwNTMUcfsj/AsqAejXyuScuPu8wwgdFntY2msoMCj/bSs2O2k
    XtA5BOEEo9Lksn1NsBK3EoViawITQ/PueHwdnGRIauu3Ont1ohCxGv/x9W2ibGj9RIto
    cl1Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdfLlf0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id Y02aa4xAAHHC51c
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 10 Nov 2021 18:17:12 +0100 (CET)
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
Subject: [PATCH v2 0/6] mmc: core: extend mmc_fixup_device and transplant ti,wl1251 quirks from to be retired omap_hsmmc
Date:   Wed, 10 Nov 2021 18:17:05 +0100
Message-Id: <cover.1636564631.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

PATCH V2 2021-11-10 18:17:11:
* remove setting card->ocr = 0x80 because it is no longer needed (by H. Nikolaus Schaller <hns@goldelico.com>)
* include patch "mmc: core: Fixup storing of OCR for MMC_QUIRK_NONSTD_SDIO" by Ulf Hansson <ulf.hansson@linaro.org>

PATCH V1 2021-11-09 11:59:08:
* merge call of mmc_fixup_device for sdio into other commit (suggested by Ulf Hansson <ulf.hansson@linaro.org>)
* do not call mmc_fixup_device(card, sdio_card_init_methods) for mmc and sd interfaces, just sdio (suggested by Ulf Hansson <ulf.hansson@linaro.org>)
* do not use a matching list but a single string constant (suggested by Ulf Hansson <ulf.hansson@linaro.org>)
* switched to "[PATCH v1]" (suggested by Ulf Hansson <ulf.hansson@linaro.org>)

RFC V4 2021-11-05 10:05:51:
* remove const from char *const * (Ulf Hansson <ulf.hansson@linaro.org>)
* use for_each_child_of_node() to scan compatible children (Ulf Hansson <ulf.hansson@linaro.org>)
(see: https://lore.kernel.org/lkml/CAPDyKFpr0kpRXoUACNNSwe8pL1S9wJPjnX+GFGS1PNezKCDYzQ@mail.gmail.com/)

RFC V3 2021-11-03 14:00:13:
* patches have been split into smaller ones a little further
* propose a new macro for setup of device tree compatible quirks
* directly include patches by jerome.pouiller@silabs.com
  in this series

RFC V2 2021-11-01 10:24:26:
* reworked to not misuse mmc_select_card() but add a call to
  mmc_fixup_device() right after where host->ops->init_card
  was called before to apply the wl1251 specific quirks.
  Device tree matching is done by a new table passed to mmc_fixup_device().
  suggested by: ulf.hansson@linaro.org
  based on patches by: jerome.pouiller@silabs.com

RFC V1 2021-10-06 13:24:13:


H. Nikolaus Schaller (3):
  mmc: core: provide macro and table to match the device tree to apply
    quirks
  mmc: core: transplant ti,wl1251 quirks from to be retired omap_hsmmc
  mmc: host: omap_hsmmc: revert special init for wl1251

Jérôme Pouiller (2):
  mmc: core: rewrite mmc_fixup_device()
  mmc: core: allow to match the device tree to apply quirks

Ulf Hansson (1):
  mmc: core: Fixup storing of OCR for MMC_QUIRK_NONSTD_SDIO

 drivers/mmc/core/card.h       | 36 ++++++++++++++++++++
 drivers/mmc/core/quirks.h     | 64 +++++++++++++++++++++++++----------
 drivers/mmc/core/sdio.c       |  5 ++-
 drivers/mmc/host/omap_hsmmc.c | 36 --------------------
 4 files changed, 87 insertions(+), 54 deletions(-)

-- 
2.33.0

