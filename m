Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF179B886
	for <lists+linux-omap@lfdr.de>; Sat, 24 Aug 2019 00:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390762AbfHWWYr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Aug 2019 18:24:47 -0400
Received: from muru.com ([72.249.23.125]:58476 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731062AbfHWWYq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 23 Aug 2019 18:24:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0FB4880A5;
        Fri, 23 Aug 2019 22:25:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] ti-sysc driver changes for v5.3
Date:   Fri, 23 Aug 2019 15:24:41 -0700
Message-Id: <pull-1566599057-142651@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5b63fb90adb95a178ad403e1703f59bf1ff2c16b:

  ARM: dts: Fix incomplete dts data for am3 and am4 mmc (2019-08-13 04:03:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/ti-sysc-signed

for you to fetch changes up to c8a738f4cfaeccce40b171aca6da5fc45433ce60:

  bus: ti-sysc: remove set but not used variable 'quirks' (2019-08-13 04:40:11 -0700)

----------------------------------------------------------------
Driver changes for ti-sysc for v5.4

Few changes to prepare for using a reset driver for PRM rstctrl mostly
to deal with the clocks for reset. Then few minor clean-up patches and
SPDX license identifier changes, and add a MAINTAINERs file entry.

----------------------------------------------------------------
Suman Anna (4):
      MAINTAINERS: Add ti-sysc files under the OMAP2+ entry
      dt-bindings: ti-sysc: Add SPDX license identifier
      bus: ti-sysc: Switch to SPDX license identifier
      bus: ti-sysc: Add missing kerneldoc comments

Tero Kristo (3):
      bus: ti-sysc: re-order the clkdm control around reset handling
      bus: ti-sysc: rework the reset handling
      bus: ti-sysc: allow reset sharing across devices

YueHaibing (1):
      bus: ti-sysc: remove set but not used variable 'quirks'

 MAINTAINERS                           |  2 ++
 drivers/bus/ti-sysc.c                 | 56 ++++++++++++++---------------------
 include/dt-bindings/bus/ti-sysc.h     |  1 +
 include/linux/platform_data/ti-sysc.h |  7 +++--
 4 files changed, 31 insertions(+), 35 deletions(-)
