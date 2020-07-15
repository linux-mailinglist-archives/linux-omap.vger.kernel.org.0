Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845FE221479
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jul 2020 20:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgGOSoY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jul 2020 14:44:24 -0400
Received: from muru.com ([72.249.23.125]:37094 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbgGOSoX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jul 2020 14:44:23 -0400
Received: from alpine.gateway.sonic.net (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B87FA8188;
        Wed, 15 Jul 2020 18:44:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] More device tree changes for omaps for v5.9
Date:   Wed, 15 Jul 2020 11:44:21 -0700
Message-Id: <pull-1594838111-649880@atomide.com-3>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <pull-1594838111-649880@atomide.com>
References: <pull-1594838111-649880@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e14d2c766392ff1f226017fd62f0b6283a53bd0c:

  ARM: dts: am335x-pocketbeagle: add gpio-line-names (2020-06-29 11:24:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.9/dt-pt2-signed

for you to fetch changes up to 75f66813e081d2bd718d931ee50334c12a9e4492:

  Replace HTTP links with HTTPS ones: OMAP DEVICE TREE SUPPORT (2020-07-13 11:25:29 -0700)

----------------------------------------------------------------
More dts changes for omaps for v5.9

A series of changes to configure IPU and DSP remoteproc for omap4 & 5.
And a change to configure the default mux for am335x-pocketbeagle, and
a change to use https for external links.

----------------------------------------------------------------
Alexander A. Klimov (1):
      Replace HTTP links with HTTPS ones: OMAP DEVICE TREE SUPPORT

Drew Fustini (1):
      ARM: dts: am335x-pocketbeagle: set default mux for gpio pins

Suman Anna (13):
      ARM: dts: omap4: Add timer_sys_ck clocks for timers
      ARM: dts: omap5: Add timer_sys_ck clocks for timers
      ARM: dts: omap4: Update the DSP node
      ARM: dts: omap4: Add IPU DT node
      ARM: dts: omap4: Add aliases for rproc nodes
      ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
      ARM: dts: omap4-panda-common:: Add system timers to DSP and IPU
      ARM: dts: omap5: Add DSP and IPU nodes
      ARM: dts: omap5: Add aliases for rproc nodes
      ARM: dts: omap5-uevm: Add CMA pools and enable IPU & DSP
      ARM: dts: omap5-uevm: Add system timers to DSP and IPU
      ARM: dts: omap4-panda-common: Add watchdog timers for IPU and DSP
      ARM: dts: omap5-uevm: Add watchdog timers for IPU and DSP

 arch/arm/boot/dts/am335x-baltos-ir2110.dts      |   2 +-
 arch/arm/boot/dts/am335x-baltos-ir3220.dts      |   2 +-
 arch/arm/boot/dts/am335x-baltos-ir5221.dts      |   2 +-
 arch/arm/boot/dts/am335x-baltos-leds.dtsi       |   2 +-
 arch/arm/boot/dts/am335x-baltos.dtsi            |   2 +-
 arch/arm/boot/dts/am335x-bone-common.dtsi       |   2 +-
 arch/arm/boot/dts/am335x-bone.dts               |   2 +-
 arch/arm/boot/dts/am335x-boneblack-common.dtsi  |   2 +-
 arch/arm/boot/dts/am335x-boneblack-wireless.dts |   2 +-
 arch/arm/boot/dts/am335x-boneblack.dts          |   2 +-
 arch/arm/boot/dts/am335x-boneblue.dts           |   2 +-
 arch/arm/boot/dts/am335x-bonegreen-common.dtsi  |   2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts |   2 +-
 arch/arm/boot/dts/am335x-bonegreen.dts          |   2 +-
 arch/arm/boot/dts/am335x-chiliboard.dts         |   2 +-
 arch/arm/boot/dts/am335x-chilisom.dtsi          |   2 +-
 arch/arm/boot/dts/am335x-evm.dts                |   2 +-
 arch/arm/boot/dts/am335x-evmsk.dts              |   2 +-
 arch/arm/boot/dts/am335x-guardian.dts           |   2 +-
 arch/arm/boot/dts/am335x-icev2.dts              |   2 +-
 arch/arm/boot/dts/am335x-lxm.dts                |   2 +-
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts    |   2 +-
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts    |   2 +-
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts    |   2 +-
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts     |   4 +-
 arch/arm/boot/dts/am335x-osd335x-common.dtsi    |   2 +-
 arch/arm/boot/dts/am335x-pdu001.dts             |   2 +-
 arch/arm/boot/dts/am335x-pocketbeagle.dts       | 127 +++++++++++++++++++++++-
 arch/arm/boot/dts/am335x-sancloud-bbe.dts       |   2 +-
 arch/arm/boot/dts/am33xx.dtsi                   |   2 +-
 arch/arm/boot/dts/am3517-craneboard.dts         |   2 +-
 arch/arm/boot/dts/am3517-evm-ui.dtsi            |   2 +-
 arch/arm/boot/dts/am3517-evm.dts                |   2 +-
 arch/arm/boot/dts/am3517.dtsi                   |   2 +-
 arch/arm/boot/dts/am3874-iceboard.dts           |   4 +-
 arch/arm/boot/dts/am4372.dtsi                   |   2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts             |   2 +-
 arch/arm/boot/dts/am437x-idk-evm.dts            |   2 +-
 arch/arm/boot/dts/am437x-sk-evm.dts             |   2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts            |   2 +-
 arch/arm/boot/dts/am57-pruss.dtsi               |   2 +-
 arch/arm/boot/dts/am5718.dtsi                   |   2 +-
 arch/arm/boot/dts/am571x-idk.dts                |   2 +-
 arch/arm/boot/dts/am5728.dtsi                   |   2 +-
 arch/arm/boot/dts/am572x-idk-common.dtsi        |   2 +-
 arch/arm/boot/dts/am572x-idk.dts                |   2 +-
 arch/arm/boot/dts/am5748.dtsi                   |   2 +-
 arch/arm/boot/dts/am574x-idk.dts                |   2 +-
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi |   2 +-
 arch/arm/boot/dts/am57xx-beagle-x15-revb1.dts   |   2 +-
 arch/arm/boot/dts/am57xx-beagle-x15-revc.dts    |   2 +-
 arch/arm/boot/dts/am57xx-beagle-x15.dts         |   2 +-
 arch/arm/boot/dts/am57xx-idk-common.dtsi        |   2 +-
 arch/arm/boot/dts/dra7-dspeve-thermal.dtsi      |   2 +-
 arch/arm/boot/dts/dra7-evm-common.dtsi          |   2 +-
 arch/arm/boot/dts/dra7-evm.dts                  |   2 +-
 arch/arm/boot/dts/dra7-iva-thermal.dtsi         |   2 +-
 arch/arm/boot/dts/dra7.dtsi                     |   2 +-
 arch/arm/boot/dts/dra71-evm.dts                 |   2 +-
 arch/arm/boot/dts/dra71x.dtsi                   |   2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi         |   2 +-
 arch/arm/boot/dts/dra72-evm-revc.dts            |   2 +-
 arch/arm/boot/dts/dra72-evm-tps65917.dtsi       |   4 +-
 arch/arm/boot/dts/dra72-evm.dts                 |   2 +-
 arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi       |   2 +-
 arch/arm/boot/dts/dra72x.dtsi                   |   2 +-
 arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi       |   2 +-
 arch/arm/boot/dts/dra74x.dtsi                   |   2 +-
 arch/arm/boot/dts/dra76-evm.dts                 |   2 +-
 arch/arm/boot/dts/dra76x.dtsi                   |   2 +-
 arch/arm/boot/dts/omap2.dtsi                    |   2 +-
 arch/arm/boot/dts/omap2420-h4.dts               |   2 +-
 arch/arm/boot/dts/omap2420.dtsi                 |   2 +-
 arch/arm/boot/dts/omap2430-sdp.dts              |   2 +-
 arch/arm/boot/dts/omap2430.dtsi                 |   2 +-
 arch/arm/boot/dts/omap3-beagle-xm-ab.dts        |   2 +-
 arch/arm/boot/dts/omap3-beagle-xm.dts           |   2 +-
 arch/arm/boot/dts/omap3-beagle.dts              |   2 +-
 arch/arm/boot/dts/omap3-cpu-thermal.dtsi        |   2 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts            |   2 +-
 arch/arm/boot/dts/omap3-evm.dts                 |   2 +-
 arch/arm/boot/dts/omap3-ha-common.dtsi          |   2 +-
 arch/arm/boot/dts/omap3-ha-lcd.dts              |   2 +-
 arch/arm/boot/dts/omap3-ha.dts                  |   2 +-
 arch/arm/boot/dts/omap3-ldp.dts                 |   2 +-
 arch/arm/boot/dts/omap3-tao3530.dtsi            |   2 +-
 arch/arm/boot/dts/omap3-thunder.dts             |   2 +-
 arch/arm/boot/dts/omap3-zoom3.dts               |   2 +-
 arch/arm/boot/dts/omap3.dtsi                    |   2 +-
 arch/arm/boot/dts/omap3430-sdp.dts              |   2 +-
 arch/arm/boot/dts/omap34xx.dtsi                 |   2 +-
 arch/arm/boot/dts/omap36xx.dtsi                 |   2 +-
 arch/arm/boot/dts/omap4-cpu-thermal.dtsi        |   2 +-
 arch/arm/boot/dts/omap4-l4-abe.dtsi             |  20 ++--
 arch/arm/boot/dts/omap4-l4.dtsi                 |  35 ++++---
 arch/arm/boot/dts/omap4-panda-a4.dts            |   2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi       |  36 ++++++-
 arch/arm/boot/dts/omap4-panda-es.dts            |   2 +-
 arch/arm/boot/dts/omap4-panda.dts               |   2 +-
 arch/arm/boot/dts/omap4-sdp-es23plus.dts        |   2 +-
 arch/arm/boot/dts/omap4-sdp.dts                 |   6 +-
 arch/arm/boot/dts/omap4-var-som-om44.dtsi       |   2 +-
 arch/arm/boot/dts/omap4.dtsi                    |  31 +++++-
 arch/arm/boot/dts/omap443x.dtsi                 |   2 +-
 arch/arm/boot/dts/omap4460.dtsi                 |   2 +-
 arch/arm/boot/dts/omap5-board-common.dtsi       |   2 +-
 arch/arm/boot/dts/omap5-core-thermal.dtsi       |   2 +-
 arch/arm/boot/dts/omap5-gpu-thermal.dtsi        |   2 +-
 arch/arm/boot/dts/omap5-l4-abe.dtsi             |  20 ++--
 arch/arm/boot/dts/omap5-l4.dtsi                 |  35 ++++---
 arch/arm/boot/dts/omap5-uevm.dts                |  36 ++++++-
 arch/arm/boot/dts/omap5.dtsi                    |  27 ++++-
 arch/arm/boot/dts/twl6030_omap4.dtsi            |   2 +-
 113 files changed, 423 insertions(+), 162 deletions(-)
