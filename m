Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8792113F44E
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 19:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389814AbgAPSst (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 13:48:49 -0500
Received: from muru.com ([72.249.23.125]:51300 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436988AbgAPSsq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Jan 2020 13:48:46 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A3A19817C;
        Thu, 16 Jan 2020 18:49:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/4] ti-sysc driver changes for omaps for v5.6
Date:   Thu, 16 Jan 2020 10:48:12 -0800
Message-Id: <pull-1579200367-372444@atomide.com-3>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <pull-1579200367-372444@atomide.com>
References: <pull-1579200367-372444@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e709ed70d122e94cb426b1e1f905829eae19a009:

  bus: ti-sysc: Fix missing reset delay handling (2019-12-12 08:20:10 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/ti-sysc-signed

for you to fetch changes up to 3f2c420596be57e74719bd09333d3b5efe90341d:

  bus: ti-sysc: Use PTR_ERR_OR_ZERO() to simplify code (2019-12-12 09:06:40 -0800)

----------------------------------------------------------------
ti-sysc driver changes for omaps for v5.6 merge window

Few changes to implement quirk handling for cases where we need to block
clockdomain autoidle, drop old MMU specific quirks, and simplify the
return code for sysc_init_resets().

----------------------------------------------------------------
Suman Anna (1):
      bus: ti-sysc: Drop MMU quirks

Tony Lindgren (1):
      bus: ti-sysc: Implement quirk handling for CLKDM_NOAUTO

zhengbin (1):
      bus: ti-sysc: Use PTR_ERR_OR_ZERO() to simplify code

 drivers/bus/ti-sysc.c                 | 18 +++++++++---------
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)
