Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1FF25117B9
	for <lists+linux-omap@lfdr.de>; Wed, 27 Apr 2022 14:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbiD0MLx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Apr 2022 08:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233589AbiD0MLu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Apr 2022 08:11:50 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C26AA532C8
        for <linux-omap@vger.kernel.org>; Wed, 27 Apr 2022 05:08:39 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8A21F816A;
        Wed, 27 Apr 2022 12:05:34 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/4] SoC clean-up for omaps
Date:   Wed, 27 Apr 2022 15:08:27 +0300
Message-Id: <pull-1651061256-836848@atomide.com-3>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <pull-1651061256-836848@atomide.com>
References: <pull-1651061256-836848@atomide.com>
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

The following changes since commit 71ff461c3f41f6465434b9e980c01782763e7ad8:

  iommu/omap: Fix regression in probe for NULL pointer dereference (2022-04-08 11:16:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.19/soc-signed

for you to fetch changes up to df3eb1feeb73f17776e559679eaa986572db0837:

  ARM: OMAP2+: drop hwmod-clock helper comment (2022-04-21 14:47:15 +0300)

----------------------------------------------------------------
Soc clean-up for omaps

Soc clean-up for omaps to add missing of_node_put() calls
and drop unused omap_device_register().

----------------------------------------------------------------
Johan Hovold (2):
      ARM: OMAP2+: drop omap_device_register() helper
      ARM: OMAP2+: drop hwmod-clock helper comment

Wang Qing (1):
      ARM: OMAP2+: add missing of_node_put before break and return

 arch/arm/mach-omap2/cm_common.c   |  8 ++++++--
 arch/arm/mach-omap2/control.c     | 19 ++++++++++++++-----
 arch/arm/mach-omap2/omap_device.c | 20 --------------------
 arch/arm/mach-omap2/omap_device.h |  1 -
 arch/arm/mach-omap2/prm_common.c  |  8 ++++++--
 5 files changed, 26 insertions(+), 30 deletions(-)
