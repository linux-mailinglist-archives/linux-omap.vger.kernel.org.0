Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FA9303DD0
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 13:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391539AbhAZMyi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 07:54:38 -0500
Received: from muru.com ([72.249.23.125]:53472 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403971AbhAZMuY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 07:50:24 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DE3DB8057;
        Tue, 26 Jan 2021 12:49:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCHv2 00/12] Drop legacy platform data for dra7
Date:   Tue, 26 Jan 2021 14:49:25 +0200
Message-Id: <20210126124937.52994-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here's v2 series to update dra7 to probe with ti-sysc and genpd like we've
already done for am3 and 4. This series depends on the related driver
and dts changes:

[PATCHv2 00/15] Update dra7 devicetree files to probe with genpd

Note that the driver and device tree changes series has dependencies
listed in the cover letter.

Please review and test. I've also pushed out a temporary testing branch
with all the related patches to make testing easier, the test branch is
at [0][1] below.

Regards,

Tony

Changes since v1:

- Split the series into two parts, looks like most of the emails did not
  make it to the lists

- Dropped Balaji from Cc as the email address bounces

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git tmp-testing-genpd-dra7
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.12/tmp-testing-genpd-dra7

Tony Lindgren (12):
  ARM: OMAP2+: Drop legacy platform data for dra7 pcie
  ARM: OMAP2+: Drop legacy platform data for dra7 qspi
  ARM: OMAP2+: Drop legacy platform data for dra7 sata
  ARM: OMAP2+: Drop legacy platform data for dra7 mpu
  ARM: OMAP2+: Drop legacy platform data for dra7 dmm
  ARM: OMAP2+: Drop legacy platform data for dra7 l4_wkup
  ARM: OMAP2+: Drop legacy platform data for dra7 l4_per1
  ARM: OMAP2+: Drop legacy platform data for dra7 l4_per2
  ARM: OMAP2+: Drop legacy platform data for dra7 l4_per3
  ARM: OMAP2+: Drop legacy platform data for dra7 l4_cfg
  ARM: OMAP2+: Drop legacy platform data for dra7 l3
  ARM: OMAP2+: Drop legacy platform data for dra7 hwmod

 arch/arm/boot/dts/dra7-l4.dtsi            |   1 -
 arch/arm/boot/dts/dra7.dtsi               |   6 -
 arch/arm/mach-omap2/Kconfig               |   1 -
 arch/arm/mach-omap2/Makefile              |   1 -
 arch/arm/mach-omap2/common.h              |   9 -
 arch/arm/mach-omap2/io.c                  |   2 -
 arch/arm/mach-omap2/omap_hwmod.c          |   8 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 719 ----------------------
 8 files changed, 747 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_7xx_data.c

-- 
2.30.0
