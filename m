Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1398525C050
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 13:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgICL3B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 07:29:01 -0400
Received: from muru.com ([72.249.23.125]:41914 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728535AbgICL1B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Sep 2020 07:27:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8774680FE;
        Thu,  3 Sep 2020 11:26:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Device tree changes for omaps for v5.10
Date:   Thu,  3 Sep 2020 14:26:42 +0300
Message-Id: <pull-1599132307-761202@atomide.com-3>
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

The following changes since commit 6542e2b613c2b1952e83973dc434831332ce8e27:

  ARM: dts: omap5: Fix DSI base address and clocks (2020-08-19 08:54:33 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/dt-signed

for you to fetch changes up to 513f8297f6b14a76346cd049956f1c9a2a48d7aa:

  Merge branch 'fixes' into omap-for-v5.10/dt (2020-08-19 10:52:00 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v5.10

- Use a known good SGX clockrate for 4430, this is not needed as a fix
  as the closed source SGX driver is out of tree

- Prepare DSI panels for upcoming changes to use generic driver code

- Add common support for MOXA UC-8100 series

- Add ocp label for l3 interconnect for board specific dts files to
  reference

- Configure CPU thermal properties for omap3

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: omap3: Add cpu trips and cooling map for omap34/36 families

Drew Fustini (1):
      ARM: dts: am33xx: add ocp label

Johnson CH Chen (陳昭勳) (1):
      ARM: dts: am335x: add common dtsi for MOXA UC-8100 series

Sebastian Reichel (3):
      ARM: dts: omap: add channel to DSI panels
      ARM: dts: omap4-droid4: add panel compatible
      ARM: dts: omap4-droid4: add panel orientation

Tony Lindgren (3):
      ARM: dts: omap4: Fix sgx clock rate for 4430
      Merge branch 'omap-for-v5.10/dt-moxa' into omap-for-v5.10/dt
      Merge branch 'fixes' into omap-for-v5.10/dt

 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi | 427 ++++++++++++++++++++++
 arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts    | 404 +-------------------
 arch/arm/boot/dts/am33xx.dtsi                     |   2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi   |   6 +-
 arch/arm/boot/dts/omap3-cpu-thermal.dtsi          |  21 ++
 arch/arm/boot/dts/omap3-n950.dts                  |   3 +-
 arch/arm/boot/dts/omap3.dtsi                      |   3 +
 arch/arm/boot/dts/omap34xx.dtsi                   |   1 +
 arch/arm/boot/dts/omap36xx.dtsi                   |   1 +
 arch/arm/boot/dts/omap4-sdp.dts                   |   6 +-
 arch/arm/boot/dts/omap4.dtsi                      |   8 +-
 arch/arm/boot/dts/omap443x.dtsi                   |  10 +
 arch/arm/boot/dts/omap5.dtsi                      |   6 +
 13 files changed, 488 insertions(+), 410 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi
