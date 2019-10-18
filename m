Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3389DC985
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 17:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409057AbfJRPqR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 11:46:17 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42150 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409052AbfJRPqQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 11:46:16 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkDSu005895;
        Fri, 18 Oct 2019 10:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571413573;
        bh=QIHNicus3UqUNLJM8IoaxNSWcvCYyJXUsrZb07TeW2I=;
        h=From:To:CC:Subject:Date;
        b=KG1ZY15ohlTbhuUOSOFwoJlqxPKAxPDTIGvk8TKan8xgllpfpmFj+szxujfu5/A2w
         galPXyHHlLSq01Bv8S7YBlhnZOydVva/pwQj5Ogxu150xn4x5Mq+evS7t937FHqaG/
         SWt1avt9pYlqHHnP9erzy1YfLM6B0JxnH1jXZWGI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkDBK128650;
        Fri, 18 Oct 2019 10:46:13 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:46:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:46:05 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkDAM045642;
        Fri, 18 Oct 2019 10:46:13 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 0/9] ARM: dts: dra7: add cal nodes 
Date:   Fri, 18 Oct 2019 10:48:40 -0500
Message-ID: <20191018154849.3127-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch series adds the needed clkctrl and ty-sysc nodes for CAL module.
It also adds support for the module in related dtsi and dts for DRA72,
DRA76 and AM654 SoC.

Benoit Parrot (9):
  ARM: dts: dra7: add cam clkctrl node
  ARM: OMAP: DRA7xx: Make CAM clock domain SWSUP only
  ARM: dts: dra7-l4: Add ti-sysc node for CAM
  ARM: dts: DRA72: Add CAL dtsi node
  arm: dts: dra72-evm-common: Add entries for the CSI2 cameras
  arm: dtsi: dra76x: Add CAL dtsi node
  arm: dts: dra76-evm: Add CAL and OV5640 nodes
  arm64: dts: k3-am65-main Add CAL node
  arm64: dts: k3-am654-base-board: Add CSI2 OV5640 camera

 arch/arm/boot/dts/dra7-l4.dtsi                | 43 ++++++++++++++++---
 arch/arm/boot/dts/dra72-evm-common.dtsi       | 35 +++++++++++++++
 arch/arm/boot/dts/dra72x.dtsi                 | 43 +++++++++++++++++++
 arch/arm/boot/dts/dra76-evm.dts               | 39 +++++++++++++++++
 arch/arm/boot/dts/dra76x.dtsi                 | 43 +++++++++++++++++++
 arch/arm/boot/dts/dra7xx-clocks.dtsi          | 14 ++++++
 arch/arm/mach-omap2/clockdomains7xx_data.c    |  2 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 23 ++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 36 ++++++++++++++++
 drivers/clk/ti/clk-7xx.c                      | 19 ++++++++
 include/dt-bindings/clock/dra7.h              | 10 +++++
 11 files changed, 300 insertions(+), 7 deletions(-)

-- 
2.17.1

