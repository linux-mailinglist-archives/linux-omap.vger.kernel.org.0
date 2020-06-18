Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1521FF9C0
	for <lists+linux-omap@lfdr.de>; Thu, 18 Jun 2020 18:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgFRQze (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Jun 2020 12:55:34 -0400
Received: from muru.com ([72.249.23.125]:58292 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727882AbgFRQze (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Jun 2020 12:55:34 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BA53A80A9;
        Thu, 18 Jun 2020 16:56:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Few dts fixes for omaps for v5.8
Date:   Thu, 18 Jun 2020 09:55:27 -0700
Message-Id: <pull-1592499282-121092@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 07c7b547a79605f1041d55b84d91a4a4d9c5b363:

  Merge tag 'v5.8-rc1' into fixes (2020-06-16 09:25:03 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.8/fixes-rc1-signed

for you to fetch changes up to a352fe371053d047481635da328ea781329c84a4:

  Merge branch 'omap-for-v5.8/fixes-rc1' into fixes (2020-06-16 09:26:03 -0700)

----------------------------------------------------------------
Few dts fixes for omaps for v5.8

Few fixes for various devices:

- Prevent pocketgeagle header line signal from accidentally setting
  micro-SD write protection signal by removing the default mux

- Fix NFSroot flakeyness after resume for duover by switching the
  smsc911x gpio interrupt to back to level sensitive

- Fix regression for omap4 clockevent source after recent system
  timer changes

- Yet another ethernet regression fix for the "rgmii" vs "rgmii-rxid"
  phy-mode

----------------------------------------------------------------
Drew Fustini (2):
      ARM: dts: am335x-pocketbeagle: Fix mmc0 Write Protect
      ARM: dts: am5729: beaglebone-ai: fix rgmii phy-mode

Tony Lindgren (3):
      ARM: dts: Fix duovero smsc interrupt for suspend
      ARM: dts: Fix omap4 system timer source clocks
      Merge branch 'omap-for-v5.8/fixes-rc1' into fixes

 arch/arm/boot/dts/am335x-pocketbeagle.dts  | 1 -
 arch/arm/boot/dts/am5729-beagleboneai.dts  | 2 +-
 arch/arm/boot/dts/omap4-duovero-parlor.dts | 2 +-
 arch/arm/boot/dts/omap4.dtsi               | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)
