Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1661E2C608D
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 08:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392737AbgK0Hia (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 02:38:30 -0500
Received: from muru.com ([72.249.23.125]:49416 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387909AbgK0Hia (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 27 Nov 2020 02:38:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3C4E080EE;
        Fri, 27 Nov 2020 07:38:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Devicetree changes for omaps for v5.11 merge window
Date:   Fri, 27 Nov 2020 09:38:20 +0200
Message-Id: <pull-1606462656-588116@atomide.com-2>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606462656-588116@atomide.com>
References: <pull-1606462656-588116@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/dt-signed

for you to fetch changes up to d7356a7ab125c3a4fee521b7530f3122bc842ac4:

  ARM: dts: am335x: Fix comments for AM335X_PIN_GPMC_WPN pin in GPIO mode (2020-11-16 13:38:29 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v5.11 merge window

- Two non-urgent pandaboard updates to get gpio button and bluetooth
  working on pandaboard-es

- Updates to follow devicetree binding docs for dwc3 and pwm-leds

- Add initial support for droid bionic based on what we have for droid4

- Add second sha instance for dra7

- Add eQEP nodes for am335x for boneblue

- Fix wrong comments for am335x gpio_31

----------------------------------------------------------------
Alexander Dahl (1):
      ARM: dts: omap: Fix schema warnings for pwm-leds

Alexander Shiyan (1):
      ARM: dts: am335x: Fix comments for AM335X_PIN_GPMC_WPN pin in GPIO mode

Carl Philipp Klemm (2):
      ARM: dts: mapphone: separate out xt894 specific things
      ARM: dts: xt875: add section for kionix kxtf9

David Lechner (2):
      ARM: dts: am33xx: Add nodes for eQEP
      ARM: dts: am335x-boneblue: Enable eQEP

H. Nikolaus Schaller (2):
      ARM: dts: pandaboard: fix pinmux for gpio user button of Pandaboard ES
      ARM: dts: pandaboard es: add bluetooth uart for HCI

Serge Semin (2):
      ARM: dts: am437x: Correct DWC USB3 compatible string
      ARM: dts: omap5: Harmonize DWC USB3 DT nodes name

Tero Kristo (1):
      ARM: dts: dra7: add second SHA instance

Tony Lindgren (1):
      Merge branch 'omap-for-v5.11/dt-mot-take2' into omap-for-v5.11/dt

 arch/arm/boot/dts/am335x-baltos.dtsi            |   2 +-
 arch/arm/boot/dts/am335x-boneblue.dts           |  54 +++++++++
 arch/arm/boot/dts/am335x-cm-t335.dts            |   2 +-
 arch/arm/boot/dts/am335x-evm.dts                |   2 +-
 arch/arm/boot/dts/am335x-igep0033.dtsi          |   2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                |  27 +++++
 arch/arm/boot/dts/am437x-l4.dtsi                |   4 +-
 arch/arm/boot/dts/dra7.dtsi                     |  34 +++++-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 141 +----------------------
 arch/arm/boot/dts/omap3-beagle-xm.dts           |  10 +-
 arch/arm/boot/dts/omap3-overo-base.dtsi         |   4 +-
 arch/arm/boot/dts/omap4-droid-bionic-xt875.dts  |  46 ++++++++
 arch/arm/boot/dts/omap4-droid4-xt894.dts        | 143 ++++++++++++++++++++++++
 arch/arm/boot/dts/omap4-kc1.dts                 |   6 +-
 arch/arm/boot/dts/omap4-panda-es.dts            |  34 +++++-
 arch/arm/boot/dts/omap4-sdp.dts                 |  26 +++--
 arch/arm/boot/dts/omap5-l4.dtsi                 |   2 +-
 17 files changed, 367 insertions(+), 172 deletions(-)
