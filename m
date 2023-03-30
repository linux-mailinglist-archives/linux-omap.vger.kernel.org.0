Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEAC6D0536
	for <lists+linux-omap@lfdr.de>; Thu, 30 Mar 2023 14:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbjC3Mrv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Mar 2023 08:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjC3Mrs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Mar 2023 08:47:48 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F7BEAF3F
        for <linux-omap@vger.kernel.org>; Thu, 30 Mar 2023 05:47:46 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AE6F580FE;
        Thu, 30 Mar 2023 12:47:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree overlays for omaps for v6.4
Date:   Thu, 30 Mar 2023 15:47:42 +0300
Message-Id: <pull-1680180448-508978@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.4/dt-overlays-signed

for you to fetch changes up to a63945c3b56174537a4a655676fbe965f974b6b1:

  ARM: dts: am57xx-idk: Add IDK displays and touchscreens (2023-03-27 11:07:13 +0300)

----------------------------------------------------------------
Devicetree overlays for omaps for v6.4

Devicetree overlays for omaps to enable the optional LCD and touchscreen
modules on am57xx-evm and am57xx-idk boards.

----------------------------------------------------------------
Andrew Davis (3):
      ARM: dts: ti: Add AM57xx GP EVM board support
      ARM: dts: ti: Add AM57xx GP EVM Rev A3 board support
      ARM: dts: am57xx-idk: Add IDK displays and touchscreens

 arch/arm/boot/dts/Makefile                        |   8 ++
 arch/arm/boot/dts/am571x-idk-touchscreen.dtso     |  32 ++++++
 arch/arm/boot/dts/am572x-idk-touchscreen.dtso     |  32 ++++++
 arch/arm/boot/dts/am57xx-evm.dtso                 | 127 ++++++++++++++++++++++
 arch/arm/boot/dts/am57xx-idk-lcd-osd101t2045.dtso |  63 +++++++++++
 arch/arm/boot/dts/am57xx-idk-lcd-osd101t2587.dtso |  66 +++++++++++
 6 files changed, 328 insertions(+)
 create mode 100644 arch/arm/boot/dts/am571x-idk-touchscreen.dtso
 create mode 100644 arch/arm/boot/dts/am572x-idk-touchscreen.dtso
 create mode 100644 arch/arm/boot/dts/am57xx-evm.dtso
 create mode 100644 arch/arm/boot/dts/am57xx-idk-lcd-osd101t2045.dtso
 create mode 100644 arch/arm/boot/dts/am57xx-idk-lcd-osd101t2587.dtso
