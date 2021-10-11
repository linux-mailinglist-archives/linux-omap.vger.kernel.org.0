Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60AC428BBB
	for <lists+linux-omap@lfdr.de>; Mon, 11 Oct 2021 13:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbhJKLEw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Oct 2021 07:04:52 -0400
Received: from muru.com ([72.249.23.125]:43346 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236132AbhJKLEv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Oct 2021 07:04:51 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5A9F28102;
        Mon, 11 Oct 2021 11:03:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Driver changes for ti-sysc for v5.16
Date:   Mon, 11 Oct 2021 14:02:43 +0300
Message-Id: <pull-1633950030-501948@atomide.com-2>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <pull-1633950030-501948@atomide.com>
References: <pull-1633950030-501948@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/ti-sysc-signed

for you to fetch changes up to 1b1da99b845337362a3dafe0f7b49927ab4ae041:

  bus: ti-sysc: Fix variable set but not used warning for reinit_modules (2021-10-06 08:38:09 +0300)

----------------------------------------------------------------
Driver changes for ti-sysc for v5.16

Changes for ti-sysc driver for improved system suspend and resume
support as some drivers need to be reinitialized on resume. Also
a non-urgent resume warning fix, and dropping of legacy flags for
gpio and sham:

- Fix timekeeping suspended warning on resume. Probably no need to merge
  this into fixes as it's gone unnoticed for a while.

- Check for context loss for reinit of a module

- Add add quirk handling to reinit on context loss, and also fix a
  build warning it caused

- Add quirk handling to reset on reinit

- Use context loss quirk for gpmc and otg

- Handle otg force-idle quirk even if no driver is loaded

- Drop legacy flags for gpio and sham

----------------------------------------------------------------
Tony Lindgren (10):
      bus: ti-sysc: Fix timekeeping_suspended warning on resume
      bus: ti-sysc: Check for lost context in sysc_reinit_module()
      bus: ti-sysc: Add quirk handling for reinit on context lost
      bus: ti-sysc: Add quirk handling for reset on re-init
      bus: ti-sysc: Use context lost quirks for gpmc
      bus: ti-sysc: Use context lost quirk for otg
      bus: ti-sysc: Handle otg force idle quirk
      bus: ti-sysc: Drop legacy quirk flag for gpio
      bus: ti-sysc: Drop legacy quirk flag for sham
      bus: ti-sysc: Fix variable set but not used warning for reinit_modules

 drivers/bus/ti-sysc.c                 | 276 +++++++++++++++++++++++++++++-----
 include/linux/platform_data/ti-sysc.h |   3 +
 2 files changed, 244 insertions(+), 35 deletions(-)
