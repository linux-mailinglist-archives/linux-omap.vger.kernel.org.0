Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A1642EF05
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 12:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbhJOKth (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 06:49:37 -0400
Received: from muru.com ([72.249.23.125]:44862 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhJOKtg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 06:49:36 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5532080F1;
        Fri, 15 Oct 2021 10:48:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCHv4 0/6] More SoCs for sdhci-omap to deprecate omap_hsmmc
Date:   Fri, 15 Oct 2021 13:47:14 +0300
Message-Id: <20211015104720.52240-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are v4 changes to add support to sdhci-omap for earlier SoCs so we
can start deprecating the old omap_hsmmc driver.

For most part these changes can be tested just by changing the old hsmmc
devicetree compatible value for the SoC as described in the first binding
patch. Then after some testing, I'll post patches to enable sdhci-omap
for all the omap variants instead of omap_hsmmc.

These patches are against current Linux next.

Regards,

Tony

Changes since v3:

- More runtime PM fixes and improvments as commented by Ulf

- Use 0U instead of 0UL to fix compile warnings

Changes since v2:

- Fix up runtime PM issues and enable autosuspend based on comments
  from Ulf

  Changes since v1:

  - Added Rob's ack for the binding changes

  - Fix wakeirq assignment as noted by Grygorii


Tony Lindgren (6):
  dt-bindings: sdhci-omap: Update binding for legacy SoCs
  mmc: sdhci-omap: Handle voltages to add support omap4
  mmc: sdhci-omap: Add omap_offset to support omap3 and earlier
  mmc: sdhci-omap: Implement PM runtime functions
  mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM
  mmc: sdhci-omap: Configure optional wakeirq

 .../devicetree/bindings/mmc/sdhci-omap.txt    |   6 +-
 drivers/mmc/host/sdhci-omap.c                 | 260 ++++++++++++++----
 2 files changed, 204 insertions(+), 62 deletions(-)

-- 
2.33.0
