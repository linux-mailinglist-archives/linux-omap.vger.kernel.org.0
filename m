Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563D23F139F
	for <lists+linux-omap@lfdr.de>; Thu, 19 Aug 2021 08:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhHSGfT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Aug 2021 02:35:19 -0400
Received: from muru.com ([72.249.23.125]:48808 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231220AbhHSGfT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Aug 2021 02:35:19 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2A3E480C7;
        Thu, 19 Aug 2021 06:35:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [GIT PULL] Fix for omap gpt12 timer error handling
Date:   Thu, 19 Aug 2021 09:34:36 +0300
Message-Id: <pull-1629354796-830948@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 353b7a55dcaf5fb8758e09ebe2ddf5f3adbac7c5:

  Merge branch 'fixes-v5.14' into fixes (2021-07-27 11:25:08 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/gpt12-fix-signed

for you to fetch changes up to 06a089ef644934372a3062528244fca3417d3430:

  bus: ti-sysc: Fix error handling for sysc_check_active_timer() (2021-08-11 08:34:46 +0300)

----------------------------------------------------------------
Fix for omap gpt12 timer error handling

Two of the recent fixes for ti-sysc driver had bad interaction for a
function return value that caused one of the fixes to not work so we
need to change the return value handling. Otherwise early beagleboard
variants still have a boot issue.

----------------------------------------------------------------
Tony Lindgren (1):
      bus: ti-sysc: Fix error handling for sysc_check_active_timer()

 drivers/bus/ti-sysc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
