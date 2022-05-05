Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202D851B74B
	for <lists+linux-omap@lfdr.de>; Thu,  5 May 2022 06:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbiEEFB4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 May 2022 01:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiEEFBz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 May 2022 01:01:55 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E350541F86
        for <linux-omap@vger.kernel.org>; Wed,  4 May 2022 21:58:16 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AB15F80B0;
        Thu,  5 May 2022 04:54:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] More devicetree changes for omaps
Date:   Thu,  5 May 2022 07:58:12 +0300
Message-Id: <pull-1651726643-535261@atomide.com>
X-Mailer: git-send-email 2.35.2
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

The following changes since commit dff844e1fe17e6c41e5899d46a378f857ea4f354:

  ARM: dts: am335x-baltos: update MPU regulator range (2022-04-21 14:12:52 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.19/dt-part2-signed

for you to fetch changes up to e4edfeaf6b585fac340071ea9845970ab528c6ce:

  ARM: dts: dm81xx: use new 'dma-channels/requests' properties (2022-05-03 10:11:44 +0300)

----------------------------------------------------------------
More devicetree changes for omaps

Devicetree updates for few boards and more clean-up for make dtbs warnings:

- Updates for am335x-myirtech oscillator and mtd

- Firmware configuration for i2c voltage scaling and IO isolation for am3/4
  that are wired for these features

- A series of omap3 clock node clean-up for make dtbs warnings for
  unique_unit_address and node_name_chars_strict

- Updates for dma-channel usage to add the generic dma-common properties

----------------------------------------------------------------
Alexander Shiyan (2):
      ARM: dts: am335x-myirtech: Add an external clock oscillator for CPU RTC
      ARM: dts: am335x-myirtech: Update NAND default partition table layout

Dave Gerlach (3):
      ARM: dts: am437x-gp-evm: Enable wkup_m3 control of IO isolation
      ARM: dts: am33xx: Add i2c voltage scaling firmware to wkup_m3_ipc
      ARM: dts: am43xx: Add i2c voltage scaling firmware to wkup_m3_ipc

Krzysztof Kozlowski (2):
      ARM: dts: am33xx: use new 'dma-channels/requests' properties
      ARM: dts: dm81xx: use new 'dma-channels/requests' properties

Tony Lindgren (19):
      ARM: dts: Group omap3 CONTROL_DEVCONF0 clocks
      ARM: dts: Group omap3 CONTROL_DEVCONF1 clocks
      ARM: dts: Group omap3 CM_FCLKEN1_CORE clocks
      ARM: dts: Group omap3 crypto accelerator clocks
      ARM: dts: Group omap3 CM_ICLKEN1_CORE clocks
      ARM: dts: Group omap3 CM_ICLKEN3_CORE clocks
      ARM: dts: Group omap3 CM_CLKSEL_CORE clocks
      ARM: dts: Group omap3 CM_FCLKEN_WKUP clocks
      ARM: dts: Group omap3 CM_ICLKEN_WKUP clocks
      ARM: dts: Group omap3 CM_CLKSEL_WKUP clocks
      ARM: dts: Group omap3 CM_CLKSEL1_PLL clocks
      ARM: dts: Group omap3 CM_CLKOUT_CTRL clocks
      ARM: dts: Group omap3 CM_FCLKEN_DSS clocks
      ARM: dts: Group omap3 CM_CLKSEL_DSS clocks
      ARM: dts: Group omap3 CM_FCLKEN_CAM clocks
      ARM: dts: Group omap3 CM_FCLKEN_PER clocks
      ARM: dts: Group omap3 CM_ICLKEN_PER clocks
      ARM: dts: Group omap3 CM_CLKSEL_PER clocks
      ARM: dts: Group omap3 CM_CLKSEL1_EMU clocks

 arch/arm/boot/dts/am335x-bone-common.dtsi          |    4 +
 arch/arm/boot/dts/am335x-evm.dts                   |    4 +
 arch/arm/boot/dts/am335x-evmsk.dts                 |    4 +
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi         |   12 +-
 arch/arm/boot/dts/am335x-myirtech-myd.dts          |   20 +-
 arch/arm/boot/dts/am33xx.dtsi                      |    3 +
 arch/arm/boot/dts/am35xx-clocks.dtsi               |   52 +-
 arch/arm/boot/dts/am437x-gp-evm.dts                |    5 +
 arch/arm/boot/dts/am437x-sk-evm.dts                |    4 +
 arch/arm/boot/dts/am43x-epos-evm.dts               |    4 +
 arch/arm/boot/dts/dm814x.dtsi                      |    3 +
 arch/arm/boot/dts/dm816x.dtsi                      |    3 +
 arch/arm/boot/dts/omap3430es1-clocks.dtsi          |  184 +-
 arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi    |  275 +--
 .../omap36xx-am35xx-omap3430es2plus-clocks.dtsi    |   79 +-
 arch/arm/boot/dts/omap36xx-clocks.dtsi             |   17 +-
 .../boot/dts/omap36xx-omap3430es2plus-clocks.dtsi  |  136 +-
 arch/arm/boot/dts/omap3xxx-clocks.dtsi             | 2044 +++++++++++---------
 18 files changed, 1596 insertions(+), 1257 deletions(-)
