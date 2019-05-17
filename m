Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8A7C211A6
	for <lists+linux-omap@lfdr.de>; Fri, 17 May 2019 03:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfEQBNr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 21:13:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50156 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfEQBNr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 21:13:47 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4H1DfKE000709;
        Thu, 16 May 2019 20:13:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558055621;
        bh=gYQRbOj4PndgXS6e8xSmmGTgO0c0lScnBwnPPEdj1a4=;
        h=From:To:CC:Subject:Date;
        b=MGSPfh+YFzlms1ebpKBRkGHal9Z8csOP+D9aP/NzjMSk7+oa6fijoiwaIw4hyp1BP
         KOQh/E1VHJZmXc1bv7/HxZQ0aF3t3ZKWgp25wuiUDhnIWiG2Y54PSy86+OXYSiOwDG
         cUM+euHzHOWkPkptTIqDj/2QxRQx9mxzhxaaBBE0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4H1DfHI059319
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 20:13:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 20:13:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 20:13:40 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4H1Dcgx032414;
        Thu, 16 May 2019 20:13:39 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 0/4] dra71/76: Fix boot issues
Date:   Fri, 17 May 2019 06:44:05 +0530
Message-ID: <20190517011409.22167-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series adds patches that fix boot on dra76/71-evms.

Changes in v2:

  * Pushed the disabling to dra76x and dra71x.dtsi respectively

Keerthy (4):
  arm: dts: dra76x: Disable rtc target module
  arm: dts: dra76x: Disable usb4_tm target module
  arm: dts: dra71x: Disable rtc target module
  arm: dts: dra71x: Disable usb4_tm target module

 arch/arm/boot/dts/dra7-l4.dtsi  |  2 +-
 arch/arm/boot/dts/dra71-evm.dts |  2 +-
 arch/arm/boot/dts/dra71x.dtsi   | 17 +++++++++++++++++
 arch/arm/boot/dts/dra76x.dtsi   |  8 ++++++++
 4 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/dra71x.dtsi

-- 
2.17.1

