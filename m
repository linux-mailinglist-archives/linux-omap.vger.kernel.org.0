Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E096D172B
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 19:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbfJIRx7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 13:53:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49128 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbfJIRx7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 13:53:59 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99Hrttj032259;
        Wed, 9 Oct 2019 12:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570643635;
        bh=FcFxGHNZSeZ2QDi/0mIGHWN9xxGBNaup5w8sjlaEJEs=;
        h=From:To:CC:Subject:Date;
        b=UykJLdorJQLt8kkFH7UDLvWEjXzLz7Nsb3+yYK7Yxwe0kpG2U0IZ52W7j+Cw+t2Rq
         xsMQYw42HZd7v/NVfs/vo+rEemZbFTJ4vGIVjZetLtVD0b8gj4GKkm9eibSeeByt30
         4KahrnRUsZuPoc7oKB8TFICuLIlX0h0el41RzZIo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99HrtxP047240;
        Wed, 9 Oct 2019 12:53:55 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 12:53:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 12:53:54 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99Hrsh8069742;
        Wed, 9 Oct 2019 12:53:54 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 0/3] ARM: dts: dra7: add vpe nodes 
Date:   Wed, 9 Oct 2019 12:56:25 -0500
Message-ID: <20191009175628.20570-1-bparrot@ti.com>
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

Benoit Parrot (3):
  dt-bindings: media: ti-vpe: Document VPE driver
  ARM: dts: dra7: add vpe clkctrl node
  ARM: dts: dra7: Add ti-sysc node for VPE

 .../devicetree/bindings/media/ti-vpe.txt      | 48 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/dra7-l4.dtsi                | 30 ++++++++++--
 arch/arm/boot/dts/dra7xx-clocks.dtsi          | 18 ++++++-
 drivers/clk/ti/clk-7xx.c                      |  6 +++
 include/dt-bindings/clock/dra7.h              | 10 ++++
 6 files changed, 108 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti-vpe.txt

-- 
2.17.1

