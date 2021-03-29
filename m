Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5D734C55E
	for <lists+linux-omap@lfdr.de>; Mon, 29 Mar 2021 09:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhC2Hzz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 03:55:55 -0400
Received: from muru.com ([72.249.23.125]:48356 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230319AbhC2Hzk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Mar 2021 03:55:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 304CA811B;
        Mon, 29 Mar 2021 07:56:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Drop legacy data for dra7 and omap4/5 and clean-up
Date:   Mon, 29 Mar 2021 10:55:22 +0300
Message-Id: <pull-1617004205-537424@atomide.com-3>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <pull-1617004205-537424@atomide.com>
References: <pull-1617004205-537424@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 083516ad540a1104a0ae5ae7e83f2a2d8e39d2bc:

  Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and 'genpd-dts-omap5' into omap-for-v5.13/dts-genpd (2021-03-10 14:16:34 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/genpd-cleanup-signed

for you to fetch changes up to 4adcf4c28f6dc191187359bfceee5ab5fe91a50e:

  bus: ti-sysc: Warn about old dtb for dra7 and omap4/5 (2021-03-12 10:23:48 +0200)

----------------------------------------------------------------
Drop legacy data for dra7 and omap4/5 for genpd support for v5.13

Similar to what we have already done for am3 and 4, we can now boot dra7,
omap4, and omap5 with devicetree data and genpd without legacy SoC specific
built-in data.

Let's drop the legacy data for these SoCs, and the related "ti,hwmods"
custom devicetree property. As with these changes we now expect to have
complete devicetree data, let's also warn in the case if an old devicetree
data is noticed. And with the warning provided, there should not be any
need to delay dropping the legacy data as it just unnecessarily complicates
things.

The main reasons for dropping the legacy data is to avoid the burden of
maintaining a mixed boot process where both legacy built-in data and
devicetree data are needed. And we can now use standard reset driver,
genpd, and simple-pm-bus features.

These patches are based on the related devicetree changes to add the
missing interconnect target module configuration for these SoCs.

----------------------------------------------------------------
Tony Lindgren (35):
      ARM: OMAP2+: Drop legacy platform data for dra7 pcie
      ARM: OMAP2+: Drop legacy platform data for dra7 qspi
      ARM: OMAP2+: Drop legacy platform data for dra7 sata
      ARM: OMAP2+: Drop legacy platform data for dra7 mpu
      ARM: OMAP2+: Drop legacy platform data for dra7 dmm
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per1
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per2
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per3
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for dra7 l3
      ARM: OMAP2+: Drop legacy platform data for dra7 hwmod
      ARM: OMAP2+: Drop legacy platform data for omap4 iss
      ARM: OMAP2+: Drop legacy platform data for omap4 control modules
      ARM: OMAP2+: Drop legacy platform data for omap4 dmm
      ARM: OMAP2+: Drop legacy platform data for omap4 emif
      ARM: OMAP2+: Drop legacy platform data for omap4 debugss
      ARM: OMAP2+: Drop legacy platform data for omap4 mpu
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_per
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for omap4 l3
      ARM: OMAP2+: Drop legacy platform data for omap4 hwmod
      ARM: OMAP2+: Drop legacy platform data for omap5 dmm
      ARM: OMAP2+: Drop legacy platform data for omap5 emif
      ARM: OMAP2+: Drop legacy platform data for omap5 mpu
      ARM: OMAP2+: Drop legacy platform data for omap5 sata
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_per
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for omap5 l3
      ARM: OMAP2+: Drop legacy platform data for omap5 hwmod
      Merge branches 'omap-for-v5.13/genpd-dra7', 'omap-for-v5.13/genpd-omap4' and 'omap-for-v5.13/genpd-omap5' into omap-for-v5.13/genpd-drop-legacy
      ARM: OMAP2+: Stop building legacy code for dra7 and omap4/5
      bus: ti-sysc: Warn about old dtb for dra7 and omap4/5

 arch/arm/boot/dts/dra7-l4.dtsi             |   1 -
 arch/arm/boot/dts/dra7.dtsi                |   5 -
 arch/arm/boot/dts/omap4-l4.dtsi            |   4 -
 arch/arm/boot/dts/omap4.dtsi               |   8 +-
 arch/arm/boot/dts/omap5.dtsi               |   4 -
 arch/arm/mach-omap2/Kconfig                |   3 -
 arch/arm/mach-omap2/Makefile               |  11 +-
 arch/arm/mach-omap2/common.h               |   9 -
 arch/arm/mach-omap2/io.c                   |  12 +-
 arch/arm/mach-omap2/omap_hwmod.c           |   8 -
 arch/arm/mach-omap2/omap_hwmod.h           |  14 +-
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 877 -----------------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 467 ---------------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c  | 719 -----------------------
 arch/arm/mach-omap2/pdata-quirks.c         |   2 +-
 arch/arm/mach-omap2/sr_device.c            |   7 +
 drivers/bus/ti-sysc.c                      |   3 +
 17 files changed, 35 insertions(+), 2119 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_44xx_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_54xx_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_7xx_data.c
