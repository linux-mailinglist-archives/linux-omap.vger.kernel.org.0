Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161A5306FF8
	for <lists+linux-omap@lfdr.de>; Thu, 28 Jan 2021 08:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbhA1HpY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Jan 2021 02:45:24 -0500
Received: from muru.com ([72.249.23.125]:53842 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231952AbhA1Hok (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 Jan 2021 02:44:40 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 22A2180A9;
        Thu, 28 Jan 2021 07:44:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.11-rc cycle
Date:   Thu, 28 Jan 2021 09:43:50 +0200
Message-Id: <pull-1611818709-243493@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/fixes-rc5

for you to fetch changes up to 177d8f1f7f47fe7c18ceb1d87893890d7e9c95a7:

  ARM: dts: omap4-droid4: Fix lost keypad slide interrupts for droid4 (2021-01-25 10:24:26 +0200)

----------------------------------------------------------------
Fixes for omaps for v5.11-rc cycle

The recent changes to switch SoCs to boot with ti-sysc interconnect
target module driver and genpd caused few regressions:

- The omap_prm reset driver needs to clear any reset bits deasserted by
  the bootloader or kexec boot for the three reset bit cases. Otherwise
  we can have an oops with accelerators starting to boot with potentially
  unconfigured MMU for example

- Custom kernel configs are not automatically selecting simple-pm-bus
  driver that we now need to probe interconnects so we need to select it
  always

- We are not passing legacy platform data in auxdata with simple-pm-bus
  like we do for simple-bus. We need to pass auxdata to simple-pm-bus so
  it can pass it to of_platform_populate()

Then recent RCU changes started causing splats for cpuidle44xx that now
need RCU_NONIDLE added to the calls in several places

And then we have few device specific fixes:

- We need to remove legacy spi-cs-hig for gta04 display to work, and
  set the gpio to active low

- Omap1 specific ohci-omap needs to call gpio_free()

- Droid4 needs to use padconf interrupt for the slider as the edge
  gpio interrupts may be lost for deeper idle states

----------------------------------------------------------------
H. Nikolaus Schaller (2):
      DTS: ARM: gta04: remove legacy spi-cs-high to make display work again
      ARM: dts; gta04: SPI panel chip select is active low

Linus Walleij (1):
      ARM: OMAP1: OSK: fix ohci-omap breakage

Tony Lindgren (7):
      Merge branch 'fixes-omap3' into fixes
      soc: ti: omap-prm: Fix boot time errors for rst_map_012 bits 0 and 1
      ARM: OMAP2+: Fix suspcious RCU usage splats for omap_enter_idle_coupled
      Merge branch 'cpuidle-fix' into fixes
      ARM: OMAP2+: Fix booting for am335x after moving to simple-pm-bus
      drivers: bus: simple-pm-bus: Fix compatibility with simple-bus for auxdata
      ARM: dts: omap4-droid4: Fix lost keypad slide interrupts for droid4

 arch/arm/boot/dts/omap3-gta04.dtsi       |  3 +--
 arch/arm/boot/dts/omap3-n950-n9.dtsi     |  8 ++++++++
 arch/arm/boot/dts/omap4-droid4-xt894.dts |  5 +++++
 arch/arm/mach-omap1/board-osk.c          |  2 ++
 arch/arm/mach-omap2/Kconfig              | 28 ++++++++++++++--------------
 arch/arm/mach-omap2/cpuidle44xx.c        | 16 ++++++++--------
 arch/arm/mach-omap2/omap_device.c        |  8 +++++---
 arch/arm/mach-omap2/pdata-quirks.c       |  1 +
 arch/arm/mach-omap2/pmic-cpcap.c         |  2 +-
 drivers/bus/simple-pm-bus.c              |  3 ++-
 drivers/soc/ti/omap_prm.c                | 11 +++++++++++
 11 files changed, 58 insertions(+), 29 deletions(-)
