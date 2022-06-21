Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96FE552E1B
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jun 2022 11:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343867AbiFUJUG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jun 2022 05:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236786AbiFUJUF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jun 2022 05:20:05 -0400
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6496E1ADB4;
        Tue, 21 Jun 2022 02:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=OioeI
        UwveB01yCM+VPPqI1R3Pqe3irBtSPlm0YsmgTY=; b=L31esixI0W4w90QdeVeCz
        yBDQE6ekgUx/V6yT9+YgUNAxYK+3vtbs+Y9WEn1cdLKbpFL8PCXpGlkr1ZE9H/rd
        lRNxaxP40azlqnju4TN6Vs4xH2efE45nR5yTw85KKQaXp2XwxFTvuzSljT8r5dS4
        3Ni6NH/ST3kDe9nKXWyLqA=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp3 (Coremail) with SMTP id DcmowADngJIqjbFiNtMuDw--.56908S2;
        Tue, 21 Jun 2022 17:19:39 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     andre.przywara@arm.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, tony@atomide.com
Cc:     windhl@126.com, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] arm/mach: Hold reference returned by of_find_xxx APIs
Date:   Tue, 21 Jun 2022 17:19:37 +0800
Message-Id: <20220621091937.4082422-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowADngJIqjbFiNtMuDw--.56908S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tryUJr4DZFWkuF1xArWrZrb_yoW8KrW3pw
        1Du390kr18W3W7Ga4xCFW8ZF4j9a1v9r4jq3y5CFy2qws7Z348CF1Fv34YkFn8XrWkAFWr
        Ar10k3W8Xa1kXwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUfHbUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2gsnF1uwMQHIcQAAsD
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In highbank_init_irq(), tegra_init_irq() and omap4_cpcap_init(),
we should hold the reference returned by of_find_xxx APIs and
use it to call of_node_put() for refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/arm/mach-highbank/highbank.c | 6 +++++-
 arch/arm/mach-omap2/pmic-cpcap.c  | 5 ++++-
 arch/arm/mach-tegra/irq.c         | 6 +++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-highbank/highbank.c b/arch/arm/mach-highbank/highbank.c
index db607955a7e4..4f50000377b8 100644
--- a/arch/arm/mach-highbank/highbank.c
+++ b/arch/arm/mach-highbank/highbank.c
@@ -50,10 +50,14 @@ static void highbank_l2c310_write_sec(unsigned long val, unsigned reg)
 
 static void __init highbank_init_irq(void)
 {
+	struct device_node *np;
+
 	irqchip_init();
 
-	if (of_find_compatible_node(NULL, NULL, "arm,cortex-a9"))
+	np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9");
+	if (np)
 		highbank_scu_map_io();
+	of_node_put(np);
 }
 
 static void highbank_power_off(void)
diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
index 668dc84fd31e..a7368d657aa8 100644
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -238,8 +238,11 @@ static struct omap_voltdm_pmic omap4_fan_iva = {
 int __init omap4_cpcap_init(void)
 {
 	struct voltagedomain *voltdm;
+	struct device_node *np;
 
-	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
+	of_node_put(np);
+	if (!np)
 		return -ENODEV;
 
 	voltdm = voltdm_lookup("mpu");
diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
index 4e1ee70b2a3f..2aeac041bcb9 100644
--- a/arch/arm/mach-tegra/irq.c
+++ b/arch/arm/mach-tegra/irq.c
@@ -88,7 +88,11 @@ static const struct of_device_id tegra_ictlr_match[] __initconst = {
 
 void __init tegra_init_irq(void)
 {
-	if (WARN_ON(!of_find_matching_node(NULL, tegra_ictlr_match)))
+	struct device_node *np;
+
+	np = of_find_matching_node(NULL, tegra_ictlr_match);
+	of_node_put(np);
+	if (WARN_ON(!np))
 		pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
 
 	tegra114_gic_cpu_pm_registration();
-- 
2.25.1

