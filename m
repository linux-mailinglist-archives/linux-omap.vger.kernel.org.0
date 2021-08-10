Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35963E546A
	for <lists+linux-omap@lfdr.de>; Tue, 10 Aug 2021 09:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbhHJHhs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Aug 2021 03:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235980AbhHJHhp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Aug 2021 03:37:45 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D166C06179E
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 00:37:23 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id bo18so9806981pjb.0
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 00:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tPg7HlHiNHIgMXq3ifzrutSGoJ3kBhUfJVLyMOqT33Y=;
        b=aNHkIE5ncBMIBjIjJvsC//j+DCdVWU0P4mzCLIQHFyneAmv1sc641l9Q+BDeuVkMJd
         PNmGFG0IJoM/1JPjohriJqPUme/cxg10EBbwPzE19jElRJFRedJFYBrpS9EiCnkJPzHr
         GLtZfw09928BFmsHu+W98ZpncTYDBeubpxHs7U7AUpTwy4DiNNHHBEW21Jwb/jKTctRy
         0+dUm0n4ZOtUcmaYgKSn/jqluJVRsegnjQ2BCqTdVZpMK/1A1NxOY6IOjlWIU2ra9dj5
         hdFCmsxmnfliD8GFswr/gVl+pA67f40FeLQqe3ecQZ8qxvkdGs5Bk1VBb3oBH+D7c8FO
         1RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tPg7HlHiNHIgMXq3ifzrutSGoJ3kBhUfJVLyMOqT33Y=;
        b=epQCA0F+Ks1cs1FJoDz9oSOjuSu5hYumiw9qjic1NBolirrYta6D5/EGn1RXIvViBC
         kdoxesK1dk1HkMcpLOXvFpjTx1GHgB4G672L7dPr4kEm3cygjBxjWnY2L4SsuXVJGU5p
         OKiuxBS4029zMOSZgYZffXbzFl4ZS7KzkKcU0JMdQI52kmss59H5eG2N1qyw8HqPfC4h
         dCc0+HL0W3wg4qUevhsI76ST3tm3IJz+32HK0cQmiJB5gYS3sqpMUQqYkMPXRJH/JFTD
         Je2ANST/u9M0ytmUafhBszWKEObJA68ee+Z+BJCokdQxzEIX0C6rYx0RO+QN2tYqbHcj
         78pg==
X-Gm-Message-State: AOAM533ZG2DcbNuh22YJqZ+fkw+sidlhwa24fQTRCz1K5ZFlgBSWiWRL
        d08rL9PMPbMbqdNpPCKWYyRrEg==
X-Google-Smtp-Source: ABdhPJyTO5GMgPuRNnOnzkkbkb1baPrMwLauh2rJ+0LCJzrMnp1aed3qvV8XUmjK+2xMPk9BOub1iA==
X-Received: by 2002:a17:90b:1102:: with SMTP id gi2mr29168901pjb.43.1628581043191;
        Tue, 10 Aug 2021 00:37:23 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id 6sm1927629pjk.1.2021.08.10.00.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 00:37:22 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        lukasz.luba@arm.com, Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] cpufreq: omap: Use auto-registration for energy model
Date:   Tue, 10 Aug 2021 13:06:52 +0530
Message-Id: <a17b0f64c3a4cd84a126b3315539c13b15b4738c.1628579170.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1628579170.git.viresh.kumar@linaro.org>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use the CPUFREQ_REGISTER_WITH_EM flag to allow cpufreq core to
automatically register with the energy model.

This allows removal of boiler plate code from the driver and fixes the
unregistration part as well.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/omap-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index e035ee216b0f..303136f97773 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -131,7 +131,6 @@ static int omap_cpu_init(struct cpufreq_policy *policy)
 
 	/* FIXME: what's the actual transition time? */
 	cpufreq_generic_init(policy, freq_table, 300 * 1000);
-	dev_pm_opp_of_register_em(mpu_dev, policy->cpus);
 
 	return 0;
 }
@@ -144,7 +143,8 @@ static int omap_cpu_exit(struct cpufreq_policy *policy)
 }
 
 static struct cpufreq_driver omap_driver = {
-	.flags		= CPUFREQ_NEED_INITIAL_FREQ_CHECK,
+	.flags		= CPUFREQ_NEED_INITIAL_FREQ_CHECK |
+			  CPUFREQ_REGISTER_WITH_EM,
 	.verify		= cpufreq_generic_frequency_table_verify,
 	.target_index	= omap_target,
 	.get		= cpufreq_generic_get,
-- 
2.31.1.272.g89b43f80a514

