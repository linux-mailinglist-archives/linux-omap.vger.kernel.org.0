Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6A2619A9
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2019 05:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbfGHDx6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 7 Jul 2019 23:53:58 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37224 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfGHDx4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 7 Jul 2019 23:53:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x683qlHi073187;
        Sun, 7 Jul 2019 22:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562557967;
        bh=/PxbsYKEc7J+gcuFg4Za6foR6b99A27G9weDbwBQOME=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mce7VKr7jsguyzB9oW2SHO37YJcu552fbsgGA7zMkVnF3ox4rMW1MMrHrC2CQQQhV
         5TPqVuGn0+M78BPTnfUsB88AbtMKPesy79hUK40yQeMWi67MsZlBHPTjlNyrjOzXrj
         WhAx03h+sWS9LMSYDP1ubhrQnYFmkmI2Y4Yaa5VE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x683qlun102653
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 7 Jul 2019 22:52:47 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 7 Jul
 2019 22:52:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 7 Jul 2019 22:52:47 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x683qkEP036231;
        Sun, 7 Jul 2019 22:52:46 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x683qkm26449;
        Sun, 7 Jul 2019 22:52:46 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Tony Lindgren <tony@atomide.com>, "Andrew F. Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        David Lechner <david@lechnology.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 5/6] irqchip/irq-pruss-intc: Add API to trigger a PRU sysevent
Date:   Sun, 7 Jul 2019 22:52:42 -0500
Message-ID: <20190708035243.12170-6-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708035243.12170-1-s-anna@ti.com>
References: <20190708035243.12170-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Andrew F. Davis" <afd@ti.com>

The PRUSS INTC can generate an interrupt to various processor
subsystems on the SoC through a set of 64 possible PRU system
events. These system events can be used by PRU client drivers
or applications for event notifications/signalling between PRUs
and MPU or other processors. A new API, pruss_intc_trigger() is
provided to MPU-side PRU client drivers/applications to be able
to trigger an event/interrupt using IRQ numbers provided by the
PRUSS-INTC irqdomain chip.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/irqchip/irq-pruss-intc.c | 31 +++++++++++++++++++++++++++++++
 include/linux/pruss_intc.h       | 26 ++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 include/linux/pruss_intc.h

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 8118c2a2ac43..a0ad50b95cd5 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -421,6 +421,37 @@ static void pruss_intc_irq_relres(struct irq_data *data)
 	module_put(THIS_MODULE);
 }
 
+/**
+ * pruss_intc_trigger() - trigger a PRU system event
+ * @irq: linux IRQ number associated with a PRU system event
+ *
+ * Trigger an interrupt by signalling a specific PRU system event.
+ * This can be used by PRUSS client users to raise/send an event to
+ * a PRU or any other core that is listening on the host interrupt
+ * mapped to that specific PRU system event. The @irq variable is the
+ * Linux IRQ number associated with a specific PRU system event that
+ * a client user/application uses. The interrupt mappings for this is
+ * provided by the PRUSS INTC irqchip instance.
+ *
+ * Returns 0 on success, or an error value upon failure.
+ */
+int pruss_intc_trigger(unsigned int irq)
+{
+	struct irq_desc *desc;
+
+	if (irq <= 0)
+		return -EINVAL;
+
+	desc = irq_to_desc(irq);
+	if (!desc)
+		return -EINVAL;
+
+	pruss_intc_irq_retrigger(&desc->irq_data);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pruss_intc_trigger);
+
 static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
 				     irq_hw_number_t hw)
 {
diff --git a/include/linux/pruss_intc.h b/include/linux/pruss_intc.h
new file mode 100644
index 000000000000..84aa7f7edf42
--- /dev/null
+++ b/include/linux/pruss_intc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * TI PRU-ICSS Subsystem user interfaces
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com
+ *	Andrew F. Davis <afd@ti.com>
+ *	Suman Anna <s-anna@ti.com>
+ */
+
+#ifndef __LINUX_PRUSS_INTC_H
+#define __LINUX_PRUSS_INTC_H
+
+#if IS_ENABLED(CONFIG_TI_PRUSS_INTC)
+
+int pruss_intc_trigger(unsigned int irq);
+
+#else
+
+static inline int pruss_intc_trigger(unsigned int irq)
+{
+	return -ENOTSUPP;
+}
+
+#endif /* CONFIG_TI_PRUSS_INTC */
+
+#endif /* __LINUX_PRUSS_INTC_H */
-- 
2.22.0

