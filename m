Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E57B17AE790
	for <lists+linux-omap@lfdr.de>; Tue, 26 Sep 2023 10:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjIZIMI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Sep 2023 04:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbjIZIMA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Sep 2023 04:12:00 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC058CC5
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 01:11:53 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 83BE980A3;
        Tue, 26 Sep 2023 08:11:52 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps and ti-sysc
Date:   Tue, 26 Sep 2023 11:11:47 +0300
Message-ID: <pull-1695715881-95183@atomide.com>
X-Mailer: git-send-email 2.42.0
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

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/fixes-signed

for you to fetch changes up to 06f114cf7cbe96a07c51c47114d79e9654275919:

  Merge branches 'fixes-mapphone' and 'fixes-ti-sysc' into fixes (2023-09-13 11:11:11 +0300)

----------------------------------------------------------------
Fixes for omaps and ti-sysc

Fixes for several ti-sysc interconnect target module driver issues for
external abort on non-linefetch, am35x soc match, and uart module quirks
handling needed for devices to work and to allow device wake-up to work.

Fixes for droid4 boot time errors and warnings as noticed after boot doing
dmesg -lerr,warn. Let's also cut down the debug uart noise by using
overrun-throttle-ms, and downgrade the u-boot version warnings to
debug statements to further reduce the boot time noise with warnings.

----------------------------------------------------------------
Adam Ford (1):
      bus: ti-sysc: Fix missing AM35xx SoC matching

Julien Panis (1):
      bus: ti-sysc: Use fsleep() instead of usleep_range() in sysc_reset()

Tony Lindgren (6):
      ARM: dts: ti: omap: Fix bandgap thermal cells addressing for omap3/4
      ARM: dts: ti: omap: motorola-mapphone: Fix abe_clkctrl warning on boot
      ARM: dts: ti: omap: Fix noisy serial with overrun-throttle-ms for mapphone
      ARM: omap2+: Downgrade u-boot version warnings to debug statements
      bus: ti-sysc: Fix SYSC_QUIRK_SWSUP_SIDLE_ACT handling for uart wake-up
      Merge branches 'fixes-mapphone' and 'fixes-ti-sysc' into fixes

 .../boot/dts/ti/omap/motorola-mapphone-common.dtsi |  5 ++--
 arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi   |  3 +--
 arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi   |  5 +++-
 arch/arm/boot/dts/ti/omap/omap443x.dtsi            |  1 +
 arch/arm/boot/dts/ti/omap/omap4460.dtsi            |  1 +
 arch/arm/mach-omap2/pm44xx.c                       |  4 +--
 drivers/bus/ti-sysc.c                              | 31 +++++++++++++++-------
 7 files changed, 34 insertions(+), 16 deletions(-)
