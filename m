Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77E866617B
	for <lists+linux-omap@lfdr.de>; Fri, 12 Jul 2019 00:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfGKWJo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Jul 2019 18:09:44 -0400
Received: from vern.gendns.com ([98.142.107.122]:53490 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbfGKWJo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Jul 2019 18:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=freMBclZSJghQt1pjJlm67Fv5NrDKd9Bj0GxbcW/Lk8=; b=cfp4ap9wS7dcU+2RCAg59D28Sm
        vl2TtkUFk/LXxAXfoElrZNbo58O1dL3/Kp1rDh2ZSMYFRnc3Vhbm84Hzifa+mb575dHbVuXrhQmZ1
        fse2y6pMcvLxEjvDGvM3L5rjJrZqEa88phmw8hYN60s+C7QkSHBGmiIHawK2BoQ0vNaNwEw7OE6nR
        MFSdNdOjJOYNw79q+7r+ay8yD19rdZXnHW7jYt3BsjdpPX3pWnf1Iv7ymstwajqlRAb92dnokU5rk
        vTqCqchTFywQ6TTgMLlADIMmkbqov3/LUVNncGDAcFpYGmAGEEzrCxjWkgyVPN7+mg1AWrXBYyZUd
        Tz68hwgg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:35282 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hlhFz-004xwy-B9; Thu, 11 Jul 2019 18:09:39 -0400
Subject: Re: [PATCH 4/6] irqchip/irq-pruss-intc: Add helper functions to
 configure internal mapping
From:   David Lechner <david@lechnology.com>
To:     Suman Anna <s-anna@ti.com>, Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Cc:     Tony Lindgren <tony@atomide.com>, "Andrew F. Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-5-s-anna@ti.com>
 <9aa5acd8-81bf-10dc-5a86-cea2acd1132b@lechnology.com>
Message-ID: <fb2bdb7b-4d4d-508f-722a-554888280145@lechnology.com>
Date:   Thu, 11 Jul 2019 17:09:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9aa5acd8-81bf-10dc-5a86-cea2acd1132b@lechnology.com>
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

On 7/10/19 10:10 PM, David Lechner wrote:
> On 7/7/19 10:52 PM, Suman Anna wrote:
>> The PRUSS INTC receives a number of system input interrupt source events
>> and supports individual control configuration and hardware prioritization.
>> These input events can be mapped to some output host interrupts through 2
>> levels of many-to-one mapping i.e. events to channel mapping and channels
>> to host interrupts.
>>
>> This mapping information is provided through the PRU firmware that is
>> loaded onto a PRU core/s or through the device tree node of the PRU
> 
> What will the device tree bindings for this look like?
> 
> Looking back at Rob's comment on the initial series [1], I still think
> that increasing the #interrupt-cells sounds like a reasonable solution.
> 
> [1]: https://patchwork.kernel.org/patch/10697705/#22375155
> 

I have come up with an alternative to this patch that addresses my
previous comments.

I propose that we change the device tree bindings to have:

     #interrupt-cells = <3>;

Where the parameters are the system event, the channel and the host
event.

In the case of AM18xx, we will need 4 cells, with the 4th one being
the EVTSEL value (the first 32 events are multiplexed so just giving
the system event is not enough info).

With the patch below, we don't need to introduce any new public APIs.
Instead, we implement the irqchip xlate callback. This parses the
device tree parameters and saves them for later.

For the case where the mapping comes from the PRU firmware instead
of the device tree, the remoteproc driver can just call
irq_create_fwspec_mapping() to register the mapping and the same
xlate function handle it just the same as if it came from a device
tree.

The channel mapping is now done in the irqchip map callback. Reference
counting is used to allow shared channels and host events and still
give an error when there are conflicting requests. This also simplifies
the code a bit since we aren't dealing with multiple mappings at one time.

There is a bit more work to do to get EVTSEL working on AM18xx, but
I've tested that both device tree and irq_create_fwspec_mapping()
work.

Complete set of my hacks can be found at [1].

[1]: https://github.com/dlech/linux/tree/pruss-2019-07-11

---
 From 199a13a2f224489bd95e03424c0ae98744dea364 Mon Sep 17 00:00:00 2001
From: Suman Anna <s-anna@ti.com>
Date: Sun, 7 Jul 2019 22:52:41 -0500
Subject: [PATCH] irqchip/irq-pruss-intc: Add event mapping support

The PRUSS INTC receives a number of system input interrupt source events
and supports individual control configuration and hardware prioritization.
These input events can be mapped to some output host interrupts through 2
levels of many-to-one mapping i.e. events to channel mapping and channels
to host interrupts.

This mapping information is provided through the PRU firmware that is
loaded onto a PRU core/s or through the device tree node of the PRU
application. The mapping is configured when an IRQ is requested, and
cleaned up when the IRQ is freed. Reference counting is used to allow
multiple system events to share a single channel and to allow multiple
channels to share a single host event.

The remoteproc driver can register mappings read from a firmware blob
as shown below. The fwnode parameters must match the device tree
bindings.

	struct irq_fwspec fwspec;
	int irq;

	fwspec.fwnode = of_node_to_fwnode(dev->of_node);
	fwspec.param_count = 3;
	fwspec.param[0] = 63; // system event
	fwspec.param[1] = 5;  // channel
	fwspec.param[2] = 6;  // host event

	irq = irq_create_fwspec_mapping(&fwspec);
	if (irq < 0) {
		dev_err(dev, "failed to get irq\n");
		return irq;
	}

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: David Lechner <david@lechnology.com>
---
  drivers/irqchip/irq-pruss-intc.c | 302 ++++++++++++++++++++++++++++++-
  1 file changed, 293 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 142d01b434e0..dd14addfd0b4 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -13,6 +13,7 @@
  #include <linux/module.h>
  #include <linux/of_device.h>
  #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
  
  /*
   * Number of host interrupts reaching the main MPU sub-system. Note that this
@@ -24,6 +25,12 @@
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
  
@@ -57,29 +64,71 @@
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
  /**
   * struct pruss_intc - PRUSS interrupt controller structure
+ * @hwirq_data: Table of additional mapping data received from device tree
+ *	or PRU firmware
+ * @evtsel: Tracks the current state of CFGCHIP3[3].PRUSSEVTSEL (AM18xx only)
+ * @event_channel: Tracks the current state of system event to channel mappings
+ * @channel_host: Tracks the current state of channel to host mappings
   * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
   * @base: base virtual address of INTC register space
   * @irqchip: irq chip for this interrupt controller
   * @domain: irq domain for this interrupt controller
   * @lock: mutex to serialize access to INTC
- * @host_mask: indicate which HOST IRQs are enabled
   * @shared_intr: bit-map denoting if the MPU host interrupt is shared
   * @invalid_intr: bit-map denoting if host interrupt is connected to MPU
+ * @has_evtsel: indicates that the chip has an event select mux
   */
  struct pruss_intc {
+	struct pruss_intc_hwirq_data hwirq_data[MAX_PRU_SYS_EVENTS];
+	struct pruss_intc_map_record evtsel;
+	struct pruss_intc_map_record event_channel[MAX_PRU_SYS_EVENTS];
+	struct pruss_intc_map_record channel_host[MAX_PRU_CHANNELS];
  	unsigned int irqs[MAX_NUM_HOST_IRQS];
  	void __iomem *base;
  	struct irq_chip *irqchip;
  	struct irq_domain *domain;
  	struct mutex lock; /* PRUSS INTC lock */
-	u32 host_mask;
  	u16 shared_intr;
  	u16 invalid_intr;
+	bool has_evtsel;
  };
  
  static inline u32 pruss_intc_read_reg(struct pruss_intc *intc, unsigned int reg)
@@ -107,6 +156,170 @@ static int pruss_intc_check_write(struct pruss_intc *intc, unsigned int reg,
  	return 0;
  }
  
+/**
+ * pruss_intc_map() - configure the PRUSS INTC
+ * @intc: pru intc pointer
+ * @hwirq: the system event number
+ *
+ * Configures the PRUSS INTC with the provided configuration from the one
+ * parsed in the xlate function. Any existing event to channel mappings or
+ * channel to host interrupt mappings are checked to make sure there are no
+ * conflicting configuration between both the PRU cores.
+ *
+ * Returns 0 on success, or a suitable error code otherwise
+ */
+static int pruss_intc_map(struct pruss_intc *intc, unsigned long hwirq)
+{
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
+	evtsel = intc->hwirq_data[hwirq].evtsel;
+	ch = intc->hwirq_data[hwirq].channel;
+	host = intc->hwirq_data[hwirq].host;
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
+		dev_err(dev, "channel %d (req. intr_no %d) already assigned to intr_no %d\n",
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
+	dev_info(dev, "mapped system_event = %lu channel = %d host = %d\n",
+		 hwirq, ch, host);
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
+ * @intc: pru intc pointer
+ * @hwirq: the system event number
+ *
+ * Undo whatever was done in pruss_intc_map() for a PRU core.
+ * Mappings are reference counted, so resources are only disabled when there
+ * are no longer any users.
+ */
+static void pruss_intc_unmap(struct pruss_intc *intc, unsigned long hwirq)
+{
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
@@ -173,10 +386,53 @@ static void pruss_intc_irq_relres(struct irq_data *data)
  	module_put(THIS_MODULE);
  }
  
+static int
+pruss_intc_irq_domain_xlate(struct irq_domain *d, struct device_node *node,
+			    const u32 *intspec, unsigned int intsize,
+			    unsigned long *out_hwirq, unsigned int *out_type)
+{
+	struct pruss_intc *intc = d->host_data;
+	int num_cells = intc->has_evtsel ? 4 : 3;
+	u32 sys_event, channel, host;
+	u32 evtsel = 0;
+
+	if (WARN_ON(intsize != num_cells))
+		return -EINVAL;
+
+	sys_event = intspec[0];
+	if (sys_event >= MAX_PRU_SYS_EVENTS)
+		return -EINVAL;
+
+	if (intc->has_evtsel)
+		evtsel = intspec[1];
+
+	channel = intspec[intsize - 2];
+	if (channel >= MAX_PRU_CHANNELS)
+		return -EINVAL;
+
+	host = intspec[intsize - 1];
+	if (host >= MAX_PRU_HOST_INT)
+		return -EINVAL;
+
+	intc->hwirq_data[sys_event].evtsel = evtsel;
+	intc->hwirq_data[sys_event].channel = channel;
+	intc->hwirq_data[sys_event].host = host;
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
  	struct pruss_intc *intc = d->host_data;
+	int err;
+
+	err = pruss_intc_map(intc, hw);
+	if (err < 0)
+		return err;
  
  	irq_set_chip_data(virq, intc);
  	irq_set_chip_and_handler(virq, intc->irqchip, handle_level_irq);
@@ -186,12 +442,20 @@ static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
  
  static void pruss_intc_irq_domain_unmap(struct irq_domain *d, unsigned int virq)
  {
+	struct pruss_intc *intc = d->host_data;
+	int i;
+
+	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
+		if (intc->irqs[i] == virq)
+			break;
+
  	irq_set_chip_and_handler(virq, NULL, NULL);
  	irq_set_chip_data(virq, NULL);
+	pruss_intc_unmap(intc, i);
  }
  
  static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
-	.xlate	= irq_domain_xlate_onecell,
+	.xlate	= pruss_intc_irq_domain_xlate,
  	.map	= pruss_intc_irq_domain_map,
  	.unmap	= pruss_intc_irq_domain_unmap,
  };
@@ -247,7 +511,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
  	struct pruss_intc *intc;
  	struct resource *res;
  	struct irq_chip *irqchip;
-	int i, irq, count;
+	int i, err, irq, count;
  	u8 temp_intr[MAX_NUM_HOST_IRQS] = { 0 };
  
  	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
@@ -298,13 +562,20 @@ static int pruss_intc_probe(struct platform_device *pdev)
  		}
  	}
  
+	/* TODO: get intc->has_evtsel from device tree */
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
@@ -312,14 +583,17 @@ static int pruss_intc_probe(struct platform_device *pdev)
  	irqchip->irq_retrigger = pruss_intc_irq_retrigger;
  	irqchip->irq_request_resources = pruss_intc_irq_reqres;
  	irqchip->irq_release_resources = pruss_intc_irq_relres;
+	irqchip->parent_device = dev;
  	irqchip->name = dev_name(dev);
  	intc->irqchip = irqchip;
  
  	/* always 64 events */
  	intc->domain = irq_domain_add_linear(dev->of_node, MAX_PRU_SYS_EVENTS,
  					     &pruss_intc_irq_domain_ops, intc);
-	if (!intc->domain)
-		return -ENOMEM;
+	if (!intc->domain) {
+		err = -ENOMEM;
+		goto fail_alloc;
+	}
  
  	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
  		irq = platform_get_irq_byname(pdev, irq_names[i]);
@@ -330,6 +604,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
  
  			dev_err(dev->parent, "platform_get_irq_byname failed for %s : %d\n",
  				irq_names[i], irq);
+			err = irq;
  			goto fail_irq;
  		}
  
@@ -347,12 +622,18 @@ static int pruss_intc_probe(struct platform_device *pdev)
  							 NULL);
  	}
  	irq_domain_remove(intc->domain);
-	return irq;
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
  
@@ -369,6 +650,9 @@ static int pruss_intc_remove(struct platform_device *pdev)
  		irq_domain_remove(intc->domain);
  	}
  
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+
  	return 0;
  }
  
-- 
2.17.1


