Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BEC355091
	for <lists+linux-omap@lfdr.de>; Tue,  6 Apr 2021 12:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235997AbhDFKLP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Apr 2021 06:11:15 -0400
Received: from muru.com ([72.249.23.125]:51454 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233987AbhDFKLO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 6 Apr 2021 06:11:14 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D503F8119;
        Tue,  6 Apr 2021 10:12:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] 
Date:   Tue,  6 Apr 2021 13:10:59 +0300
Message-Id: <pull-1617703816-65652@atomide.com-2>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1617703816-65652@atomide.com>
References: <pull-1617703816-65652@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/dt-v2-signed

for you to fetch changes up to ee368a10d0dfb27bbff36361ea2166f864028a8b:

  ARM: dts: am335x-boneblack.dts: unique gpio-line-names (2021-03-31 08:54:45 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v5.13

Mostly configures addtional devices for various boards, and
updates the gpio line names for beagle boards so userspace can
optionally find the right lines:

- Use unique gpio line names for am335x-pocketbeagle

- Update omap3-echo led configuration and add ath6kl node

- Fix indentation for am3 tscadc node

- Prepare motorola-cpcap-mapphone for power supply dtbs_check_parsing

- Use unique gpio line names for am335x-boneblack.dts

----------------------------------------------------------------
André Hentschel (2):
      ARM: dts: omap3-echo: Update LED configuration
      ARM: dts: omap3-echo: Add ath6kl node

Dario Binacchi (1):
      ARM: dts: am33xx-l4: fix tscadc@0 node indentation

Drew Fustini (2):
      ARM: dts: am335x-pocketbeagle: unique gpio-line-names
      ARM: dts: am335x-boneblack.dts: unique gpio-line-names

Sebastian Reichel (1):
      ARM: dts: motorola-cpcap-mapphone: Prepare for dtbs_check parsing

 arch/arm/boot/dts/am335x-boneblack.dts         | 132 +++----
 arch/arm/boot/dts/am335x-pocketbeagle.dts      | 140 ++++----
 arch/arm/boot/dts/am33xx-l4.dtsi               |  28 +-
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi |  59 ++-
 arch/arm/boot/dts/omap3-echo.dts               | 476 +++++++++++++++++--------
 5 files changed, 514 insertions(+), 321 deletions(-)
