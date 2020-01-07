Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC602132E16
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 19:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbgAGSOY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 13:14:24 -0500
Received: from muru.com ([72.249.23.125]:50392 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728364AbgAGSOY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jan 2020 13:14:24 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 362128022;
        Tue,  7 Jan 2020 18:15:05 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/4] soc changes for omaps for v5.6
Date:   Tue,  7 Jan 2020 10:14:16 -0800
Message-Id: <pull-1578420398-290837@atomide.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/soc-signed

for you to fetch changes up to 4601832f40501efc3c2fd264a5a69bd1ac17d520:

  ARM: OMAP2+: use separate IOMMU pdata to fix DRA7 IPU1 boot (2019-12-17 09:57:09 -0800)

----------------------------------------------------------------
SoC changes for omaps for v5.6 merge window

SoC related changes for omaps that mostly relate to making iommus
to start probing with ti-sysc interconnect target module driver:

- Add missing lcdc clockdomain for am43xx

- Pass auxdata for reset control driver

- Remove old pdata quirks for iommus

- Add workaround for dra7 dsp mstandby errata

- Convert iommu platform code to probe with ti-sysc

- Use sperate iommu auxdata for ipu1

----------------------------------------------------------------
Dave Gerlach (1):
      ARM: OMAP2+: am43xx: Add lcdc clockdomain

Suman Anna (2):
      ARM: OMAP2+: Add workaround for DRA7 DSP MStandby errata i879
      ARM: OMAP2+: use separate IOMMU pdata to fix DRA7 IPU1 boot

Tero Kristo (3):
      ARM: OMAP2+: pdata-quirks: add PRM data for reset support
      ARM: OMAP4+: remove pdata quirks for omap4+ iommus
      ARM: OMAP2+: omap-iommu.c conversion to ti-sysc

 arch/arm/mach-omap2/clockdomains43xx_data.c |  10 +++
 arch/arm/mach-omap2/omap-iommu.c            | 128 ++++++++++++++++++++++++----
 arch/arm/mach-omap2/pdata-quirks.c          |  43 +++++++---
 arch/arm/mach-omap2/prcm43xx.h              |   1 +
 4 files changed, 153 insertions(+), 29 deletions(-)
