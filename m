Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 599E1867B5
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 19:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404079AbfHHRJ1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 13:09:27 -0400
Received: from vern.gendns.com ([98.142.107.122]:60864 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728289AbfHHRJ1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 8 Aug 2019 13:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6unxZ5asslwfaV24LhI64EK8dFL53Fedq9/jgw1wHlo=; b=reAcURK2AJzjNr83ooncOhsF2c
        7VO1ubLVDOqiH84SCYsVAAydn1Fh24R0gAOBSLx9gkvthu+btPeZ/XbdINxJARlbf+U6ma2nQc8Y6
        h07kvAUVwx7CHYqLqQWb9ubb+k1iQUhVDtq7iR2G1h+rc1CtccYJ5+l1HHU+SvhVEPZbEHMxQSnaq
        BE0BGmj2bRsrM7Hzhg25KVSTk76WBCTt/3IKx0mOgeBjYSCoMHswRiL7hZNaEtBy/U3G/aFox3Xub
        LE0e5ouYWzs8ry8vSgVhKzSXysFpinAr1k8iHTA7o7THzp8KqSFtalmrusTsBgyxnMi+rNUGBaLQu
        oSr8J62Q==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:33302 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hvluk-0007RF-O7; Thu, 08 Aug 2019 13:09:22 -0400
Subject: Re: [PATCH v2 4/6] irqchip/irq-pruss-intc: Add helper functions to
 configure internal mapping
To:     Suman Anna <s-anna@ti.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Cc:     Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
        "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190731224149.11153-1-s-anna@ti.com>
 <20190731224149.11153-5-s-anna@ti.com>
 <1a63eb50-7c5c-eb3d-3cbe-bd1cc59ce3fe@kernel.org>
 <89abc27f-5d02-a8ce-df0e-b185c2a647cd@ti.com>
 <1ac233f6-f3a3-6cec-9ad2-49e985fdfaca@lechnology.com>
 <6c17875e-496d-1277-278f-239d3a9d8ca2@ti.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <124b03b8-f8e7-682b-8767-13a739329da2@lechnology.com>
Date:   Thu, 8 Aug 2019 12:09:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6c17875e-496d-1277-278f-239d3a9d8ca2@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/2/19 4:26 PM, Suman Anna wrote:
> Point is different applications might use mapping differently as per
> their firmware and driver/application design and their split across one
> or more PRUs (design by contract). And we need to set this up at runtime
> when the application driver is getting run. We will have either the Soft
> UART or the Ethernet running at a time depending on the end goal desired
> 
>> I have an idea that we can use multiple struct irq_domains to make
>> this work in the existing IRQ framework, but it would be helpful to
>> know more about the bigger picture first.
> 
> Yeah, would be great if there is a way this can be solved without having
> to introduce additional API.
> 


Here is what I came up with to use existing IRQ APIs to implement event mapping.
Basically it is the same as my previous suggestion [1], with the addition of
multiple IRQ domains.

The idea is that each external interrupt controller (or DMA controller, etc.)
that is connected to the PRUSS interrupt controller is considered an interrupt
domain. One of the objections to my previous patch was that we could only have
one IRQ descriptor per event. Now we can have one descriptor per event per
domain.

I am still proposing that we use the interrupt-cells and identical vendor
resource data structures in the PRU firmware be used to provide the mapping
information. (As a side note, I still think it is important to include EVTSEL
on AM18xx in order to fully describe the event.)

The bindings will have N = 4 cells (or N = 5 when EVTSEL is required to fully
describe the event):

	Cell 0: The PRUSS event number, e.g. 0 to 64 for most PRUSSs
	Cell 1: The EVTSEL value (omitted when N == 4), e.g. 0, 1 or
		TI_PRUSS_INTC_EVTSEL_ANY if the event is the same for all EVTSEL
		values. On AM18xx, external events will all require 0 or 1 while
		system events will always be TI_PRUSS_INTC_EVTSEL_ANY.
	Cell N-3: The channel that the event gets mapped to, e.g. 0 to 9
	Cell N-2: The host that the channel gets mapped to, e.g. 0 to 9
	Cell N-1: The interrupt domain, e.g. TI_PRUSS_INTC_DOMAIN_PRU or
		TI_PRUSS_INTC_DOMAIN_MCU

The TI_PRUSS_INTC_DOMAIN_* values are just arbitrary numbers assigned to the
possible domains. For example, on AM18xx and AM33xx, there are just two domains,
the PRU domain for host 0 and host 1 and the MCU domain for host 2 thru 9.
Looking at the AM65xx manual, it looks like it would have 4 domains, the PRU
domain, the RTU PRU domain, the MCU domain and a task manager domain. (And I
suppose that domains could even be more granular if needed, e.g. we could drop
the arbitrary domain number and treat each host interrupt/event as an interrupt
domain, then there would be an IRQ descriptor per PRU INTC event per host.)

The AM18xx example I have been using will look like this in the device tree:

	interrupts = <63 TI_PRUSS_INTC_EVTSEL_ANY 0 0 TI_PRUSS_INTC_DOMAIN_PRU>,
		     <62 TI_PRUSS_INTC_EVTSEL_ANY 2 2 TI_PRUSS_INTC_DOMAIN_MCU>;

To keep parsing simple, the PRU firmware can include vendor resources that have
essentially the same format as the device tree bindings. For example:

enum {
	/* IRQ descriptor without EVTSEL */
	TI_PRU_VENDOR_RESOURCE_IRQ = RSC_VENDOR_START,
	/* IRQ descriptor with EVTSEL */
	TI_PRU_VENDOR_RESOURCE_IRQ2,
};

struct ti_pru_vendor_resource_irq {
	__le32 event;
	__le32 channel;
	__le32 host;
	__le32 domain;
};

struct ti_pru_vendor_resource_irq2 {
	__le32 event;
	__le32 evt_sel;
	__le32 channel;
	__le32 host;
	__le32 domain;
};

Then we can provide a vendor resource hook in the remoteproc driver to handle
these resources:

static int ti_pru_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
				   int offset, int avail)
{
	struct ti_pru_data *pru = rproc->priv;
	struct irq_fwspec fwspec;
	unsigned int virq;

	switch (rsc_type) {
	case TI_PRU_VENDOR_RESOURCE_IRQ:
	{
		struct ti_pru_vendor_resource_irq *rsc_irq = rsc;

		fwspec.fwnode = pru->intc_fwnode;
		fwspec.param[0] = le32_to_cpu(rsc_irq->event);
		fwspec.param[1] = le32_to_cpu(rsc_irq->channel);
		fwspec.param[2] = le32_to_cpu(rsc_irq->host);
		fwspec.param[3] = le32_to_cpu(rsc_irq->domain);
		fwspec.param_count = 4;
	}
		break;
	case TI_PRU_VENDOR_RESOURCE_IRQ2:
	{
		struct ti_pru_vendor_resource_irq2 *rsc_irq2 = rsc;

		fwspec.fwnode = pru->intc_fwnode;
		fwspec.param[0] = le32_to_cpu(rsc_irq2->event);
		fwspec.param[1] = le32_to_cpu(rsc_irq2->evt_sel);
		fwspec.param[2] = le32_to_cpu(rsc_irq2->channel);
		fwspec.param[3] = le32_to_cpu(rsc_irq2->host);
		fwspec.param[4] = le32_to_cpu(rsc_irq2->domain);
		fwspec.param_count = 5;
		break;
	}
	default:
		return RSC_IGNORED;
	}

	virq = irq_create_fwspec_mapping(&fwspec);
	if (!virq)
		return -EINVAL;

	/* TODO: save virq (and other metadata) for later use */

	return RSC_HANDLED;
}

