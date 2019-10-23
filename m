Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA13E2221
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 19:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730100AbfJWRy7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 13:54:59 -0400
Received: from muru.com ([72.249.23.125]:39484 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730027AbfJWRy7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 13:54:59 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A2804816C;
        Wed, 23 Oct 2019 17:55:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] ti-sysc driver changes for v5.5
Date:   Wed, 23 Oct 2019 10:54:49 -0700
Message-Id: <pull-1571853258-16998@atomide.com-2>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <pull-1571853258-16998@atomide.com>
References: <pull-1571853258-16998@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit c7d8669f46ba97f6a8e14d6e9b8d6c39e2c07727:

  bus: ti-sysc: Fix watchdog quirk handling (2019-10-18 08:45:32 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/ti-sysc-signed

for you to fetch changes up to 1819ef2e2d12d5b1a6ee54ac1c2afe35cffc677c:

  bus: ti-sysc: Use swsup quirks also for am335x musb (2019-10-21 14:15:55 -0700)

----------------------------------------------------------------
Changes for ti-sysc interconnect target module driver for v5.5

A series of changes from Tero Kristo for rpm reset control
driver to deal with the ordering requirements between clocks
and resets, and two changes to deal with quirks for musb otg
device.

----------------------------------------------------------------
Tero Kristo (3):
      bus: ti-sysc: re-order reset and main clock controls
      bus: ti-sysc: drop the extra hardreset during init
      bus: ti-sysc: avoid toggling power state of module during probe

Tony Lindgren (3):
      Merge branch 'watchdog-fix' into omap-for-v5.5/ti-sysc
      bus: ti-sysc: Handle mstandby quirk and use it for musb
      bus: ti-sysc: Use swsup quirks also for am335x musb

 drivers/bus/ti-sysc.c | 87 +++++++++++++++++++--------------------------------
 1 file changed, 33 insertions(+), 54 deletions(-)
