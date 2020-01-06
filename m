Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCF31310EB
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 12:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgAFLAR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 06:00:17 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60418 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgAFLAR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 06:00:17 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006B08kv032657;
        Mon, 6 Jan 2020 05:00:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578308408;
        bh=rHHxnSNmoG0TpKHhfoDpiR+hC+hKper1pj6PfPbJugE=;
        h=From:To:CC:Subject:Date;
        b=Yk/JylhoNEEZ1OJCrK62AF0JJi+msYodaFoAFR1AV9PpL2hFsaL63sszFRaEgDeuS
         i9UXt8qVwI+QqsvxTBs+PjT4ufL6a3WvSRuvHn7t6Br7a2u8qOuwH84oHNsfh3Mm9J
         5fDm/m7c0ulC3/o66C1T+kUd0pXrBVPjXghOReko=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006B086O062609
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 Jan 2020 05:00:08 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:00:07 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:00:07 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B00Jp007044;
        Mon, 6 Jan 2020 05:00:01 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <kishon@ti.com>, <adrian.hunter@intel.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>, <tony@atomide.com>,
        <faiz_abbas@ti.com>
Subject: [PATCH v4 00/11] Port am335x and am437x devices to sdhci-omap
Date:   Mon, 6 Jan 2020 16:31:22 +0530
Message-ID: <20200106110133.13791-1-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The following add driver patches for porting TI's am335x and am437x devices to
the sdhci-omap driver.

Patches 1-4 Add Support for external DMA to the sdhci driver.

Patches 5-7 refactor the sdhci_set_timeout() function and use it disable
data timeout interrupt for erase commands

Patches 8-9 port the ti,needs-special-reset property from omap_hsmmc driver.

Patches 10-11 add new compatibles for am335x and am43xx devices to the
sdhci-omap driver.

DT changes will be posted as a separate series.

Tested on: am335x-evm, am335x-boneblack, am335x-bonegreen-wireless,
am335x-sk, am335x-bone, am437x-idk, am43xx-gp-evm, am43xx-epos-evm.

I need some help with testing all other am335x variants and SDIO cards.

Here's a branch for testing: https://github.com/faizinator/linux/tree/sdhci-omap_v4_2

RESEND ALERT: I sent these patches from a new computer yesterday but non
of them appeared in any of the mailing lists. Apologies if you receive a
duplicate series. Please ignore the previous one.

v4:
1. Made the factoring out of initialize_data, block_info and mrqs_done as a
   separate patch
2. Replaced the patch introducing the quirk to disable DTO during erase
   operations to a set_timeout() callback in sdhci-omap
3. Ported the ti,needs-special-reset property from omap_hsmmc to sdhci-omap.
4. Minor style changes.

v3:
1. Dropped patch 1 because the tasklet was removed by Adrian in an
   earlier series.
2. Added dma bindings in sdhci-omap as optional properties.
3. Rebased on top of latest mainline.

v2:
1. sdhci is using two bottom halves. One threaded_rq for card detect and a
   tasklet for finishing mmc requests. Patch 1 removes the tasklet and
   moves its function to the threaded_irq. This enables me to
   terminate_sync() in sdhci_request_done()

2. Factored out common code for between the normal adn external dma case

3. Using existing API sdhci_data_timeout_irq for disabling DTO during
   erase commands.

4. Fixed subject line for dt-bindings patch.

Chunyan Zhang (3):
  dt-bindings: sdhci-omap: Add properties for using external dma
  mmc: sdhci: add support for using external DMA devices
  mmc: sdhci-omap: Add using external dma

Faiz Abbas (8):
  mmc: sdhci: Factor out some operations set to their own functions
  mmc: sdhci: Convert sdhci_set_timeout_irq() to non-static
  mmc: sdhci: Refactor sdhci_set_timeout()
  mmc: sdhci-omap: Disable data timeout interrupt during erase
  dt-bindings: sdhci-omap: Add documentation for ti,needs-special-reset
    property
  mmc: sdhci-omap: Add ti,needs-special-reset property
  dt-bindings: sdhci-omap: Add am335x and am437x specific bindings
  mmc: sdhci-omap: Add am335x and am437x specific compatibles

 .../devicetree/bindings/mmc/sdhci-omap.txt    |  12 +
 drivers/mmc/host/Kconfig                      |   4 +
 drivers/mmc/host/sdhci-omap.c                 |  61 ++-
 drivers/mmc/host/sdhci.c                      | 355 +++++++++++++++---
 drivers/mmc/host/sdhci.h                      |  10 +
 5 files changed, 384 insertions(+), 58 deletions(-)

-- 
2.19.2

