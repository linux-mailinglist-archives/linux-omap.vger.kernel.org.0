Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5783982D9
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 09:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhFBHVQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 03:21:16 -0400
Received: from muru.com ([72.249.23.125]:35314 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhFBHVQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 03:21:16 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 74BE48119;
        Wed,  2 Jun 2021 07:19:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Devicetree changes for omaps for v5.14
Date:   Wed,  2 Jun 2021 10:19:11 +0300
Message-Id: <pull-1622618286-677305@atomide.com-3>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1622618286-677305@atomide.com>
References: <pull-1622618286-677305@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/dt-signed

for you to fetch changes up to 9e7f5ee1137397def6580461e27e5efcb68183ee:

  ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names (2021-05-27 15:12:33 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v5.14 merge window

Mostly just clean-up for device tree binding checks with
few other clean-up patches:

- Drop ov5640 sensor for dra76-evm, it's just one of the
  optional additional sensors and makes hard to use any of
  the other options, TI is using the devicetree overlay
  snippets for these

- Group the phandles in osd3358-sm-red to make the files
  more readable

- A series of gpio clean-up patches to follow the binding
  documentation

- Move ti,no-reset related properties to the target module
  level, the ti-sysc driver handles them also in the child
  but they really belong to the target module

- Drop the unnecessary uart compatible entries to make the
  binding check to work

- Mailbox related updates to make the binding check to
  work

----------------------------------------------------------------
Dario Binacchi (1):
      ARM: dts: osd3358-sm-red: group in the same phandle all its properties

Geert Uytterhoeven (1):
      ARM: dts: dra7x-evm: Align GPIO hog names with dt-schema

Grygorii Strashko (7):
      ARM: dts: am335x: align GPIO hog names with dt-schema
      ARM: dts: am437x: align gpio hog names with dt-schema
      ARM: dts: omap3: align gpio hog names with dt-schema
      ARM: dts: omap5-board-common: align gpio hog names with dt-schema
      ARM: dts: am57xx-cl-som-am57x: fix ti,no-reset-on-init flag for gpios
      ARM: dts: am437x-gp-evm: fix ti,no-reset-on-init flag for gpios
      ARM: dts: am335x: fix ti,no-reset-on-init flag for gpios

Suman Anna (4):
      ARM: dts: OMAP2420: Drop interrupt-names from mailbox node
      ARM: dts: OMAP2/OMAP3: Rename processor sub-mailbox nodes
      ARM: dts: AM33xx/AM43xx: Rename wkup_m3 sub-mailbox node
      ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names

Tomi Valkeinen (1):
      ARM: dts: dra76-evm: remove ov5640

Vignesh Raghavendra (2):
      ARM: dts: dra7-l4: Drop ti,omap4-uart entry from UART nodes
      ARM: dts: am437x-l4: Drop ti,omap2-uart entry from UART nodes

 arch/arm/boot/dts/am335x-baltos.dtsi              |   4 +-
 arch/arm/boot/dts/am335x-boneblack-wireless.dts   |   2 +-
 arch/arm/boot/dts/am335x-boneblue.dts             |   2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts   |   4 +-
 arch/arm/boot/dts/am335x-evmsk.dts                |   2 +-
 arch/arm/boot/dts/am335x-icev2.dts                |   4 +-
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi |   2 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi |   2 +-
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts       | 132 ++++++++++------------
 arch/arm/boot/dts/am335x-shc.dts                  |   8 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                  |   4 +-
 arch/arm/boot/dts/am437x-gp-evm.dts               |   9 +-
 arch/arm/boot/dts/am437x-l4.dtsi                  |  16 +--
 arch/arm/boot/dts/am43x-epos-evm.dts              |   2 +-
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts         |  13 +--
 arch/arm/boot/dts/dm816x.dtsi                     |   2 +-
 arch/arm/boot/dts/dra7-evm.dts                    |   2 +-
 arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi        |   6 +-
 arch/arm/boot/dts/dra7-l4.dtsi                    |  24 ++--
 arch/arm/boot/dts/dra71-evm.dts                   |   2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi           |   2 +-
 arch/arm/boot/dts/dra72x.dtsi                     |   6 +-
 arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi       |   2 +-
 arch/arm/boot/dts/dra74x.dtsi                     |   8 +-
 arch/arm/boot/dts/dra76-evm.dts                   |  37 +-----
 arch/arm/boot/dts/omap2420.dtsi                   |   5 +-
 arch/arm/boot/dts/omap2430.dtsi                   |   2 +-
 arch/arm/boot/dts/omap3-evm-processor-common.dtsi |   2 +-
 arch/arm/boot/dts/omap3-gta04a5.dts               |   2 +-
 arch/arm/boot/dts/omap3.dtsi                      |   2 +-
 arch/arm/boot/dts/omap4-l4.dtsi                   |   4 +-
 arch/arm/boot/dts/omap5-board-common.dtsi         |   2 +-
 arch/arm/boot/dts/omap5-l4.dtsi                   |   4 +-
 33 files changed, 139 insertions(+), 181 deletions(-)
