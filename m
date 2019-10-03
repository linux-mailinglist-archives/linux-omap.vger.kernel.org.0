Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF38C9FA9
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 15:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730518AbfJCNmE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 09:42:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:53342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730508AbfJCNmE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Oct 2019 09:42:04 -0400
Received: from jupiter.universe (dyndsl-037-138-174-173.ewe-ip-backbone.de [37.138.174.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DD3721783;
        Thu,  3 Oct 2019 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570110123;
        bh=WCUEssIU9+0G8g1dfJGIxcEKX0xGTgolp0w5mbPkFoU=;
        h=From:To:Cc:Subject:Date:From;
        b=bi9wqLQcIhlqDcoclEDoiLIEYVPEre9nISGzXfUjkF4Eg5vRrvup3aBt46GaOXXYR
         QGSnAY0mldFrgJ6x2vtbgDPjJxhJx1OkS29zzKxGU8oXWee2zrBodbnHfbQKp7aZgA
         GvVlY/X2Rc5WMHc10orq73fR8aL9VKjMWRLIiF3c=
Received: by jupiter.universe (Postfix, from userid 1000)
        id 8B07D4800C0; Thu,  3 Oct 2019 15:42:01 +0200 (CEST)
From:   Sebastian Reichel <sre@kernel.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: [PATCHv2 0/4] Convert all btwilink users to hci_ll and drop btwilink
Date:   Thu,  3 Oct 2019 15:41:43 +0200
Message-Id: <20191003134147.9458-1-sre@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This moves the remaining users of btwilink to the "new" serdev based hci_ll
driver and drops the btwilink driver afterwards. The patches were only compile
tested by me, but Enric tested the IGEP platform and Adam will test the LogicPD
platform.

I kept the TI_ST driver for now, since I plan to send a second patchset for the
FM radio driver. Once the FM driver has been converted to also use hci_ll, we
can remove TI_ST completly.

My suggestion is for the patch handling is, that everything simply goes through
Tony's tree.

Changes since PATCHv1 [0]
 * rebase to 5.4-rc1
 * move FM radio patches into separate patchset

[0] https://lore.kernel.org/lkml/20181221011752.25627-1-sre@kernel.org/

-- Sebastian

Sebastian Reichel (4):
  ARM: dts: LogicPD Torpedo: Add WiLink UART node
  ARM: dts: IGEP: Add WiLink UART node
  ARM: OMAP2+: pdata-quirks: drop TI_ST/KIM support
  Bluetooth: btwilink: drop superseded driver

 .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |   8 +
 arch/arm/boot/dts/omap3-igep0020-rev-f.dts    |   8 +
 arch/arm/boot/dts/omap3-igep0030-rev-g.dts    |   8 +
 arch/arm/mach-omap2/pdata-quirks.c            |  52 ---
 drivers/bluetooth/Kconfig                     |  11 -
 drivers/bluetooth/Makefile                    |   1 -
 drivers/bluetooth/btwilink.c                  | 337 ------------------
 7 files changed, 24 insertions(+), 401 deletions(-)
 delete mode 100644 drivers/bluetooth/btwilink.c

-- 
2.23.0

