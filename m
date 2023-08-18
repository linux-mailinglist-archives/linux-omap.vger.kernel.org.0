Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 909D4780424
	for <lists+linux-omap@lfdr.de>; Fri, 18 Aug 2023 05:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357405AbjHRDDv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Aug 2023 23:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357384AbjHRDDd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Aug 2023 23:03:33 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 749472D56
        for <linux-omap@vger.kernel.org>; Thu, 17 Aug 2023 20:03:31 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D5BA480B0;
        Fri, 18 Aug 2023 03:03:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Driver changes for omaps for v6.6
Date:   Fri, 18 Aug 2023 06:03:27 +0300
Message-ID: <pull-1692158857-597450@atomide.com>
X-Mailer: git-send-email 2.41.0
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

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/ti-sysc-signed

for you to fetch changes up to de44bf2f7683347f75690ef6cf61a1d5ba8f0891:

  bus: ti-sysc: Fix cast to enum warning (2023-08-15 08:52:01 +0300)

----------------------------------------------------------------
Driver changes for omaps for v6.6

Driver changes for ti-sysc interconnect target module driver and for
l3 interconnect error handler. The ti-sysc driver changes just enable
using it for 64-bit systems like TI am62 that have wake-up capability
for the wkup domain devices. The l3 error handling improves the code
to show the error source if an unrecoverable timeout error occurs.

----------------------------------------------------------------
Sicelo A. Mhlongo (1):
      bus: omap_l3_smx: identify timeout cause before rebooting

Tony Lindgren (5):
      bus: ti-sysc: Fix build warning for 64-bit build
      bus: ti-sysc: Build driver for TI K3 SoCs
      bus: ti-sysc: Configure uart quirks for k3 SoC
      bus: ti-sysc: Fix a build warning with W=1 for sysconfig
      bus: ti-sysc: Fix cast to enum warning

 drivers/bus/Kconfig       |  3 ++-
 drivers/bus/omap_l3_smx.c | 21 ++++++++++-----------
 drivers/bus/ti-sysc.c     |  5 ++++-
 3 files changed, 16 insertions(+), 13 deletions(-)
