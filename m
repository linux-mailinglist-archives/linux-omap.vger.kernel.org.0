Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7165212610
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 16:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgGBOUS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 10:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729794AbgGBOUQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jul 2020 10:20:16 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D52CC08C5DD
        for <linux-omap@vger.kernel.org>; Thu,  2 Jul 2020 07:20:16 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so32416225ljn.4
        for <linux-omap@vger.kernel.org>; Thu, 02 Jul 2020 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/g1pL3/hSl0fTsy5dL717qIUgAnsVErwAcv2lpeHoaY=;
        b=OPuK0bs8473Rb8SzUxiI+RRd1mfxCrbbfDTMSxXud0kgnBLJvxe8UrPa/Gy7Rsf914
         eG8NvZ5JaT8lKCZYSqk5I8uOrTtFl3DZsPDn1TmiCIWS2YnLwsIU3HQ0E5mpavgpZDjK
         H8jCw2W4zVXpZFNjIcQ48esa2f5BQVrbAvQReZk/R/yZsKWiG+7Cb0sc6mkgFC4M7xP3
         H7jwG7B91xcJuwxQ+/1/eAbJY02ioZ0/q35OAx+3ErCdjiMWv9LD4NfPl2OpU4ZHSodI
         3y65FP42qQmy0oL8d1iREkcvNDo/3weTm4BTCyZHQKgrZQFA6OL+0wR+cV3Z+ZQAFHBt
         4F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/g1pL3/hSl0fTsy5dL717qIUgAnsVErwAcv2lpeHoaY=;
        b=tJOo3TPjMmXpIni1qlj/QwtX89/ZKjrqcMCAm+ZdovDRKCQu9OTudwILS9MRbxwWaY
         rjt0Y3iAdeUQC+PorO5NFCljWhIWeiKHuM+DfVRdLLGxKvpPHIwv1FCqqtA/4J7NmtPr
         l/MPUwh5yRqeuVb+zUBTgPlOlH3RFy+EbNelxXrwwxkwc2SZCWNuokUA6umoLMEy5ZuK
         60Aj6jXbv9n9YlaZFRLs8OCht8wW4/oZpbXtUJhll0Hidn5TQhdHbOi2SFgqcri+IdFS
         YERHBEDbq4mm1UWLD2tKeI8v2tgfYFpJ116KgtDCRy/PJvyHss7pU/M8CDIj3BK5k2Aa
         hfPw==
X-Gm-Message-State: AOAM531lq2r8Ze2wy6wrMe6iyjZ47WuNyG36l13CJ162O2AQLUtUJCC/
        fY3hEZQ3bazdRy3DSFcZppHurg==
X-Google-Smtp-Source: ABdhPJzDzwX91MztklKLg7OXBXN69Lom5WIb+x5BV9YyBJ8m7FFyW6Nw6nSXYvPwaIKzaeCPmpoXBw==
X-Received: by 2002:a2e:9ed0:: with SMTP id h16mr17588908ljk.366.1593699614324;
        Thu, 02 Jul 2020 07:20:14 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id v10sm692581ljg.113.2020.07.02.07.20.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 07:20:13 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com
Subject: [PATCHv3 6/6] irqchip/irq-pruss-intc: Add event mapping support
Date:   Thu,  2 Jul 2020 16:17:59 +0200
Message-Id: <1593699479-1445-7-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRUSS INTC receives a number of system input interrupt source events
and supports individual control configuration and hardware prioritization.
These input events can be mapped to some output host interrupts through 2
levels of many-to-one mapping i.e. events to channel mapping and channels
to host interrupts.

This mapping information is provided through the PRU firmware that is
loaded onto a PRU core/s or through the device tree node of the PRU
application. The mapping configuration is triggered by the PRU
remoteproc driver, and is setup before the PRU core is started and
cleaned up after the PRU core is stopped. This event mapping
configuration logic programs the Channel Map Registers (CMRx) and
Host-Interrupt Map Registers (HMRx) only when a new program is being
loaded/started and the same events and interrupt channels are reset to
zero when stopping a PRU.

