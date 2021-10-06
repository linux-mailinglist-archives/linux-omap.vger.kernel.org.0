Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D89423AD8
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 11:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237915AbhJFJvM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 05:51:12 -0400
Received: from muru.com ([72.249.23.125]:41422 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229824AbhJFJvK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 05:51:10 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DF5DE80E7;
        Wed,  6 Oct 2021 09:49:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/9] Drop unused PRM and CM defines for omaps
Date:   Wed,  6 Oct 2021 12:49:06 +0300
Message-Id: <20211006094915.15339-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

We can now drop a bunch of unused defines as we're using drivers/clock/ti
and drivers/soc/ti drivers for clocks and PRM.

Regards,

Tony


Tony Lindgren (9):
  ARM: OMAP2+: Drop unused PRM defines for dra7
  ARM: OMAP2+: Drop unused PRM defines for omap5
  ARM: OMAP2+: Drop unused PRM defines for omap4
  ARM: OMAP2+: Drop unused PRM defines for am4
  ARM: OMAP2+: Drop unused PRM defines for am3
  ARM: OMAP2+: Drop unused CM defines for dra7
  ARM: OMAP2+: Drop unused CM and SCRM defines for omap5
  ARM: OMAP2+: Drop unused CM and SCRM defines for omap4
  ARM: OMAP2+: Drop unused CM defines for am3

 arch/arm/mach-omap2/cm-regbits-44xx.h | 101 -----
 arch/arm/mach-omap2/cm1_44xx.h        | 174 -------
 arch/arm/mach-omap2/cm1_54xx.h        | 168 -------
 arch/arm/mach-omap2/cm1_7xx.h         | 263 -----------
 arch/arm/mach-omap2/cm2_44xx.h        | 386 ----------------
 arch/arm/mach-omap2/cm2_54xx.h        | 325 -------------
 arch/arm/mach-omap2/cm2_7xx.h         | 449 ------------------
 arch/arm/mach-omap2/cm33xx.h          | 280 ------------
 arch/arm/mach-omap2/prcm43xx.h        |  94 ----
 arch/arm/mach-omap2/prm33xx.h         |  40 --
 arch/arm/mach-omap2/prm44xx.h         | 630 --------------------------
 arch/arm/mach-omap2/prm54xx.h         | 358 ---------------
 arch/arm/mach-omap2/prm7xx.h          | 613 -------------------------
 arch/arm/mach-omap2/scrm44xx.h        | 141 ------
 arch/arm/mach-omap2/scrm54xx.h        | 228 ----------
 15 files changed, 4250 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/scrm54xx.h

-- 
2.33.0