static const struct rproc_ops ti_pru_rproc_ops = {
	.start = ti_pru_rproc_start,
	.stop = ti_pru_rproc_stop,
	.kick = ti_pru_rproc_kick,
	.da_to_va = ti_pru_rproc_da_to_va,
	.handle_rsc = ti_pru_rproc_handle_rsc,
};

The handle_rsc callback is called for each resource when the PRU is booted.
The function irq_create_fwspec_mapping() causes the IRQ to be mapped in
hardware. From what I understand from the previous discussions, this is exactly
when we want this to happen.

This patch applies on top of "irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
for PRUSS interrupts", "irqchip/irq-pruss-intc: Add support for shared and
invalid interrupts" and "irqchip/irq-pruss-intc: Implement irq_{get,set}
_irqchip_state ops" from [PATCH v2 0/6] "Add TI PRUSS Local Interrupt Controller
IRQChip driver" [2].

A working copy along with some remoteproc and rpmsg hacks can be found on my
GitHub [3].

[1]: https://lore.kernel.org/lkml/fb2bdb7b-4d4d-508f-722a-554888280145@lechnology.com/
[2]: https://lore.kernel.org/lkml/20190731224149.11153-1-s-anna@ti.com/
[3]: https://github.com/dlech/linux/commits/pruss-2019-08-08

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: David Lechner <david@lechnology.com>
---
  drivers/irqchip/irq-pruss-intc.c              | 387 +++++++++++++++++-
  .../interrupt-controller/ti-pruss.h           |  27 ++
  2 files changed, 396 insertions(+), 18 deletions(-)
  create mode 100644 include/dt-bindings/interrupt-controller/ti-pruss.h

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index c1fd6c09f2f2..da4349df08c3 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -5,6 +5,8 @@
   * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
   *	Andrew F. Davis <afd@ti.com>
   *	Suman Anna <s-anna@ti.com>
