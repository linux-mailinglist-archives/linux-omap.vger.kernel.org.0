Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C0567AA2
	for <lists+linux-omap@lfdr.de>; Sat, 13 Jul 2019 16:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbfGMOg7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 13 Jul 2019 10:36:59 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37473 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbfGMOg6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 13 Jul 2019 10:36:58 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so6172007plr.4
        for <linux-omap@vger.kernel.org>; Sat, 13 Jul 2019 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XZJBILp126Ti7TaOUDqWNUxDVtMZQoXCxXFV4fNNfns=;
        b=hk1vqjj1QdEMpt92e0pcd6j7WxLzMOEoQdZTCDjMrNa0HkrUiEsZqeupS0y3sCdn3h
         Okgw6azBc12gCAqKfqOB4Xz1abHnEA2W1X8rB1mW2onlGQobY9xmmxQk7fqBhTiKKo9g
         rgftSUEq14JOriDlp49lotaLGYNPXhdzhYbqQcFQI+v0Eyz4Pxx9gtsdvYb8GjsvB5mD
         IRSjY7lM/CNmTHzDfmdEgdJizOXE2Aspsmh22KnX/okyB2X58gdI8o7euF6zYz1tGRpl
         2R+gmMkM630F3aG5tP3a5yIuGpvrexfQbKqzTSfROSrIwfa4BFYINjNhm1mk9GzD1GEB
         z79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZJBILp126Ti7TaOUDqWNUxDVtMZQoXCxXFV4fNNfns=;
        b=G9Ary3VFy63vi8tfg2KignGQd74/T2zbWShEtlf6jUJgnw9mPl3mcdyHBMe/0QbaN6
         Dj3sXnCONT9JM28TKKfbdTzIgCDJKELp8ARET7P88FKIt1JelJoSXm8ail8YvW2kl4N7
         ScJ7UglcGQEj25fPpdl8t00mII7ylgFHbxrzIDj7IdQl4V3IvBUmEBXVQDX952KIQ4QN
         K4xHlhYD+m4LjMAuXpO9OlPBQSUykRWTUBp0qZNMYd/wJZA6c0TRFur16nEdWajnitAa
         ACKnPojvvgZUCKhJCnNfE3Xz2sL7+pN2dR7xbElYDjknGo4RPE8JSxK71vPGOd8QHaiA
         T43Q==
X-Gm-Message-State: APjAAAX1kvch2WX1V4Lo+0Cdv04cy5TLFVehdLFTstKIqRuckoWVT+ln
        QE5ENWzOan4BZ3LLLRQqD0ViKg==
X-Google-Smtp-Source: APXvYqzEi3863S5AMZlUFLa6M20Uy9xKMDWWJGQSi/hEewmq7vMD722jrBAvpX1vVp+8GdwK/QTEug==
X-Received: by 2002:a17:902:8490:: with SMTP id c16mr18417039plo.1.1563028617618;
        Sat, 13 Jul 2019 07:36:57 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id a15sm9362092pgw.3.2019.07.13.07.36.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 07:36:55 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Kevin Hilman <khilman@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH V2] cpufreq: Make cpufreq_generic_init() return void
Date:   Sat, 13 Jul 2019 20:06:49 +0530
Message-Id: <1435f5d66bcbc29a03593e31c6149259c5b5c64b.1563028513.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <ee8cf5fb4b4a01fdf9199037ff6d835b935cfd13.1562902877.git.viresh.kumar@linaro.org>
References: <ee8cf5fb4b4a01fdf9199037ff6d835b935cfd13.1562902877.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

It always returns 0 (success) and its return type should really be void.
Over that, many drivers have added error handling code based on its
return value, which is not required at all.

