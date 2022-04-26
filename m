Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802EC50F4EE
	for <lists+linux-omap@lfdr.de>; Tue, 26 Apr 2022 10:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344897AbiDZIkg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Apr 2022 04:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345788AbiDZIjb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Apr 2022 04:39:31 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3AEC2473B7
        for <linux-omap@vger.kernel.org>; Tue, 26 Apr 2022 01:31:05 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 59EA080C0;
        Tue, 26 Apr 2022 08:28:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] Devicetree changes for omaps
Date:   Tue, 26 Apr 2022 11:30:55 +0300
Message-Id: <pull-1650961799-428630@atomide.com-2>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <pull-1650961799-428630@atomide.com>
References: <pull-1650961799-428630@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 71ff461c3f41f6465434b9e980c01782763e7ad8:

  iommu/omap: Fix regression in probe for NULL pointer dereference (2022-04-08 11:16:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.19/dt-signed

for you to fetch changes up to dff844e1fe17e6c41e5899d46a378f857ea4f354:

  ARM: dts: am335x-baltos: update MPU regulator range (2022-04-21 14:12:52 +0300)

----------------------------------------------------------------
Devicetree changes for omaps

Devicetree changes for omaps:

- A series of changes to fix devicetree binding check warnings for omaps
  the the use of clock-output-names and clksel bindings

- Update Ethernet node names for omaps

- Pinctrl updates for logicpd-som-lv

- A series of updates for am335x-guardian

- Regulator range update for  am335x-baltos

Note that this branch is based on a upstream IOMMU fix as it's needed for
booting on some SoCs.

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: logicpd-som-lv: Move pinmuxing to peripheral nodes

Gireesh Hiremath (15):
      ARM: dts: am335x: Guardian: Update NAND partition table
      ARM: dts: am335x: Guardian: Rename power button label
      ARM: dts: am335x: Guardian: Add keypad
      ARM: dts: am335x: Guardian: Disable poweroff support from RTC
      ARM: dts: am335x: Guardian: Remove mmc status led
      ARM: dts: am335x: Guardian: Update life led
      ARM: dts: am335x: Guardian: Update beeper label
      ARM: dts: am335x: Guardian: Update regulator node name
      ARM: dts: am335x: Guardian: Add lcd port
      ARM: dts: am335x: Guardian: Update backlight parameter
      ARM: dts: am335x: Guardian: Enable UART port two
      ARM: dts: am335x: Guardian: Disable DMA property of USB1
      ARM: dts: am335x: Guardian: Update interface pinmux
      ARM: dts: am335x: Guardian: Add gpio line manes
      ARM: dts: am335x: Guardian: Update comments

Oleksij Rempel (1):
      ARM: dts: omap3/4/5: fix ethernet node name for different OMAP boards

Tony Lindgren (10):
      ARM: dts: Add clksel node for am3 ehrpwm
      ARM: dts: Add clksel node for am3 gfx
      ARM: dts: Add clksel node for am3 clkout
      ARM: dts: Use clock-output-names for am3
      ARM: dts: Use clock-output-names for dra7
      ARM: dts: Use clock-output-names for am4
      ARM: dts: Add clock-output-names for omap4
      ARM: dts: Drop custom clkctrl compatible and update omap4 l4per
      ARM: dts: Add clock-output-names for omap5
      ARM: dts: Drop custom clkctrl compatible and update omap5 l4per

Yegor Yefremov (1):
      ARM: dts: am335x-baltos: update MPU regulator range

 arch/arm/boot/dts/am335x-baltos.dtsi      |   2 +-
 arch/arm/boot/dts/am335x-guardian.dts     | 376 +++++++++++++---
 arch/arm/boot/dts/am33xx-clocks.dtsi      | 373 ++++++++++------
 arch/arm/boot/dts/am43xx-clocks.dtsi      | 339 ++++++++++-----
 arch/arm/boot/dts/dra7xx-clocks.dtsi      | 693 ++++++++++++++++++++----------
 arch/arm/boot/dts/logicpd-som-lv.dtsi     |  10 +-
 arch/arm/boot/dts/omap3-beagle-xm.dts     |   2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi |   2 +-
 arch/arm/boot/dts/omap443x-clocks.dtsi    |   1 +
 arch/arm/boot/dts/omap446x-clocks.dtsi    |   2 +
 arch/arm/boot/dts/omap44xx-clocks.dtsi    | 173 +++++++-
 arch/arm/boot/dts/omap5-igep0050.dts      |   2 +-
 arch/arm/boot/dts/omap5-uevm.dts          |   2 +-
 arch/arm/boot/dts/omap54xx-clocks.dtsi    | 160 ++++++-
 14 files changed, 1582 insertions(+), 555 deletions(-)
