Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725931DEE9B
	for <lists+linux-omap@lfdr.de>; Fri, 22 May 2020 19:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730747AbgEVRtX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 22 May 2020 13:49:23 -0400
Received: from muru.com ([72.249.23.125]:55536 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726373AbgEVRtX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 22 May 2020 13:49:23 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3ED088087;
        Fri, 22 May 2020 17:50:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [GIT PULL] System timer changes for omaps for v5.8
Date:   Fri, 22 May 2020 10:49:13 -0700
Message-Id: <pull-1590169577-735045@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.8/timer-signed

for you to fetch changes up to 1a5428119bc36b0a882e87fe2620c769ba655763:

  bus: ti-sysc: Timers no longer need legacy quirk handling (2020-05-19 09:38:05 -0700)

----------------------------------------------------------------
System timer changes for omaps for v5.8 merge window

This series of changes finally gets the legacy omap dual-mode timer and
32k counter system timer updated to use drivers/clocksource and device
tree data. And we can now remove the unused legacy platform data.

These changes are based on an immutable clocksource branch set up by
Daniel Lezcano.

----------------------------------------------------------------
Tony Lindgren (15):
      clocksource/drivers/timer-ti-32k: Add support for initializing directly
      clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support
      clocksource/drivers/timer-ti-dm: Fix warning for set but not used
      clk: ti: dm816: enable sysclk6_ck on init
      bus: ti-sysc: Ignore timer12 on secure omap3
      ARM: OMAP2+: Add omap_init_time_of()
      ARM: dts: Configure system timers for am335x
      ARM: dts: Configure system timers for am437x
      ARM: dts: Configure system timers for omap4
      ARM: dts: Configure system timers for omap5 and dra7
      ARM: dts: Configure system timers for omap3
      ARM: dts: Configure system timers for ti81xx
      ARM: dts: Configure system timers for omap2
      ARM: OMAP2+: Drop old timer code for dmtimer and 32k counter
      bus: ti-sysc: Timers no longer need legacy quirk handling

 arch/arm/boot/dts/am33xx-l4.dtsi                   |   6 +-
 arch/arm/boot/dts/am33xx.dtsi                      |  20 +
 arch/arm/boot/dts/am3517.dtsi                      |  24 +-
 arch/arm/boot/dts/am4372.dtsi                      |  20 +
 arch/arm/boot/dts/am437x-l4.dtsi                   |   7 +-
 arch/arm/boot/dts/dm814x.dtsi                      |  74 ++-
 arch/arm/boot/dts/dm816x.dtsi                      |  78 ++-
 arch/arm/boot/dts/dra7-l4.dtsi                     |   7 +-
 arch/arm/boot/dts/dra7.dtsi                        |  10 +
 arch/arm/boot/dts/omap2.dtsi                       |  31 +-
 arch/arm/boot/dts/omap2420.dtsi                    |  68 +-
 arch/arm/boot/dts/omap2430.dtsi                    |  68 +-
 arch/arm/boot/dts/omap3-beagle.dts                 |  33 +
 arch/arm/boot/dts/omap3-devkit8000.dts             |  33 +
 arch/arm/boot/dts/omap3.dtsi                       | 134 +++-
 arch/arm/boot/dts/omap4-l4.dtsi                    |   4 +-
 arch/arm/boot/dts/omap4.dtsi                       |  10 +
 arch/arm/boot/dts/omap5-l4.dtsi                    |   4 +-
 arch/arm/boot/dts/omap5.dtsi                       |  10 +
 arch/arm/mach-omap2/Makefile                       |   4 +-
 arch/arm/mach-omap2/board-generic.c                |  32 +-
 arch/arm/mach-omap2/common.h                       |   7 +
 arch/arm/mach-omap2/omap_hwmod_2420_data.c         |  20 -
 arch/arm/mach-omap2/omap_hwmod_2430_data.c         |  19 -
 .../mach-omap2/omap_hwmod_2xxx_interconnect_data.c |   8 -
 arch/arm/mach-omap2/omap_hwmod_2xxx_ipblock_data.c |  47 --
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |   2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |   8 -
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c |  62 --
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         |  10 -
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c         | 146 +----
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         |  45 --
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c         |  90 ---
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c         |  89 ---
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c          | 176 -----
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c         |  74 ---
 arch/arm/mach-omap2/omap_hwmod_common_data.h       |   3 -
 arch/arm/mach-omap2/timer.c                        | 568 +---------------
 drivers/bus/ti-sysc.c                              |  25 +-
 drivers/clk/ti/clk-816x.c                          |   1 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-ti-32k.c                 |  48 +-
 drivers/clocksource/timer-ti-dm-systimer.c         | 727 +++++++++++++++++++++
 43 files changed, 1368 insertions(+), 1485 deletions(-)
 create mode 100644 drivers/clocksource/timer-ti-dm-systimer.c
