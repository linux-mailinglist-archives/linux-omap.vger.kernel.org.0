Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A83C1803CB
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 17:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCJQnv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 12:43:51 -0400
Received: from muru.com ([72.249.23.125]:59538 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbgCJQnu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 12:43:50 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 58E9F810A;
        Tue, 10 Mar 2020 16:44:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] drop more legacy platform data for omaps for v5.7
Date:   Tue, 10 Mar 2020 09:43:46 -0700
Message-Id: <pull-1583858385-416921@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b2745d92bb015cc4454d4195c4ce6e2852db397e:

  bus: ti-sysc: Add support for PRUSS SYSC type (2020-03-04 07:54:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/ti-sysc-drop-pdata-signed

for you to fetch changes up to 104d56b3e3766931ff1a1d786d2fcce908daaaf7:

  ARM: OMAP2+: Drop legacy platform data for dra7 edma (2020-03-06 07:20:04 -0800)

----------------------------------------------------------------
Drop legacy platform data for omaps for v5.7

This series of changes continues dropping legacy platform data for
omaps by updating devices to probe with ti-sysc interconnect target
module driver:

- Update omap4, omap5, am437x, and dra7 display subsystem (DSS)
  to probe with device tree data only

- Update am335x, am437x and dra7 to probe EDMA to probe with
  device tree data only

- Drop legacy platform data for am335x and am437x PRUSS as the
  current code just keeps the devices in reset

- Drop legacy platform data for omap4 DSP and IPU as the current
  code just keeps the devices in reset

- Configure am437x and dra7 PRU-ICSS to probe with device tree
  data

For the dropped omap4 DSP and IPU platform data, there will be patches
coming later on to configure the accelerators using the omap remoteproc
bindings so hopefully folks can actually use these devices eventually.

----------------------------------------------------------------
Suman Anna (6):
      ARM: OMAP2+: Drop hwmod data for am3 and am4 PRUSS
      ARM: OMAP2+: Drop legacy platform data for OMAP4 DSP
      ARM: OMAP4: hwmod_data: Remove OMAP4 IPU hwmod data
      ARM: dts: AM33xx-l4: Update PRUSS interconnect target-module node
      ARM: dts: AM4372: Add the PRU-ICSS interconnect target-module node
      ARM: dts: dra7: Add PRU-ICSS interconnect target-module nodes

Tony Lindgren (37):
      ARM: dts: Configure interconnect target module for omap4 dss
      ARM: dts: Configure interconnect target module for omap4 dispc
      ARM: dts: Configure interconnect target module for omap4 rfbi
      ARM: dts: Configure interconnect target module for omap4 venc
      ARM: dts: Configure interconnect target module for omap4 dsi1
      ARM: dts: Configure interconnect target module for omap4 dsi2
      ARM: dts: Configure interconnect target module for omap4 hdmi
      ARM: dts: Configure interconnect target module for omap5 dss
      ARM: dts: Configure interconnect target module for omap5 dispc
      ARM: dts: Configure interconnect target module for omap5 rfbi
      ARM: dts: Configure interconnect target module for omap5 dsi1
      ARM: dts: Configure interconnect target module for omap5 dsi2
      ARM: dts: Configure interconnect target module for omap5 hdmi
      ARM: dts: Configure interconnect target module for dra7 dss
      ARM: dts: Configure interconnect target module for dra7 dispc
      ARM: dts: Configure interconnect target module for dra7 hdmi
      ARM: dts: Move am437x dss to the interconnect target module in l4
      ARM: dts: Configure interconnect target module for am437x dispc
      ARM: dts: Configure interconnect target module for am437x rfbi
      ARM: OMAP2+: Drop legacy platform data for omap4 dss
      ARM: OMAP2+: Drop legacy platform data for omap5 DSS
      ARM: OMAP2+: Drop legacy platform data for dra7 DSS
      ARM: OMAP2+: Drop legacy platform data for am437x DSS
      Merge branch 'omap-for-v5.7/accelerators' into omap-for-v5.7/ti-sysc-drop-pdata
      ARM: dts: Configure interconnect target module for am3 tpcc
      ARM: dts: Configure interconnect target module for am3 tptc0
      ARM: dts: Configure interconnect target module for am3 tptc1
      ARM: dts: Configure interconnect target module for am3 tptc2
      ARM: dts: Configure interconnect target module for am4 tpcc
      ARM: dts: Configure interconnect target module for am4 tptc0
      ARM: dts: Configure interconnect target module for am4 tptc1
      ARM: dts: Configure interconnect target module for am4 tptc2
      ARM: dts: Configure interconnect target module for dra7 tpcc
      ARM: dts: Configure interconnect target module for dra7 tptc0
      ARM: dts: Configure interconnect target module for dra7 tptc1
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 edma
      ARM: OMAP2+: Drop legacy platform data for dra7 edma

 arch/arm/boot/dts/am33xx-l4.dtsi                   |  21 +-
 arch/arm/boot/dts/am33xx.dtsi                      | 121 +++--
 arch/arm/boot/dts/am4372.dtsi                      | 179 ++++---
 arch/arm/boot/dts/am437x-l4.dtsi                   |  77 ++-
 arch/arm/boot/dts/am57-pruss.dtsi                  |  50 ++
 arch/arm/boot/dts/am5718.dtsi                      |   1 +
 arch/arm/boot/dts/am5728.dtsi                      |   1 +
 arch/arm/boot/dts/am5748.dtsi                      |   1 +
 arch/arm/boot/dts/dra7.dtsi                        | 219 ++++++---
 arch/arm/boot/dts/dra72x.dtsi                      |   6 +-
 arch/arm/boot/dts/dra74x.dtsi                      |  10 +-
 arch/arm/boot/dts/omap4-l4.dtsi                    |   1 +
 arch/arm/boot/dts/omap4.dtsi                       | 279 ++++++++---
 arch/arm/boot/dts/omap5.dtsi                       | 241 +++++++---
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |  10 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |  40 --
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 115 -----
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         |  14 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         | 114 -----
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c         | 531 ---------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c         | 288 -----------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c          | 251 ----------
 22 files changed, 884 insertions(+), 1686 deletions(-)
 create mode 100644 arch/arm/boot/dts/am57-pruss.dtsi
