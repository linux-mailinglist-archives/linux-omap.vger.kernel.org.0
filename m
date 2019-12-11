Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D45811ACF6
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbfLKOEv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:04:51 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44880 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbfLKOEv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:04:51 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE4mlD114268;
        Wed, 11 Dec 2019 08:04:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576073088;
        bh=216FgmVh31ZodJk67M2YBwnr592MVdcEK9wwwhnHv7w=;
        h=From:To:CC:Subject:Date;
        b=ssyokr5UGOC+0A5IF+orh3+EQNG06U1PfwQxdarW9Pv1xZhnYtglKSaTHjwNexVci
         zNWVslWfNZ9XfQUrDPmkdz/V7rpoZF5EjJldL50FfgX8LrBk78uky0cek+62aMjkPh
         xHhgfX0/z2NN56pw80EyR+Inkwb7Y2qVOB8SGmeg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE4mPw102523;
        Wed, 11 Dec 2019 08:04:48 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:04:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:04:48 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE4m6e088450;
        Wed, 11 Dec 2019 08:04:48 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v5 0/3] ARM: dts: dra7: add vpe nodes 
Date:   Wed, 11 Dec 2019 08:08:07 -0600
Message-ID: <20191211140810.10657-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch series adds the needed clkctrl and ty-sysc nodes for VPE module.
We also document the VPE DT bindings.

Changes since v4:
- Added Tony's ack 

Changes since v3:
- Patches [1](dt-bindings) and [5](driver compatible) were merged in
  linux-media
- Added special clock naming notice to commit message as per Tony's
  comment

Changes since v2:
- Fix binding spdx license
- Added Rob's ack 

Changes since v1:
- Added a patch to update the compatible in the driver
- Removed unnededed #cell #size properties
- Updated the compatible in dtsi to match binding
- Split off the clk code into its own patch
- Added device specific prefix
- Converted binding to dt schema

Benoit Parrot (3):
  clk: ti: dra7: add vpe clkctrl data
  ARM: dts: dra7: add vpe clkctrl node
  ARM: dts: dra7: Add ti-sysc node for VPE

 arch/arm/boot/dts/dra7-l4.dtsi       | 28 +++++++++++++++++++++++++---
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 18 ++++++++++++++++--
 drivers/clk/ti/clk-7xx.c             |  6 ++++++
 include/dt-bindings/clock/dra7.h     | 10 ++++++++++
 4 files changed, 57 insertions(+), 5 deletions(-)

-- 
2.17.1

