Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B70A10B2EE
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2019 17:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfK0QGe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Nov 2019 11:06:34 -0500
Received: from muru.com ([72.249.23.125]:43726 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbfK0QGe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 Nov 2019 11:06:34 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 56AC38102;
        Wed, 27 Nov 2019 16:07:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] few omap dts fixes for v5.5 merge window
Date:   Wed, 27 Nov 2019 08:06:27 -0800
Message-Id: <pull-1574870758-237468@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit abb0e36b434d784864fe0e4d5dedd17f4d72f3e3:

  ARM: dts: logicpd-torpedo: Disable USB Host (2019-11-11 13:03:06 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/dt-fixes-merge-window-signed

for you to fetch changes up to 3e5c3c41ae925458150273e2f74ffbf999530c5f:

  ARM: dts: Fix sgx sysconfig register for omap4 (2019-11-25 07:40:01 -0800)

----------------------------------------------------------------
Device tree fixes for omap variants for for v5.5 merge window

This series of changes contains fixes for few SoC and board specific
issues that would be good to have merged for v5.5-rc1:

- Fix incorrect MMC card detection polarity for omap3-tao3530

- Fix wrong am57xx-beagle-x15 pinmux named states for eMMC

- Fix dra7 cpsw mdio clock that causes wrong speed

- Fix vcsi for droid4 so it won't get turned off after init

- Fix rev and sysconfig register offsets for omap4 sgx so it can idle

Then there are also two minor late changes to logicpd-torpedo-baseboard
to configure 1-wire HDQ for battery stats, and remove out of date
workaround comments no longer needed.

----------------------------------------------------------------
Adam Ford (2):
      ARM: dts: logicpd-torpedo-baseboard:  Enable HDQ
      ARM: dts: logicpd-torpedo: Remove unnecessary notes/comments

Faiz Abbas (1):
      ARM: dts: am57xx-beagle-x15: Update pinmux name to ddr_3_3v

Grygorii Strashko (1):
      ARM: dts: dra7: fix cpsw mdio fck clock

Jarkko Nikula (1):
      ARM: dts: omap3-tao3530: Fix incorrect MMC card detection GPIO polarity

Tony Lindgren (2):
      ARM: dts: Fix vcsi regulator to be always-on for droid4 to prevent hangs
      ARM: dts: Fix sgx sysconfig register for omap4

 arch/arm/boot/dts/am57xx-beagle-x15-revb1.dts        |  2 +-
 arch/arm/boot/dts/am57xx-beagle-x15-revc.dts         |  2 +-
 arch/arm/boot/dts/dra7-l4.dtsi                       |  2 +-
 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts |  1 -
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi     | 13 ++++++++++++-
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi       |  4 ++--
 arch/arm/boot/dts/omap3-tao3530.dtsi                 |  2 +-
 arch/arm/boot/dts/omap4.dtsi                         |  4 ++--
 8 files changed, 20 insertions(+), 10 deletions(-)
