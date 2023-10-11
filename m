Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5D07C4C42
	for <lists+linux-omap@lfdr.de>; Wed, 11 Oct 2023 09:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344899AbjJKHsd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Oct 2023 03:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344007AbjJKHsd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Oct 2023 03:48:33 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4338392
        for <linux-omap@vger.kernel.org>; Wed, 11 Oct 2023 00:48:32 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 19B7780E1;
        Wed, 11 Oct 2023 07:48:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v6.7
Date:   Wed, 11 Oct 2023 10:48:26 +0300
Message-ID: <pull-1697010475-119828@atomide.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.7/dt-signed

for you to fetch changes up to ea1c1e67e631be14f6e6bc9a6e96219c47f31ed4:

  ARM: dts: omap4-embt2ws: Fix pinctrl single node name warning (2023-10-07 10:33:20 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v6.7 merge window

Two non-urgent devicetree fixes for am371-evm led pinmux and a node name
warning fix for omap4-epson-embt2ws, and updates for connected devices for
various devices:

- Device updates and enabling of pru support for am335x-pocketbeagle

- Few more devices such as leds and iio for omap4-epson-embt2ws

- Ethernet and led updates for am3517-evm

- Modem sleep pins configuration for motorola-mapphone

----------------------------------------------------------------
Adam Ford (3):
      ARM: dts: am3517-evm: Fix LED3/4 pinmux
      ARM: dts: am3517-evm: Enable Ethernet PHY Interrupt
      ARM: dts: am3517: Configure ethernet alias

Andreas Kemnade (4):
      ARM: dts: omap4: embt2ws: add LED
      ARM: dts: omap: omap4-embt2ws: Let IMU driver handle Magnetometer internally
      ARM: dts: omap: omap4-embt2ws: Add IMU at control unit
      ARM: dts: omap3-gta04: Drop superfluous omap36xx compatible

Tony Lindgren (2):
      ARM: dts: motorola-mapphone: Add mdm6600 sleep pins
      ARM: dts: omap4-embt2ws: Fix pinctrl single node name warning

Trevor Woerner (4):
      ARM: dts: am335x-pocketbeagle: update LED information
      ARM: dts: am335x-pocketbeagle: remove dependency cycle
      ARM: dts: am335x-pocketbeagle: enable pru
      ARM: dts: am335x-pocketbeagle: add missing GPIO mux

 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  | 57 ++++++++++++++++++----
 arch/arm/boot/dts/ti/omap/am3517-evm.dts           | 35 ++++++++++---
 arch/arm/boot/dts/ti/omap/am3517.dtsi              |  1 +
 .../boot/dts/ti/omap/motorola-mapphone-common.dtsi | 20 +++++++-
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |  2 +-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 55 ++++++++++++++++-----
 6 files changed, 140 insertions(+), 30 deletions(-)
