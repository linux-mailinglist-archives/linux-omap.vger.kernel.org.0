Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCAC1E3E43
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 12:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgE0KAj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 06:00:39 -0400
Received: from foss.arm.com ([217.140.110.172]:35034 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387721AbgE0KAi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 May 2020 06:00:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B47C1106F;
        Wed, 27 May 2020 03:00:37 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.61])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B59313F6C4;
        Wed, 27 May 2020 03:00:27 -0700 (PDT)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, qperret@google.com, bsegall@google.com,
        mgorman@suse.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, khilman@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, lukasz.luba@arm.com,
        patrick.bellasi@matbug.net, orjan.eide@arm.com,
        rdunlap@infradead.org, mka@chromium.org
Subject: [PATCH v8 2/8] PM / EM: introduce em_dev_register_perf_domain function
Date:   Wed, 27 May 2020 10:58:48 +0100
Message-Id: <20200527095854.21714-3-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527095854.21714-1-lukasz.luba@arm.com>
References: <20200527095854.21714-1-lukasz.luba@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add now function in the Energy Model framework which is going to support
new devices. This function will help in transition and make it smoother.
For now it still checks if the cpumask is a valid pointer, which will be
removed later when the new structures and infrastructure will be ready.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Quentin Perret <qperret@google.com>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h | 13 ++++++++++--
 kernel/power/energy_model.c  | 40 ++++++++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index fe336a9eb5d4..7c048df98447 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_ENERGY_MODEL_H
 #define _LINUX_ENERGY_MODEL_H
 #include <linux/cpumask.h>
+#include <linux/device.h>
 #include <linux/jump_label.h>
 #include <linux/kobject.h>
 #include <linux/rcupdate.h>
@@ -42,7 +43,7 @@ struct em_perf_domain {
 #define em_span_cpus(em) (to_cpumask((em)->cpus))
 
 #ifdef CONFIG_ENERGY_MODEL
-#define EM_CPU_MAX_POWER 0xFFFF
+#define EM_MAX_POWER 0xFFFF
 
 struct em_data_callback {
 	/**
@@ -59,7 +60,7 @@ struct em_data_callback {
 	 * and frequency.
 	 *
 	 * The power is the one of a single CPU in the domain, expressed in
-	 * milli-watts. It is expected to fit in the [0, EM_CPU_MAX_POWER]
+	 * milli-watts. It is expected to fit in the [0, EM_MAX_POWER]
 	 * range.
 	 *
 	 * Return 0 on success.
@@ -71,6 +72,8 @@ struct em_data_callback {
 struct em_perf_domain *em_cpu_get(int cpu);
 int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
 						struct em_data_callback *cb);
+int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
+				struct em_data_callback *cb, cpumask_t *span);
 
 /**
  * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
@@ -174,6 +177,12 @@ static inline int em_register_perf_domain(cpumask_t *span,
 {
 	return -EINVAL;
 }
+static inline
+int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
+				struct em_data_callback *cb, cpumask_t *span)
+{
+	return -EINVAL;
+}
 static inline struct em_perf_domain *em_cpu_get(int cpu)
 {
 	return NULL;
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 9892d548a0fa..875b163e54ab 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -125,7 +125,7 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 		 * The power returned by active_state() is expected to be
 		 * positive, in milli-watts and to fit into 16 bits.
 		 */
-		if (!power || power > EM_CPU_MAX_POWER) {
+		if (!power || power > EM_MAX_POWER) {
 			pr_err("pd%d: invalid power: %lu\n", cpu, power);
 			goto free_ps_table;
 		}
@@ -183,10 +183,13 @@ struct em_perf_domain *em_cpu_get(int cpu)
 EXPORT_SYMBOL_GPL(em_cpu_get);
 
 /**
- * em_register_perf_domain() - Register the Energy Model of a performance domain
- * @span	: Mask of CPUs in the performance domain
+ * em_dev_register_perf_domain() - Register the Energy Model (EM) for a device
+ * @dev		: Device for which the EM is to register
  * @nr_states	: Number of performance states to register
  * @cb		: Callback functions providing the data of the Energy Model
+ * @span	: Pointer to cpumask_t, which in case of a CPU device is
+ *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
+ *		type of devices this should be set to NULL.
  *
  * Create Energy Model tables for a performance domain using the callbacks
  * defined in cb.
@@ -196,14 +199,14 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
  *
  * Return 0 on success
  */
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb)
+int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
+				struct em_data_callback *cb, cpumask_t *span)
 {
 	unsigned long cap, prev_cap = 0;
 	struct em_perf_domain *pd;
 	int cpu, ret = 0;
 
-	if (!span || !nr_states || !cb)
+	if (!dev || !span || !nr_states || !cb)
 		return -EINVAL;
 
 	/*
@@ -255,4 +258,29 @@ int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
+
+/**
+ * em_register_perf_domain() - Register the Energy Model of a performance domain
+ * @span	: Mask of CPUs in the performance domain
+ * @nr_states	: Number of capacity states to register
+ * @cb		: Callback functions providing the data of the Energy Model
+ *
+ * Create Energy Model tables for a performance domain using the callbacks
+ * defined in cb.
+ *
+ * If multiple clients register the same performance domain, all but the first
+ * registration will be ignored.
+ *
+ * Return 0 on success
+ */
+int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
+						struct em_data_callback *cb)
+{
+	struct device *cpu_dev;
+
+	cpu_dev = get_cpu_device(cpumask_first(span));
+
+	return em_dev_register_perf_domain(cpu_dev, nr_states, cb, span);
+}
 EXPORT_SYMBOL_GPL(em_register_perf_domain);
-- 
2.17.1

