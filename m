Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB40428BB9
	for <lists+linux-omap@lfdr.de>; Mon, 11 Oct 2021 13:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbhJKLEu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Oct 2021 07:04:50 -0400
Received: from muru.com ([72.249.23.125]:43342 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236122AbhJKLEt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Oct 2021 07:04:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AD9BD8061;
        Mon, 11 Oct 2021 11:03:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.16
Date:   Mon, 11 Oct 2021 14:02:42 +0300
Message-Id: <pull-1633950030-501948@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/soc-signed

for you to fetch changes up to e60150de94ef1508e77cbf5956ecc0ca84c4fc9b:

  ARM: OMAP2+: Drop unused CM defines for am3 (2021-10-06 12:36:23 +0300)

----------------------------------------------------------------
SoC changes for omaps for v5.16

Few non-urgent comment typo fixes and few changes to drop unused auxdata.
Then a series of changes to drop some a pile of old unused defines. These
can be now dropped for the SoCs that have been updated to use devicetree
data with drivers/clock and drivers/soc device drivers.

----------------------------------------------------------------
Jason Wang (2):
      ARM: OMAP2+: Fix typo in some comments
      ARM: OMAP2+: Fix comment typo

Tony Lindgren (11):
      ARM: OMAP2+: Drop old unused omap5_uevm_legacy_init()
      ARM: OMAP2+: Drop unused old auxdata for dra7x_evm_mmc_quirk()
      ARM: OMAP2+: Drop unused PRM defines for dra7
      ARM: OMAP2+: Drop unused PRM defines for omap5
      ARM: OMAP2+: Drop unused PRM defines for omap4
      ARM: OMAP2+: Drop unused PRM defines for am4
      ARM: OMAP2+: Drop unused PRM defines for am3
      ARM: OMAP2+: Drop unused CM defines for dra7
      ARM: OMAP2+: Drop unused CM and SCRM defines for omap5
      ARM: OMAP2+: Drop unused CM and SCRM defines for omap4
      ARM: OMAP2+: Drop unused CM defines for am3

 arch/arm/mach-omap2/cm-regbits-44xx.h | 101 ------
 arch/arm/mach-omap2/cm1_44xx.h        | 174 ----------
 arch/arm/mach-omap2/cm1_54xx.h        | 168 ---------
 arch/arm/mach-omap2/cm1_7xx.h         | 263 --------------
 arch/arm/mach-omap2/cm2_44xx.h        | 386 ---------------------
 arch/arm/mach-omap2/cm2_54xx.h        | 325 ------------------
 arch/arm/mach-omap2/cm2_7xx.h         | 449 ------------------------
 arch/arm/mach-omap2/cm33xx.h          | 280 ---------------
 arch/arm/mach-omap2/omap_hwmod.c      |   6 +-
 arch/arm/mach-omap2/pdata-quirks.c    |  36 --
 arch/arm/mach-omap2/powerdomain.c     |   6 +-
 arch/arm/mach-omap2/prcm43xx.h        |  94 -----
 arch/arm/mach-omap2/prm33xx.h         |  40 ---
 arch/arm/mach-omap2/prm44xx.h         | 630 ----------------------------------
 arch/arm/mach-omap2/prm54xx.h         | 358 -------------------
 arch/arm/mach-omap2/prm7xx.h          | 613 ---------------------------------
 arch/arm/mach-omap2/scrm44xx.h        | 141 --------
 arch/arm/mach-omap2/scrm54xx.h        | 228 ------------
 18 files changed, 6 insertions(+), 4292 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/scrm54xx.h
