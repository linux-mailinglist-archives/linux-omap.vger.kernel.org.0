Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473B31D35D6
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 18:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgENQCX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 12:02:23 -0400
Received: from muru.com ([72.249.23.125]:54516 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgENQCX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 12:02:23 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1075080C0;
        Thu, 14 May 2020 16:03:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Three network phy fixes for am57xx and am437x
Date:   Thu, 14 May 2020 09:02:15 -0700
Message-Id: <pull-1589472123-367692@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 738b150ecefbffb6e55cfa8a3b66a844f777d8fb:

  ARM: dts: omap4-droid4: Fix occasional lost wakeirq for uart1 (2020-05-05 10:19:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/cpsw-fixes-signed

for you to fetch changes up to fb6823a6f9801dbe86b6551103f477dd3c5d115a:

  ARM: dts: Fix wrong mdio clock for dm814x (2020-05-12 13:54:23 -0700)

----------------------------------------------------------------
Few cpsw related dts fixes for omaps

Recent cpsw driver changes exposed few regressions in the cpsw related
dts configuration that would be good to fix:

- Few more boards still need to be updated to use rgmii-rxid phy caused
  by the fallout from commit bcf3440c6dd7 ("net: phy: micrel: add phy-mode
  support for the KSZ9031 PHY" as the rx delay is now disabled unless we
  use rgmii-rxid.

- On dm814x we have been using a wrong clock for mdio that now can produce
  external abort on some boards

----------------------------------------------------------------
Grygorii Strashko (2):
      ARM: dts: am57xx: fix networking on boards with ksz9031 phy
      ARM: dts: am437x: fix networking on boards with ksz9031 phy

Tony Lindgren (1):
      ARM: dts: Fix wrong mdio clock for dm814x

 arch/arm/boot/dts/am437x-gp-evm.dts             | 2 +-
 arch/arm/boot/dts/am437x-idk-evm.dts            | 2 +-
 arch/arm/boot/dts/am437x-sk-evm.dts             | 4 ++--
 arch/arm/boot/dts/am571x-idk.dts                | 4 ++--
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 4 ++--
 arch/arm/boot/dts/am57xx-idk-common.dtsi        | 4 ++--
 arch/arm/boot/dts/dm814x.dtsi                   | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)