change its return type to void and update all the callers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
- Fixed compilation warning with s3c64xx driver by replace %d with %ld
  (Reported by buildbot).

 drivers/cpufreq/bmips-cpufreq.c     |  7 ++-----
 drivers/cpufreq/cpufreq.c           |  4 +---
 drivers/cpufreq/davinci-cpufreq.c   |  3 ++-
 drivers/cpufreq/imx6q-cpufreq.c     |  6 ++----
 drivers/cpufreq/kirkwood-cpufreq.c  |  3 ++-
 drivers/cpufreq/loongson1-cpufreq.c |  8 +++-----
 drivers/cpufreq/loongson2_cpufreq.c |  3 ++-
 drivers/cpufreq/maple-cpufreq.c     |  3 ++-
 drivers/cpufreq/omap-cpufreq.c      | 15 +++++----------
 drivers/cpufreq/pasemi-cpufreq.c    |  3 ++-
 drivers/cpufreq/pmac32-cpufreq.c    |  3 ++-
 drivers/cpufreq/pmac64-cpufreq.c    |  3 ++-
 drivers/cpufreq/s3c2416-cpufreq.c   |  9 ++-------
 drivers/cpufreq/s3c64xx-cpufreq.c   | 15 +++------------
 drivers/cpufreq/s5pv210-cpufreq.c   |  3 ++-
 drivers/cpufreq/sa1100-cpufreq.c    |  3 ++-
 drivers/cpufreq/sa1110-cpufreq.c    |  3 ++-
 drivers/cpufreq/spear-cpufreq.c     |  3 ++-
 drivers/cpufreq/tegra20-cpufreq.c   |  8 +-------
 include/linux/cpufreq.h             |  2 +-
 20 files changed, 42 insertions(+), 65 deletions(-)

diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
index 56a4ebbf00e0..2b187d802fe3 100644
--- a/drivers/cpufreq/bmips-cpufreq.c
+++ b/drivers/cpufreq/bmips-cpufreq.c
@@ -141,11 +141,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
 		return ret;
 	}
 
-	ret = cpufreq_generic_init(policy, freq_table, TRANSITION_LATENCY);
-	if (ret)
-		bmips_cpufreq_exit(policy);
-	else
-		pr_info("%s: registered\n", BMIPS_CPUFREQ_NAME);
+	cpufreq_generic_init(policy, freq_table, TRANSITION_LATENCY);
+	pr_info("%s: registered\n", BMIPS_CPUFREQ_NAME);
 
 	return ret;
 }
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 4d6043ee7834..8dda62367816 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -159,7 +159,7 @@ EXPORT_SYMBOL_GPL(arch_set_freq_scale);
  * - set policies transition latency
  * - policy->cpus with all possible CPUs
  */
