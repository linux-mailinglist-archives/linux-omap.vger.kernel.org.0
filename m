Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44F27A0992
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfH1Se5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:34:57 -0400
Received: from muru.com ([72.249.23.125]:59004 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbfH1Se5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Aug 2019 14:34:57 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0FEC88162;
        Wed, 28 Aug 2019 18:35:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/4] soc changes for omap variants for v5.4
Date:   Wed, 28 Aug 2019 11:34:49 -0700
Message-Id: <pull-1567016893-318461@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/soc-signed

for you to fetch changes up to 50f57ef83d836d727902a6a7e70cca61b0d02655:

  ARM: OMAP2+: Delete an unnecessary kfree() call in omap_hsmmc_pdata_init() (2019-08-26 08:59:48 -0700)

----------------------------------------------------------------
SoC changes for omap variants for v5.4

The first change moves platform-specific asm-offsets.h to arch/arm/mach-omap2
to fix iessu with parallel build with CONFIG_IKHEADERS, and the second change
removes a useless kfree.

Note that the first change causes a trivial merge conflict with the iommu
changes for arch/arm/mach-omap2/Makefile.

----------------------------------------------------------------
Markus Elfring (1):
      ARM: OMAP2+: Delete an unnecessary kfree() call in omap_hsmmc_pdata_init()

Masahiro Yamada (1):
      ARM: OMAP2+: move platform-specific asm-offset.h to arch/arm/mach-omap2

 arch/arm/mach-omap2/.gitignore  | 1 +
 arch/arm/mach-omap2/Makefile    | 5 +++--
 arch/arm/mach-omap2/hsmmc.c     | 4 +---
 arch/arm/mach-omap2/sleep33xx.S | 2 +-
 arch/arm/mach-omap2/sleep43xx.S | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/mach-omap2/.gitignore
