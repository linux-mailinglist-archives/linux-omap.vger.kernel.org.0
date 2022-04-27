Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B59511742
	for <lists+linux-omap@lfdr.de>; Wed, 27 Apr 2022 14:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbiD0MLy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Apr 2022 08:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbiD0MLw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Apr 2022 08:11:52 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1E547554B6
        for <linux-omap@vger.kernel.org>; Wed, 27 Apr 2022 05:08:42 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0AA9380E4;
        Wed, 27 Apr 2022 12:05:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] Drivers changes for ti-sysc
Date:   Wed, 27 Apr 2022 15:08:28 +0300
Message-Id: <pull-1651061256-836848@atomide.com-4>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.19/ti-sysc-signed

for you to fetch changes up to b6cd9be3d288249f52a1bcb10f7dbd445747ee59:

  bus: ti-sysc: Drop commas after SoC match table sentinels (2022-04-21 15:07:24 +0300)

----------------------------------------------------------------
Driver changes for omaps

One patch to remove commas from sentinels for ti-sysc.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      bus: ti-sysc: Drop commas after SoC match table sentinels

 drivers/bus/ti-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
