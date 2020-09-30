Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CD427E0D9
	for <lists+linux-omap@lfdr.de>; Wed, 30 Sep 2020 08:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgI3GI2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Sep 2020 02:08:28 -0400
Received: from muru.com ([72.249.23.125]:45720 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgI3GI2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Sep 2020 02:08:28 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B20F18136;
        Wed, 30 Sep 2020 06:08:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] More device tree changes for omaps for v5.10
Date:   Wed, 30 Sep 2020 09:08:15 +0300
Message-Id: <pull-1601445968-476435@atomide.com-2>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <pull-1601445968-476435@atomide.com>
References: <pull-1601445968-476435@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 513f8297f6b14a76346cd049956f1c9a2a48d7aa:

  Merge branch 'fixes' into omap-for-v5.10/dt (2020-08-19 10:52:00 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/dt-part2-signed

for you to fetch changes up to 5e7998b8017f83d421fcf41421c562f63ed125cc:

  ARM: dts: am3874: iceboard: fix GPIO expander reset GPIOs (2020-09-25 14:38:31 +0300)

----------------------------------------------------------------
More dts changes for omaps for v5.10 merge window

Some more dts changes that did not make it to the first set of
dts changes:

- Drop unnessary nokia,nvm-size property

- A series of changes to use "okay" instead of "ok"

- A series of changes to move boards to use new cpsw switch
  driver and drop the drop legacy cpsw dt node

- A series of changes to fix issues with the GPIO binding
  usage

----------------------------------------------------------------
Adrian Schmutzler (3):
      ARM: dts: omap: replace status value "ok" by "okay"
      ARM: dts: dra7xx: replace status value "ok" by "okay"
      ARM: dts: am43xx: replace status value "ok" by "okay"

Grygorii Strashko (9):
      ARM: dts: am5729: beagleboneai: switch to new cpsw switch drv
      ARM: dts: am57xx-idk: switch to new cpsw switch drv
      ARM: dts: beagle-x15: switch to new cpsw switch drv
      ARM: dts: dra7x-evm: switch to new cpsw switch drv
      ARM: dts: am57xx-cl-som-am57x: switch to new cpsw switch drv
      ARM: dts: dra7: drop legacy cpsw dt node
      ARM: dts: am437x-l4: add dt node for new cpsw switchdev driver
      ARM: dts: am437x: switch to new cpsw switch drv
      ARM: dts: am437x-l4: drop legacy cpsw dt node

Krzysztof Kozlowski (3):
      ARM: dts: am335x: lxm: fix PCA9539 GPIO expander properties
      ARM: dts: am335x: t335: align GPIO hog names with dtschema
      ARM: dts: am3874: iceboard: fix GPIO expander reset GPIOs

Sakari Ailus (1):
      ARM: dts: n9, n950: Remove nokia,nvm-size property

 arch/arm/boot/dts/am335x-lxm.dts                   |  4 ++
 arch/arm/boot/dts/am335x-sbc-t335.dts              |  4 +-
 arch/arm/boot/dts/am3517-evm-ui.dtsi               |  4 +-
 arch/arm/boot/dts/am3517-evm.dts                   |  2 +-
 arch/arm/boot/dts/am3874-iceboard.dts              |  8 +--
 arch/arm/boot/dts/am4372.dtsi                      |  4 +-
 arch/arm/boot/dts/am437x-cm-t43.dts                | 14 ++--
 arch/arm/boot/dts/am437x-gp-evm.dts                | 15 +++--
 arch/arm/boot/dts/am437x-idk-evm.dts               | 13 ++--
 arch/arm/boot/dts/am437x-l4.dtsi                   | 77 +++++++++++-----------
 arch/arm/boot/dts/am437x-sbc-t43.dts               |  2 +-
 arch/arm/boot/dts/am437x-sk-evm.dts                | 14 ++--
 arch/arm/boot/dts/am43x-epos-evm.dts               | 15 +++--
 arch/arm/boot/dts/am571x-idk.dts                   | 27 --------
 arch/arm/boot/dts/am5729-beagleboneai.dts          | 14 ++--
 arch/arm/boot/dts/am572x-idk.dts                   |  5 --
 arch/arm/boot/dts/am574x-idk.dts                   |  5 --
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi    | 19 +++---
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts          | 13 ++--
 arch/arm/boot/dts/am57xx-idk-common.dtsi           | 14 ++--
 arch/arm/boot/dts/am57xx-sbc-am57x.dts             |  4 +-
 arch/arm/boot/dts/dra7-evm.dts                     | 15 ++---
 arch/arm/boot/dts/dra7-l4.dtsi                     | 54 ---------------
 arch/arm/boot/dts/dra7.dtsi                        |  4 +-
 arch/arm/boot/dts/dra71-evm.dts                    | 14 ++--
 arch/arm/boot/dts/dra72-evm-common.dtsi            | 10 +--
 arch/arm/boot/dts/dra72-evm-revc.dts               | 14 ++--
 arch/arm/boot/dts/dra72-evm.dts                    | 13 ++--
 arch/arm/boot/dts/dra76-evm.dts                    | 18 +++--
 arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi    |  2 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   |  2 +-
 arch/arm/boot/dts/omap3-beagle-xm.dts              |  4 +-
 arch/arm/boot/dts/omap3-beagle.dts                 |  6 +-
 arch/arm/boot/dts/omap3-cm-t3517.dts               |  2 +-
 arch/arm/boot/dts/omap3-cm-t3530.dts               |  2 +-
 arch/arm/boot/dts/omap3-cm-t3730.dts               |  2 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi                |  4 +-
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi     |  4 +-
 arch/arm/boot/dts/omap3-gta04.dtsi                 |  8 +--
 arch/arm/boot/dts/omap3-ha-lcd.dts                 |  2 +-
 arch/arm/boot/dts/omap3-igep0020-common.dtsi       |  2 +-
 arch/arm/boot/dts/omap3-n9.dts                     |  1 -
 arch/arm/boot/dts/omap3-n900.dts                   |  6 +-
 arch/arm/boot/dts/omap3-n950.dts                   |  5 +-
 arch/arm/boot/dts/omap3-overo-common-dvi.dtsi      |  2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi    |  2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi    |  2 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi        |  4 +-
 .../boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi    |  2 +-
 arch/arm/boot/dts/omap3-thunder.dts                |  2 +-
 arch/arm/boot/dts/omap34xx.dtsi                    |  2 +-
 arch/arm/boot/dts/omap36xx.dtsi                    |  2 +-
 arch/arm/boot/dts/omap4-duovero-parlor.dts         |  4 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi          |  6 +-
 arch/arm/boot/dts/omap4-sdp.dts                    |  8 +--
 arch/arm/boot/dts/omap5-board-common.dtsi          |  4 +-
 arch/arm/boot/dts/omap5-cm-t54.dts                 |  6 +-
 57 files changed, 220 insertions(+), 297 deletions(-)
