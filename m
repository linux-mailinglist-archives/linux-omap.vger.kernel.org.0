Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289EF3E1084
	for <lists+linux-omap@lfdr.de>; Thu,  5 Aug 2021 10:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238277AbhHEIrZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Aug 2021 04:47:25 -0400
Received: from muru.com ([72.249.23.125]:35984 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239662AbhHEIrZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Aug 2021 04:47:25 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4779F818C;
        Thu,  5 Aug 2021 08:47:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Devicetree changes for omaps for v5.15
Date:   Thu,  5 Aug 2021 11:46:44 +0300
Message-Id: <pull-1628153040-834155@atomide.com-3>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <pull-1628153040-834155@atomide.com>
References: <pull-1628153040-834155@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/dt-signed

for you to fetch changes up to 8c054cd2818ea08555efe24a2ffde330833c2f3f:

  ARM: dts: am57xx: Add PRUSS MDIO controller nodes (2021-08-03 15:25:14 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v5.15

Devicetree changes for omaps to configure more devices, and
add support for new SoC variants and devices:

- Add add gpio-line-names for am335x-boneblue

- Add support for dra762 abz package

- Two patches for McASP support on omap4

- Three patches to add support for am335x-sancloud-bbe-lite

- A series of changes to configure PRUSS for am3/4/5

----------------------------------------------------------------
Andrew F. Davis (1):
      ARM: dts: am4372: Add PRUSS MDIO controller node

David Lechner (1):
      ARM: dts: am335x-boneblue: add gpio-line-names

Lokesh Vutla (1):
      ARM: dts: Add support for dra762 abz package

Paul Barker (3):
      ARM: dts: am335x-boneblack: Extract HDMI config
      ARM: dts: am335x-sancloud-bbe: Extract common code
      ARM: dts: am335x-sancloud-bbe-lite: New devicetree

Peter Ujfalusi (2):
      ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
      ARM: dts: omap4-l4-abe: Add McASP configuration

Suman Anna (10):
      ARM: dts: am33xx-l4: Add PRUSS node
      ARM: dts: am33xx-l4: Add PRUSS MDIO controller node
      ARM: dts: am335x-bone-common: Enable PRU-ICSS node
      ARM: dts: am335x-evm: Enable PRU-ICSS module
      ARM: dts: am335x-evmsk: Enable PRU-ICSS module
      ARM: dts: am335x-icev2: Enable PRU-ICSS module
      ARM: dts: am4372: Add the PRU-ICSS1 DT node
      ARM: dts: am4372: Add the PRU-ICSS0 DT node
      ARM: dts: am57xx: Add PRU-ICSS nodes
      ARM: dts: am57xx: Add PRUSS MDIO controller nodes

 arch/arm/boot/dts/Makefile                        |   1 +
 arch/arm/boot/dts/am335x-bone-common.dtsi         |   4 +
 arch/arm/boot/dts/am335x-boneblack-common.dtsi    | 135 ----------------
 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi      | 141 +++++++++++++++++
 arch/arm/boot/dts/am335x-boneblack-wireless.dts   |   1 +
 arch/arm/boot/dts/am335x-boneblack.dts            |   1 +
 arch/arm/boot/dts/am335x-boneblue.dts             | 143 ++++++++++++++++-
 arch/arm/boot/dts/am335x-evm.dts                  |   4 +
 arch/arm/boot/dts/am335x-evmsk.dts                |   4 +
 arch/arm/boot/dts/am335x-icev2.dts                |   4 +
 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi |  96 ++++++++++++
 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts    |  50 ++++++
 arch/arm/boot/dts/am335x-sancloud-bbe.dts         |  92 +----------
 arch/arm/boot/dts/am33xx-l4.dtsi                  |  82 ++++++++++
 arch/arm/boot/dts/am4372.dtsi                     | 165 ++++++++++++++++++++
 arch/arm/boot/dts/am437x-cm-t43.dts               |   4 +
 arch/arm/boot/dts/am437x-gp-evm.dts               |   4 +
 arch/arm/boot/dts/am437x-idk-evm.dts              |   4 +
 arch/arm/boot/dts/am437x-sk-evm.dts               |   4 +
 arch/arm/boot/dts/am43x-epos-evm.dts              |   4 +
 arch/arm/boot/dts/am57-pruss.dtsi                 | 178 +++++++++++++++++++++-
 arch/arm/boot/dts/am571x-idk.dts                  |   8 +
 arch/arm/boot/dts/am572x-idk.dts                  |   8 +
 arch/arm/boot/dts/am5748.dtsi                     |   6 +-
 arch/arm/boot/dts/am574x-idk.dts                  |  10 +-
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi   |   8 +
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts         |   8 +
 arch/arm/boot/dts/dra74x-p.dtsi                   |  27 ++++
 arch/arm/boot/dts/dra76x.dtsi                     |  12 --
 arch/arm/boot/dts/omap4-l4-abe.dtsi               |  38 ++---
 30 files changed, 981 insertions(+), 265 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
 create mode 100644 arch/arm/boot/dts/dra74x-p.dtsi
