Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD14530788F
	for <lists+linux-omap@lfdr.de>; Thu, 28 Jan 2021 15:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhA1Ors (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Jan 2021 09:47:48 -0500
Received: from muru.com ([72.249.23.125]:54112 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232210AbhA1Opy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 Jan 2021 09:45:54 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 30B9F80F1;
        Thu, 28 Jan 2021 14:45:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] Devicetree changes for omaps for v5.12
Date:   Thu, 28 Jan 2021 16:45:02 +0200
Message-Id: <pull-1611845066-809577@atomide.com-2>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <pull-1611845066-809577@atomide.com>
References: <pull-1611845066-809577@atomide.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/dt-signed

for you to fetch changes up to 4231f3a72f9ac7f8738d003b7ad56fa998574fb8:

  ARM: dts: am335x-myirtech-*: Add DT for AM335X MYIR Tech Limited board (2021-01-26 13:21:31 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v5.12 merge window

This includes the following earlier patches that were considered too
late for v5.11 as discussed between Arnd and me on freenode #armlinux
in December:

- More updates to use cpsw switchdev driver

- Enable gta04 PMIC power management

- Updates for dra7 for ECC support, 1.8GHz speed and keep the
  ldo0 regulator always on as specified in the data manual

And then we have the new devicetree changes:

- Configure the original Amazon Echo to for audio

- Configure missing thermal interrupt for omap4430

- Configure mapphone devices for passive thermal cooling, and add
  1.2GHz mode.

- Correct omap4430 sgx clock rate to use the runtime Android kernel
  value, the earlier value was for a lower power operating point

- Drop turbo mode for 1GHz omap3 variants as we now have passive
  cooling configured

- Update email address for Javier

- Add new MYIR Tech Limited board support

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: omap36xx: Remove turbo mode for 1GHz variants

Alexander Shiyan (1):
      ARM: dts: am335x-myirtech-*: Add DT for AM335X MYIR Tech Limited board

Andreas Kemnade (1):
      ARM: dts: omap3-gta04: fix twl4030-power settings

André Hentschel (1):
      ARM: dts: omap3-echo: Add speaker sound card support

Carl Philipp Klemm (2):
      ARM: dts: motorola-mapphone: Add 1.2GHz OPP
      ARM: dts: omap443x: Correct sgx clock to 307.2MHz as used on motorola vendor kernel

Grygorii Strashko (2):
      ARM: dts: am33xx-l4: add dt node for new cpsw switchdev driver
      ARM: dts: am335x-evm/evmsk/icev2: switch to new cpsw switch drv

Javier Martinez Canillas (1):
      ARM: dts: omap3-igep: Change email address in copyright notice

Tero Kristo (3):
      ARM: dts: am574x-idk: add support for EMIF1 ECC
      ARM: dts: dra76x: add support for OPP_PLUS
      ARM: dts: dra71-evm: mark ldo0 regulator as always on

Tony Lindgren (3):
      Merge tag 'omap-for-v5.11/dt-late-signed' into omap-for-v5.12-dt
      ARM: dts: Configure missing thermal interrupt for 4430
      ARM: dts: motorola-mapphone: Configure lower temperature passive cooling

 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/am335x-evm.dts                |  13 +-
 arch/arm/boot/dts/am335x-evmsk.dts              |  14 +-
 arch/arm/boot/dts/am335x-icev2.dts              |  14 +-
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi      | 267 ++++++++++++
 arch/arm/boot/dts/am335x-myirtech-myd.dts       | 536 ++++++++++++++++++++++++
 arch/arm/boot/dts/am33xx-l4.dtsi                |  49 +++
 arch/arm/boot/dts/am574x-idk.dts                |   4 +
 arch/arm/boot/dts/dra71-evm.dts                 |   2 +
 arch/arm/boot/dts/dra76x.dtsi                   |  36 ++
 arch/arm/boot/dts/motorola-mapphone-common.dtsi |  23 +
 arch/arm/boot/dts/omap3-echo.dts                |  67 +++
 arch/arm/boot/dts/omap3-gta04.dtsi              |   4 +-
 arch/arm/boot/dts/omap3-igep.dtsi               |   2 +-
 arch/arm/boot/dts/omap3-igep0020-common.dtsi    |   2 +-
 arch/arm/boot/dts/omap3-igep0020-rev-f.dts      |   2 +-
 arch/arm/boot/dts/omap3-igep0020.dts            |   2 +-
 arch/arm/boot/dts/omap3-igep0030-common.dtsi    |   2 +-
 arch/arm/boot/dts/omap3-igep0030-rev-g.dts      |   2 +-
 arch/arm/boot/dts/omap3-igep0030.dts            |   2 +-
 arch/arm/boot/dts/omap36xx.dtsi                 |   1 -
 arch/arm/boot/dts/omap443x.dtsi                 |   6 +-
 22 files changed, 1018 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-myirtech-myc.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-myirtech-myd.dts
