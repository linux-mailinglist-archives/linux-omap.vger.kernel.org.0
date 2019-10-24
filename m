Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5C3E380F
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 18:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503473AbfJXQhC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 12:37:02 -0400
Received: from muru.com ([72.249.23.125]:39788 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503452AbfJXQhB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Oct 2019 12:37:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2DB0C80C5;
        Thu, 24 Oct 2019 16:37:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] soc changes for omaps for v5.5
Date:   Thu, 24 Oct 2019 09:36:53 -0700
Message-Id: <pull-1571934890-285615@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 17a9e5bbbfe5a5a6356e47cdc1c1656e1e5e1f62:

  Merge tag 'wlcore-fix' into fixes (2019-10-11 09:15:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/soc-signed

for you to fetch changes up to bc794744cdc56f53b495debbe054946d1b620441:

  Merge branch 'omap-for-v5.5/pm' into omap-for-v5.5/soc (2019-10-23 10:42:39 -0700)

----------------------------------------------------------------
SoC changes for omaps for v5.5

This series of changes contains SoC related clean-up, and some PM
improvments:

- SoC clean-up to drop unused enable_wakeup and disable_wakeup,
  simplify clkdm_clock_enable and disable, and few sparse fixes

- Drop pdata-quirks for TI bluetooth, this is now handled by a serdev
  driver

- A series of PM changes to re-enable core oswr (open switch retention)
  for omap4 that got disabled earlier because of various gpio-omap issues
  that have been fixed earlier this year. We want to do this in small
  steps for the pwrdm_set_logic_retst() changes so we can identify the
  domain in case of unexpected issues

- A series of PM changes to configure voltage controller for droid4.
  Eventually the voltage controller configuration should use device tree,
  but we want to get things working first. These changes bring down
  down the idle power consumption for droid4 with LCD blanked, WLAN
  connected, USB disabled, and modem disabled to about 32 to 35mW from
  about 39 to 45 mW

----------------------------------------------------------------
Ben Dooks (4):
      ARM: OMAP2+: do not export am43xx_control functions
      ARM: OMAP2+: make dra7xx_sha0_hwmod static
      ARM: OMAP2+: prm44xx: make prm_{save,restore}_context static
      ARM: OMAP2+: make omap44xx_sha0_hwmod and omap44xx_l3_main_2__des static

Sebastian Reichel (1):
      ARM: OMAP2+: pdata-quirks: drop TI_ST/KIM support

Tony Lindgren (13):
      ARM: OMAP2+: Remove unused wakeup_cpu
      ARM: OMAP2+: Drop bogus wkup domain oswr setting
      ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC
      ARM: OMAP2+: Update 4430 voltage controller operating points
      ARM: OMAP2+: Configure voltage controller for cpcap
      ARM: OMAP2+: Allow per oswr for omap4
      ARM: OMAP2+: Allow core oswr for omap4
      ARM: OMAP2+: Initialize voltage controller for omap4
      ARM: OMAP2+: Drop unused enable_wakeup and disable_wakeup
      ARM: OMAP2+: Simplify code for clkdm_clock_enable and disable
      ARM: OMAP2+: Configure voltage controller for retention
      ARM: OMAP2+: Configure voltage controller for cpcap to low-speed
      Merge branch 'omap-for-v5.5/pm' into omap-for-v5.5/soc

YueHaibing (2):
      ARM: OMAP2+: Make some functions static
      ARM: OMAP2+: Remove duplicated include from pmic-cpcap.c

 arch/arm/mach-omap2/Makefile               |   5 +
 arch/arm/mach-omap2/clockdomain.c          |  78 +++------
 arch/arm/mach-omap2/control.c              |   4 +-
 arch/arm/mach-omap2/control.h              |   1 +
 arch/arm/mach-omap2/omap-mpuss-lowpower.c  |   2 -
 arch/arm/mach-omap2/omap_hwmod.c           |  97 -----------
 arch/arm/mach-omap2/omap_hwmod.h           |   3 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c |   4 +-
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c  |   2 +-
 arch/arm/mach-omap2/omap_twl.c             |   8 +-
 arch/arm/mach-omap2/opp4xxx_data.c         |  16 +-
 arch/arm/mach-omap2/pdata-quirks.c         |  52 ------
 arch/arm/mach-omap2/pm.c                   |   1 +
 arch/arm/mach-omap2/pm.h                   |  14 ++
 arch/arm/mach-omap2/pm44xx.c               |  13 +-
 arch/arm/mach-omap2/pmic-cpcap.c           | 271 +++++++++++++++++++++++++++++
 arch/arm/mach-omap2/prm44xx.c              |   4 +-
 arch/arm/mach-omap2/vc.c                   |  57 +++++-
 arch/arm/mach-omap2/vc.h                   |   2 +-
 19 files changed, 389 insertions(+), 245 deletions(-)
 create mode 100644 arch/arm/mach-omap2/pmic-cpcap.c
