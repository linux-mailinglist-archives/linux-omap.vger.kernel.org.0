Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DF91CD7A5
	for <lists+linux-omap@lfdr.de>; Mon, 11 May 2020 13:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbgEKLUU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 07:20:20 -0400
Received: from foss.arm.com ([217.140.110.172]:57138 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgEKLUT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 May 2020 07:20:19 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0827101E;
        Mon, 11 May 2020 04:20:18 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.83])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA2423F305;
        Mon, 11 May 2020 04:20:08 -0700 (PDT)
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
Subject: [PATCH v7 04/15] PM / EM: add support for other devices than CPUs in Energy Model
Date:   Mon, 11 May 2020 12:19:01 +0100
Message-Id: <20200511111912.3001-5-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511111912.3001-1-lukasz.luba@arm.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add support for other devices that CPUs. The registration function
does not require a valid cpumask pointer and is ready to handle new
devices. Some of the internal structures has been reorganized in order to
keep consistent view (like removing per_cpu pd pointers). To track usage
of the Energy Model structures, they are protected with kref.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/device.h       |   5 +
 include/linux/energy_model.h |  28 +++--
 kernel/power/energy_model.c  | 237 ++++++++++++++++++++++++-----------
 3 files changed, 187 insertions(+), 83 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index ac8e37cd716a..7023d3ea189b 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -13,6 +13,7 @@
 #define _DEVICE_H_
 
 #include <linux/dev_printk.h>
+#include <linux/energy_model.h>
 #include <linux/ioport.h>
 #include <linux/kobject.h>
 #include <linux/klist.h>
@@ -559,6 +560,10 @@ struct device {
 	struct dev_pm_info	power;
 	struct dev_pm_domain	*pm_domain;
 
+#ifdef CONFIG_ENERGY_MODEL
+	struct em_perf_domain	*em_pd;
+#endif
+
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 	struct irq_domain	*msi_domain;
 #endif
diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index 7076cb22b247..f5a88486d1c4 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -12,8 +12,10 @@
 
 /**
  * em_perf_state - Performance state of a performance domain
- * @frequency:	The CPU frequency in KHz, for consistency with CPUFreq
- * @power:	The power consumed by 1 CPU at this level, in milli-watts
+ * @frequency:	The frequency in KHz, for consistency with CPUFreq
+ * @power:	The power consumed at this level, in milli-watts (by 1 CPU or
+		by a registered device). It can be a total power: static and
+		dynamic.
  * @cost:	The cost coefficient associated with this level, used during
  *		energy calculation. Equal to: power * max_frequency / frequency
  */
@@ -27,12 +29,15 @@ struct em_perf_state {
  * em_perf_domain - Performance domain
  * @table:		List of performance states, in ascending order
  * @nr_perf_states:	Number of performance states
- * @cpus:		Cpumask covering the CPUs of the domain
+ * @cpus:		Cpumask covering the CPUs of the domain. It's here
+ *			for performance reasons to avoid potential cache
+ *			misses during energy calculations in the scheduler
  *
- * A "performance domain" represents a group of CPUs whose performance is
- * scaled together. All CPUs of a performance domain must have the same
- * micro-architecture. Performance domains often have a 1-to-1 mapping with
- * CPUFreq policies.
+ * In case of CPU device, a "performance domain" represents a group of CPUs
+ * whose performance is scaled together. All CPUs of a performance domain
+ * must have the same micro-architecture. Performance domains often have
+ * a 1-to-1 mapping with CPUFreq policies. In case of other devices the 'cpus'
+ * field is unused.
  */
 struct em_perf_domain {
 	struct em_perf_state *table;
@@ -71,10 +76,12 @@ struct em_data_callback {
 #define EM_DATA_CB(_active_power_cb) { .active_power = &_active_power_cb }
 
 struct em_perf_domain *em_cpu_get(int cpu);
+struct em_perf_domain *em_pd_get(struct device *dev);
 int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
 						struct em_data_callback *cb);
 int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 				struct em_data_callback *cb, cpumask_t *span);
+void em_dev_unregister_perf_domain(struct device *dev);
 
 /**
  * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
@@ -184,10 +191,17 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 {
 	return -EINVAL;
 }
+static inline void em_dev_unregister_perf_domain(struct device *dev)
+{
+}
 static inline struct em_perf_domain *em_cpu_get(int cpu)
 {
 	return NULL;
 }
+static inline struct em_perf_domain *em_pd_get(struct device *dev)
+{
+	return NULL;
+}
 static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 			unsigned long max_util, unsigned long sum_util)
 {
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 5b8a1566526a..9cc7f2973600 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -2,8 +2,9 @@
 /*
  * Energy Model of CPUs
  *
- * Copyright (c) 2018, Arm ltd.
+ * Copyright (c) 2018-2020, Arm ltd.
  * Written by: Quentin Perret, Arm ltd.
+ * Improvements provided by: Lukasz Luba, Arm ltd.
  */
 
 #define pr_fmt(fmt) "energy_model: " fmt
@@ -15,15 +16,17 @@
 #include <linux/sched/topology.h>
 #include <linux/slab.h>
 
-/* Mapping of each CPU to the performance domain to which it belongs. */
-static DEFINE_PER_CPU(struct em_perf_domain *, em_data);
-
 /*
  * Mutex serializing the registrations of performance domains and letting
  * callbacks defined by drivers sleep.
  */
 static DEFINE_MUTEX(em_pd_mutex);
 
+static bool _is_cpu_device(struct device *dev)
+{
+	return (dev->bus == &cpu_subsys);
+}
+
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *rootdir;
 
@@ -49,22 +52,30 @@ static int em_debug_cpus_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(em_debug_cpus);
 
-static void em_debug_create_pd(struct em_perf_domain *pd, int cpu)
+static void em_debug_create_pd(struct device *dev)
 {
 	struct dentry *d;
-	char name[8];
 	int i;
 
-	snprintf(name, sizeof(name), "pd%d", cpu);
-
 	/* Create the directory of the performance domain */
-	d = debugfs_create_dir(name, rootdir);
+	d = debugfs_create_dir(dev_name(dev), rootdir);
 
-	debugfs_create_file("cpus", 0444, d, pd->cpus, &em_debug_cpus_fops);
+	if (_is_cpu_device(dev))
+		debugfs_create_file("cpus", 0444, d, dev->em_pd->cpus,
+				    &em_debug_cpus_fops);
 
 	/* Create a sub-directory for each performance state */
-	for (i = 0; i < pd->nr_perf_states; i++)
-		em_debug_create_ps(&pd->table[i], d);
+	for (i = 0; i < dev->em_pd->nr_perf_states; i++)
+		em_debug_create_ps(&dev->em_pd->table[i], d);
+
+}
+
+static void em_debug_remove_pd(struct device *dev)
+{
+	struct dentry *debug_dir;
+
+	debug_dir = debugfs_lookup(dev_name(dev), rootdir);
+	debugfs_remove_recursive(debug_dir);
 }
 
 static int __init em_debug_init(void)
@@ -76,40 +87,34 @@ static int __init em_debug_init(void)
 }
 core_initcall(em_debug_init);
 #else /* CONFIG_DEBUG_FS */
-static void em_debug_create_pd(struct em_perf_domain *pd, int cpu) {}
+static void em_debug_create_pd(struct device *dev) {}
+static void em_debug_remove_pd(struct device *dev) {}
 #endif
-static struct em_perf_domain *
-em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
-	     cpumask_t *span)
+
+static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
+				int nr_states, struct em_data_callback *cb)
 {
 	unsigned long opp_eff, prev_opp_eff = ULONG_MAX;
 	unsigned long power, freq, prev_freq = 0;
-	int i, ret, cpu = cpumask_first(span);
 	struct em_perf_state *table;
-	struct em_perf_domain *pd;
+	int i, ret;
 	u64 fmax;
 
-	if (!cb->active_power)
-		return NULL;
-
-	pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
-	if (!pd)
-		return NULL;
-
 	table = kcalloc(nr_states, sizeof(*table), GFP_KERNEL);
 	if (!table)
-		goto free_pd;
+		return -ENOMEM;
 
 	/* Build the list of performance states for this performance domain */
 	for (i = 0, freq = 0; i < nr_states; i++, freq++) {
 		/*
 		 * active_power() is a driver callback which ceils 'freq' to
-		 * lowest performance state of 'cpu' above 'freq' and updates
+		 * lowest performance state of 'dev' above 'freq' and updates
 		 * 'power' and 'freq' accordingly.
 		 */
 		ret = cb->active_power(&power, &freq, dev);
 		if (ret) {
-			pr_err("pd%d: invalid perf. state: %d\n", cpu, ret);
+			dev_err(dev, "EM: invalid perf. state: %d\n",
+				ret);
 			goto free_ps_table;
 		}
 
@@ -118,7 +123,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
 		 * higher performance states.
 		 */
 		if (freq <= prev_freq) {
-			pr_err("pd%d: non-increasing freq: %lu\n", cpu, freq);
+			dev_err(dev, "EM: non-increasing freq: %lu\n",
+				freq);
 			goto free_ps_table;
 		}
 
@@ -127,7 +133,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
 		 * positive, in milli-watts and to fit into 16 bits.
 		 */
 		if (!power || power > EM_MAX_POWER) {
-			pr_err("pd%d: invalid power: %lu\n", cpu, power);
+			dev_err(dev, "EM: invalid power: %lu\n",
+				power);
 			goto free_ps_table;
 		}
 
@@ -142,8 +149,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
 		 */
 		opp_eff = freq / power;
 		if (opp_eff >= prev_opp_eff)
-			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
-					cpu, i, i - 1);
+			dev_dbg(dev, "EM: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
+					i, i - 1);
 		prev_opp_eff = opp_eff;
 	}
 
