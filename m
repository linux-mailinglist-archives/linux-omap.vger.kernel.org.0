Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE04E3810
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 18:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503474AbfJXQhH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 12:37:07 -0400
Received: from muru.com ([72.249.23.125]:39796 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503472AbfJXQhC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Oct 2019 12:37:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8DDBD819C;
        Thu, 24 Oct 2019 16:37:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] device tree changes for omaps for v5.5
Date:   Thu, 24 Oct 2019 09:36:54 -0700
Message-Id: <pull-1571934890-285615@atomide.com-2>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <pull-1571934890-285615@atomide.com>
References: <pull-1571934890-285615@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 087a2b7ec973f6f30f6e7b72cb50b6f7734ffdd2:

  ARM: dts: Use level interrupt for omap4 & 5 wlcore (2019-10-09 15:11:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/dt-signed

for you to fetch changes up to fedc8844d5004ffa69d3e320081bfd59979e1937:

  Merge branch 'omap-for-v5.5/droid4' into omap-for-v5.5/dt (2019-10-23 10:34:28 -0700)

----------------------------------------------------------------
Device tree changes for omaps for v5.5

This series of changes adds support for few new boards, moves
remaining ti wilink bluetooth users to use the serdev driver,
and improves support for existing devices:

- Add support for NetCAN Plus devices

- Configure wilink bluetooth for logicpd-torpedo and omap3-igep

- Switch to using generic LCD panel for logicpd-torpedo and
  increase camera pixel clock

- Configure droid4 for 300mA USB host mode and move to a common file
  to start adding support for droid bionic

- Rename ocmcram node to sram

----------------------------------------------------------------
Adam Ford (4):
      ARM: dts: logicpd-torpedo-baseboard: Reduce video regulator chatter
      ARM: dts: logicpd-torpedo-37xx-devkit-28: Reference new DRM panel
      ARM: dts: logicpd-torpedo: Disable Bluetooth Serial DMA
      ARM: dts: logicpd-torpedo-37xx-devkit: Increase camera pixel clock

Krzysztof Kozlowski (2):
      ARM: dts: am: Rename "ocmcram" node to "sram"
      ARM: dts: omap: Rename "ocmcram" node to "sram"

Sebastian Reichel (2):
      ARM: dts: LogicPD Torpedo: Add WiLink UART node
      ARM: dts: IGEP: Add WiLink UART node

Tony Lindgren (3):
      ARM: dts: omap4-droid4: Allow 300mA current for USB peripherals
      ARM: dts: Add minimal support for Droid Bionic xt875
      Merge branch 'omap-for-v5.5/droid4' into omap-for-v5.5/dt

Yegor Yefremov (3):
      ARM: dts: add DTS for NetCAN Plus devices
      ARM: dts: add DTS for NetCom Plus 1xx and 2xx device series
      ARM: dts: add DTS for NetCom Plus 4xx and 8xx device series

 arch/arm/boot/dts/Makefile                         |   4 +
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts       |  87 +++
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts       |  95 +++
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts       | 115 +++
 arch/arm/boot/dts/am33xx.dtsi                      |   6 +-
 arch/arm/boot/dts/am4372.dtsi                      |   6 +-
 .../boot/dts/logicpd-torpedo-37xx-devkit-28.dts    |  20 +-
 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts  |  14 +
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   |   1 +
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    | 786 +++++++++++++++++++++
 arch/arm/boot/dts/omap3-igep0020-rev-f.dts         |   8 +
 arch/arm/boot/dts/omap3-igep0030-rev-g.dts         |   8 +
 arch/arm/boot/dts/omap4-droid-bionic-xt875.dts     |   9 +
 arch/arm/boot/dts/omap4-droid4-xt894.dts           | 777 +-------------------
 arch/arm/boot/dts/omap4.dtsi                       |   2 +-
 arch/arm/boot/dts/omap5.dtsi                       |   2 +-
 16 files changed, 1138 insertions(+), 802 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
 create mode 100644 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
 create mode 100644 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
 create mode 100644 arch/arm/boot/dts/motorola-mapphone-common.dtsi
 create mode 100644 arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
