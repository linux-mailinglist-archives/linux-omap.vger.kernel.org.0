Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813D9221477
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jul 2020 20:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgGOSoV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jul 2020 14:44:21 -0400
Received: from muru.com ([72.249.23.125]:37082 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbgGOSoV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jul 2020 14:44:21 -0400
Received: from alpine.gateway.sonic.net (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DF3D08120;
        Wed, 15 Jul 2020 18:44:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.9
Date:   Wed, 15 Jul 2020 11:44:19 -0700
Message-Id: <pull-1594838111-649880@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.9/soc-signed

for you to fetch changes up to e9dbebaf9b9de381a67500e39e63c9b1219c4f99:

  ARM: OMAP: Replace HTTP links with HTTPS ones (2020-07-13 11:37:54 -0700)

----------------------------------------------------------------
SoC changes for omaps for v5.9 merge window

Just one commit to use https for the external links.

----------------------------------------------------------------
Alexander A. Klimov (1):
      ARM: OMAP: Replace HTTP links with HTTPS ones

 arch/arm/mach-omap1/Kconfig    | 2 +-
 arch/arm/mach-omap1/dma.c      | 2 +-
 arch/arm/mach-omap1/gpio15xx.c | 2 +-
 arch/arm/mach-omap1/gpio16xx.c | 2 +-
 arch/arm/mach-omap1/gpio7xx.c  | 2 +-
 arch/arm/mach-omap1/timer.c    | 2 +-
 arch/arm/plat-omap/dma.c       | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)
