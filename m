Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B9D3476FB
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 12:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhCXLUo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 07:20:44 -0400
Received: from muru.com ([72.249.23.125]:46404 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234691AbhCXLUn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 07:20:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 82F9B8057;
        Wed, 24 Mar 2021 11:21:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] More fixes for omaps for v5.12-rc cycle
Date:   Wed, 24 Mar 2021 13:20:39 +0200
Message-Id: <pull-1616584662-702939@atomide.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/fixes-rc4-signed

for you to fetch changes up to b3d09a06d89f474cb52664e016849315a97e09d9:

  ARM: OMAP4: PM: update ROM return address for OSWR and OFF (2021-03-17 15:15:52 +0200)

----------------------------------------------------------------
More fixes for omaps for v5.12-rc cycle

Two fixes for hangs, mmc slot order fix, and a voltage typo fix:

- Remove unused duplicate sha2md5_fck clock node that can race with the
  OMAP4_SHA2MD5_CLKCTRL clock node for disable for unused clocks

- Add aliases for omap4/5 mmc to put the slots back into the right
  order again

- Fix typo for bionic voltage controllers that accidentally use mpu
  for all instances instead of mpu, core and iva

- Fix random hangs for droid4 caused by missing fix from TI Android
  kernel tree to do a dummy smc call on cpuidle wakeup path

----------------------------------------------------------------

Note that the stats below also include my earlier pull request as the pull
request is generated against v5.12-rc2.

Carlos Leija (1):
      ARM: OMAP4: PM: update ROM return address for OSWR and OFF

Grygorii Strashko (1):
      bus: omap_l3_noc: mark l3 irqs as IRQF_NO_THREAD

Mans Rullgard (1):
      ARM: dts: am33xx: add aliases for mmc interfaces

Tony Lindgren (9):
      soc: ti: omap-prm: Fix reboot issue with invalid pcie reset map for dra7
      ARM: OMAP2+: Fix smartreflex init regression after dropping legacy data
      Merge branch 'fixes-v5.11' into fixes
      bus: ti-sysc: Fix warning on unbind if reset is not deasserted
      soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva
      ARM: dts: Drop duplicate sha2md5_fck to fix clk_disable race
      ARM: dts: Fix moving mmc devices with aliases for omap4 & 5
      Merge branch 'fixes-rc2' into fixes
      ARM: OMAP4: Fix PMIC voltage domains for bionic

 arch/arm/boot/dts/am33xx.dtsi          |  3 ++
 arch/arm/boot/dts/omap4.dtsi           |  5 +++
 arch/arm/boot/dts/omap44xx-clocks.dtsi |  8 ----
 arch/arm/boot/dts/omap5.dtsi           |  5 +++
 arch/arm/mach-omap2/omap-secure.c      | 39 ++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h      |  1 +
 arch/arm/mach-omap2/pmic-cpcap.c       |  4 +-
 arch/arm/mach-omap2/sr_device.c        | 75 ++++++++++++++++++++++++++--------
 drivers/bus/omap_l3_noc.c              |  4 +-
 drivers/bus/ti-sysc.c                  |  4 +-
 drivers/soc/ti/omap_prm.c              |  8 +++-
 11 files changed, 124 insertions(+), 32 deletions(-)
