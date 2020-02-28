Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 121C9173B5A
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2020 16:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgB1P0Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Feb 2020 10:26:25 -0500
Received: from muru.com ([72.249.23.125]:58168 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726951AbgB1P0Z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 Feb 2020 10:26:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id ED6A4806C;
        Fri, 28 Feb 2020 15:27:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.6-rc cycle
Date:   Fri, 28 Feb 2020 07:26:20 -0800
Message-Id: <pull-1582903541-589933@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/fixes-rc3-signed

for you to fetch changes up to 51c22d7b40dca8b39a33b2c3b03f13122a2a1af3:

  ARM: OMAP2+: Fix compile if CONFIG_HAVE_ARM_SMCCC is not set (2020-02-26 10:49:25 -0800)

----------------------------------------------------------------
Few fixes for omaps for v5.6-rc cycle

This series of changes contains few code fixes for issues
recently discovered:

- A build fix for ARMv6 only configs when CONFIG_HAVE_ARM_SMCCC is
  not set

- A fix for ti-sysc quirk handling for 1-wire hdq reset

And a handful of dts fixes that I had queued up and should
have already sent earlier instead of waiting for the code
fixes to get sorted out:

- Fix naming of vsys_3v3 regulator for dra7-evm

- Fix incorrect OPP node names for am437x-idk-evm

- Fix IPU1 mux clock parent source for dra7

- Add missing PWM property for dra7 timers 13 to 16

- Add missing dma-ranges for dra7 PCIe nodes

- Fix mmc3 max-frequency for dra76x

----------------------------------------------------------------
Faiz Abbas (1):
      arm: dts: dra76x: Fix mmc3 max-frequency

Grygorii Strashko (1):
      ARM: dts: dra7-l4: mark timer13-16 as pwm capable

Kishon Vijay Abraham I (1):
      ARM: dts: dra7: Add "dma-ranges" property to PCIe RC DT nodes

Peter Ujfalusi (1):
      ARM: dts: dra7-evm: Rename evm_3v3 regulator to vsys_3v3

Suman Anna (2):
      ARM: dts: am437x-idk-evm: Fix incorrect OPP node names
      ARM: dts: dra7xx-clocks: Fixup IPU1 mux clock parent source

Tony Lindgren (3):
      bus: ti-sysc: Fix 1-wire reset quirk
      Merge tag 'hdq-fix' into omap-for-v5.6/fixes-rc2
      ARM: OMAP2+: Fix compile if CONFIG_HAVE_ARM_SMCCC is not set

 arch/arm/boot/dts/am437x-idk-evm.dts |  4 ++--
 arch/arm/boot/dts/dra7-evm.dts       |  4 ++--
 arch/arm/boot/dts/dra7-l4.dtsi       |  4 ++++
 arch/arm/boot/dts/dra7.dtsi          |  2 ++
 arch/arm/boot/dts/dra76x.dtsi        |  5 +++++
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 12 ++----------
 arch/arm/mach-omap2/Makefile         |  2 +-
 arch/arm/mach-omap2/io.c             |  2 --
 drivers/bus/ti-sysc.c                |  4 ++--
 9 files changed, 20 insertions(+), 19 deletions(-)
