Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77CEE679926
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jan 2023 14:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234059AbjAXNWD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Jan 2023 08:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbjAXNWC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Jan 2023 08:22:02 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ECACE30D9
        for <linux-omap@vger.kernel.org>; Tue, 24 Jan 2023 05:22:00 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 56D95809F;
        Tue, 24 Jan 2023 13:21:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] Devicetree changes for omaps for v6.3
Date:   Tue, 24 Jan 2023 15:21:55 +0200
Message-Id: <pull-1674566471-434733@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.3/dt-signed

for you to fetch changes up to 9dd320f0075fc765c6f35eb52f2a0cc73bf38a3f:

  ARM: dts: omap: gta04a5: cleanup i2c node names (2023-01-19 10:34:39 +0200)

----------------------------------------------------------------
Devicetree related changes for omaps for v6.3

Updates for am335x-nano, n900, and gta04 for the connected peripherals.
Also few corrections for node names.

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: omap: gta04: add BNO055 IMU chip
      ARM: dts: omap: gta04a5: cleanup i2c node names

Geert Uytterhoeven (1):
      ARM: dts: ti: Fix pca954x i2c-mux node names

Laurent Pinchart (1):
      ARM: dts: omap: Use new media bus type macros

Mark Jackson (5):
      ARM: dts: am335x-nano: Fix GPIO settings for RTS/CTS pins on UART3 & 4
      ARM: dts: am335x-nano: Enable RS485 mode for UART3 & 4
      ARM: dts: am335x-nano: Enable I2C temperature sensor
      ARM: dts: am335x-nano: Fix GPIO settings for MMC pins
      ARM: dts: am335x-nano: Enable USB host

Sicelo A. Mhlongo (2):
      ARM: dts: n900: rename accelerometer node
      ARM: dts: n900: use iio driver for accelerometer

 arch/arm/boot/dts/am335x-nano.dts     | 32 +++++++++++++++----
 arch/arm/boot/dts/am3874-iceboard.dts |  4 +--
 arch/arm/boot/dts/omap3-gta04a5.dts   | 19 +++++++++--
 arch/arm/boot/dts/omap3-n900.dts      | 59 +++++++----------------------------
 4 files changed, 56 insertions(+), 58 deletions(-)
