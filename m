Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD113DEEB4
	for <lists+linux-omap@lfdr.de>; Tue,  3 Aug 2021 15:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235782AbhHCNFp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Aug 2021 09:05:45 -0400
Received: from muru.com ([72.249.23.125]:34264 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235635AbhHCNFp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Aug 2021 09:05:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DFFB28050;
        Tue,  3 Aug 2021 13:05:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.14-rc series
Date:   Tue,  3 Aug 2021 16:05:29 +0300
Message-Id: <pull-1627995895-406133@atomide.com>
X-Mailer: git-send-email 2.32.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/fixes-rc5-signed

for you to fetch changes up to 353b7a55dcaf5fb8758e09ebe2ddf5f3adbac7c5:

  Merge branch 'fixes-v5.14' into fixes (2021-07-27 11:25:08 +0300)

----------------------------------------------------------------
Fixes for omaps for v5.14-rc series

Some fixes for regressions and boot issues for various devices:

- Fix gpt12 system timer regression on earlier beagleboard revisions

- Fix potential NULL pointer access for omap_hwmod_get_pwrdm()

- Disable RNG on secure am335x variants as it's not accessible

- Fix flakey DCDC2 voltage causing hangs on am43x-epos-evm by reducing
  i2c0 bus speed for tps65218

- Fix typo for am437x-l4 can@0 node

- Fix omap5 regression caused by vdds_1v8_main fixed-regulator

----------------------------------------------------------------
Dario Binacchi (1):
      ARM: dts: am437x-l4: fix typo in can@0 node

Dave Gerlach (1):
      ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for tps65218

H. Nikolaus Schaller (1):
      omap5-board-common: remove not physically existing vdds_1v8_main fixed-regulator

Kevin Hilman (1):
      bus: ti-sysc: AM3: RNG is GP only

Tero Kristo (1):
      ARM: omap2+: hwmod: fix potential NULL pointer access

Tony Lindgren (2):
      bus: ti-sysc: Fix gpt12 system timer issue with reserved status
      Merge branch 'fixes-v5.14' into fixes

 arch/arm/boot/dts/am437x-l4.dtsi          |  2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts      |  2 +-
 arch/arm/boot/dts/omap5-board-common.dtsi |  9 +--------
 arch/arm/mach-omap2/omap_hwmod.c          | 10 +++++++++-
 drivers/bus/ti-sysc.c                     | 22 +++++++++++++++-------
 5 files changed, 27 insertions(+), 18 deletions(-)