Reference counting is used to allow multiple system events to share a
single channel and to allow multiple channels to share a single host
event.

The remoteproc driver can register mappings read from a firmware blob
as shown below.

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

Suggested-by: David Lechner <david@lechnology.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v3:
- This patch replaces https://patchwork.kernel.org/patch/11069753/
  according to received feedback. Instead of exporting custom functions
  from interrupt driver, the xlate and irq domain map is used for
  interrupt parsing and mapping.
---
 drivers/irqchip/irq-pruss-intc.c | 265 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 264 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 362aa01..cf40a97 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -51,14 +51,42 @@
 #define PRU_INTC_HIER		0x1500
 
 /* CMR register bit-field macros */
+#define CMR_EVT_MAP_MASK	0xf
+#define CMR_EVT_MAP_BITS	8
 #define CMR_EVT_PER_REG		4
 
 /* HMR register bit-field macros */
+#define HMR_CH_MAP_MASK		0xf
+#define HMR_CH_MAP_BITS		8
 #define HMR_CH_PER_REG		4
 
 /* HIPIR register bit-fields */
 #define INTC_HIPIR_NONE_HINT	0x80000000
 
+#define MAX_PRU_SYS_EVENTS 160
+#define MAX_PRU_CHANNELS 20
+
+/**
+ * struct pruss_intc_hwirq_data - additional metadata associated with a PRU
+ * system event
+ * @channel: The PRU INTC channel that the system event should be mapped to
+ * @host: The PRU INTC host that the channel should be mapped to
+ */
+struct pruss_intc_hwirq_data {
+	u8 channel;
+	u8 host;
+};
+
+/**
+ * struct pruss_intc_map_record - keeps track of actual mapping state
+ * @value: The currently mapped value (channel or host)
+ * @ref_count: Keeps track of number of current users of this resource
+ */
+struct pruss_intc_map_record {
+	u8 value;
+	u8 ref_count;
+};
+
 /**
  * struct pruss_intc_match_data - match data to handle SoC variations
  * @num_system_events: number of input system events handled by the PRUSS INTC
@@ -71,18 +99,29 @@ struct pruss_intc_match_data {
 
 /**
  * struct pruss_intc - PRUSS interrupt controller structure
+ * @hwirq_data: table of additional mapping data received from device tree
+ *	or PRU firmware
+ * @event_channel: current state of system event to channel mappings
+ * @channel_host: current state of channel to host mappings
  * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
  * @base: base virtual address of INTC register space
  * @domain: irq domain for this interrupt controller
  * @soc_config: cached PRUSS INTC IP configuration data
+ * @lock: mutex to serialize access to INTC
+ * @dev: PRUSS INTC device pointer
  * @shared_intr: bit-map denoting if the MPU host interrupt is shared
  * @invalid_intr: bit-map denoting if host interrupt is not connected to MPU
  */
 struct pruss_intc {
+	struct pruss_intc_hwirq_data hwirq_data[MAX_PRU_SYS_EVENTS];
+	struct pruss_intc_map_record event_channel[MAX_PRU_SYS_EVENTS];
+	struct pruss_intc_map_record channel_host[MAX_PRU_CHANNELS];
 	unsigned int irqs[MAX_NUM_HOST_IRQS];
 	void __iomem *base;
 	struct irq_domain *domain;
 	const struct pruss_intc_match_data *soc_config;
+	struct mutex lock; /* PRUSS INTC lock */
+	struct device *dev;
 	u16 shared_intr;
 	u16 invalid_intr;
 };
@@ -98,6 +137,165 @@ static inline void pruss_intc_write_reg(struct pruss_intc *intc,
 	writel_relaxed(val, intc->base + reg);
 }
 
