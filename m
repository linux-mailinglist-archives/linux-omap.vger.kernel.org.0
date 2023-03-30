Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B42B56D053B
	for <lists+linux-omap@lfdr.de>; Thu, 30 Mar 2023 14:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbjC3Ms1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Mar 2023 08:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbjC3MsZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Mar 2023 08:48:25 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 020E11722
        for <linux-omap@vger.kernel.org>; Thu, 30 Mar 2023 05:48:22 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id ADF4D80FE;
        Thu, 30 Mar 2023 12:48:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Clean-up for omap1 for v6.4
Date:   Thu, 30 Mar 2023 15:48:19 +0300
Message-Id: <pull-1680180485-415954@atomide.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.4/omap1-signed

for you to fetch changes up to c29313d58c42f205cdecdd337f784f59bdf92dd7:

  ARM: omap1: remove redundant variables err (2023-03-27 10:10:37 +0300)

----------------------------------------------------------------
Clean-up for omap1 for v6.4 merge window

Two clean-up patches to fix Kconfig indentation and to simplify the
return path for ams_delta_modem_init().

----------------------------------------------------------------
Jinpeng Cui (1):
      ARM: omap1: remove redundant variables err

Juerg Haefliger (1):
      ARM: omap1: Kconfig: Fix indentation

 arch/arm/mach-omap1/Kconfig           | 2 +-
 arch/arm/mach-omap1/board-ams-delta.c | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)