@@ -156,30 +163,82 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
 
 	pd->table = table;
 	pd->nr_perf_states = nr_states;
-	cpumask_copy(to_cpumask(pd->cpus), span);
-
-	em_debug_create_pd(pd, cpu);
 
-	return pd;
+	return 0;
 
 free_ps_table:
 	kfree(table);
-free_pd:
-	kfree(pd);
+	return -EINVAL;
+}
+
+static int em_create_pd(struct device *dev, int nr_states,
+			struct em_data_callback *cb, cpumask_t *cpus)
+{
+	struct em_perf_domain *pd;
+	struct device *cpu_dev;
+	int cpu, ret;
+
+	if (_is_cpu_device(dev)) {
+		pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
+		if (!pd)
+			return -ENOMEM;
+
+		cpumask_copy(em_span_cpus(pd), cpus);
+	} else {
+		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
+		if (!pd)
+			return -ENOMEM;
+	}
+
+	ret = em_create_perf_table(dev, pd, nr_states, cb);
+	if (ret) {
+		kfree(pd);
+		return ret;
+	}
 
-	return NULL;
+	if (_is_cpu_device(dev))
+		for_each_cpu(cpu, cpus) {
+			cpu_dev = get_cpu_device(cpu);
+			cpu_dev->em_pd = pd;
+		}
+	else
+		dev->em_pd = pd;
+
+	return 0;
 }
 
+/**
+ * em_pd_get() - Return the performance domain for a device
+ * @dev : Device to find the performance domain for
+ *
+ * Returns the performance domain to which 'dev' belongs, or NULL if it doesn't
+ * exist.
+ */
+struct em_perf_domain *em_pd_get(struct device *dev)
+{
+	if (IS_ERR_OR_NULL(dev))
+		return NULL;
+
+	return dev->em_pd;
+}
+EXPORT_SYMBOL_GPL(em_pd_get);
+
 /**
  * em_cpu_get() - Return the performance domain for a CPU
  * @cpu : CPU to find the performance domain for
  *
- * Return: the performance domain to which 'cpu' belongs, or NULL if it doesn't
+ * Returns the performance domain to which 'cpu' belongs, or NULL if it doesn't
  * exist.
  */
 struct em_perf_domain *em_cpu_get(int cpu)
 {
-	return READ_ONCE(per_cpu(em_data, cpu));
+	struct device *cpu_dev;
+
+	cpu_dev = get_cpu_device(cpu);
+	if (!cpu_dev)
+		return NULL;
+
+	return em_pd_get(cpu_dev);
 }
 EXPORT_SYMBOL_GPL(em_cpu_get);
 
@@ -188,7 +247,7 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
  * @dev		: Device for which the EM is to register
  * @nr_states	: Number of performance states to register
  * @cb		: Callback functions providing the data of the Energy Model
