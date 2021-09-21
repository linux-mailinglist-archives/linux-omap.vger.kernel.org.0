Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B9A413257
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhIULRj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:17:39 -0400
Received: from muru.com ([72.249.23.125]:35684 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232272AbhIULRh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:17:37 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2714280A8;
        Tue, 21 Sep 2021 11:16:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 0/5] More SoCs for sdhci-omap to deprecate omap_hsmmc
Date:   Tue, 21 Sep 2021 14:15:55 +0300
Message-Id: <20210921111600.24577-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series of changes adds support to sdhci-omap for earlier SoCs so we
can start deprecating the old omap_hsmmc driver.

For most part these changes can be tested just by changing the old hsmmc
devicetree compatible value for the SoC as described in the first binding
patch.

There are few old quirks I have not yet handled, like the wl1251 quirk
f6498b922e57 ("mmc: host: omap_hsmmc: add code for special init of wl1251
to get rid of pandora_wl1251_init_card"). But those can be added later
once we figure out how to best handle them :)

These patches are against v5.15-rc1, and depend on patch series
"[PATCH 0/5] Prepare sdhci-omap to support more SoCs".

Regards,

Tony


Tony Lindgren (5):
  dt-bindings: sdhci-omap: Update binding for legacy SoCs
  mmc: sdhci-omap: Handle voltages to add support omap4
  mmc: sdhci-omap: Add omap_offset to support omap3 and earlier
  mmc: sdhci-omap: Implement PM runtime functions
  mmc: sdhci-omap: Configure optional wakeirq

 .../devicetree/bindings/mmc/sdhci-omap.txt    |   6 +-
 drivers/mmc/host/sdhci-omap.c                 | 270 ++++++++++++++----
 2 files changed, 221 insertions(+), 55 deletions(-)

-- 
2.33.0
