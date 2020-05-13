Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129381D1B2F
	for <lists+linux-omap@lfdr.de>; Wed, 13 May 2020 18:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732218AbgEMQfr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 May 2020 12:35:47 -0400
Received: from muru.com ([72.249.23.125]:54390 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389675AbgEMQfq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 May 2020 12:35:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8314A80E1;
        Wed, 13 May 2020 16:36:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] SoC changes for omaps for v5.8
Date:   Wed, 13 May 2020 09:35:43 -0700
Message-Id: <pull-1589387719-605999@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.8/soc-signed-take2

for you to fetch changes up to d33e3d542b6c09a5cb4fa51d82109b2ca92e89c2:

  ARM: OMAP2+: pm33xx-core: Make am43xx_get_rtc_base_addr static (2020-05-12 08:36:04 -0700)

----------------------------------------------------------------
SoC changes for omaps for v5.8 merge window

SoC related changes for omaps:

- Use ard instead of adrl for sleep34xx.S for clang

- Stop selecting MIGHT_HAVE_CACHE_L2X0, it's already selected
  by ARCH_MULTI_V6_V7

- Make omap5_erratum_workaround_801819() and am43xx_get_rtc_base_addr()
  static

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: omap2plus: Drop unneeded select of MIGHT_HAVE_CACHE_L2X0

Ma Feng (1):
      ARM: omap2: make omap5_erratum_workaround_801819 static

Samuel Zou (1):
      ARM: OMAP2+: pm33xx-core: Make am43xx_get_rtc_base_addr static

Stefan Agner (1):
      ARM: OMAP2+: drop unnecessary adrl

 arch/arm/mach-omap2/Kconfig       | 1 -
 arch/arm/mach-omap2/omap-smp.c    | 2 +-
 arch/arm/mach-omap2/pm33xx-core.c | 2 +-
 arch/arm/mach-omap2/sleep34xx.S   | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)
