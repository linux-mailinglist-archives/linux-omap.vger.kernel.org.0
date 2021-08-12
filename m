Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BAD3E9F27
	for <lists+linux-omap@lfdr.de>; Thu, 12 Aug 2021 09:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbhHLHEO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Aug 2021 03:04:14 -0400
Received: from muru.com ([72.249.23.125]:42460 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230147AbhHLHEN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Aug 2021 03:04:13 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6732380E2;
        Thu, 12 Aug 2021 07:04:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] Two missed omap Kconfig patches for v5.15
Date:   Thu, 12 Aug 2021 10:03:42 +0300
Message-Id: <pull-1628751694-126144@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 8d5a937f10ed091e14fc57a4158f59983e2934cf:

  MAINTAINERS: Adopt SanCloud dts files as supported (2021-07-27 11:54:52 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/soc-late-signed

for you to fetch changes up to 4297d1c0834af97fe992ec7bf766f0a262ce5ffc:

  arm: omap2: Drop the unused OMAP_PACKAGE_* KConfig entries (2021-08-06 09:40:26 +0300)

----------------------------------------------------------------
Two missed SoC changes for omaps for v5.15

I managed to miss applying two out of three Kconfig changes earlier
to drop unused entries, here are the missed changes.

----------------------------------------------------------------
Peter Robinson (2):
      arm: omap2: Drop obsolete MACH_OMAP3_PANDORA entry
      arm: omap2: Drop the unused OMAP_PACKAGE_* KConfig entries

 arch/arm/mach-omap2/Kconfig | 18 ------------------
 1 file changed, 18 deletions(-)
