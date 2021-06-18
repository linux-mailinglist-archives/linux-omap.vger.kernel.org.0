Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3F03AC571
	for <lists+linux-omap@lfdr.de>; Fri, 18 Jun 2021 09:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhFRH5T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Jun 2021 03:57:19 -0400
Received: from muru.com ([72.249.23.125]:48268 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233663AbhFRH46 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Jun 2021 03:56:58 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 620BF807E;
        Fri, 18 Jun 2021 07:54:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] Non-urgent fixes for omaps for v5.14
Date:   Fri, 18 Jun 2021 10:54:45 +0300
Message-Id: <pull-1624002812-396117@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 78b4b165280d3d70e7a217599f0c06a4c0bb11f9:

  ARM: dts: dra7: Fix duplicate USB4 target module node (2021-06-11 08:30:42 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/fixes-not-urgent-signed

for you to fetch changes up to 093a474ce10d8ea3db3ef2922aca5a38f34bab1b:

  ARM: OMAP2+: Block suspend for am3 and am4 if PM is not configured (2021-06-11 10:43:08 +0300)

----------------------------------------------------------------
Non-urgent fixes for omaps for v5.14 merge window

Warn and block suspend for am335x unless the PM related modules and
firmware are loaded and warn otherwise. Otherwise we easily end up
with a suspended system with nothing capable of waking it up.

We also drop a duplicated prototype for am33xx_init_early().

----------------------------------------------------------------
Alejandro Lucero (1):
      ARM: OMAP2+: remove duplicated prototype

Tony Lindgren (1):
      ARM: OMAP2+: Block suspend for am3 and am4 if PM is not configured

 arch/arm/mach-omap2/common.h      |  1 -
 arch/arm/mach-omap2/pm33xx-core.c | 40 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)
