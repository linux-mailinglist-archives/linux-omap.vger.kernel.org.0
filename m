Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DF63E9F29
	for <lists+linux-omap@lfdr.de>; Thu, 12 Aug 2021 09:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhHLHEV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Aug 2021 03:04:21 -0400
Received: from muru.com ([72.249.23.125]:42472 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230147AbhHLHEV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Aug 2021 03:04:21 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 42F5380E2;
        Thu, 12 Aug 2021 07:04:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Changes for am3 cpsw and SanCloud for v5.15
Date:   Thu, 12 Aug 2021 10:03:44 +0300
Message-Id: <pull-1628751694-126144@atomide.com-3>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <pull-1628751694-126144@atomide.com>
References: <pull-1628751694-126144@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 8c054cd2818ea08555efe24a2ffde330833c2f3f:

  ARM: dts: am57xx: Add PRUSS MDIO controller nodes (2021-08-03 15:25:14 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/dt-am3-signed

for you to fetch changes up to 29fabf5274bfb89124918840c79851659a25ba79:

  ARM: dts: am335x-sancloud-bbe: Drop usb wifi comment (2021-08-10 09:52:41 +0300)

----------------------------------------------------------------
Changes for am3 cpsw and SanCloud for v5.15

A series of changes to update am3 to use cpsw switch driver and
few updates to earlier SanCloud changes. The plan was to send the
cpsw switch driver changes earlier but looks like I never tagged
the mail thread in my inbox to apply for v5.15.

----------------------------------------------------------------
Grygorii Strashko (16):
      ARM: dts: am335x-baltos: switch to new cpsw switch drv
      ARM: dts: am335x-nano: switch to new cpsw switch drv
      ARM: dts: am335x-chiliboard: switch to new cpsw switch drv
      ARM: dts: am335x-cm-t335: switch to new cpsw switch drv
      ARM: dts: am335x-igep0033: switch to new cpsw switch drv
      ARM: dts: am335x-lxm: switch to new cpsw switch drv
      ARM: dts: am335x-moxa-uc: switch to new cpsw switch drv
      ARM: dts: am335x-myirtech: switch to new cpsw switch drv
      ARM: dts: am335x-osd3358-sm-red: switch to new cpsw switch drv
      ARM: dts: am335x-pdu001: switch to new cpsw switch drv
      ARM: dts: am335x-pepper: switch to new cpsw switch drv
      ARM: dts: am335x-phycore: switch to new cpsw switch drv
      ARM: dts: am335x-shc: switch to new cpsw switch drv
      ARM: dts: am335x-sl50: switch to new cpsw switch drv
      ARM: dts: am33xx: update ethernet aliases
      ARM: dts: am335x-bone: switch to new cpsw switch drv

Paul Barker (2):
      ARM: dts: am335x-sancloud-bbe: Fix missing pinctrl refs
      ARM: dts: am335x-sancloud-bbe: Drop usb wifi comment

 arch/arm/boot/dts/am335x-baltos-ir2110.dts        | 10 +++---
 arch/arm/boot/dts/am335x-baltos-ir3220.dts        |  8 ++---
 arch/arm/boot/dts/am335x-baltos-ir5221.dts        |  8 ++---
 arch/arm/boot/dts/am335x-baltos.dtsi              |  5 ++-
 arch/arm/boot/dts/am335x-bone-common.dtsi         | 13 +++++---
 arch/arm/boot/dts/am335x-boneblack-wireless.dts   |  2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts   |  2 +-
 arch/arm/boot/dts/am335x-chiliboard.dts           | 13 +++++---
 arch/arm/boot/dts/am335x-cm-t335.dts              | 13 +++++---
 arch/arm/boot/dts/am335x-igep0033.dtsi            | 12 +++----
 arch/arm/boot/dts/am335x-lxm.dts                  | 14 ++++-----
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi | 12 +++----
 arch/arm/boot/dts/am335x-moxa-uc-2101.dts         |  7 ++---
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi | 16 ++++------
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi        | 25 ++++++++-------
 arch/arm/boot/dts/am335x-myirtech-myd.dts         | 18 ++++++-----
 arch/arm/boot/dts/am335x-nano.dts                 | 13 ++++----
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts      | 10 +++---
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts      | 10 +++---
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts      | 10 +++---
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts       | 13 +++++---
 arch/arm/boot/dts/am335x-pcm-953.dtsi             | 10 +++---
 arch/arm/boot/dts/am335x-pdu001.dts               | 14 ++++-----
 arch/arm/boot/dts/am335x-pepper.dts               | 14 ++++-----
 arch/arm/boot/dts/am335x-phycore-som.dtsi         | 14 +++++----
 arch/arm/boot/dts/am335x-regor.dtsi               | 11 +++----
 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi | 37 +++-------------------
 arch/arm/boot/dts/am335x-sancloud-bbe.dts         |  4 +++
 arch/arm/boot/dts/am335x-shc.dts                  | 38 +++++++++++++----------
 arch/arm/boot/dts/am335x-sl50.dts                 | 12 ++++---
 arch/arm/boot/dts/am335x-wega.dtsi                | 11 +++----
 arch/arm/boot/dts/am33xx.dtsi                     |  4 +--
 32 files changed, 194 insertions(+), 209 deletions(-)
