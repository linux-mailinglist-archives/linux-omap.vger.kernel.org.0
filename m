Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49FA7777449
	for <lists+linux-omap@lfdr.de>; Thu, 10 Aug 2023 11:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbjHJJTr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Aug 2023 05:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233395AbjHJJT0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Aug 2023 05:19:26 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A725D49EF
        for <linux-omap@vger.kernel.org>; Thu, 10 Aug 2023 02:17:25 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E592A8107;
        Thu, 10 Aug 2023 09:17:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] Maintainer file list update for omaps for v6.6
Date:   Thu, 10 Aug 2023 12:16:51 +0300
Message-ID: <pull-1691658952-110529@atomide.com-2>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/maintainers-signed

for you to fetch changes up to fda31904ffbc7231898198333804fa551b681387:

  MAINTAINERS: add board bindings list to OMAP2+ files (2023-07-31 09:11:14 +0300)

----------------------------------------------------------------
Maintainer file list update for omaps for v6.6

Adds the new SoC specific yaml file to MAINTAINERS.

----------------------------------------------------------------
Andreas Kemnade (1):
      MAINTAINERS: add board bindings list to OMAP2+ files

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)
