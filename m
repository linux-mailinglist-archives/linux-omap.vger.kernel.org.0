Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3B5417C2C5
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 17:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCFQT5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 11:19:57 -0500
Received: from muru.com ([72.249.23.125]:59066 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgCFQT5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Mar 2020 11:19:57 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C4E658160;
        Fri,  6 Mar 2020 16:20:42 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] am3 and am4 pm changes for v5.7
Date:   Fri,  6 Mar 2020 08:19:48 -0800
Message-Id: <pull-1583511417-919838@atomide.com-2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <pull-1583511417-919838@atomide.com>
References: <pull-1583511417-919838@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/pm33xx-signed

for you to fetch changes up to 73321b5f4dafc0a0e7389174ba7eaf558291a188:

  ARM: omap2plus_defconfig: Add CONFIG_ARM_CPUIDLE (2020-02-27 09:27:30 -0800)

----------------------------------------------------------------
PM changes for am335x and am437x for v5.7 merge window

A series of changes from Dave Gerlach to enable basic cpuidle support
for am335x and am437x based on generic cpuidle-arm driver.

----------------------------------------------------------------
Dave Gerlach (5):
      dt-bindings: arm: cpu: Add TI AM335x and AM437x enable method
      ARM: OMAP2+: pm33xx-core: Add cpuidle_ops for am335x/am437x
      ARM: OMAP2+: pm33xx-core: Extend platform_data ops for cpuidle
      soc: ti: pm33xx: Add base cpuidle support
      ARM: omap2plus_defconfig: Add CONFIG_ARM_CPUIDLE

 Documentation/devicetree/bindings/arm/cpus.yaml |   2 +
 arch/arm/configs/omap2plus_defconfig            |   2 +
 arch/arm/mach-omap2/pm33xx-core.c               | 137 ++++++++++++++++++++++--
 drivers/soc/ti/pm33xx.c                         |  21 +++-
 include/linux/platform_data/pm33xx.h            |   6 +-
 5 files changed, 160 insertions(+), 8 deletions(-)
