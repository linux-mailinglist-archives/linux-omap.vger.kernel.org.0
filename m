Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B5B132E18
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 19:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgAGSOZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 13:14:25 -0500
Received: from muru.com ([72.249.23.125]:50398 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728364AbgAGSOZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jan 2020 13:14:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3538F810E;
        Tue,  7 Jan 2020 18:15:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] dts changes for omaps for v5.6
Date:   Tue,  7 Jan 2020 10:14:17 -0800
Message-Id: <pull-1578420398-290837@atomide.com-2>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <pull-1578420398-290837@atomide.com>
References: <pull-1578420398-290837@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/dt-signed

for you to fetch changes up to bfe0237dd6c441f0ba531755ab24579eaee99be7:

  ARM: dts: am335x-icev2: Add support for OSD9616P0899-10 at i2c0 (2019-12-12 09:35:02 -0800)

----------------------------------------------------------------
Devicetree changes for omaps for v5.6 merge window

Devicetree changes for omaps for v5.6 to configure more
devices and update boards to use generic lcd panels:

- Configure HDMI for dra76-evm and am57xx-idk

- Correct node name for am3517 mdio

- Convert am335x-evm, am335x-evmsk, and am335x-icev2 to use generic
  panels

----------------------------------------------------------------
Grygorii Strashko (1):
      ARM: dts: omap3: name mdio node properly

Jyri Sarha (3):
      ARM: dts: am335x-evm: Use drm simple-panel instead of tilcdc-panel
      ARM: dts: am335x-evmsk: Use drm simple-panel instead of tilcdc-panel
      ARM: dts: am335x-icev2: Add support for OSD9616P0899-10 at i2c0

Tomi Valkeinen (2):
      ARM: dts: dra76-evm: add HDMI output
      ARM: dts: am57xx-idk-common: add HDMI to the common dtsi

 arch/arm/boot/dts/am335x-evm.dts         | 40 +++++++------------
 arch/arm/boot/dts/am335x-evmsk.dts       | 38 ++++++------------
 arch/arm/boot/dts/am335x-icev2.dts       | 13 +++++++
 arch/arm/boot/dts/am3517.dtsi            |  2 +-
 arch/arm/boot/dts/am57xx-idk-common.dtsi | 59 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/dra76-evm.dts          | 66 ++++++++++++++++++++++++++++++++
 6 files changed, 164 insertions(+), 54 deletions(-)
