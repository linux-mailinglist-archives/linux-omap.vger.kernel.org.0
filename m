Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60125355090
	for <lists+linux-omap@lfdr.de>; Tue,  6 Apr 2021 12:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbhDFKLO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Apr 2021 06:11:14 -0400
Received: from muru.com ([72.249.23.125]:51448 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233987AbhDFKLN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 6 Apr 2021 06:11:13 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6162D80A4;
        Tue,  6 Apr 2021 10:12:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] 
Date:   Tue,  6 Apr 2021 13:10:58 +0300
Message-Id: <pull-1617703816-65652@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/soc-signed

for you to fetch changes up to 206fa766ca2151d728a0894bdb03688d48564aa0:

  ARM: OMAP1: fix incorrect kernel-doc comment syntax in file (2021-03-31 09:05:42 +0300)

----------------------------------------------------------------
SoC changes for omaps for v5.13

Minor non-urgent fixes for issues found by robots and few typo fixes:

- Use DEFINE_DEBUGFS_ATTRIBUTE

- Add missing of_node_put()

- Use true and false for bool variable

- Use DEFINE_SPINLOCK

- Fix incorrect kerneldoc usage

----------------------------------------------------------------
Aditya Srivastava (2):
      ARM: OMAP2+: fix incorrect kernel-doc comment syntax in file
      ARM: OMAP1: fix incorrect kernel-doc comment syntax in file

Jiapeng Chong (1):
      ARM: OMAP2+: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

Lifu Chen (1):
      ARM: OMAP2+: Use DEFINE_SPINLOCK() for spinlock

Yang Li (2):
      ARM: OMAP2+: add missing call to of_node_put()
      ARM: OMAP2+: use true and false for bool variable

 arch/arm/mach-omap1/timer.c       |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c  |  1 +
 arch/arm/mach-omap2/omap_twl.c    |  2 +-
 arch/arm/mach-omap2/pm-debug.c    |  4 ++--
 arch/arm/mach-omap2/powerdomain.c | 12 ++++++------
 arch/arm/plat-omap/dma.c          |  3 +--
 6 files changed, 12 insertions(+), 12 deletions(-)
