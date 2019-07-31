Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087057D163
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 00:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbfGaWnE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Jul 2019 18:43:04 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59548 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfGaWnE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Jul 2019 18:43:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VMftEx086737;
        Wed, 31 Jul 2019 17:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564612915;
        bh=Lh/ko7kGLPGr6pxMk6bV2R0qPMr5v+BQRcarbEjRS6s=;
        h=From:To:CC:Subject:Date;
        b=ri8K6j7onwwjk2U/rBCj5CEYgYaeZ32tjH2mc3aj07ophmw6D0hBwCIKU6ShSnFLq
         oGAxRhq+im3z8onHJagKtxNOcHMT7FAz69gRloTIsy+4u0y35OLhEjZ47um1p6KGk2
         2Db6EkRB3gkq+FtF8wzvvfgij2vZOZsL/goND/rY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VMftjb071206
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 17:41:55 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 17:41:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 17:41:55 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VMfsuf127024;
        Wed, 31 Jul 2019 17:41:54 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x6VMfsZ24928;
        Wed, 31 Jul 2019 17:41:54 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Rob Herring <robh+dt@kernel.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/6] Add TI PRUSS Local Interrupt Controller IRQChip driver
Date:   Wed, 31 Jul 2019 17:41:43 -0500
Message-ID: <20190731224149.11153-1-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

The following is a v2 version of the series [1] that adds an IRQChip driver for
the local interrupt controller present within a Programmable Real-Time Unit and
Industrial Communication Subsystem (PRU-ICSS) present on a number of TI SoCs 
including OMAP architecture based AM335x, AM437x, AM57xx SoCs, Keystone 2 
architecture based 66AK2G SoCs, Davinci architecture based OMAP-L138/DA850 SoCs
and the latest K3 architecture based AM65x and J721E SoCs. Please see the
v1 cover-letter [1] for details about the features of this interrupt controller.
More details can be found in any of the supported SoC TRMs.
 Eg: Chapter 30.1.6 of AM5728 TRM [2]

Please see the individual patches for exact changes in each patch, following are
the main changes from v1:
 - Dropped the pruss_intc_trigger() API and patch and replaced it with a new
   patch achieving the same through irq_set_irqchip_state() callback (patch 5)
 - Added cleanup logic on INTC mapping fails and reset the mapping registers
   during unmap (patch 4)
 - Minor revisions to the bindings, no new properties introduced (patch 1)

regards
Suman

[1] https://patchwork.kernel.org/cover/11034561/
[2] http://www.ti.com/lit/pdf/spruhz6

Andrew F. Davis (1):
  irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS
    interrupts

David Lechner (1):
  irqchip/irq-pruss-intc: Implement irq_{get,set}_irqchip_state ops

Suman Anna (4):
  dt-bindings: irqchip: Add PRUSS interrupt controller bindings
  irqchip/irq-pruss-intc: Add support for shared and invalid interrupts
  irqchip/irq-pruss-intc: Add helper functions to configure internal
    mapping
  irqchip/irq-pruss-intc: Add support for ICSSG INTC on K3 SoCs

 .../interrupt-controller/ti,pruss-intc.txt    |  98 +++
 drivers/irqchip/Kconfig                       |  10 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-pruss-intc.c              | 764 ++++++++++++++++++
 include/linux/irqchip/irq-pruss-intc.h        |  36 +
 5 files changed, 909 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt
 create mode 100644 drivers/irqchip/irq-pruss-intc.c
 create mode 100644 include/linux/irqchip/irq-pruss-intc.h

-- 
2.22.0

