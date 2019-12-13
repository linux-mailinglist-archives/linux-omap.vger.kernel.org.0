Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABBF111E86D
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 17:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbfLMQfu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 11:35:50 -0500
Received: from muru.com ([72.249.23.125]:47150 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728244AbfLMQfu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Dec 2019 11:35:50 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 615408186;
        Fri, 13 Dec 2019 16:36:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] omap fixes for v5.5-rc cycle
Date:   Fri, 13 Dec 2019 08:35:40 -0800
Message-Id: <pull-1576254925-709310@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/fixes-rc1-signed

for you to fetch changes up to e709ed70d122e94cb426b1e1f905829eae19a009:

  bus: ti-sysc: Fix missing reset delay handling (2019-12-12 08:20:10 -0800)

----------------------------------------------------------------
Fixes for omap variants for v5.5-rc1 cycle

This series of changes contains fixes for issues recently noticed:

- The ti-sysc interconnect target module driver needs fixes for
  mstandby quirk handling and reset delay

- We need to configure am335x-sancloud-bbe to use rgmii-id mode because of
  the phy changes done earlier

- NET_SWITCHDEV is no longer selected in Kconfig but a dependency and we
  must enable CONFIG_NET_SWITCHDEV to have TI_CPSW_SWITCHDEV

- We are still relying on DEBUG_FS at least for PM configuration, let's
  add it back

- We need to update compatible for am437x-gp/epos-evm because of the
  recent changes to use generic panels

----------------------------------------------------------------
Grygorii Strashko (1):
      ARM: omap2plus_defconfig: enable NET_SWITCHDEV

Mans Rullgard (1):
      ARM: dts: am335x-sancloud-bbe: fix phy mode

Tomi Valkeinen (1):
      ARM: dts: am437x-gp/epos-evm: fix panel compatible

Tony Lindgren (3):
      bus: ti-sysc: Fix missing force mstandby quirk handling
      ARM: omap2plus_defconfig: Add back DEBUG_FS
      bus: ti-sysc: Fix missing reset delay handling

 arch/arm/boot/dts/am335x-sancloud-bbe.dts | 2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts       | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts      | 2 +-
 arch/arm/configs/omap2plus_defconfig      | 4 +++-
 drivers/bus/ti-sysc.c                     | 7 ++++++-
 include/linux/platform_data/ti-sysc.h     | 1 +
 6 files changed, 13 insertions(+), 5 deletions(-)
