Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFCD5132E1A
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 19:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgAGSO1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 13:14:27 -0500
Received: from muru.com ([72.249.23.125]:50406 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728364AbgAGSO1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jan 2020 13:14:27 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 67E8B8022;
        Tue,  7 Jan 2020 18:15:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] drop more legacy platform data for omaps for v5.6
Date:   Tue,  7 Jan 2020 10:14:19 -0800
Message-Id: <pull-1578420398-290837@atomide.com-4>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <pull-1578420398-290837@atomide.com>
References: <pull-1578420398-290837@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a6c8056d2f34e8d8fec398630facb32673f23984:

  ARM: dts: omap5: convert IOMMUs to use ti-sysc (2019-12-17 09:27:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/ti-sysc-drop-pdata-signed

for you to fetch changes up to 9fc85a7124b5ff9ec24ad391f9994f89ae611313:

  Merge branch 'omap-for-v5.6/sdma' into omap-for-v5.6/ti-sysc-drop-pdata (2019-12-30 10:17:51 -0800)

----------------------------------------------------------------
Drop more legacy platform data for omaps for v5.6 merge window

We can now probe devices with ti-sysc interconnect driver and dts
data, and can continue dropping the related platform data and custom
ti,hwmods dts property for various devices.

And related to that, we finally can remove the legacy sdma support in
favor of using the dmaengine driver only. I was planning to send the
sdma changes separately, but that would have produced a pile of
pointless merge conflicts, so I decided it's best to resolve it locally.
After all, the sdma series also ends up removing the related platform
data.

Note that this series is based on omap-for-v5.6/ti-sysc-dt-signed branch
as it depends for dts data being in place.

----------------------------------------------------------------
Tero Kristo (2):
      ARM: OMAP4: hwmod-data: remove OMAP4 IOMMU hwmod data
      ARM: OMAP5: hwmod-data: remove OMAP5 IOMMU hwmod data

Tony Lindgren (56):
      ARM: OMAP2+: Drop unused sdma functions
      ARM: OMAP2+: Drop sdma interrupt handling for mach-omap2
      ARM: OMAP2+: Configure sdma capabilities directly
      ARM: OMAP2+: Configure dma_plat_info directly and drop dma_dev_attr
      dmaengine: ti: omap-dma: Add device tree match data and use it for cpu_pm
      ARM: OMAP2+: Drop legacy platform data for am4 qspi
      ARM: OMAP2+: Drop legacy platform data for omap4 aess
      ARM: OMAP2+: Drop legacy platform data for omap4 dmic
      ARM: OMAP2+: Drop legacy platform data for omap4 mcpdm
      ARM: OMAP2+: Drop legacy platform data for omap5 dmic
      ARM: OMAP2+: Drop legacy platform data for omap5 mcpdm
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 sham
      ARM: OMAP2+: Drop legacy platform data for dra7 sham
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 aes
      ARM: OMAP2+: Drop legacy platform data for dra7 aes
      ARM: OMAP2+: Drop legacy platform data for am4 des
      ARM: OMAP2+: Drop legacy platform data for dra7 des
      ARM: OMAP2+: Drop legacy platform data for omap4 timers except timer1
      ARM: OMAP2+: Drop legacy platform data for omap5 timers except timer1
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 timers except timer1 and 2
      ARM: OMAP2+: Drop legacy platform data for dra7 timers except timer1 to 4
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 epwmss
      ARM: OMAP2+: Drop legacy platform data for dra7 epwmss
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 spinlock
      ARM: OMAP2+: Drop legacy platform data for omap4 spinlock
      ARM: OMAP2+: Drop legacy platform data for omap5 spinlock
      ARM: OMAP2+: Drop legacy platform data for dra7 spinlock
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 spi
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 dcan
      ARM: OMAP2+: Drop legacy platform data for dra7 dcan
      ARM: OMAP2+: Drop legacy platform data for am3 adc_tsc
      ARM: OMAP2+: Drop legacy platform data for am4 adc_tsc
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 elm
      ARM: OMAP2+: Drop legacy platform data for omap4 elm
      ARM: OMAP2+: Drop legacy platform data for dra7 elm
      ARM: OMAP2+: Drop legacy platform data for am3 lcdc
      ARM: OMAP2+: Drop legacy platform data for am4 ocp2scp
      ARM: OMAP2+: Drop legacy platform data for omap4 ocp2scp
      ARM: OMAP2+: Drop legacy platform data for omap5 ocp2scp
      ARM: OMAP2+: Drop legacy platform data for dra7 ocp2scp
      ARM: OMAP2+: Drop legacy platform data for am4 vpfe
      ARM: OMAP2+: Drop legacy platform data for omap4 hsi
      ARM: OMAP2+: Drop legacy platform data for omap4 smartreflex
      ARM: OMAP2+: Drop legacy platform data for dra7 smartreflex
      ARM: OMAP2+: Drop legacy platform data for omap4 kbd
      ARM: OMAP2+: Drop legacy platform data for omap5 kbd
      ARM: OMAP2+: Drop legacy platform data for omap4 slimbus
      ARM: OMAP2+: Drop legacy platform data for omap4 fdif
      Merge branch 'omap-for-v5.6/ti-sysc-dt' into omap-for-v5.6/ti-sysc-drop-pdata
      dmaengine: ti: omap-dma: Configure global priority register directly
      dmaengine: ti: omap-dma: Pass sdma auxdata to driver and use it
      dmaengine: ti: omap-dma: Allocate channels directly
      dmaengine: ti: omap-dma: Use cpu notifier to block idle for omap2
      ARM: OMAP2+: Drop legacy init for sdma
      ARM: OMAP2+: Drop legacy platform data for sdma
      Merge branch 'omap-for-v5.6/sdma' into omap-for-v5.6/ti-sysc-drop-pdata

 arch/arm/boot/dts/am33xx-l4.dtsi                   |   16 -
 arch/arm/boot/dts/am33xx.dtsi                      |    2 -
 arch/arm/boot/dts/am4372.dtsi                      |    4 -
 arch/arm/boot/dts/am437x-l4.dtsi                   |   29 -
 arch/arm/boot/dts/dra7-l4.dtsi                     |   25 +-
 arch/arm/boot/dts/dra7.dtsi                        |    3 -
 arch/arm/boot/dts/omap2.dtsi                       |   43 +-
 arch/arm/boot/dts/omap2430.dtsi                    |    4 +
 arch/arm/boot/dts/omap3-n900.dts                   |    5 +
 arch/arm/boot/dts/omap3.dtsi                       |   46 +-
 arch/arm/boot/dts/omap36xx.dtsi                    |    4 +
 arch/arm/boot/dts/omap4-l4-abe.dtsi                |    7 -
 arch/arm/boot/dts/omap4-l4.dtsi                    |   19 +-
 arch/arm/boot/dts/omap4.dtsi                       |    1 -
 arch/arm/boot/dts/omap5-l4-abe.dtsi                |    6 -
 arch/arm/boot/dts/omap5-l4.dtsi                    |   13 +-
 arch/arm/mach-omap2/common.h                       |    3 +
 arch/arm/mach-omap2/dma.c                          |  119 +--
 arch/arm/mach-omap2/omap_device.c                  |  170 ---
 arch/arm/mach-omap2/omap_device.h                  |    4 -
 arch/arm/mach-omap2/omap_hwmod.c                   |   18 -
 arch/arm/mach-omap2/omap_hwmod.h                   |    3 -
 arch/arm/mach-omap2/omap_hwmod_2420_data.c         |   34 -
 arch/arm/mach-omap2/omap_hwmod_2430_data.c         |   34 -
 arch/arm/mach-omap2/omap_hwmod_2xxx_ipblock_data.c |   18 -
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |   33 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |  124 ---
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c |  335 ------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         |   91 --
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c         |   61 --
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         |  448 --------
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c         | 1099 +-------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c         |  662 ------------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c          |  873 ----------------
 arch/arm/mach-omap2/omap_hwmod_common_data.h       |    1 -
 arch/arm/mach-omap2/omap_hwmod_reset.c             |   24 -
 arch/arm/mach-omap2/pdata-quirks.c                 |    1 +
 arch/arm/mach-omap2/pm24xx.c                       |   22 +-
 arch/arm/mach-omap2/pm34xx.c                       |    5 -
 arch/arm/plat-omap/dma.c                           |  471 +--------
 drivers/dma/ti/omap-dma.c                          |  286 ++++-
 include/linux/omap-dma.h                           |   18 -
 include/sound/aess.h                               |   53 -
 43 files changed, 395 insertions(+), 4842 deletions(-)
 delete mode 100644 include/sound/aess.h
