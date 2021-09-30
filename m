Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E02241D3AA
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 08:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348388AbhI3G7a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 02:59:30 -0400
Received: from muru.com ([72.249.23.125]:38910 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348383AbhI3G73 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 02:59:29 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1CCA28050;
        Thu, 30 Sep 2021 06:58:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCHv2 0/5] More SoCs for sdhci-omap to deprecate omap_hsmmc
Date:   Thu, 30 Sep 2021 09:57:28 +0300
Message-Id: <20210930065733.31943-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are v2 changes to add support to sdhci-omap for earlier SoCs so we
can start deprecating the old omap_hsmmc driver.

For most part these changes can be tested just by changing the old hsmmc
devicetree compatible value for the SoC as described in the first binding
patch.

There are few old quirks I have not yet handled, like the wl1251 quirk
f6498b922e57 ("mmc: host: omap_hsmmc: add code for special init of wl1251
to get rid of pandora_wl1251_init_card"). But those can be added later
once we figure out how to best handle them :)

These patches are against current Linux next.

Regards,

Tony

Changes since v1:

- Added Rob's ack for the binding changes

- Fix wakeirq assignment as noted by Grygorii

Tony Lindgren (5):
  dt-bindings: sdhci-omap: Update binding for legacy SoCs
  mmc: sdhci-omap: Handle voltages to add support omap4
  mmc: sdhci-omap: Add omap_offset to support omap3 and earlier
  mmc: sdhci-omap: Implement PM runtime functions
  mmc: sdhci-omap: Configure optional wakeirq

 .../devicetree/bindings/mmc/sdhci-omap.txt    |   6 +-
 drivers/mmc/host/sdhci-omap.c                 | 275 ++++++++++++++----
 2 files changed, 226 insertions(+), 55 deletions(-)

-- 
2.33.0