-int cpufreq_generic_init(struct cpufreq_policy *policy,
+void cpufreq_generic_init(struct cpufreq_policy *policy,
 		struct cpufreq_frequency_table *table,
 		unsigned int transition_latency)
 {
@@ -171,8 +171,6 @@ int cpufreq_generic_init(struct cpufreq_policy *policy,
 	 * share the clock and voltage and clock.
 	 */
 	cpumask_setall(policy->cpus);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(cpufreq_generic_init);
 
diff --git a/drivers/cpufreq/davinci-cpufreq.c b/drivers/cpufreq/davinci-cpufreq.c
index 3de48ae60c29..297d23cad8b5 100644
--- a/drivers/cpufreq/davinci-cpufreq.c
+++ b/drivers/cpufreq/davinci-cpufreq.c
@@ -90,7 +90,8 @@ static int davinci_cpu_init(struct cpufreq_policy *policy)
 	 * Setting the latency to 2000 us to accommodate addition of drivers
 	 * to pre/post change notification list.
 	 */
-	return cpufreq_generic_init(policy, freq_table, 2000 * 1000);
+	cpufreq_generic_init(policy, freq_table, 2000 * 1000);
+	return 0;
 }
 
 static struct cpufreq_driver davinci_driver = {
diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index 47ccfa6b17b7..648a09a1778a 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -190,14 +190,12 @@ static int imx6q_set_target(struct cpufreq_policy *policy, unsigned int index)
 
 static int imx6q_cpufreq_init(struct cpufreq_policy *policy)
 {
-	int ret;
-
 	policy->clk = clks[ARM].clk;
-	ret = cpufreq_generic_init(policy, freq_table, transition_latency);
+	cpufreq_generic_init(policy, freq_table, transition_latency);
 	policy->suspend_freq = max_freq;
 	dev_pm_opp_of_register_em(policy->cpus);
 
-	return ret;
+	return 0;
 }
 
 static struct cpufreq_driver imx6q_cpufreq_driver = {
diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
index 7ab564c1f7ae..cb74bdc5baaa 100644
--- a/drivers/cpufreq/kirkwood-cpufreq.c
+++ b/drivers/cpufreq/kirkwood-cpufreq.c
@@ -85,7 +85,8 @@ static int kirkwood_cpufreq_target(struct cpufreq_policy *policy,
 /* Module init and exit code */
 static int kirkwood_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	return cpufreq_generic_init(policy, kirkwood_freq_table, 5000);
+	cpufreq_generic_init(policy, kirkwood_freq_table, 5000);
+	return 0;
 }
 
 static struct cpufreq_driver kirkwood_cpufreq_driver = {
diff --git a/drivers/cpufreq/loongson1-cpufreq.c b/drivers/cpufreq/loongson1-cpufreq.c
index 21c9ce8526c0..0ea88778882a 100644
--- a/drivers/cpufreq/loongson1-cpufreq.c
+++ b/drivers/cpufreq/loongson1-cpufreq.c
@@ -81,7 +81,7 @@ static int ls1x_cpufreq_init(struct cpufreq_policy *policy)
 	struct device *cpu_dev = get_cpu_device(policy->cpu);
 	struct cpufreq_frequency_table *freq_tbl;
 	unsigned int pll_freq, freq;
-	int steps, i, ret;
+	int steps, i;
 
 	pll_freq = clk_get_rate(cpufreq->pll_clk) / 1000;
 
@@ -103,11 +103,9 @@ static int ls1x_cpufreq_init(struct cpufreq_policy *policy)
 	freq_tbl[i].frequency = CPUFREQ_TABLE_END;
 
 	policy->clk = cpufreq->clk;
-	ret = cpufreq_generic_init(policy, freq_tbl, 0);
-	if (ret)
-		kfree(freq_tbl);
+	cpufreq_generic_init(policy, freq_tbl, 0);
 
-	return ret;
+	return 0;
 }
 
 static int ls1x_cpufreq_exit(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index da344696beed..890813e0bb76 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -95,7 +95,8 @@ static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	}
 
 	policy->clk = cpuclk;
-	return cpufreq_generic_init(policy, &loongson2_clockmod_table[0], 0);
+	cpufreq_generic_init(policy, &loongson2_clockmod_table[0], 0);
+	return 0;
 }
 
 static int loongson2_cpufreq_exit(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpufreq.c
index f5220b3d4ec5..28d346062166 100644
--- a/drivers/cpufreq/maple-cpufreq.c
+++ b/drivers/cpufreq/maple-cpufreq.c
@@ -140,7 +140,8 @@ static unsigned int maple_cpufreq_get_speed(unsigned int cpu)
 
 static int maple_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	return cpufreq_generic_init(policy, maple_cpu_freqs, 12000);
+	cpufreq_generic_init(policy, maple_cpu_freqs, 12000);
+	return 0;
 }
 
 static struct cpufreq_driver maple_cpufreq_driver = {
diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index 29643f06a3c3..8d14b42a8c6f 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -122,23 +122,18 @@ static int omap_cpu_init(struct cpufreq_policy *policy)
 			dev_err(mpu_dev,
 				"%s: cpu%d: failed creating freq table[%d]\n",
 				__func__, policy->cpu, result);
-			goto fail;
+			clk_put(policy->clk);
+			return result;
 		}
 	}
 
 	atomic_inc_return(&freq_table_users);
 
 	/* FIXME: what's the actual transition time? */
-	result = cpufreq_generic_init(policy, freq_table, 300 * 1000);
-	if (!result) {
-		dev_pm_opp_of_register_em(policy->cpus);
-		return 0;
-	}
+	cpufreq_generic_init(policy, freq_table, 300 * 1000);
+	dev_pm_opp_of_register_em(policy->cpus);
 
-	freq_table_free();
-fail:
-	clk_put(policy->clk);
-	return result;
+	return 0;
 }
 
 static int omap_cpu_exit(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 6b1e4abe3248..93f39a1d4c3d 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -196,7 +196,8 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	policy->cur = pas_freqs[cur_astate].frequency;
 	ppc_proc_freq = policy->cur * 1000ul;
 
-	return cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
+	cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
+	return 0;
 
 out_unmap_sdcpwr:
 	iounmap(sdcpwr_mapbase);
diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 650104d729f3..73621bc11976 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -372,7 +372,8 @@ static int pmac_cpufreq_target(	struct cpufreq_policy *policy,
 
 static int pmac_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	return cpufreq_generic_init(policy, pmac_cpu_freqs, transition_latency);
+	cpufreq_generic_init(policy, pmac_cpu_freqs, transition_latency);
+	return 0;
 }
 
 static u32 read_gpio(struct device_node *np)
diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index 1af3492a000d..d7542a106e6b 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -321,7 +321,8 @@ static unsigned int g5_cpufreq_get_speed(unsigned int cpu)
 
 static int g5_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	return cpufreq_generic_init(policy, g5_cpu_freqs, transition_latency);
+	cpufreq_generic_init(policy, g5_cpu_freqs, transition_latency);
+	return 0;
 }
 
 static struct cpufreq_driver g5_cpufreq_driver = {
diff --git a/drivers/cpufreq/s3c2416-cpufreq.c b/drivers/cpufreq/s3c2416-cpufreq.c
index f7ff1ed7fef1..106910351c41 100644
--- a/drivers/cpufreq/s3c2416-cpufreq.c
+++ b/drivers/cpufreq/s3c2416-cpufreq.c
@@ -447,21 +447,16 @@ static int s3c2416_cpufreq_driver_init(struct cpufreq_policy *policy)
 	/* Datasheet says PLL stabalisation time must be at least 300us,
 	 * so but add some fudge. (reference in LOCKCON0 register description)
 	 */
-	ret = cpufreq_generic_init(policy, s3c_freq->freq_table,
+	cpufreq_generic_init(policy, s3c_freq->freq_table,
 			(500 * 1000) + s3c_freq->regulator_latency);
-	if (ret)
-		goto err_freq_table;
-
 	register_reboot_notifier(&s3c2416_cpufreq_reboot_notifier);
 
 	return 0;
 
-err_freq_table:
 #ifdef CONFIG_ARM_S3C2416_CPUFREQ_VCORESCALE
-	regulator_put(s3c_freq->vddarm);
 err_vddarm:
-#endif
 	clk_put(s3c_freq->armclk);
+#endif
 err_armclk:
 	clk_put(s3c_freq->hclk);
 err_hclk:
diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index 37df2d892eb0..af0c00dabb22 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -144,7 +144,6 @@ static void s3c64xx_cpufreq_config_regulator(void)
 
 static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 {
-	int ret;
 	struct cpufreq_frequency_table *freq;
 
 	if (policy->cpu != 0)
@@ -165,8 +164,7 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 #ifdef CONFIG_REGULATOR
 	vddarm = regulator_get(NULL, "vddarm");
 	if (IS_ERR(vddarm)) {
-		ret = PTR_ERR(vddarm);
-		pr_err("Failed to obtain VDDARM: %d\n", ret);
+		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
 		pr_err("Only frequency scaling available\n");
 		vddarm = NULL;
 	} else {
@@ -196,16 +194,9 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 	 * the PLLs, which we don't currently) is ~300us worst case,
 	 * but add some fudge.
 	 */
-	ret = cpufreq_generic_init(policy, s3c64xx_freq_table,
+	cpufreq_generic_init(policy, s3c64xx_freq_table,
 			(500 * 1000) + regulator_latency);
-	if (ret != 0) {
-		pr_err("Failed to configure frequency table: %d\n",
-		       ret);
-		regulator_put(vddarm);
-		clk_put(policy->clk);
-	}
-
-	return ret;
+	return 0;
 }
 
 static struct cpufreq_driver s3c64xx_cpufreq_driver = {
diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index e5cb17d4be7b..5d10030f2560 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -541,7 +541,8 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 	s5pv210_dram_conf[1].freq = clk_get_rate(dmc1_clk);
 
 	policy->suspend_freq = SLEEP_FREQ;
-	return cpufreq_generic_init(policy, s5pv210_freq_table, 40000);
+	cpufreq_generic_init(policy, s5pv210_freq_table, 40000);
+	return 0;
 
 out_dmc1:
 	clk_put(dmc0_clk);
diff --git a/drivers/cpufreq/sa1100-cpufreq.c b/drivers/cpufreq/sa1100-cpufreq.c
index ab5cab93e638..5c075ef6adc0 100644
--- a/drivers/cpufreq/sa1100-cpufreq.c
+++ b/drivers/cpufreq/sa1100-cpufreq.c
@@ -181,7 +181,8 @@ static int sa1100_target(struct cpufreq_policy *policy, unsigned int ppcr)
 
 static int __init sa1100_cpu_init(struct cpufreq_policy *policy)
 {
-	return cpufreq_generic_init(policy, sa11x0_freq_table, 0);
+	cpufreq_generic_init(policy, sa11x0_freq_table, 0);
+	return 0;
 }
 
 static struct cpufreq_driver sa1100_driver __refdata = {
diff --git a/drivers/cpufreq/sa1110-cpufreq.c b/drivers/cpufreq/sa1110-cpufreq.c
index dab54e051c0e..d9d04d935b3a 100644
--- a/drivers/cpufreq/sa1110-cpufreq.c
+++ b/drivers/cpufreq/sa1110-cpufreq.c
@@ -303,7 +303,8 @@ static int sa1110_target(struct cpufreq_policy *policy, unsigned int ppcr)
 
 static int __init sa1110_cpu_init(struct cpufreq_policy *policy)
 {
-	return cpufreq_generic_init(policy, sa11x0_freq_table, 0);
+	cpufreq_generic_init(policy, sa11x0_freq_table, 0);
+	return 0;
 }
 
 /* sa1110_driver needs __refdata because it must remain after init registers
diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index 4074e2615522..73bd8dc47074 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -153,8 +153,9 @@ static int spear_cpufreq_target(struct cpufreq_policy *policy,
 static int spear_cpufreq_init(struct cpufreq_policy *policy)
 {
 	policy->clk = spear_cpufreq.clk;
-	return cpufreq_generic_init(policy, spear_cpufreq.freq_tbl,
+	cpufreq_generic_init(policy, spear_cpufreq.freq_tbl,
 			spear_cpufreq.transition_latency);
+	return 0;
 }
 
 static struct cpufreq_driver spear_cpufreq_driver = {
diff --git a/drivers/cpufreq/tegra20-cpufreq.c b/drivers/cpufreq/tegra20-cpufreq.c
index 3c32cc7b0671..f84ecd22f488 100644
--- a/drivers/cpufreq/tegra20-cpufreq.c
+++ b/drivers/cpufreq/tegra20-cpufreq.c
@@ -118,17 +118,11 @@ static int tegra_target(struct cpufreq_policy *policy, unsigned int index)
 static int tegra_cpu_init(struct cpufreq_policy *policy)
 {
 	struct tegra20_cpufreq *cpufreq = cpufreq_get_driver_data();
-	int ret;
 
 	clk_prepare_enable(cpufreq->cpu_clk);
 
 	/* FIXME: what's the actual transition time? */
-	ret = cpufreq_generic_init(policy, freq_table, 300 * 1000);
-	if (ret) {
-		clk_disable_unprepare(cpufreq->cpu_clk);
-		return ret;
-	}
-
+	cpufreq_generic_init(policy, freq_table, 300 * 1000);
 	policy->clk = cpufreq->cpu_clk;
 	policy->suspend_freq = freq_table[0].frequency;
 	return 0;
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index d757a56a74dc..536a049d7ecc 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -992,7 +992,7 @@ extern struct freq_attr *cpufreq_generic_attr[];
 int cpufreq_table_validate_and_sort(struct cpufreq_policy *policy);
 
 unsigned int cpufreq_generic_get(unsigned int cpu);
-int cpufreq_generic_init(struct cpufreq_policy *policy,
+void cpufreq_generic_init(struct cpufreq_policy *policy,
 		struct cpufreq_frequency_table *table,
 		unsigned int transition_latency);
 #endif /* _LINUX_CPUFREQ_H */
-- 
2.21.0.rc0.269.g1a574e7a288b

