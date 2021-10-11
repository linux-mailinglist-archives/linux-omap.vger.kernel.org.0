Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BBA428BBC
	for <lists+linux-omap@lfdr.de>; Mon, 11 Oct 2021 13:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236132AbhJKLEz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Oct 2021 07:04:55 -0400
Received: from muru.com ([72.249.23.125]:43352 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236147AbhJKLEy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Oct 2021 07:04:54 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 470E28061;
        Mon, 11 Oct 2021 11:03:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Devicetree changes for omaps for v5.16
Date:   Mon, 11 Oct 2021 14:02:44 +0300
Message-Id: <pull-1633950030-501948@atomide.com-3>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <pull-1633950030-501948@atomide.com>
References: <pull-1633950030-501948@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/dt-signed

for you to fetch changes up to 02794dbdc892a20479995cb9083a69a2ff213d96:

  ARM: dts: dra7: add entry for bb2d module (2021-10-06 10:46:44 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v5.16

These changes configure devices for am335x and dra7, and fixes
various devicetree check warnings for gta04:

- Update am335x-pocketbeagle to use pinconf-single

- A series of devicetree warning fixes for omap3 and gta04

- Configure bb2d Vivante GC 2D Accelerator for dra7

----------------------------------------------------------------
Andreas Kemnade (6):
      ARM: dts: omap3: fix cpu thermal label name
      arm: dts: omap3-gta04: cleanup LCD definition
      arm: dts: omap3-gta04: fix missing sensor supply
      arm: dts: omap3-gta04a5: fix missing sensor supply
      arm: dts: omap3-gta04a4: accelerometer irq fix
      arm: dts: omap3-gta04: cleanup led node names

Drew Fustini (1):
      ARM: dts: am335x-pocketbeagle: switch to pinconf-single

Gowtham Tammana (1):
      ARM: dts: dra7: add entry for bb2d module

 arch/arm/boot/dts/am335x-pocketbeagle.dts |  1 +
 arch/arm/boot/dts/dra7.dtsi               | 19 +++++++++++++++++++
 arch/arm/boot/dts/omap3-cpu-thermal.dtsi  |  2 +-
 arch/arm/boot/dts/omap3-gta04.dtsi        | 23 +++++++++++++----------
 arch/arm/boot/dts/omap3-gta04a5.dts       |  2 ++
 5 files changed, 36 insertions(+), 11 deletions(-)
