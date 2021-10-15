Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E857342E936
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 08:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhJOGrY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 02:47:24 -0400
Received: from muru.com ([72.249.23.125]:44774 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229716AbhJOGrX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 02:47:23 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9905A80F1;
        Fri, 15 Oct 2021 06:45:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] GPMC changes for omaps for v5.16
Date:   Fri, 15 Oct 2021 09:45:14 +0300
Message-Id: <pull-1634280279-284035@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/gpmc-signed

for you to fetch changes up to 51b9e22ffd3c4c56cbb7caae9750f70e55ffa603:

  ARM: dts: omap: fix gpmc,mux-add-data type (2021-10-11 12:31:54 +0300)

----------------------------------------------------------------
Changes for omap gpmc bindings and devicetree files for v5.16

A series of changes to update the gpmc related bindings to yaml
format, and a few non-urgent dts fixes.

----------------------------------------------------------------
Roger Quadros (8):
      dt-bindings: mtd: Remove gpmc-nor.txt
      dt-bindings: net: Remove gpmc-eth.txt
      dt-bindings: memory-controllers: Introduce ti,gpmc-child
      dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
      dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
      dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
      ARM: dts: omap: Fix boolean properties gpmc,cycle2cycle-{same|diff}csen
      ARM: dts: omap: fix gpmc,mux-add-data type

 .../bindings/memory-controllers/omap-gpmc.txt      | 157 -------------
 .../bindings/memory-controllers/ti,gpmc-child.yaml | 245 +++++++++++++++++++++
 .../bindings/memory-controllers/ti,gpmc.yaml       | 172 +++++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt          | 147 -------------
 Documentation/devicetree/bindings/mtd/gpmc-nor.txt |  98 ---------
 .../devicetree/bindings/mtd/gpmc-onenand.txt       |  48 ----
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml      | 121 ++++++++++
 .../devicetree/bindings/mtd/ti,gpmc-onenand.yaml   |  81 +++++++
 Documentation/devicetree/bindings/net/gpmc-eth.txt |  97 --------
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi          |   4 +-
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi          |   2 +-
 arch/arm/boot/dts/omap-zoom-common.dtsi            |   4 +-
 arch/arm/boot/dts/omap2430-sdp.dts                 |   4 +-
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi     |   4 +-
 arch/arm/boot/dts/omap3-overo-tobiduo-common.dtsi  |   2 +-
 arch/arm/boot/dts/omap3-sb-t35.dtsi                |   4 +-
 16 files changed, 631 insertions(+), 559 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt
