Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 344B2172B29
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 23:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbgB0W2s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 17:28:48 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46698 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729868AbgB0W2s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 17:28:48 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSkPp006367;
        Thu, 27 Feb 2020 16:28:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582842526;
        bh=s7jUvbTC2OEhwx0oLYE8BMjbaCi0VVFONE8+mDlSIR0=;
        h=From:To:CC:Subject:Date;
        b=uBTsQBibe1yrWOJzmDtQJIRz1dKvG23lhN7EDl3DNBUiDlBkU7hixOlJUJvVjx6Vo
         kT5TISNzQrdT13Ro5jee2G1j4NGqEa/nGav43iasaMJoGu7ymBFYYjiCsNoHoMKhas
         g1gU2Oomp/BeSjJv2HU2kxHsxGIBvElOmAeAllX8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSk2p056921;
        Thu, 27 Feb 2020 16:28:46 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 16:28:45 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 16:28:46 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01RMSjrd116368;
        Thu, 27 Feb 2020 16:28:45 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01RMSj49086962;
        Thu, 27 Feb 2020 16:28:45 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/5] ti-sysc support for PRUSS
Date:   Thu, 27 Feb 2020 16:28:32 -0600
Message-ID: <20200227222837.7329-1-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

The following is a revised series of the ti-sysc support for PRUSS.
Please refer to the original series cover-letter [1] for details.

Following are the main changes in v2:
 - Drop the enabling of the interconnect nodes from various AM335x and
   AM437x board dts files (last 7 patches from original series)
 - Enable the target-module node for AM437x by default. None of the
   current AM437x board dts files use AM4372, so there should not be
   any regressions.

We can drop the status=disabled in the am33xx.dtsi file once we add the
SoC revision support for AM335x SoCs. This is already disabled before the
series as well. I have identified a few boards which use the older SoCs
that can disable the node in dts, but there were few others which can
use any of the SoCs, so those will definitely require the SoC device
match logic and an additional PRUSS disable quirk in the ti-sysc bus
driver.

regards
Suman

[1] https://patchwork.kernel.org/cover/11404569/

Roger Quadros (1):
  dt-bindings: bus: ti-sysc: Add support for PRUSS SYSC type

Suman Anna (4):
  bus: ti-sysc: Add support for PRUSS SYSC type
  ARM: dts: AM33xx-l4: Update PRUSS interconnect target-module node
  ARM: dts: AM4372: Add the PRU-ICSS interconnect target-module node
  ARM: dts: dra7: Add PRU-ICSS interconnect target-module nodes

 .../devicetree/bindings/bus/ti-sysc.txt       |  1 +
 arch/arm/boot/dts/am33xx-l4.dtsi              | 21 ++++++--
 arch/arm/boot/dts/am4372.dtsi                 | 22 ++++++++
 arch/arm/boot/dts/am57-pruss.dtsi             | 50 +++++++++++++++++++
 arch/arm/boot/dts/am5718.dtsi                 |  1 +
 arch/arm/boot/dts/am5728.dtsi                 |  1 +
 arch/arm/boot/dts/am5748.dtsi                 |  1 +
 arch/arm/boot/dts/dra7.dtsi                   |  2 +-
 drivers/bus/ti-sysc.c                         | 27 ++++++++++
 include/dt-bindings/bus/ti-sysc.h             |  4 ++
 include/linux/platform_data/ti-sysc.h         |  2 +
 11 files changed, 128 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/am57-pruss.dtsi

-- 
2.23.0