+ *
+ * Copyright (C) 2019 David Lechner <david@lechnology.com>
   */
  
  #include <linux/interrupt.h>
@@ -14,6 +16,14 @@
  #include <linux/module.h>
  #include <linux/of_device.h>
  #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <dt-bindings/interrupt-controller/ti-pruss.h>
+
+/* The number of possible interrupt domains, see TI_PRUSS_INTC_DOMAIN_* in
+ * dt-bindings/interrupt-controller/ti-pruss.h
+ */
+#define NUM_TI_PRUSS_INTC_DOMAIN 5
  
  /*
   * Number of host interrupts reaching the main MPU sub-system. Note that this
@@ -25,6 +35,12 @@
  /* minimum starting host interrupt number for MPU */
  #define MIN_PRU_HOST_INT	2
  
+/* maximum number of host interrupts */
+#define MAX_PRU_HOST_INT	10
+
+/* maximum number of interrupt channels */
+#define MAX_PRU_CHANNELS	10
+
  /* maximum number of system events */
  #define MAX_PRU_SYS_EVENTS	64
  
@@ -57,27 +73,83 @@
  #define PRU_INTC_HINLR(x)	(0x1100 + (x) * 4)
  #define PRU_INTC_HIER		0x1500
  
+/* CMR register bit-field macros */
+#define CMR_EVT_MAP_MASK	0xf
+#define CMR_EVT_MAP_BITS	8
+#define CMR_EVT_PER_REG		4
+
+/* HMR register bit-field macros */
+#define HMR_CH_MAP_MASK		0xf
+#define HMR_CH_MAP_BITS		8
+#define HMR_CH_PER_REG		4
+
  /* HIPIR register bit-fields */
  #define INTC_HIPIR_NONE_HINT	0x80000000
  
+/**
+ * struct pruss_intc_hwirq_data - additional metadata associated with a PRU
+ * system event
+ * @evtsel: The event select index (AM18xx only)
+ * @channel: The PRU INTC channel that the system event should be mapped to
+ * @host: The PRU INTC host that the channel should be mapped to
+ */
+struct pruss_intc_hwirq_data {
+	u8 evtsel;
+	u8 channel;
+	u8 host;
+};
+
+/**
+ * struct pruss_intc_map_record - keeps track of actual mapping state
+ * @value: The currently mapped value (evtsel, channel or host)
+ * @ref_count: Keeps track of number of current users of this resource
+ */
+struct pruss_intc_map_record {
+	u8 value;
+	u8 ref_count;
+};
+
+/**
+ * struct pruss_intc_domain - information specific to an external IRQ domain
+ * @hwirq_data: Table of additional mapping data received from device tree
+ *	or PRU firmware
+ * @domain: irq domain
+ * @intc: the interrupt controller
+ * @id: Unique domain identifier (from device tree bindings)
+ */
+struct pruss_intc_domain {
+	struct pruss_intc_hwirq_data hwirq_data[MAX_PRU_SYS_EVENTS];
+	struct irq_domain *domain;
+	struct pruss_intc *intc;
+	u32 id;
+};
+
  /**
   * struct pruss_intc - PRUSS interrupt controller structure
+ * @domain: External interrupt domains
+ * @evtsel: Tracks the current state of CFGCHIP3[3].PRUSSEVTSEL (AM18xx only)
+ * @event_channel: Tracks the current state of system event to channel mappings
+ * @channel_host: Tracks the current state of channel to host mappings
   * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
   * @base: base virtual address of INTC register space
   * @irqchip: irq chip for this interrupt controller
- * @domain: irq domain for this interrupt controller
   * @lock: mutex to serialize access to INTC
   * @shared_intr: bit-map denoting if the MPU host interrupt is shared
   * @invalid_intr: bit-map denoting if host interrupt is not connected to MPU
+ * @has_evtsel: indicates that the chip has an event select mux
   */
  struct pruss_intc {
+	struct pruss_intc_domain domain[NUM_ISA_INTERRUPTS];
+	struct pruss_intc_map_record evtsel;
+	struct pruss_intc_map_record event_channel[MAX_PRU_SYS_EVENTS];
+	struct pruss_intc_map_record channel_host[MAX_PRU_CHANNELS];
  	unsigned int irqs[MAX_NUM_HOST_IRQS];
  	void __iomem *base;
  	struct irq_chip *irqchip;
-	struct irq_domain *domain;
  	struct mutex lock; /* PRUSS INTC lock */
  	u16 shared_intr;
  	u16 invalid_intr;
+	bool has_evtsel;
  };
  
  static inline u32 pruss_intc_read_reg(struct pruss_intc *intc, unsigned int reg)
