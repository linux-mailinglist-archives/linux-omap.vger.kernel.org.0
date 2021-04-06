Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AAF355092
	for <lists+linux-omap@lfdr.de>; Tue,  6 Apr 2021 12:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241315AbhDFKLQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Apr 2021 06:11:16 -0400
Received: from muru.com ([72.249.23.125]:51460 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233987AbhDFKLQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 6 Apr 2021 06:11:16 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2EBC88128;
        Tue,  6 Apr 2021 10:12:17 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] 
Date:   Tue,  6 Apr 2021 13:11:00 +0300
Message-Id: <pull-1617703816-65652@atomide.com-3>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1617703816-65652@atomide.com>
References: <pull-1617703816-65652@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/defconfig-signed

for you to fetch changes up to f6a7ea04ad2044e8f05b55f3bdd3133f468f60d1:

  ARM: omap2plus_defconfig: Add AT25 EEPROM module (2021-03-24 13:46:55 +0200)

----------------------------------------------------------------
Defconfig changes for omaps for v5.13

Update defconfig to have nefilter available as loadable modules
to make the defconfig more usable for networked devices. And we now
select SIMPLE_PM_BUS so it can be dropped. And some devices use
EEPROM_AT25 so let's add it as a loadable module.

----------------------------------------------------------------
Adam Ford (1):
      ARM: omap2plus_defconfig: Add AT25 EEPROM module

Ivan Jelincic (2):
      ARM: omap2plus_defconfig: Update for dropped simple-pm-bus
      ARM: omap2plus_defconfig: Enable Netfilter components as modules

 arch/arm/configs/omap2plus_defconfig | 151 ++++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 1 deletion(-)
