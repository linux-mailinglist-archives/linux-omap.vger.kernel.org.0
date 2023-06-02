Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D7F71FEB1
	for <lists+linux-omap@lfdr.de>; Fri,  2 Jun 2023 12:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbjFBKNW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Jun 2023 06:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbjFBKNU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Jun 2023 06:13:20 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A5A2B1BC
        for <linux-omap@vger.kernel.org>; Fri,  2 Jun 2023 03:13:15 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 505A181B3;
        Fri,  2 Jun 2023 10:13:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Clean-up for omap pinctrl-single nodes for v6.5
Date:   Fri,  2 Jun 2023 13:13:06 +0300
Message-ID: <pull-1685700720-242492@atomide.com-2>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <pull-1685700720-242492@atomide.com>
References: <pull-1685700720-242492@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.5/dt-pin-nodes-signed

for you to fetch changes up to 5cb957a188c7c71f6fdae6bc5a730eb7cbb676ca:

  ARM: dts: Unify pinctrl-single pin group nodes for dra7 (2023-05-23 10:59:46 +0300)

----------------------------------------------------------------
Clean-up for pinctrl-single node names for omaps for v6.5

To avoid producing lots of make dtbs checks warnings when the yaml binding
for pinctrl-single gets merged, let's fix up the pin group node names. We
want to do this rather than add non-standard node name workarounds to the
yaml binding.

Also included is a non-urgent fix to move gta04 model name out of the pinmux
node that can wait for the merge window.

