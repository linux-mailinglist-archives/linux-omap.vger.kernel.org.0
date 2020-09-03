Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C8C25C4DD
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 17:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729035AbgICPTt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 11:19:49 -0400
Received: from muru.com ([72.249.23.125]:41910 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728517AbgICL1B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Sep 2020 07:27:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EAB3380FC;
        Thu,  3 Sep 2020 11:26:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Drop legacy platform data for omaps for v5.10
Date:   Thu,  3 Sep 2020 14:26:41 +0300
Message-Id: <pull-1599132307-761202@atomide.com-2>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <pull-1599132307-761202@atomide.com>
References: <pull-1599132307-761202@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/ti-sysc-drop-pdata-signed

for you to fetch changes up to 0d7ce5c5c4e6418c1bb1d7c5ee94de815fdc3041:

  Merge branch 'omap-for-v5.10/prm-genpd' into omap-for-v5.10/ti-sysc-drop-pdata (2020-09-03 12:06:18 +0300)

----------------------------------------------------------------
Add initial genpd support for omaps to drop more platform data

We now drop legacy platform data for RTC on am3, am4 and dra7.
And we add initial genpd support for PRM (Power and Reset Manager)
and use it to drop legacy platform data for am3 sgx and omap4/5
l4_abe interconnect instance.

----------------------------------------------------------------
Tony Lindgren (10):
      dt-bindings: omap: Update PRM binding for genpd
      soc: ti: omap-prm: Add basic power domain support
      soc: ti: omap-prm: Configure sgx power domain for am3 and am4
      soc: ti: omap-prm: Configure omap4 and 5 l4_abe power domain
      ARM: dts: Configure am3 and am4 sgx for genpd and drop platform data
      ARM: dts: Configure omap4 and 5 l4_abe for genpd and drop platform data
      soc: ti: pm33xx: Simplify RTC usage to prepare to drop platform data
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 rtc
      ARM: OMAP2+: Drop legacy platform data for dra7 rtcss
      Merge branch 'omap-for-v5.10/prm-genpd' into omap-for-v5.10/ti-sysc-drop-pdata

 .../devicetree/bindings/arm/omap/prm-inst.txt      |   2 +
 arch/arm/boot/dts/am33xx-l4.dtsi                   |   1 -
 arch/arm/boot/dts/am33xx.dtsi                      |   2 +
 arch/arm/boot/dts/am4372.dtsi                      |   2 +
 arch/arm/boot/dts/am437x-l4.dtsi                   |   3 +-
 arch/arm/boot/dts/am43x-epos-evm.dts               |   4 +
 arch/arm/boot/dts/dra7-l4.dtsi                     |   1 -
 arch/arm/boot/dts/omap4-l4-abe.dtsi                |   6 +-
 arch/arm/boot/dts/omap4.dtsi                       |   6 +
 arch/arm/boot/dts/omap5-l4-abe.dtsi                |   6 +-
 arch/arm/boot/dts/omap5.dtsi                       |   6 +
 arch/arm/mach-omap2/Kconfig                        |   1 +
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |   2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |  24 --
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c |  77 ------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         |   3 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         |  10 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c         |  33 ---
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c         |  31 ---
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c          |  44 ----
 arch/arm/mach-omap2/pm33xx-core.c                  |  25 --
 drivers/soc/ti/omap_prm.c                          | 274 ++++++++++++++++++++-
 drivers/soc/ti/pm33xx.c                            |  47 +++-
 include/linux/platform_data/pm33xx.h               |   3 -
 24 files changed, 345 insertions(+), 268 deletions(-)
