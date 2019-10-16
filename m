Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D29D9703
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 18:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393570AbfJPQWN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 12:22:13 -0400
Received: from muru.com ([72.249.23.125]:37568 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727451AbfJPQWN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Oct 2019 12:22:13 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 642748107;
        Wed, 16 Oct 2019 16:22:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] more fixes for omaps for v5.4
Date:   Wed, 16 Oct 2019 09:22:08 -0700
Message-Id: <pull-1571242890-118432@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/fixes-rc3-signed

for you to fetch changes up to 17a9e5bbbfe5a5a6356e47cdc1c1656e1e5e1f62:

  Merge tag 'wlcore-fix' into fixes (2019-10-11 09:15:35 -0700)

----------------------------------------------------------------
Fixes for omaps for v5.4-rc cycle

More fixes for omap variants:

- Update more panel options in omap2plus_defconfig that got changed
  as we moved to use generic LCD panels

- Remove unused twl_keypad for logicpd-torpedo-som to avoid boot
  time warnings. This is only a cosmetic fix, but at least dmesg output
  is now getting more readable after all the fixes to remove pointless
  warnings

- Fix gpu_cm node name as we still have a non-standard node name
  dependency for clocks. This should eventually get fixed by use
  of domain specific compatible property

- Fix use of i2c-mux-idle-disconnect for m3874-iceboard

- Use level interrupt for omap4 & 5 wlcore to avoid lost edge
  interrupts

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: logicpd-torpedo-som: Remove twl_keypad

Andrey Smirnov (1):
      ARM: dts: am3874-iceboard: Fix 'i2c-mux-idle-disconnect' usage

Tero Kristo (1):
      ARM: dts: omap5: fix gpu_cm clock provider name

Tony Lindgren (4):
      ARM: omap2plus_defconfig: Fix selected panels after generic panel changes
      Merge tag 'fix-missing-panels' into fixes
      ARM: dts: Use level interrupt for omap4 & 5 wlcore
      Merge tag 'wlcore-fix' into fixes

 arch/arm/boot/dts/am335x-icev2.dts                 |   2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                   |   6 +-
 arch/arm/boot/dts/am3874-iceboard.dts              |   9 +-
 arch/arm/boot/dts/am4372.dtsi                      |   2 +
 arch/arm/boot/dts/dra7-l4.dtsi                     |  48 +++++-----
 arch/arm/boot/dts/logicpd-torpedo-som.dtsi         |   4 +
 arch/arm/boot/dts/omap3-gta04.dtsi                 |   1 +
 arch/arm/boot/dts/omap4-droid4-xt894.dts           |   2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi          |   2 +-
 arch/arm/boot/dts/omap4-sdp.dts                    |   2 +-
 arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi     |   2 +-
 arch/arm/boot/dts/omap5-board-common.dtsi          |   2 +-
 arch/arm/boot/dts/omap54xx-clocks.dtsi             |   2 +-
 arch/arm/configs/omap2plus_defconfig               |  15 ++--
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c |   3 +-
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         |   5 +-
 arch/arm/mach-omap2/pm.c                           | 100 ---------------------
 drivers/clk/ti/clk-7xx.c                           |   6 +-
 18 files changed, 57 insertions(+), 156 deletions(-)
