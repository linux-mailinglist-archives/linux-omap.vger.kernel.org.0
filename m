Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14FC2F9205
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfKLOYG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:24:06 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49286 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKLOYG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:24:06 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACENwBE090204;
        Tue, 12 Nov 2019 08:23:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568638;
        bh=ojO2YUC3C1xyhuLDq8oEMHciFwHn5qSw8Xn6s33sf+0=;
        h=From:To:CC:Subject:Date;
        b=uFX4TY5mK7CrxRKA3TmdYIUxGiKa1iWP9VgMlgM8M49rJq6xVrE5fJ04Oum2oWMlW
         xX+oWAesIY+gC71a3MQ+yISI9Tbxmgu8vgzig7NhwIaeTlOori6nZhLFWeiLm52Bxv
         vJxY3hMmsZabBycD1mpkolZ6fojawtDHFIxchmqg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACENw0h018536
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:23:58 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:23:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:23:40 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACENwTh099408;
        Tue, 12 Nov 2019 08:23:58 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 0/3] ARM: dts: dra7: add vpe nodes 
Date:   Tue, 12 Nov 2019 08:26:54 -0600
Message-ID: <20191112142657.22898-1-bparrot@ti.com>
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