+static void pruss_intc_update_cmr(struct pruss_intc *intc, int evt, s8 ch)
+{
+	u32 idx, offset, val;
+
+	idx = evt / CMR_EVT_PER_REG;
+	offset = (evt % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS;
+
+	val = pruss_intc_read_reg(intc, PRU_INTC_CMR(idx));
+	val &= ~(CMR_EVT_MAP_MASK << offset);
+	val |= ch << offset;
+	pruss_intc_write_reg(intc, PRU_INTC_CMR(idx), val);
+
+	dev_dbg(intc->dev, "SYSEV%u -> CH%d (CMR%d 0x%08x)\n", evt, ch,
+		idx, pruss_intc_read_reg(intc, PRU_INTC_CMR(idx)));
+}
+
+static void pruss_intc_update_hmr(struct pruss_intc *intc, int ch, s8 host)
+{
+	u32 idx, offset, val;
+
+	idx = ch / HMR_CH_PER_REG;
+	offset = (ch % HMR_CH_PER_REG) * HMR_CH_MAP_BITS;
+
+	val = pruss_intc_read_reg(intc, PRU_INTC_HMR(idx));
+	val &= ~(HMR_CH_MAP_MASK << offset);
+	val |= host << offset;
+	pruss_intc_write_reg(intc, PRU_INTC_HMR(idx), val);
+
+	dev_dbg(intc->dev, "CH%d -> HOST%d (HMR%d 0x%08x)\n", ch, host, idx,
+		pruss_intc_read_reg(intc, PRU_INTC_HMR(idx)));
+}
+
+/**
+ * pruss_intc_map() - configure the PRUSS INTC
+ * @intc: PRUSS interrupt controller pointer
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
+	struct device *dev = intc->dev;
+	int ret = 0;
+	u8 ch, host, reg_idx;
+	u32 val;
+
+	if (hwirq >= intc->soc_config->num_system_events)
+		return -EINVAL;
+
+	mutex_lock(&intc->lock);
+
+	ch = intc->hwirq_data[hwirq].channel;
+	host = intc->hwirq_data[hwirq].host;
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
+	if (++intc->event_channel[hwirq].ref_count == 1) {
+		intc->event_channel[hwirq].value = ch;
+
+		pruss_intc_update_cmr(intc, hwirq, ch);
+
+		reg_idx = hwirq / 32;
+		val = BIT(hwirq  % 32);
+
+		/* clear and enable system event */
+		pruss_intc_write_reg(intc, PRU_INTC_ESR(reg_idx), val);
+		pruss_intc_write_reg(intc, PRU_INTC_SECR(reg_idx), val);
+	}
+
+	if (++intc->channel_host[ch].ref_count == 1) {
+		intc->channel_host[ch].value = host;
+
+		pruss_intc_update_hmr(intc, ch, host);
+
+		/* enable host interrupts */
+		pruss_intc_write_reg(intc, PRU_INTC_HIEISR, host);
+	}
+
+	dev_dbg(dev, "mapped system_event = %lu channel = %d host = %d",
+		 hwirq, ch, host);
+
+	/* global interrupt enable */
+	pruss_intc_write_reg(intc, PRU_INTC_GER, 1);
+
+unlock:
+	mutex_unlock(&intc->lock);
+	return ret;
+}
+
+/**
+ * pruss_intc_unmap() - unconfigure the PRUSS INTC
+ * @intc: PRUSS interrupt controller pointer
+ * @hwirq: the system event number
+ *
+ * Undo whatever was done in pruss_intc_map() for a PRU core.
+ * Mappings are reference counted, so resources are only disabled when there
+ * are no longer any users.
+ */
+static void pruss_intc_unmap(struct pruss_intc *intc, unsigned long hwirq)
+{
+	u8 ch, host, reg_idx;
+	u32 val;
+
+	if (hwirq >= intc->soc_config->num_system_events)
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
+
+		/* clear the map using reset value 0 */
+		pruss_intc_update_hmr(intc, ch, 0);
+	}
+
+	if (--intc->event_channel[hwirq].ref_count == 0) {
+		reg_idx = hwirq / 32;
+		val = BIT(hwirq  % 32);
+
+		/* disable system events */
+		pruss_intc_write_reg(intc, PRU_INTC_ECR(reg_idx), val);
+		/* clear any pending status */
+		pruss_intc_write_reg(intc, PRU_INTC_SECR(reg_idx), val);
+
+		/* clear the map using reset value 0 */
+		pruss_intc_update_cmr(intc, hwirq, 0);
+	}
+
+	dev_dbg(intc->dev, "unmapped system_event = %lu channel = %d host = %d\n",
+		hwirq, ch, host);
+
+	mutex_unlock(&intc->lock);
+}
+
 static void pruss_intc_init(struct pruss_intc *intc)
 {
 	const struct pruss_intc_match_data *soc_config = intc->soc_config;
@@ -212,10 +410,67 @@ static struct irq_chip pruss_irqchip = {
 	.irq_set_irqchip_state = pruss_intc_irq_set_irqchip_state,
 };
 
+static int
+pruss_intc_irq_domain_xlate(struct irq_domain *d, struct device_node *node,
+			    const u32 *intspec, unsigned int intsize,
+			    unsigned long *out_hwirq, unsigned int *out_type)
+{
+	struct pruss_intc *intc = d->host_data;
+	struct device *dev = intc->dev;
+	int sys_event, channel, host;
+
+	if (intsize == 1) {
+		/*
+		 * In case of short version (intsize == 1) verify if sysevent
+		 * already mapped to channel/host irq if not return error
+		 */
+		sys_event = intspec[0];
+		if (intc->event_channel[sys_event].ref_count)
+			goto already_mapped;
+		else
+			return -EINVAL;
+	}
+
+	if (intsize < 3)
+		return -EINVAL;
+
+	sys_event = intspec[0];
+	if (sys_event < 0 || sys_event >= intc->soc_config->num_system_events) {
+		dev_err(dev, "not valid event number\n");
+		return -EINVAL;
+	}
+
+	channel = intspec[1];
+	if (channel < 0 || channel >= intc->soc_config->num_host_intrs) {
+		dev_err(dev, "not valid channel number");
+		return -EINVAL;
+	}
+
+	host = intspec[2];
+	if (host < 0 || host >= intc->soc_config->num_host_intrs) {
+		dev_err(dev, "not valid host irq number\n");
+		return -EINVAL;
+	}
+
+	intc->hwirq_data[sys_event].channel = channel;
+	intc->hwirq_data[sys_event].host = host;
+
+already_mapped:
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
 	irq_set_chip_and_handler(virq, &pruss_irqchip, handle_level_irq);
@@ -225,12 +480,16 @@ static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
 
 static void pruss_intc_irq_domain_unmap(struct irq_domain *d, unsigned int virq)
 {
+	struct pruss_intc *intc = d->host_data;
+	unsigned long hwirq = irqd_to_hwirq(irq_get_irq_data(virq));
+
 	irq_set_chip_and_handler(virq, NULL, NULL);
 	irq_set_chip_data(virq, NULL);
+	pruss_intc_unmap(intc, hwirq);
 }
 
 static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
-	.xlate	= irq_domain_xlate_onecell,
+	.xlate	= pruss_intc_irq_domain_xlate,
 	.map	= pruss_intc_irq_domain_map,
 	.unmap	= pruss_intc_irq_domain_unmap,
 };
@@ -298,6 +557,8 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
 	if (!intc)
 		return -ENOMEM;
+
+	intc->dev = dev;
 	intc->soc_config = data;
 	platform_set_drvdata(pdev, intc);
 
@@ -355,6 +616,8 @@ static int pruss_intc_probe(struct platform_device *pdev)
 
 	pruss_intc_init(intc);
 
+	mutex_init(&intc->lock);
+
 	intc->domain = irq_domain_add_linear(dev->of_node, max_system_events,
 					     &pruss_intc_irq_domain_ops, intc);
 	if (!intc->domain)
-- 
2.7.4

