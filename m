Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B528E3811
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 18:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503452AbfJXQhH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 12:37:07 -0400
Received: from muru.com ([72.249.23.125]:39802 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503474AbfJXQhE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Oct 2019 12:37:04 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2900981BF;
        Thu, 24 Oct 2019 16:37:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] drop legacy platform data for omaps for v5.5
Date:   Thu, 24 Oct 2019 09:36:55 -0700
Message-Id: <pull-1571934890-285615@atomide.com-3>
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

The following changes since commit 1819ef2e2d12d5b1a6ee54ac1c2afe35cffc677c:

  bus: ti-sysc: Use swsup quirks also for am335x musb (2019-10-21 14:15:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/ti-sysc-drop-pdata-v2-signed-take2

for you to fetch changes up to b08a0c577518a02ea08673f68881223a3ed35cc6:

  ARM: OMAP2+: Drop legacy platform data for am335x musb (2019-10-23 07:46:32 -0700)

----------------------------------------------------------------
Drop legacy platform data for omaps for v5.5

This series of changes continues dropping legacy platform data for
omaps. With the proper device tree configuration in place in the dts
files for ti-sysc interconnect target module driver, we can drop the
related platform data and legacy ti,hwmods custom property.

Most of the patches in this series drop platform data and custom dts
property one device class and one SoC at time. This way we can easily
revert one patch at a time in case of unexpected issues if the fix is
not trivial.

For am335x musb, we need to first update the device tree to probe with
ti-sysc interconnect target module driver. And then the following
patches drop the legacy platform data.

Note that this series depends on earlier ti-sysc related driver changes

----------------------------------------------------------------
Tony Lindgren (34):
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 gpio
      ARM: dts: Drop custom hwmod property for omap4 gpio
      ARM: dts: Drop custom hwmod property for omap5 gpio
      ARM: OMAP2+: Drop legacy platform data for dra7 mailbox
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 mailbox
      ARM: OMAP2+: Drop legacy platform data for omap4 mailbox
      ARM: OMAP2+: Drop legacy platform data for omap5 mailbox
      ARM: dts: Drop custom hwmod property for omap5 mcspi
      ARM: OMAP2+: Drop legacy platform data for omap5 mcspi
      ARM: dts: Drop custom hwmod property for am33xx uart
      ARM: dts: Drop custom hwmod property for am4 uart
      ARM: dts: Drop custom hwmod property for omap5 uart
      ARM: dts: Drop custom hwmod property for am3 i2c
      ARM: dts: Drop custom hwmod property for am4 i2c
      ARM: dts: Drop custom hwmod property for omap5 i2c
      ARM: dts: Drop custom hwmod property for am3 mmc
      ARM: dts: Drop custom hwmod property for am4 mmc
      ARM: dts: Drop custom hwmod property for omap5 mmc
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 wdt
      ARM: OMAP2+: Drop legacy platform data for dra7 wdt
      ARM: OMAP2+: Drop legacy platform data for omap5 wdt
      ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp
      ARM: OMAP2+: Drop legacy platform data for omap5 mcbsp
      ARM: OMAP2+: Drop legacy platform data for am4 hdq1w
      ARM: OMAP2+: Drop legacy platform data for dra7 hdq1w
      ARM: OMAP2+: Drop legacy platform data for omap4 hdq1w
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 rng
      ARM: OMAP2+: Drop legacy platform data for dra7 rng
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 mcasp
      ARM: OMAP2+: Drop legacy platform data for omap4 mcasp
      ARM: OMAP2+: Drop legacy platform data for musb on omap4
      ARM: dts: Probe am335x musb with ti-sysc
      ARM: dts: Drop pointless status changing for am3 musb
      ARM: OMAP2+: Drop legacy platform data for am335x musb

 arch/arm/boot/dts/am335x-baltos.dtsi               |  12 -
 arch/arm/boot/dts/am335x-bone-common.dtsi          |  22 --
 arch/arm/boot/dts/am335x-boneblue.dts              |  22 --
 arch/arm/boot/dts/am335x-chiliboard.dts            |  18 -
 arch/arm/boot/dts/am335x-cm-t335.dts               |  20 -
 arch/arm/boot/dts/am335x-evm.dts                   |  25 --
 arch/arm/boot/dts/am335x-evmsk.dts                 |  25 --
 arch/arm/boot/dts/am335x-guardian.dts              |  22 --
 arch/arm/boot/dts/am335x-igep0033.dtsi             |  25 --
 arch/arm/boot/dts/am335x-lxm.dts                   |  22 --
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi  |  17 -
 arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts     |  22 --
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts        |  22 --
 arch/arm/boot/dts/am335x-pcm-953.dtsi              |  25 --
 arch/arm/boot/dts/am335x-pdu001.dts                |  28 --
 arch/arm/boot/dts/am335x-pepper.dts                |  20 -
 arch/arm/boot/dts/am335x-pocketbeagle.dts          |  22 --
 arch/arm/boot/dts/am335x-regor.dtsi                |  21 -
 arch/arm/boot/dts/am335x-shc.dts                   |  17 -
 arch/arm/boot/dts/am335x-sl50.dts                  |  22 --
 arch/arm/boot/dts/am335x-wega.dtsi                 |  26 --
 arch/arm/boot/dts/am33xx-l4.dtsi                   |  27 +-
 arch/arm/boot/dts/am33xx.dtsi                      |  67 ++--
 arch/arm/boot/dts/am4372.dtsi                      |   1 -
 arch/arm/boot/dts/am437x-l4.dtsi                   |  23 --
 arch/arm/boot/dts/dra7-l4.dtsi                     |  16 -
 arch/arm/boot/dts/omap4-l4-abe.dtsi                |   4 -
 arch/arm/boot/dts/omap4-l4.dtsi                    |  14 -
 arch/arm/boot/dts/omap5-l4-abe.dtsi                |   3 -
 arch/arm/boot/dts/omap5-l4.dtsi                    |  30 --
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |   9 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |  32 --
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 231 -----------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         |  58 ---
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         |  48 ---
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c         | 343 ----------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c         | 317 ---------------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c          | 431 ---------------------
 38 files changed, 39 insertions(+), 2070 deletions(-)
