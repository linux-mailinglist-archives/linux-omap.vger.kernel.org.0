Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51DAF18506E
	for <lists+linux-omap@lfdr.de>; Fri, 13 Mar 2020 21:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCMUkD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Mar 2020 16:40:03 -0400
Received: from muru.com ([72.249.23.125]:60098 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbgCMUkD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Mar 2020 16:40:03 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3AC5B8087;
        Fri, 13 Mar 2020 20:40:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.6-rc cycle
Date:   Fri, 13 Mar 2020 13:39:57 -0700
Message-Id: <pull-1584131971-332655@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 51c22d7b40dca8b39a33b2c3b03f13122a2a1af3:

  ARM: OMAP2+: Fix compile if CONFIG_HAVE_ARM_SMCCC is not set (2020-02-26 10:49:25 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/fixes-rc5-signed

for you to fetch changes up to cfb5d65f25959f724081bae8445a0241db606af6:

  ARM: dts: dra7: Add bus_dma_limit for L3 bus (2020-03-13 07:40:55 -0700)

----------------------------------------------------------------
Fixes for omap variants for v5.6-rc cycle

- Add bus_dma_limit for dra7 that fixes a SATA controller issue trying
  to do 64-bit DMA on LPAE kernels. We first had this only for SATA, but
  decided on the mailings lists that it applies to the whole interconnect

- Add missing quirk handling for lcdc on am335x to fix a suspend/resume
  issue. Note that this fix causes a minor merge conflict with patches
  pending in Linux next that I've already resolved in my updated
  omap-for-v5.7/ti-sysc branch, so I'll send a separate pull request for
  that

- Fix a regression for n900 onenand timings that caused onenand to
  not work depending on the version of onenand manufacturer

- Fix a regression for dm814x and j5eco for Ethernet that was again
  caused by the earlier changes to disable phy delay for RGMII mode
  but only recently noticed

----------------------------------------------------------------
Arthur Demchenkov (1):
      ARM: dts: N900: fix onenand timings

Roger Quadros (1):
      ARM: dts: dra7: Add bus_dma_limit for L3 bus

Tomi Valkeinen (1):
      backlight: add led-backlight driver

Tony Lindgren (6):
      ARM: dts: droid4: Configure LED backlight for lm3532
      Merge branch 'omap-for-v5.6/fixes-rc2' into fixes
      Merge branch 'omap-for-v5.6/fixes-rc3' into fixes
      ARM: dts: Fix dm814x Ethernet by changing to use rgmii-id mode
      bus: ti-sysc: Fix quirk flags for lcdc on am335x
      Merge branch 'fix-lcdc-quirk' into fixes

 arch/arm/boot/dts/dm8148-evm.dts                |   4 +-
 arch/arm/boot/dts/dm8148-t410.dts               |   4 +-
 arch/arm/boot/dts/dra62x-j5eco-evm.dts          |   4 +-
 arch/arm/boot/dts/dra7.dtsi                     |   1 +
 arch/arm/boot/dts/motorola-mapphone-common.dtsi |  13 +-
 arch/arm/boot/dts/omap3-n900.dts                |  44 ++--
 arch/arm/configs/omap2plus_defconfig            |   1 +
 drivers/bus/ti-sysc.c                           |   3 +-
 drivers/video/backlight/Kconfig                 |   7 +
 drivers/video/backlight/Makefile                |   1 +
 drivers/video/backlight/led_bl.c                | 260 ++++++++++++++++++++++++
 11 files changed, 317 insertions(+), 25 deletions(-)
 create mode 100644 drivers/video/backlight/led_bl.c
