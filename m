Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30AAF4892DD
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jan 2022 08:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240840AbiAJH4X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Jan 2022 02:56:23 -0500
Received: from muru.com ([72.249.23.125]:48160 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243681AbiAJHzp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 10 Jan 2022 02:55:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 84DAA805F;
        Mon, 10 Jan 2022 07:56:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date:   Mon, 10 Jan 2022 09:55:38 +0200
Message-Id: <pull-1641801310-149268@atomide.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.17/fixes-for-merge-window-signed

for you to fetch changes up to 31aa7056bbec0259e2ec91db7d3571f66b14f93f:

  ARM: dts: Don't use legacy clock defines for dra7 clkctrl (2021-12-22 08:28:19 +0200)

----------------------------------------------------------------
Fixes for omaps

A series of fixes for omap variants for minor issues, and a fix for a timer
regression for some omap3 beagleboard versions.

The timer fix needs to patch both the dts and the timer code because
otherwise the timer quirk handling for old dtbs will prevent the dts fix
from working.

The other changes are for issues found by automated analysis, a macasp
typo fix, and two cosmetic fixes for clocks.

----------------------------------------------------------------
Jayesh Choudhary (1):
      ARM: dts: am335x-wega: Fix typo in mcasp property rx-num-evt

Tony Lindgren (3):
      ARM: dts: Fix timer regression for beagleboard revision c
      clk: ti: Move dra7 clock devices out of the legacy section
      ARM: dts: Don't use legacy clock defines for dra7 clkctrl

Wan Jiabing (1):
      ARM: OMAP2+: hwmod: Add of_node_put() before break

Ye Guojin (1):
      ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of

 .../devicetree/bindings/arm/omap/omap.txt          |  3 ++
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/am335x-wega.dtsi                 |  2 +-
 arch/arm/boot/dts/dra7.dtsi                        | 20 ++++-----
 arch/arm/boot/dts/omap3-beagle-ab4.dts             | 47 ++++++++++++++++++++++
 arch/arm/boot/dts/omap3-beagle.dts                 | 33 ---------------
 arch/arm/mach-omap2/display.c                      |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c                   |  4 +-
 drivers/clocksource/timer-ti-dm-systimer.c         |  2 +-
 include/dt-bindings/clock/dra7.h                   | 14 +++----
 10 files changed, 74 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap3-beagle-ab4.dts
