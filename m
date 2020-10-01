Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B39127FC7E
	for <lists+linux-omap@lfdr.de>; Thu,  1 Oct 2020 11:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731605AbgJAJat (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Oct 2020 05:30:49 -0400
Received: from muru.com ([72.249.23.125]:45882 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbgJAJat (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Oct 2020 05:30:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 69C108057;
        Thu,  1 Oct 2020 09:30:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Two omap regression fixes
Date:   Thu,  1 Oct 2020 12:30:44 +0300
Message-Id: <pull-1601544624-617679@atomide.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6542e2b613c2b1952e83973dc434831332ce8e27:

  ARM: dts: omap5: Fix DSI base address and clocks (2020-08-19 08:54:33 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.9/fixes-rc7

for you to fetch changes up to 8f04aea048d56f3e39a7e543939450246542a6fc:

  ARM: OMAP2+: Restore MPU power domain if cpu_cluster_pm_enter() fails (2020-09-23 10:39:33 +0300)

----------------------------------------------------------------
Two regression fixes for omaps

Fix AM33XX_IOPAD macro that broke after recent pinctrl changes
to use #pinctrl-cells = 2. And fix omap_enter_idle_coupled()
for cases where cpu_cluster_pm_enter() returns an error as
otherwise we may end up wrongly idling the MPU domain on the
next WFI.

----------------------------------------------------------------
Drew Fustini (1):
      ARM: dts: am33xx: modify AM33XX_IOPAD for #pinctrl-cells = 2

Tony Lindgren (1):
      ARM: OMAP2+: Restore MPU power domain if cpu_cluster_pm_enter() fails

 arch/arm/mach-omap2/cpuidle44xx.c  | 4 +++-
 include/dt-bindings/pinctrl/omap.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)
