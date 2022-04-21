Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18681509F71
	for <lists+linux-omap@lfdr.de>; Thu, 21 Apr 2022 14:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbiDUMSa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Apr 2022 08:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbiDUMSa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Apr 2022 08:18:30 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E65F92D1DC
        for <linux-omap@vger.kernel.org>; Thu, 21 Apr 2022 05:15:40 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 086E78106;
        Thu, 21 Apr 2022 12:12:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date:   Thu, 21 Apr 2022 15:15:27 +0300
Message-Id: <pull-1650543308-836725@atomide.com>
X-Mailer: git-send-email 2.35.2
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.18/fixes-take2

for you to fetch changes up to 46ff3df87215ff42c0cd2c4bdb7d74540384a69c:

  ARM: dts: logicpd-som-lv: Fix wrong pinmuxing on OMAP35 (2022-04-14 11:38:44 +0300)

----------------------------------------------------------------
Fixes for omaps

Few regression fixes for omap variants. These mostly fix issues related to
warnings added for system suspend, and some devicetree issues:

- Make ti-sysc driver quirks for gpt12 timer omap3 specific to fix
  timer clock disabling for am335x system suspend

- Fix new system suspend warning for dra7 vpe caused by trying to
  use register bits not wired for vpe

- Fix mmc boot order for omap3-gta04 that has no mmc2 or 3 wired

- Add missing touchscreen properties for am3

- Fix pin muxing for logicpd-som-lv and am3517-evm to not depend on
  earlier bootloader versions

- Fix refcount leak for omap_gic_of_init

----------------------------------------------------------------
Adam Ford (2):
      ARM: dts: am3517-evm: Fix misc pinmuxing
      ARM: dts: logicpd-som-lv: Fix wrong pinmuxing on OMAP35

H. Nikolaus Schaller (1):
      ARM: dts: Fix mmc order for omap3-gta04

Miaoqian Lin (1):
      ARM: OMAP2+: Fix refcount leak in omap_gic_of_init

Miquel Raynal (1):
      ARM: dts: am33xx-l4: Add missing touchscreen clock properties

Tony Lindgren (2):
      bus: ti-sysc: Make omap3 gpt12 quirk handling SoC specific
      ARM: dts: dra7: Fix suspend warning for vpe powerdomain

 arch/arm/boot/dts/am33xx-l4.dtsi                 |  2 ++
 arch/arm/boot/dts/am3517-evm.dts                 | 45 +++++++++++++++++++++---
 arch/arm/boot/dts/am3517-som.dtsi                |  9 +++++
 arch/arm/boot/dts/dra7-l4.dtsi                   |  4 +--
 arch/arm/boot/dts/logicpd-som-lv-35xx-devkit.dts | 15 ++++++++
 arch/arm/boot/dts/logicpd-som-lv-37xx-devkit.dts | 15 ++++++++
 arch/arm/boot/dts/logicpd-som-lv.dtsi            | 15 --------
 arch/arm/boot/dts/omap3-gta04.dtsi               |  2 ++
 arch/arm/mach-omap2/omap4-common.c               |  2 ++
 drivers/bus/ti-sysc.c                            | 16 ++++++++-
 10 files changed, 102 insertions(+), 23 deletions(-)
