Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EEE39EDF0
	for <lists+linux-omap@lfdr.de>; Tue,  8 Jun 2021 07:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhFHFMH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Jun 2021 01:12:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43950 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHFMG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Jun 2021 01:12:06 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1585A8Kx066536;
        Tue, 8 Jun 2021 00:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623129008;
        bh=KLAt0d/F/l4n4vOSmZm35Ag5pkBA32yCHtN/EtOpsnU=;
        h=From:To:CC:Subject:Date;
        b=Des6ltxBx3LZPidDCZBGT1i99L5hv9vu1XjhJvyb+WZxXzaBUq+jb/1jvjiKth1g3
         IVj3NpFDIHAH0s33vHlYSzOxpHpDuAZ6oVTP8Ypwaf8K9vpkAAv0jptKDZbUSBL25I
         cRUfYX6RMZrCg5ZZpo2HVGs4PM5GfVvZv5ulJ3OI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1585A8IR117494
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Jun 2021 00:10:08 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 00:10:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 00:10:07 -0500
Received: from gsaswath-HP-ProBook-640-G5.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15859wi5129735;
        Tue, 8 Jun 2021 00:10:00 -0500
From:   Aswath Govindraju <a-govindraju@ti.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Uri Mashiach <uri.mashiach@compulab.co.il>,
        Raag Jadav <raagjadav@gmail.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] arm: am335x/am437x: Fix ti,pindir-d0-out-d1-in property to boolean
Date:   Tue, 8 Jun 2021 10:39:50 +0530
Message-ID: <20210608050952.14204-1-a-govindraju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The following series of patches fix "ti,pindir-d0-out-d1-in" property to
boolean.

changes since v1:
- added fixes tags
- split the series according to their respective trees

link to v1:
https://lore.kernel.org/patchwork/project/lkml/list/?series=502255

Aswath Govindraju (2):
  ARM: dts: am335x: align ti,pindir-d0-out-d1-in property with dt-shema
  ARM: dts: am437x: align ti,pindir-d0-out-d1-in property with dt-shema

 arch/arm/boot/dts/am335x-cm-t335.dts | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1

