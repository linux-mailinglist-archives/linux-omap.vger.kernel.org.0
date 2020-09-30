Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8380D27E0DA
	for <lists+linux-omap@lfdr.de>; Wed, 30 Sep 2020 08:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgI3GIa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Sep 2020 02:08:30 -0400
Received: from muru.com ([72.249.23.125]:45726 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgI3GI3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Sep 2020 02:08:29 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4209880BF;
        Wed, 30 Sep 2020 06:08:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Defconfig changes for omaps for v5.10
Date:   Wed, 30 Sep 2020 09:08:16 +0300
Message-Id: <pull-1601445968-476435@atomide.com-3>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <pull-1601445968-476435@atomide.com>
References: <pull-1601445968-476435@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/defconfig-signed

for you to fetch changes up to 74623757b98239b1eb43304e1f5d15a29b40fb84:

  ARM: omap2plus_defconfig: enable generic net options (2020-09-10 13:14:50 +0300)

----------------------------------------------------------------
Defconfig changes for omaps for v5.10 merge window

Enable twl4030_madc as a loadable module as the ADC is used
on some devices by the battery charger. And enable more widely
used networking options as loadable modules where possible.

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable twl4030_madc as a loadable module

Grygorii Strashko (1):
      ARM: omap2plus_defconfig: enable generic net options

 arch/arm/configs/omap2plus_defconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)
