Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5537C1226FC
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 09:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLQIuO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 03:50:14 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33406 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfLQIuO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 03:50:14 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH8oAh6105883;
        Tue, 17 Dec 2019 02:50:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576572610;
        bh=stxhaHjBS+jW7OuN5dUVBlSD457dPuUGvzWYcepCOyU=;
        h=From:To:CC:Subject:Date;
        b=RW9WdKj1zqIzlCm2ZpKORntErIK/2SpEw17LZfNLUHl+uqFMuwVVXsoFnIHJ/q7Rz
         sYFOQSFCtUd8xFYy+ohWSNn4YiqiVn2JexYH7p/4uqFthocSxLHbdKKRTjPccj3tq4
         MeZISDNABNt795nfq1royQFswIRsaCRO6yFLOAQY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBH8oAAo039913
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 02:50:10 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 02:50:09 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 02:50:09 -0600
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH8o6dV062966;
        Tue, 17 Dec 2019 02:50:07 -0600
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
Subject: [PATCH 0/3] AM57xx: Fix bugs in device tree files
Date:   Tue, 17 Dec 2019 14:21:21 +0530
Message-ID: <20191217085124.22480-1-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series
 *) Removes gpio property from endpoint device tree node (since it's
    used for driving PERST# line)
 *) Fix gpio used for driving PERST# line in AM571x IDK
 *) Model 5V0 regulator which is used for deriving the regulator
    connected to COMQ port in beagle x15

Kishon Vijay Abraham I (3):
  ARM: dts: am57xx-beagle-x15/am57xx-idk: Remove "gpios" for  endpoint
    dt nodes
  ARM: dts: am571x-idk: Fix gpios property to have the correct  gpio
    number
  ARM: dts: beagle-x15-common: Model 5V0 regulator

 arch/arm/boot/dts/am571x-idk.dts              |  6 +----
 arch/arm/boot/dts/am572x-idk-common.dtsi      |  4 ---
 .../boot/dts/am57xx-beagle-x15-common.dtsi    | 25 ++++++++++++++++---
 3 files changed, 22 insertions(+), 13 deletions(-)

-- 
2.17.1

