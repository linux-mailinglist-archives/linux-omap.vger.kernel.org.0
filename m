Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8784D1D2E
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 02:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731155AbfJJAM2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 20:12:28 -0400
Received: from muru.com ([72.249.23.125]:36712 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730815AbfJJAM2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 20:12:28 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 74BBD8140;
        Thu, 10 Oct 2019 00:13:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 0/8] Improve PM for omap4 devices
Date:   Wed,  9 Oct 2019 17:12:16 -0700
Message-Id: <20191010001224.41826-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

We've had core oswr (open switch retention) disabled for a while now for
omap4 devices because of all kind of GPIO issues it caused with bootloaders
that configured per and core LOGICRETSTATE bits.

With all the recent GPIO fixes, these issues are now gone, and we can enable
per and core oswr again.

By adding the voltage controller data for droid4, we can get it idle at
something like 40 to 50 mW for the whole device with LCD blanked, and USB and
modem shut down.

Regards,

Tony


Tony Lindgren (8):
  ARM: OMAP2+: Remove unused wakeup_cpu
  ARM: OMAP2+: Drop bogus wkup domain oswr setting
  ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC
  ARM: OMAP2+: Update 4430 voltage controller operating points
  ARM: OMAP2+: Configure voltage controller for cpcap
  ARM: OMAP2+: Allow per oswr for omap4
  ARM: OMAP2+: Allow core oswr for omap4
  ARM: OMAP2+: Initialize voltage controller for omap4

 arch/arm/mach-omap2/Makefile              |   5 +
 arch/arm/mach-omap2/control.h             |   1 +
 arch/arm/mach-omap2/omap-mpuss-lowpower.c |   2 -
 arch/arm/mach-omap2/omap_twl.c            |   8 +-
 arch/arm/mach-omap2/opp4xxx_data.c        |  16 +-
 arch/arm/mach-omap2/pm.c                  |   1 +
 arch/arm/mach-omap2/pm.h                  |  14 ++
 arch/arm/mach-omap2/pm44xx.c              |  13 +-
 arch/arm/mach-omap2/pmic-cpcap.c          | 265 ++++++++++++++++++++++
 arch/arm/mach-omap2/vc.c                  |  20 ++
 10 files changed, 319 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm/mach-omap2/pmic-cpcap.c

-- 
2.23.0
