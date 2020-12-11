Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1449D2D71ED
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 09:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391494AbgLKIix (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 03:38:53 -0500
Received: from muru.com ([72.249.23.125]:50122 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391451AbgLKIia (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Dec 2020 03:38:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 419E180C8;
        Fri, 11 Dec 2020 08:37:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] Late devicetree changes for omaps for v5.11
Date:   Fri, 11 Dec 2020 10:37:41 +0200
Message-Id: <pull-1607675790-251347@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit d7356a7ab125c3a4fee521b7530f3122bc842ac4:

  ARM: dts: am335x: Fix comments for AM335X_PIN_GPMC_WPN pin in GPIO mode (2020-11-16 13:38:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/dt-late-signed

for you to fetch changes up to 4d4ce69f19d4991701e84d5eaa0fc0e506210042:

  ARM: dts: dra71-evm: mark ldo0 regulator as always on (2020-12-08 15:57:43 +0200)

----------------------------------------------------------------
Late devicetree changes for omaps for v5.11 merge window

Here are few more late changes that would be nice to get into v5.11:

- More updates to use cpsw switchdev driver

- Enable gta04 PMIC power management

- Updates for dra7 for ECC support, 1.8GHz speed and keep the
  ldo0 regulator always on as specified in the data manual

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: omap3-gta04: fix twl4030-power settings

Grygorii Strashko (2):
      ARM: dts: am33xx-l4: add dt node for new cpsw switchdev driver
      ARM: dts: am335x-evm/evmsk/icev2: switch to new cpsw switch drv

Tero Kristo (3):
      ARM: dts: am574x-idk: add support for EMIF1 ECC
      ARM: dts: dra76x: add support for OPP_PLUS
      ARM: dts: dra71-evm: mark ldo0 regulator as always on

 arch/arm/boot/dts/am335x-evm.dts   | 13 ++++++----
 arch/arm/boot/dts/am335x-evmsk.dts | 14 +++++------
 arch/arm/boot/dts/am335x-icev2.dts | 14 +++++------
 arch/arm/boot/dts/am33xx-l4.dtsi   | 49 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/am574x-idk.dts   |  4 ++++
 arch/arm/boot/dts/dra71-evm.dts    |  2 ++
 arch/arm/boot/dts/dra76x.dtsi      | 36 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/omap3-gta04.dtsi |  4 ++--
 8 files changed, 113 insertions(+), 23 deletions(-)