@@ -105,6 +177,172 @@ static int pruss_intc_check_write(struct pruss_intc *intc, unsigned int reg,
  	return 0;
  }
  
+/**
+ * pruss_intc_map() - configure the PRUSS INTC
+ * @domain: pru intc domain pointer
+ * @hwirq: the system event number
+ *
+ * Configures the PRUSS INTC with the provided configuration from the one
+ * parsed in the xlate function. Any existing event to channel mappings or
+ * channel to host interrupt mappings are checked to make sure there are no
+ * conflicting configuration between both the PRU cores.
+ *
+ * Returns 0 on success, or a suitable error code otherwise
+ */
+static int pruss_intc_map(struct pruss_intc_domain *domain, unsigned long hwirq)
+{
+	struct pruss_intc *intc = domain->intc;
+	struct device* dev = intc->irqchip->parent_device;
+	u32 val;
+	int idx, ret;
+	u8 evtsel, ch, host;
+
+	if (hwirq >= MAX_PRU_SYS_EVENTS)
+		return -EINVAL;
+
+	mutex_lock(&intc->lock);
+
+	evtsel = domain->hwirq_data[hwirq].evtsel;
+	ch = domain->hwirq_data[hwirq].channel;
+	host = domain->hwirq_data[hwirq].host;
+
+	if (intc->has_evtsel && intc->evtsel.ref_count > 0 &&
+	    intc->evtsel.value != evtsel) {
+		dev_err(dev, "event %lu (req. evtsel %d) already assigned to evtsel %d\n",
+			hwirq, evtsel, intc->evtsel.value);
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/* check if sysevent already assigned */
+	if (intc->event_channel[hwirq].ref_count > 0 &&
+	    intc->event_channel[hwirq].value != ch) {
+		dev_err(dev, "event %lu (req. channel %d) already assigned to channel %d\n",
+			hwirq, ch, intc->event_channel[hwirq].value);
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/* check if channel already assigned */
+	if (intc->channel_host[ch].ref_count > 0 &&
+	    intc->channel_host[ch].value != host) {
+		dev_err(dev, "channel %d (req. host %d) already assigned to host %d\n",
+			ch, host, intc->channel_host[ch].value);
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (++intc->evtsel.ref_count == 1) {
+		intc->evtsel.value = evtsel;
+
+		/* TODO: need to implement CFGCHIP3[3].PRUSSEVTSEL */
+	}
+
+	if (++intc->event_channel[hwirq].ref_count == 1) {
+		intc->event_channel[hwirq].value = ch;
+
+		/*
+		 * configure channel map registers - each register holds map
+		 * info for 4 events, with each event occupying the lower nibble
+		 * in a register byte address in little-endian fashion
+		 */
+		idx = hwirq / CMR_EVT_PER_REG;
+
+		val = pruss_intc_read_reg(intc, PRU_INTC_CMR(idx));
+		val &= ~(CMR_EVT_MAP_MASK <<
+				((hwirq % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS));
+		val |= ch << ((hwirq % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS);
+		pruss_intc_write_reg(intc, PRU_INTC_CMR(idx), val);
+
+		dev_dbg(dev, "SYSEV%lu -> CH%d (CMR%d 0x%08x)\n", hwirq, ch,
+			idx, pruss_intc_read_reg(intc, PRU_INTC_CMR(idx)));
+
+		/* clear and enable system event */
+		pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
+		pruss_intc_write_reg(intc, PRU_INTC_EISR, hwirq);
+	}
+
+	if (++intc->channel_host[ch].ref_count == 1) {
+		intc->channel_host[ch].value = host;
+
+		/*
+		 * set host map registers - each register holds map info for
+		 * 4 channels, with each channel occupying the lower nibble in
+		 * a register byte address in little-endian fashion
+		 */
+		idx = ch / HMR_CH_PER_REG;
+
+		val = pruss_intc_read_reg(intc, PRU_INTC_HMR(idx));
+		val &= ~(HMR_CH_MAP_MASK <<
+				((ch % HMR_CH_PER_REG) * HMR_CH_MAP_BITS));
+		val |= host << ((ch % HMR_CH_PER_REG) * HMR_CH_MAP_BITS);
+		pruss_intc_write_reg(intc, PRU_INTC_HMR(idx), val);
+
+		dev_dbg(dev, "CH%d -> HOST%d (HMR%d 0x%08x)\n", ch, host, idx,
+			pruss_intc_read_reg(intc, PRU_INTC_HMR(idx)));
+
+		/* enable host interrupts */
+		pruss_intc_write_reg(intc, PRU_INTC_HIEISR, host);
+	}
+
+	dev_info(dev, "mapped system_event = %lu channel = %d host = %d domain = %u\n",
+		 hwirq, ch, host, domain->id);
+
+	/* global interrupt enable */
+	pruss_intc_write_reg(intc, PRU_INTC_GER, 1);
+
+	mutex_unlock(&intc->lock);
+	return 0;
+
+unlock:
+	mutex_unlock(&intc->lock);
+	return ret;
+}
+
+/**
+ * pruss_intc_unmap() - unconfigure the PRUSS INTC
+ * @domain: pru intc domain pointer
+ * @hwirq: the system event number
+ *
+ * Undo whatever was done in pruss_intc_map() for a PRU core.
+ * Mappings are reference counted, so resources are only disabled when there
+ * are no longer any users.
+ */
+static void pruss_intc_unmap(struct pruss_intc_domain *domain, unsigned long hwirq)
+{
+	struct pruss_intc *intc = domain->intc;
+	struct device* dev = intc->irqchip->parent_device;
+	u8 ch, host;
+
+	if (hwirq >= MAX_PRU_SYS_EVENTS)
+		return;
+
+	mutex_lock(&intc->lock);
+
+	ch = intc->event_channel[hwirq].value;
+	host = intc->channel_host[ch].value;
+
+	if (--intc->channel_host[ch].ref_count == 0) {
+		/* disable host interrupts */
+		pruss_intc_write_reg(intc, PRU_INTC_HIDISR, host);
+	}
+
+	if (--intc->event_channel[hwirq].ref_count == 0) {
+		/* disable system events */
+		pruss_intc_write_reg(intc, PRU_INTC_EICR, hwirq);
+		/* clear any pending status */
+		pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
+	}
+
+	if (intc->has_evtsel)
+		intc->evtsel.ref_count--;
+
+	dev_info(dev, "unmapped system_event = %lu channel = %d host = %d\n",
+		 hwirq, ch, host);
+
+	mutex_unlock(&intc->lock);
+}
+
  static void pruss_intc_init(struct pruss_intc *intc)
  {
  	int i;
@@ -198,10 +436,83 @@ static int pruss_intc_irq_set_irqchip_state(struct irq_data *data,
  	return pruss_intc_check_write(intc, PRU_INTC_SICR, data->hwirq);
  }
  
+static int pruss_intc_irq_domain_select(struct irq_domain *d,
+					struct irq_fwspec *fwspec,
+					enum irq_domain_bus_token bus_token)
+{
+	struct pruss_intc_domain *domain = d->host_data;
+	int num_cells = domain->intc->has_evtsel ? 5 : 4;
+	u32 domain_id;
+
+	if (!fwspec || fwspec->fwnode != domain->domain->fwnode)
+		return 0;
+
+	if (bus_token != DOMAIN_BUS_ANY && bus_token != domain->domain->bus_token)
+		return 0;
+
+	if (WARN_ON_ONCE(fwspec->param_count != num_cells))
+		return 0;
+
+	domain_id = fwspec->param[fwspec->param_count - 1];
+	if (domain_id != domain->id)
+		return 0;
+
+	return 1;
+}
+
+static int
+pruss_intc_irq_domain_xlate(struct irq_domain *d, struct device_node *node,
+			    const u32 *intspec, unsigned int intsize,
+			    unsigned long *out_hwirq, unsigned int *out_type)
+{
+	struct pruss_intc_domain *domain = d->host_data;
+	struct pruss_intc *intc = domain->intc;
+	int num_cells = intc->has_evtsel ? 5 : 4;
+	u32 sys_event, channel, host, domain_id;
+	u32 evtsel = 0;
+
+	if (WARN_ON_ONCE(intsize != num_cells))
+		return -EINVAL;
+
+	sys_event = intspec[0];
+	if (sys_event >= MAX_PRU_SYS_EVENTS)
+		return -EINVAL;
+
+	if (intc->has_evtsel)
+		evtsel = intspec[1];
+
+	channel = intspec[intsize - 3];
+	if (channel >= MAX_PRU_CHANNELS)
+		return -EINVAL;
+
+	host = intspec[intsize - 2];
+	if (host >= MAX_PRU_HOST_INT)
+		return -EINVAL;
+
+	domain_id = intspec[intsize - 1];
+	if (domain_id != domain->id)
+		return -EINVAL;
+
+	domain->hwirq_data[sys_event].evtsel = evtsel;
+	domain->hwirq_data[sys_event].channel = channel;
+	domain->hwirq_data[sys_event].host = host;
+
+	*out_hwirq = sys_event;
+	*out_type = IRQ_TYPE_NONE;
+
+	return 0;
+}
+
  static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
  				     irq_hw_number_t hw)
  {
-	struct pruss_intc *intc = d->host_data;
+	struct pruss_intc_domain *domain = d->host_data;
+	struct pruss_intc *intc = domain->intc;
+	int err;
+
+	err = pruss_intc_map(domain, hw);
+	if (err < 0)
+		return err;
  
  	irq_set_chip_data(virq, intc);
  	irq_set_chip_and_handler(virq, intc->irqchip, handle_level_irq);
@@ -211,12 +522,17 @@ static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
  
  static void pruss_intc_irq_domain_unmap(struct irq_domain *d, unsigned int virq)
  {
+	struct pruss_intc_domain *domain = d->host_data;
+	unsigned long hwirq = irqd_to_hwirq(irq_get_irq_data(virq));
+
  	irq_set_chip_and_handler(virq, NULL, NULL);
  	irq_set_chip_data(virq, NULL);
+	pruss_intc_unmap(domain, hwirq);
  }
  
  static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
-	.xlate	= irq_domain_xlate_onecell,
+	.select	= pruss_intc_irq_domain_select,
+	.xlate	= pruss_intc_irq_domain_xlate,
  	.map	= pruss_intc_irq_domain_map,
  	.unmap	= pruss_intc_irq_domain_unmap,
  };
@@ -245,7 +561,8 @@ static void pruss_intc_irq_handler(struct irq_desc *desc)
  	hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
  	while (!(hipir & INTC_HIPIR_NONE_HINT)) {
  		hwirq = hipir & GENMASK(9, 0);
-		virq = irq_linear_revmap(intc->domain, hwirq);
+		virq = irq_linear_revmap(
+			intc->domain[TI_PRUSS_INTC_DOMAIN_MCU].domain, hwirq);
  
  		/*
  		 * NOTE: manually ACK any system events that do not have a
@@ -272,7 +589,8 @@ static int pruss_intc_probe(struct platform_device *pdev)
  	struct pruss_intc *intc;
  	struct resource *res;
  	struct irq_chip *irqchip;
-	int i, irq, count;
+	int i, err, irq, count;
+	u32 num_cells;
  	u8 temp_intr[MAX_NUM_HOST_IRQS] = { 0 };
  
  	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
@@ -323,13 +641,22 @@ static int pruss_intc_probe(struct platform_device *pdev)
  		}
  	}
  
+	err = of_property_read_u32(dev->of_node, "#interrupt-cells", &num_cells);
+	if (!err && num_cells == 5)
+		intc->has_evtsel = true;
+
  	mutex_init(&intc->lock);
  
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
  	pruss_intc_init(intc);
  
  	irqchip = devm_kzalloc(dev, sizeof(*irqchip), GFP_KERNEL);
-	if (!irqchip)
-		return -ENOMEM;
+	if (!irqchip) {
+		err = -ENOMEM;
+		goto fail_alloc;
+	}
  
  	irqchip->irq_ack = pruss_intc_irq_ack;
  	irqchip->irq_mask = pruss_intc_irq_mask;
@@ -338,14 +665,24 @@ static int pruss_intc_probe(struct platform_device *pdev)
  	irqchip->irq_release_resources = pruss_intc_irq_relres;
  	irqchip->irq_get_irqchip_state = pruss_intc_irq_get_irqchip_state;
  	irqchip->irq_set_irqchip_state = pruss_intc_irq_set_irqchip_state;
+	irqchip->parent_device = dev;
  	irqchip->name = dev_name(dev);
  	intc->irqchip = irqchip;
  
-	/* always 64 events */
-	intc->domain = irq_domain_add_linear(dev->of_node, MAX_PRU_SYS_EVENTS,
-					     &pruss_intc_irq_domain_ops, intc);
-	if (!intc->domain)
-		return -ENOMEM;
+	for (i = 0; i < NUM_TI_PRUSS_INTC_DOMAIN; i++) {
+		intc->domain[i].intc = intc;
+		intc->domain[i].id = i;
+		/* always 64 events */
+		intc->domain[i].domain = irq_domain_add_linear(dev->of_node,
+				MAX_PRU_SYS_EVENTS, &pruss_intc_irq_domain_ops,
+				&intc->domain[i]);
+		if (!intc->domain[i].domain) {
+			while (--i >= 0)
+				irq_domain_remove(intc->domain[i].domain);
+			err = -ENOMEM;
+			goto fail_alloc;
+		}
+	}
  
  	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
  		irq = platform_get_irq_byname(pdev, irq_names[i]);
@@ -356,6 +693,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
  
  			dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
  				irq_names[i], irq);
+			err = irq;
  			goto fail_irq;
  		}
  
@@ -372,13 +710,20 @@ static int pruss_intc_probe(struct platform_device *pdev)
  			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
  							 NULL);
  	}
-	irq_domain_remove(intc->domain);
-	return irq;
+	for (i = 0; i < NUM_TI_PRUSS_INTC_DOMAIN; i++)
+		irq_domain_remove(intc->domain[i].domain);
+
+fail_alloc:
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+
+	return err;
  }
  
  static int pruss_intc_remove(struct platform_device *pdev)
  {
  	struct pruss_intc *intc = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
  	unsigned int hwirq;
  	int i;
  
@@ -388,9 +733,15 @@ static int pruss_intc_remove(struct platform_device *pdev)
  							 NULL);
  	}
  
