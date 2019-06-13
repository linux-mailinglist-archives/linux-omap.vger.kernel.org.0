Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 493B344499
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 18:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387999AbfFMQht (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 12:37:49 -0400
Received: from muru.com ([72.249.23.125]:52936 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730628AbfFMHLB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Jun 2019 03:11:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 210398160;
        Thu, 13 Jun 2019 07:11:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     arm@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] dts changes for omap variants for v5.3
Date:   Thu, 13 Jun 2019 00:10:51 -0700
Message-Id: <pull-1560399818-512977@atomide.com-2>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <pull-1560399818-512977@atomide.com>
References: <pull-1560399818-512977@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/dt-signed

for you to fetch changes up to 8f62581f820d32eec9698e477ddff21ebfbe0541:

  Merge branch 'baltos' into omap-for-v5.3/dt (2019-06-12 00:57:27 -0700)

----------------------------------------------------------------
dts changes for omap variants for v5.3

This series of changes improves support for few boards:

- configure another lcd type for logicpd torpedo devkit

- a series of updates for am335x phytec boards

- configure mmc card detect pin for am335x-baltos

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: Add LCD type 28 support to LogicPD Torpedo DM3730 devkit

Daniel Schultz (1):
      ARM: dts: am335x-phycore-som: Add emmc node

Teresa Remmet (5):
      ARM: dts: am335x phytec boards: Remove regulator node
      ARM: dts: am335x-phycore-som: Enable gpmc node in dts files
      ARM: dts: am335x-pcm-953: Update user led names
      ARM: dts: am335x-pcm-953: Remove eth phy delay
      ARM: dts: Add support for phyBOARD-REGOR-AM335x

Tony Lindgren (1):
      Merge branch 'baltos' into omap-for-v5.3/dt

Yegor Yefremov (2):
      ARM: dts: am335x-baltos: Fix PHY mode for ethernet
      ARM: dts: am335x-baltos: add support for MMC1 CD pin

 .../devicetree/bindings/arm/omap/omap.txt          |   3 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/am335x-baltos-ir2110.dts         |  14 +-
 arch/arm/boot/dts/am335x-baltos-ir3220.dts         |  14 +-
 arch/arm/boot/dts/am335x-baltos-ir5221.dts         |  13 +-
 arch/arm/boot/dts/am335x-pcm-953.dtsi              |  22 +-
 arch/arm/boot/dts/am335x-phycore-rdk.dts           |   4 +
 arch/arm/boot/dts/am335x-phycore-som.dtsi          |  47 +++--
 arch/arm/boot/dts/am335x-regor-rdk.dts             |  24 +++
 arch/arm/boot/dts/am335x-regor.dtsi                | 223 +++++++++++++++++++++
 arch/arm/boot/dts/am335x-wega-rdk.dts              |   4 +
 arch/arm/boot/dts/am335x-wega.dtsi                 |  16 +-
 .../boot/dts/logicpd-torpedo-37xx-devkit-28.dts    |  32 +++
 13 files changed, 372 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-regor-rdk.dts
 create mode 100644 arch/arm/boot/dts/am335x-regor.dtsi
 create mode 100644 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
