Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C745117D7
	for <lists+linux-omap@lfdr.de>; Wed, 27 Apr 2022 14:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbiD0MLt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Apr 2022 08:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbiD0MLs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Apr 2022 08:11:48 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4068B5522C
        for <linux-omap@vger.kernel.org>; Wed, 27 Apr 2022 05:08:37 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 899C280E4;
        Wed, 27 Apr 2022 12:05:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/4] Maintainaer updates for omaps
Date:   Wed, 27 Apr 2022 15:08:25 +0300
Message-Id: <pull-1651061256-836848@atomide.com>
X-Mailer: git-send-email 2.35.2
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/maintainers-signed-take2

for you to fetch changes up to 73f1aaf114e63ee2baa94ac798d5764b15e4fdc5:

  MAINTAINERS: omap: remove me as a maintainer (2022-04-26 10:48:55 +0300)

----------------------------------------------------------------
A maintainer update for omaps

A patch from Rajendra to remove his contact information for omap
PM framework.

----------------------------------------------------------------
Rajendra Nayak (1):
      MAINTAINERS: omap: remove me as a maintainer

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)
