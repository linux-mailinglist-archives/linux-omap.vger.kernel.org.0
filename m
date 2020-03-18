Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57AE018A97D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 00:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgCRXun (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 19:50:43 -0400
Received: from muru.com ([72.249.23.125]:60880 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726903AbgCRXun (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 19:50:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D202380B6;
        Wed, 18 Mar 2020 23:51:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] defconfig updates for omaps for v5.7
Date:   Wed, 18 Mar 2020 16:50:40 -0700
Message-Id: <pull-1584575344-983293@atomide.com>
X-Mailer: git-send-email 2.25.1
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/defconfig-signed

for you to fetch changes up to 98c2cc359f8fa67992eb715f89f19390d70e135d:

  ARM: omap2plus_defconfig: Update for moved and dropped options (2020-03-17 09:37:53 -0700)

Note that this causes a minor merge conflict in next with the dss
panel changes.

----------------------------------------------------------------
Defconfig changes for omaps for v5.7 merge window

We want to enable some more features for omap2plus_defconfig to make it
more usable:

- Enable scururity for ext4 so setcap works

- Enable simple-pm-bus so it can be later on be configured in the dts
  files as needed

- Enable zram as loadable modules as we do have devices using it

- Enable more devices for droid4 for 1-wire battery eeprom and isl29028
  proximity sensor

- Enable mcpdm clocks from the PMIC as loadable modules

- Enable ina2xx_adc as loadable module

- And finally let's also  omap2plus_deconfig for moved and dropped options

----------------------------------------------------------------
Tony Lindgren (7):
      ARM: omap2plus_defconfig: Enable ext4 security for setcap
      ARM: omap2plus_defconfig: Enable simple-pm-bus
      ARM: omap2plus_defconfig: Enable zram as loadable modules
      ARM: omap2plus_defconfig: Enable more droid4 devices as loadable modules
      ARM: omap2plus_defconfig: Enable McPDM optional PMIC clock as modules
      ARM: omap2plus_defconfig: Enable ina2xx_adc as a loadable module
      ARM: omap2plus_defconfig: Update for moved and dropped options

 arch/arm/configs/omap2plus_defconfig | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)
