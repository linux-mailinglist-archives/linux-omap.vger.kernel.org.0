Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A882F25C4E5
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 17:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgICPU3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 11:20:29 -0400
Received: from muru.com ([72.249.23.125]:41904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728514AbgICL1B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Sep 2020 07:27:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5F6DE80F1;
        Thu,  3 Sep 2020 11:26:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.10
Date:   Thu,  3 Sep 2020 14:26:40 +0300
Message-Id: <pull-1599132307-761202@atomide.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/soc-signed

for you to fetch changes up to 501e69b028a47e20cb0d842e267fc5aa5e5230aa:

  Merge branch 'omap-for-v5.10/omap1' into omap-for-v5.10/soc (2020-09-03 11:50:37 +0300)

----------------------------------------------------------------
SoC changes for omaps for v5.10

Few changes to replace HTTP links with HTTPS, and a change to
delete a duplicate word for omap1 mux.h comments.

----------------------------------------------------------------
Alexander A. Klimov (5):
      ARM: OMAP2+: PRM: Replace HTTP links with HTTPS ones
      ARM: OMAP2+: Replace HTTP links with HTTPS ones
      ARM: OMAP2+: hwmod: Replace HTTP links with HTTPS ones
      ARM: OMAP2+: pm33xx-core: Replace HTTP links with HTTPS ones
      ARM: OMAP2+: Replace HTTP links with HTTPS ones

Randy Dunlap (1):
      arm: mach-omap1: mux.h: delete duplicate word

Tony Lindgren (1):
      Merge branch 'omap-for-v5.10/omap1' into omap-for-v5.10/soc

 arch/arm/mach-omap1/include/mach/mux.h        | 2 +-
 arch/arm/mach-omap2/am33xx.h                  | 2 +-
 arch/arm/mach-omap2/board-generic.c           | 2 +-
 arch/arm/mach-omap2/clockdomains33xx_data.c   | 2 +-
 arch/arm/mach-omap2/clockdomains81xx_data.c   | 2 +-
 arch/arm/mach-omap2/cm-regbits-33xx.h         | 2 +-
 arch/arm/mach-omap2/cm-regbits-54xx.h         | 2 +-
 arch/arm/mach-omap2/cm-regbits-7xx.h          | 2 +-
 arch/arm/mach-omap2/cm1_54xx.h                | 2 +-
 arch/arm/mach-omap2/cm1_7xx.h                 | 2 +-
 arch/arm/mach-omap2/cm2_54xx.h                | 2 +-
 arch/arm/mach-omap2/cm2_7xx.h                 | 2 +-
 arch/arm/mach-omap2/cm33xx.c                  | 2 +-
 arch/arm/mach-omap2/cm33xx.h                  | 2 +-
 arch/arm/mach-omap2/cm81xx.h                  | 2 +-
 arch/arm/mach-omap2/display.c                 | 2 +-
 arch/arm/mach-omap2/dma.c                     | 2 +-
 arch/arm/mach-omap2/l3_2xxx.h                 | 2 +-
 arch/arm/mach-omap2/l3_3xxx.h                 | 2 +-
 arch/arm/mach-omap2/l4_2xxx.h                 | 2 +-
 arch/arm/mach-omap2/omap-iommu.c              | 2 +-
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    | 2 +-
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c    | 2 +-
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 2 +-
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c    | 2 +-
 arch/arm/mach-omap2/omap_opp_data.h           | 2 +-
 arch/arm/mach-omap2/omap_phy_internal.c       | 2 +-
 arch/arm/mach-omap2/opp3xxx_data.c            | 2 +-
 arch/arm/mach-omap2/opp4xxx_data.c            | 2 +-
 arch/arm/mach-omap2/pm33xx-core.c             | 2 +-
 arch/arm/mach-omap2/powerdomains33xx_data.c   | 2 +-
 arch/arm/mach-omap2/prcm43xx.h                | 2 +-
 arch/arm/mach-omap2/prcm_mpu54xx.h            | 2 +-
 arch/arm/mach-omap2/prcm_mpu7xx.h             | 2 +-
 arch/arm/mach-omap2/prm-regbits-33xx.h        | 2 +-
 arch/arm/mach-omap2/prm33xx.c                 | 2 +-
 arch/arm/mach-omap2/prm33xx.h                 | 2 +-
 arch/arm/mach-omap2/prm54xx.h                 | 2 +-
 arch/arm/mach-omap2/prm7xx.h                  | 2 +-
 arch/arm/mach-omap2/scrm54xx.h                | 2 +-
 arch/arm/mach-omap2/sleep33xx.S               | 2 +-
 arch/arm/mach-omap2/sleep43xx.S               | 2 +-
 arch/arm/mach-omap2/ti81xx.h                  | 2 +-
 arch/arm/mach-omap2/voltagedomains54xx_data.c | 2 +-
 44 files changed, 44 insertions(+), 44 deletions(-)
