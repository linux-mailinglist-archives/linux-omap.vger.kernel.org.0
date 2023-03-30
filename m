Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1129C6D0529
	for <lists+linux-omap@lfdr.de>; Thu, 30 Mar 2023 14:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjC3MqX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Mar 2023 08:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbjC3MqW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Mar 2023 08:46:22 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0EB821BC1
        for <linux-omap@vger.kernel.org>; Thu, 30 Mar 2023 05:46:16 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BC8EA80FE;
        Thu, 30 Mar 2023 12:46:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Driver clean-up for ti-sysc for v6.4
Date:   Thu, 30 Mar 2023 15:46:10 +0300
Message-Id: <pull-1680180355-69164@atomide.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.4/ti-sysc-signed

for you to fetch changes up to b79ad2307a1dfd9cba3cfce6445fa0be74a757a0:

  bus: ti-sysc: Fix comment typo (2023-03-27 11:23:23 +0300)

----------------------------------------------------------------
Clean-up for ti-sysc driver for v6.4

Clean-up for ti-sysc interconnect target module driver mostly to remove
open coded ranges property parsing, to use of_property_present(), and
to use list_for_each_entry(). Also included is one comment typo change.

----------------------------------------------------------------
Jason Wang (1):
      bus: ti-sysc: Fix comment typo

Rob Herring (2):
      bus: ti-sysc: Remove open coded "ranges" parsing
      bus: ti-sysc: Use of_property_present() for testing DT property presence

Yang Yingliang (1):
      bus: ti-sysc: Use list_for_each_entry() helper

 drivers/bus/ti-sysc.c | 53 +++++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 40 deletions(-)