- * @span	: Pointer to cpumask_t, which in case of a CPU device is
+ * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
  *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
  *		type of devices this should be set to NULL.
  *
@@ -201,13 +260,12 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
  * Return 0 on success
  */
 int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
-				struct em_data_callback *cb, cpumask_t *span)
+				struct em_data_callback *cb, cpumask_t *cpus)
 {
 	unsigned long cap, prev_cap = 0;
-	struct em_perf_domain *pd;
-	int cpu, ret = 0;
+	int cpu, ret;
 
-	if (!dev || !span || !nr_states || !cb)
+	if (!dev || !nr_states || !cb)
 		return -EINVAL;
 
 	/*
@@ -216,47 +274,50 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 	 */
 	mutex_lock(&em_pd_mutex);
 
-	for_each_cpu(cpu, span) {
-		/* Make sure we don't register again an existing domain. */
-		if (READ_ONCE(per_cpu(em_data, cpu))) {
-			ret = -EEXIST;
-			goto unlock;
-		}
+	if (dev->em_pd) {
+		ret = -EEXIST;
+		goto unlock;
+	}
 
-		/*
-		 * All CPUs of a domain must have the same micro-architecture
-		 * since they all share the same table.
-		 */
-		cap = arch_scale_cpu_capacity(cpu);
-		if (prev_cap && prev_cap != cap) {
-			pr_err("CPUs of %*pbl must have the same capacity\n",
-							cpumask_pr_args(span));
+	if (_is_cpu_device(dev)) {
+		if (!cpus) {
+			dev_err(dev, "EM: invalid CPU mask\n");
 			ret = -EINVAL;
 			goto unlock;
 		}
-		prev_cap = cap;
+
+		for_each_cpu(cpu, cpus) {
+			if (em_cpu_get(cpu)) {
+				dev_err(dev, "EM: exists for CPU%d\n", cpu);
+				ret = -EEXIST;
+				goto unlock;
+			}
+			/*
+			 * All CPUs of a domain must have the same
+			 * micro-architecture since they all share the same
+			 * table.
+			 */
+			cap = arch_scale_cpu_capacity(cpu);
+			if (prev_cap && prev_cap != cap) {
+				dev_err(dev, "EM: CPUs of %*pbl must have the same capacity\n",
+					cpumask_pr_args(cpus));
+
+				ret = -EINVAL;
+				goto unlock;
+			}
+			prev_cap = cap;
+		}
 	}
 
-	/* Create the performance domain and add it to the Energy Model. */
-	pd = em_create_pd(dev, nr_states, cb, span);
-	if (!pd) {
-		ret = -EINVAL;
+	ret = em_create_pd(dev, nr_states, cb, cpus);
+	if (ret)
 		goto unlock;
-	}
 
-	for_each_cpu(cpu, span) {
-		/*
-		 * The per-cpu array can be read concurrently from em_cpu_get().
-		 * The barrier enforces the ordering needed to make sure readers
-		 * can only access well formed em_perf_domain structs.
-		 */
-		smp_store_release(per_cpu_ptr(&em_data, cpu), pd);
-	}
+	em_debug_create_pd(dev);
+	dev_info(dev, "EM: created perf domain\n");
 
-	pr_debug("Created perf domain %*pbl\n", cpumask_pr_args(span));
 unlock:
 	mutex_unlock(&em_pd_mutex);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
@@ -285,3 +346,27 @@ int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
 	return em_dev_register_perf_domain(cpu_dev, nr_states, cb, span);
 }
 EXPORT_SYMBOL_GPL(em_register_perf_domain);
+
+/**
+ * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
+ * @dev		: Device for which the EM is registered
+ *
+ * Try to unregister the EM for the specified device (but not a CPU).
+ */
+void em_dev_unregister_perf_domain(struct device *dev)
+{
+	if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
+		return;
+
+	if (_is_cpu_device(dev))
+		return;
+
+	mutex_lock(&em_pd_mutex);
+	em_debug_remove_pd(dev);
+
+	kfree(dev->em_pd->table);
+	kfree(dev->em_pd);
+	dev->em_pd = NULL;
+	mutex_unlock(&em_pd_mutex);
+}
+EXPORT_SYMBOL_GPL(em_dev_unregister_perf_domain);
-- 
2.17.1

