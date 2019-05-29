Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4B02D665
	for <lists+linux-omap@lfdr.de>; Wed, 29 May 2019 09:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfE2Hcc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 May 2019 03:32:32 -0400
Received: from muru.com ([72.249.23.125]:51632 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbfE2Hcc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 May 2019 03:32:32 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E0DB18027;
        Wed, 29 May 2019 07:32:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     arm@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] mmc voltage and boot issue fixes for omaps for v5.2
Date:   Wed, 29 May 2019 00:32:27 -0700
Message-Id: <pull-1559115102-965591@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.2/fixes-rc2

for you to fetch changes up to 4ee23cd76c0ce8622976b3da0e2bc89e6d94f6d4:

  Merge branch 'omap-for-v5.2/ti-sysc' into fixes (2019-05-20 08:33:03 -0700)

----------------------------------------------------------------
Fixes for omap variants for dra7 mmc voltage and boot issues

This series contains dra7 mmc voltage fixes, and fixes to the recent
changes to probe devices with device tree data insteas of legacy
platform data:

- Two fixes for dra7 mmc that needs 1.8V mode disabled as in case of a
  reset, the bootrom will try to access the mmc card at 3.3V potentially
  damaging the card

- Two regression fixes for am335x d_can. We must allow devices with no
  control registers for ti-sysc interconnect target module driver for
  at least d_can, and we remove the incorrect control registers for
  d_can. And we must configure the osc clock for d_can as otherwise
  register access may fail depending on the bootloader version

- Four regression fixes for dra7 variant dts files to tag rtc and usb4
  as disabled for dra71x and dra76x. These SoC variants do not have
  these devices, and got accidentally enabled when the L4 interconnect
  got defined in the dra7-l4.dtsi for the dra7 SoC family

----------------------------------------------------------------
Faiz Abbas (2):
      ARM: dts: am57xx-idk: Remove support for voltage switching for SD card
      ARM: dts: dra76x: Update MMC2_HS200_MANUAL1 iodelay values

Keerthy (4):
      ARM: dts: dra76x: Disable rtc target module
      ARM: dts: dra76x: Disable usb4_tm target module
      ARM: dts: dra71x: Disable rtc target module
      ARM: dts: dra71x: Disable usb4_tm target module

Tony Lindgren (5):
      ARM: dts: Configure osc clock for d_can on am335x
      bus: ti-sysc: Handle devices with no control registers
      Merge branch 'am5-sdio-fixes' into fixes
      Merge branch 'fixes-dra7' into fixes
      Merge branch 'omap-for-v5.2/ti-sysc' into fixes

 arch/arm/boot/dts/am33xx-l4.dtsi          | 14 +++++------
 arch/arm/boot/dts/am437x-l4.dtsi          |  4 ----
 arch/arm/boot/dts/am57xx-idk-common.dtsi  |  1 +
 arch/arm/boot/dts/dra7-l4.dtsi            |  2 +-
 arch/arm/boot/dts/dra71-evm.dts           |  2 +-
 arch/arm/boot/dts/dra71x.dtsi             | 17 +++++++++++++
 arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi | 40 +++++++++++++++----------------
 arch/arm/boot/dts/dra76x.dtsi             |  8 +++++++
 drivers/bus/ti-sysc.c                     | 23 +++++++++---------
 9 files changed, 65 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm/boot/dts/dra71x.dtsi