-	for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
-		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
-	irq_domain_remove(intc->domain);
+	for (i = 0; i < NUM_TI_PRUSS_INTC_DOMAIN; i++) {
+		for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
+			irq_dispose_mapping(irq_find_mapping(
+					    intc->domain[i].domain, hwirq));
+		irq_domain_remove(intc->domain[i].domain);
+	}
+
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
  
  	return 0;
  }
diff --git a/include/dt-bindings/interrupt-controller/ti-pruss.h b/include/dt-bindings/interrupt-controller/ti-pruss.h
new file mode 100644
index 000000000000..326a68c31bce
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/ti-pruss.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * This header provides constants for the Texas Instruments Programmable
+ * Realtime Unit Subsystem (PRUSS) interrupt controller.
+ */
+
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_TI_PRUSS_H
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_TI_PRUSS_H
+
+/* interrupt specifier for optional cell 1 */
+
+#define TI_PRUSS_INTC_EVTSEL_ANY	0xffffffff
+
+/* interrupt specifier for cell #interrupt-cells - 1 */
+
+/* host interrupt is connected to PRU cores, e.g. host events 0 and 1 */
+#define TI_PRUSS_INTC_DOMAIN_PRU	0
+/* host interrupt is connected to MCU's interrupt controller  */
+#define TI_PRUSS_INTC_DOMAIN_MCU	1
+/* host interrupt is connected to DSP's interrupt controller  */
+#define TI_PRUSS_INTC_DOMAIN_DSP	2
+/* host interrupt is connected to the auxillary PRU cores  */
+#define TI_PRUSS_INTC_DOMAIN_RTU_PRU	3
+/* host interrupt is connected to the task managers  */
+#define TI_PRUSS_INTC_DOMAIN_TASK	4
+
+#endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_TI_PRUSS_H */
-- 
2.17.1

