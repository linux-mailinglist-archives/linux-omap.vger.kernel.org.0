Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7187177744A
	for <lists+linux-omap@lfdr.de>; Thu, 10 Aug 2023 11:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbjHJJTu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Aug 2023 05:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234936AbjHJJT1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Aug 2023 05:19:27 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 877EE49F5
        for <linux-omap@vger.kernel.org>; Thu, 10 Aug 2023 02:17:26 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 53F758200;
        Thu, 10 Aug 2023 09:17:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/4] Devicetree changes for omaps for v6.6
Date:   Thu, 10 Aug 2023 12:16:52 +0300
Message-ID: <pull-1691658952-110529@atomide.com-3>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <pull-1691658952-110529@atomide.com>
References: <pull-1691658952-110529@atomide.com>
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

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/dt-take2-signed

for you to fetch changes up to 5821d766932cc816518bdc5304b4fe4e99f65aaf:

  arm: dts: ti: omap: Fix OPP table node names (2023-07-31 09:25:10 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v6.6

Updates for opp and pinctrl nodes to follow the devicetree bindings.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: ti: split interrupts per cells
      ARM: dts: ti: add missing space before {

Nishanth Menon (3):
      arm: dts: ti: omap: omap36xx: Rename opp_supply nodename
      arm: dts: ti: omap: am5729-beagleboneai: Drop the OPP
      arm: dts: ti: omap: Fix OPP table node names

Tony Lindgren (1):
      ARM: dts: Unify pinctrl-single pin group nodes for davinci

 arch/arm/boot/dts/ti/davinci/da850-evm.dts         |  4 +-
 arch/arm/boot/dts/ti/davinci/da850-lcdk.dts        |  4 +-
 arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts    |  4 +-
 arch/arm/boot/dts/ti/davinci/da850.dtsi            | 67 ++++++++++------------
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |  3 +-
 .../boot/dts/ti/omap/am335x-osd335x-common.dtsi    |  3 +-
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           | 10 ++--
 arch/arm/boot/dts/ti/omap/am33xx.dtsi              | 30 ++++++----
 arch/arm/boot/dts/ti/omap/am3517.dtsi              |  6 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi              | 15 +++--
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       | 14 +++--
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           | 12 ++--
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |  6 --
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |  9 ++-
 arch/arm/boot/dts/ti/omap/dra76x.dtsi              |  3 +-
 arch/arm/boot/dts/ti/omap/omap34xx.dtsi            | 12 ++--
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            | 14 +++--
 arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi  |  6 +-
 19 files changed, 121 insertions(+), 103 deletions(-)