----------------------------------------------------------------
Tony Lindgren (9):
      ARM: dts: gta04: Move model property out of pinctrl node
      ARM: dts: Unify pinctrl-single pin group nodes for omap3
      ARM: dts: Unify pinctrl-single pin group nodes for omap2
      ARM: dts: Unify pinctrl-single pin group nodes for omap4
      ARM: dts: Unify pinctrl-single pin group nodes for omap5
      ARM: dts: Unify pinctrl-single pin group nodes for ti81xx
      ARM: dts: Unify pinctrl-single pin group nodes for am33xx
      ARM: dts: Unify pinctrl-single pin group nodes for am4
      ARM: dts: Unify pinctrl-single pin group nodes for dra7

 arch/arm/boot/dts/am335x-baltos-ir2110.dts         |  4 +-
 arch/arm/boot/dts/am335x-baltos-ir3220.dts         |  8 +--
 arch/arm/boot/dts/am335x-baltos-ir5221.dts         | 10 +--
 arch/arm/boot/dts/am335x-baltos-leds.dtsi          |  2 +-
 arch/arm/boot/dts/am335x-baltos.dtsi               | 20 +++---
 arch/arm/boot/dts/am335x-base0033.dts              |  6 +-
 arch/arm/boot/dts/am335x-bone-common.dtsi          | 22 +++---
 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi       |  6 +-
 arch/arm/boot/dts/am335x-boneblack-wireless.dts    |  8 +--
 arch/arm/boot/dts/am335x-boneblue.dts              | 34 +++++-----
 arch/arm/boot/dts/am335x-bonegreen-common.dtsi     |  2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts    |  8 +--
 arch/arm/boot/dts/am335x-chiliboard.dts            | 16 ++---
 arch/arm/boot/dts/am335x-chilisom.dtsi             |  4 +-
 arch/arm/boot/dts/am335x-cm-t335.dts               | 36 +++++-----
 arch/arm/boot/dts/am335x-evm.dts                   | 40 +++++------
 arch/arm/boot/dts/am335x-evmsk.dts                 | 34 +++++-----
 arch/arm/boot/dts/am335x-guardian.dts              | 30 ++++-----
 arch/arm/boot/dts/am335x-icev2.dts                 | 18 ++---
 arch/arm/boot/dts/am335x-igep0033.dtsi             |  8 +--
 arch/arm/boot/dts/am335x-lxm.dts                   | 16 ++---
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi  | 12 ++--
 arch/arm/boot/dts/am335x-moxa-uc-2101.dts          |  4 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi  | 24 +++----
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi         | 20 +++---
 arch/arm/boot/dts/am335x-myirtech-myd.dts          | 50 +++++++-------
 arch/arm/boot/dts/am335x-nano.dts                  | 20 +++---
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts       |  4 +-
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts       |  4 +-
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts       |  6 +-
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts        | 18 ++---
 arch/arm/boot/dts/am335x-pcm-953.dtsi              | 18 ++---
 arch/arm/boot/dts/am335x-pdu001.dts                | 28 ++++----
 arch/arm/boot/dts/am335x-pepper.dts                | 34 +++++-----
 arch/arm/boot/dts/am335x-phycore-som.dtsi          | 10 +--
 arch/arm/boot/dts/am335x-pocketbeagle.dts          | 26 ++++----
 arch/arm/boot/dts/am335x-regor.dtsi                | 14 ++--
 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi  |  6 +-
 .../boot/dts/am335x-sancloud-bbe-extended-wifi.dts |  6 +-
 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts     |  2 +-
 arch/arm/boot/dts/am335x-sancloud-bbe.dts          |  4 +-
 arch/arm/boot/dts/am335x-sbc-t335.dts              |  4 +-
 arch/arm/boot/dts/am335x-shc.dts                   | 30 ++++-----
 arch/arm/boot/dts/am335x-sl50.dts                  | 46 ++++++-------
 arch/arm/boot/dts/am335x-wega.dtsi                 | 12 ++--
 arch/arm/boot/dts/am3517-craneboard.dts            |  2 +-
 arch/arm/boot/dts/am3517-evm-ui.dtsi               |  4 +-
 arch/arm/boot/dts/am3517-evm.dts                   | 20 +++---
 arch/arm/boot/dts/am3517-som.dtsi                  | 14 ++--
 arch/arm/boot/dts/am3874-iceboard.dts              | 16 ++---
 arch/arm/boot/dts/am437x-cm-t43.dts                | 14 ++--
 arch/arm/boot/dts/am437x-gp-evm.dts                | 78 +++++++++++-----------
 arch/arm/boot/dts/am437x-idk-evm.dts               | 32 ++++-----
 arch/arm/boot/dts/am437x-sbc-t43.dts               | 14 ++--
 arch/arm/boot/dts/am437x-sk-evm.dts                | 54 +++++++--------
 arch/arm/boot/dts/am43x-epos-evm.dts               | 72 ++++++++++----------
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts          | 28 ++++----
 arch/arm/boot/dts/am57xx-idk-common.dtsi           |  4 +-
 arch/arm/boot/dts/am57xx-sbc-am57x.dts             | 14 ++--
 arch/arm/boot/dts/dm8148-evm.dts                   |  6 +-
 arch/arm/boot/dts/dm8148-t410.dts                  |  6 +-
 arch/arm/boot/dts/dm8168-evm.dts                   | 10 +--
 arch/arm/boot/dts/dra62x-j5eco-evm.dts             |  4 +-
 arch/arm/boot/dts/dra7-evm.dts                     |  4 +-
 arch/arm/boot/dts/dra7-mmc-iodelay.dtsi            |  2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi            |  4 +-
 arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi          | 28 ++++----
 arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi          | 44 ++++++------
 arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi          | 16 ++---
 arch/arm/boot/dts/logicpd-som-lv-35xx-devkit.dts   |  2 +-
 arch/arm/boot/dts/logicpd-som-lv-37xx-devkit.dts   |  2 +-
 arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi    | 16 ++---
 arch/arm/boot/dts/logicpd-som-lv.dtsi              | 24 +++----
 arch/arm/boot/dts/logicpd-torpedo-35xx-devkit.dts  |  2 +-
 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts  |  6 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   | 26 ++++----
 arch/arm/boot/dts/logicpd-torpedo-som.dtsi         | 14 ++--
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    | 40 +++++------
 arch/arm/boot/dts/omap2420-n810.dts                |  4 +-
 arch/arm/boot/dts/omap3-beagle-xm.dts              | 14 ++--
 arch/arm/boot/dts/omap3-beagle.dts                 | 14 ++--
 arch/arm/boot/dts/omap3-cm-t3517.dts               | 14 ++--
 arch/arm/boot/dts/omap3-cm-t3530.dts               |  2 +-
 arch/arm/boot/dts/omap3-cm-t3730.dts               |  6 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi                | 20 +++---
 arch/arm/boot/dts/omap3-cm-t3x30.dtsi              |  4 +-
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi     |  2 +-
 arch/arm/boot/dts/omap3-echo.dts                   | 12 ++--
 arch/arm/boot/dts/omap3-evm-37xx.dts               |  4 +-
 arch/arm/boot/dts/omap3-evm-common.dtsi            |  2 +-
 arch/arm/boot/dts/omap3-evm-processor-common.dtsi  | 18 ++---
 arch/arm/boot/dts/omap3-evm.dts                    |  4 +-
 arch/arm/boot/dts/omap3-gta04.dtsi                 | 54 +++++++--------
 arch/arm/boot/dts/omap3-gta04a5.dts                | 10 +--
 arch/arm/boot/dts/omap3-gta04a5one.dts             |  6 +-
 arch/arm/boot/dts/omap3-ha-common.dtsi             | 16 ++---
 arch/arm/boot/dts/omap3-ha-lcd.dts                 | 10 +--
 arch/arm/boot/dts/omap3-igep.dtsi                  | 16 ++---
 arch/arm/boot/dts/omap3-igep0020-common.dtsi       | 14 ++--
 arch/arm/boot/dts/omap3-igep0020-rev-f.dts         |  2 +-
 arch/arm/boot/dts/omap3-igep0020.dts               |  2 +-
 arch/arm/boot/dts/omap3-igep0030-common.dtsi       | 10 +--
 arch/arm/boot/dts/omap3-igep0030-rev-g.dts         |  4 +-
 arch/arm/boot/dts/omap3-igep0030.dts               |  2 +-
 arch/arm/boot/dts/omap3-ldp.dts                    |  6 +-
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi            | 30 ++++-----
 arch/arm/boot/dts/omap3-lilly-dbb056.dts           | 12 ++--
 arch/arm/boot/dts/omap3-n900.dts                   | 34 +++++-----
 arch/arm/boot/dts/omap3-n950-n9.dtsi               | 18 ++---
 arch/arm/boot/dts/omap3-n950.dts                   |  8 +--
 arch/arm/boot/dts/omap3-overo-alto35-common.dtsi   |  4 +-
 arch/arm/boot/dts/omap3-overo-base.dtsi            | 14 ++--
 arch/arm/boot/dts/omap3-overo-chestnut43.dts       |  4 +-
 arch/arm/boot/dts/omap3-overo-common-dvi.dtsi      |  2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi    | 10 +--
 arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi    | 10 +--
 .../boot/dts/omap3-overo-common-peripherals.dtsi   |  4 +-
 arch/arm/boot/dts/omap3-overo-gallop43.dts         |  4 +-
 arch/arm/boot/dts/omap3-overo-palo35.dts           |  4 +-
 arch/arm/boot/dts/omap3-overo-palo43.dts           |  4 +-
 arch/arm/boot/dts/omap3-overo-storm-chestnut43.dts |  4 +-
 arch/arm/boot/dts/omap3-overo-storm-gallop43.dts   |  4 +-
 arch/arm/boot/dts/omap3-overo-storm-palo35.dts     |  4 +-
 arch/arm/boot/dts/omap3-overo-storm-palo43.dts     |  4 +-
 arch/arm/boot/dts/omap3-overo-storm-summit.dts     |  2 +-
 arch/arm/boot/dts/omap3-overo-storm.dtsi           |  4 +-
 arch/arm/boot/dts/omap3-overo-summit.dts           |  2 +-
 arch/arm/boot/dts/omap3-overo.dtsi                 |  4 +-
 arch/arm/boot/dts/omap3-pandora-1ghz.dts           |  6 +-
 arch/arm/boot/dts/omap3-pandora-600mhz.dts         |  6 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi        | 16 ++---
 arch/arm/boot/dts/omap3-sb-t35.dtsi                |  8 +--
 arch/arm/boot/dts/omap3-sbc-t3517.dts              |  4 +-
 arch/arm/boot/dts/omap3-sbc-t3530.dts              |  2 +-
 arch/arm/boot/dts/omap3-sbc-t3730.dts              |  2 +-
 arch/arm/boot/dts/omap3-sniper.dts                 | 20 +++---
 arch/arm/boot/dts/omap3-tao3530.dtsi               | 20 +++---
 arch/arm/boot/dts/omap3-thunder.dts                |  6 +-
 arch/arm/boot/dts/omap3-zoom3.dts                  | 18 ++---
 arch/arm/boot/dts/omap4-duovero-parlor.dts         | 12 ++--
 arch/arm/boot/dts/omap4-duovero.dtsi               | 18 ++---
 arch/arm/boot/dts/omap4-kc1.dts                    | 14 ++--
 arch/arm/boot/dts/omap4-mcpdm.dtsi                 |  2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi          | 30 ++++-----
 arch/arm/boot/dts/omap4-panda-es.dts               |  8 +--
 arch/arm/boot/dts/omap4-sdp.dts                    | 36 +++++-----
 arch/arm/boot/dts/omap4-var-om44customboard.dtsi   | 24 +++----
 arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi     |  6 +-
 arch/arm/boot/dts/omap4-var-som-om44.dtsi          | 22 +++---
 arch/arm/boot/dts/omap5-board-common.dtsi          | 42 ++++++------
 arch/arm/boot/dts/omap5-cm-t54.dts                 | 32 ++++-----
 arch/arm/boot/dts/omap5-igep0050.dts               |  4 +-
 arch/arm/boot/dts/omap5-sbc-t54.dts                |  4 +-
 arch/arm/boot/dts/omap5-uevm.dts                   |  6 +-
 arch/arm/boot/dts/twl4030_omap3.dtsi               |  4 +-
 arch/arm/boot/dts/twl6030_omap4.dtsi               |  4 +-
 156 files changed, 1098 insertions(+), 1096 deletions(-)
