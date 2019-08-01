Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A490A7D2D6
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 03:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfHAB2m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Jul 2019 21:28:42 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40439 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfHAB2m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Jul 2019 21:28:42 -0400
Received: by mail-qt1-f196.google.com with SMTP id a15so68537103qtn.7
        for <linux-omap@vger.kernel.org>; Wed, 31 Jul 2019 18:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eKKhIP0u3/Bw85pW7TDdO3i0E03O+ULRQUd0v4/azRs=;
        b=DUp8y7Ps/It8+MteZghP9+aQouKzhzNoO6MoufE8YAoU7co1HGpArdwi78Jq5rvOJV
         nFBmG15B16Z62HqGLewwyl4vIzyyKQU9WUtABlQ2C00vA2e7c7ESU9GxXUYk5kuXlgjB
         slUYrbjaFyTz7+gpKoSZ8sAAMeUAyhJlZYNQjuLv/2fbNlkQCjcnNa7S0B2wBmRPRdnd
         fONcdTYdXiBCMQF0TelE3/rfHXiZlaZJzOH+9sZyJjjr7bbNQO2kGBXVFRpaXeqPb5bx
         j6HKobKVFv6rKwRyvFB1skKqJMFcNng97YKJfcsnufcMlMY07tp+5DFx4N1cGPB4EhyI
         zhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eKKhIP0u3/Bw85pW7TDdO3i0E03O+ULRQUd0v4/azRs=;
        b=KxQ+o5TMyuhHopt0TgUSOS4CwatpBGBB/pMJpdb6GSrOCVkCXsxvsuPCRCD/WJJ9wB
         Tzp8CyovOmnq5a9otQ9ql9PPNstBSaLOzCyqrIbUb57E7ysNuaHCRz3h6QKMlKB3aGbU
         cU9WpQpsXHpu639hgPIee5QQR4cKLhWF1CumHrjC5qoqXib7t7DktT6ECc34axLf2XcJ
         PHAPTK7w57PQ6IvdFdqvwWfRstG4jIVof8vcPh1LYmmXX79hr3MmMl+Nl47FF0jWFiPm
         KdOEIDvv9CFry1nELyM/n7h8Uz3FBq183QEKjbySUIAeJd8ZGLmjC4l4GF4Fbls4zWa0
         OpLQ==
X-Gm-Message-State: APjAAAWxD0bJXZLkDKOrlxu86wKSZH3TEymaksoHwrAsxitAyezHPG0S
        bwp+1iKlKdOvxa/HrFaQgiyVRJqv1my8hQ==
X-Google-Smtp-Source: APXvYqxgCUBQCw2L7L6ngOrQTTV654V74tCiOAS3krgF6uLxENoTviaEfWDhzMRG8G+y7F44ejEDOA==
X-Received: by 2002:aed:3e96:: with SMTP id n22mr81639001qtf.247.1564622921333;
        Wed, 31 Jul 2019 18:28:41 -0700 (PDT)
Received: from lepton.domain.name ([191.243.232.18])
        by smtp.gmail.com with ESMTPSA id x205sm32130536qka.56.2019.07.31.18.28.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 18:28:40 -0700 (PDT)
From:   =?UTF-8?q?Andr=C3=A9=20Roth?= <neolynx@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Roth?= <neolynx@gmail.com>
Subject: [PATCH 2/3] OMAP: Initialize PM and SmartReflex after TWL probe
Date:   Thu,  1 Aug 2019 03:28:22 +0200
Message-Id: <20190801012823.28730-3-neolynx@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801012823.28730-1-neolynx@gmail.com>
References: <20190801012823.28730-1-neolynx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use late_initcall_sync and omap_late_initcall_sync for sr_init and
omap2_common_pm_late_init respectively.

This prevents the following errors during SmartReflex initialization:
 twl: not initialized
 omap3_twl_set_sr_bit: Error access to TWL4030 (-1)

Signed-off-by: André Roth <neolynx@gmail.com>
---
 arch/arm/mach-omap2/pm.c        | 2 +-
 drivers/power/avs/smartreflex.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
index 1fde1bf53fb6..ec86f35ae040 100644
--- a/arch/arm/mach-omap2/pm.c
+++ b/arch/arm/mach-omap2/pm.c
@@ -261,4 +261,4 @@ int __init omap2_common_pm_late_init(void)
 
 	return 0;
 }
-omap_late_initcall(omap2_common_pm_late_init);
+omap_late_initcall_sync(omap2_common_pm_late_init);
diff --git a/drivers/power/avs/smartreflex.c b/drivers/power/avs/smartreflex.c
index 4684e7df833a..71ca5e4825b5 100644
--- a/drivers/power/avs/smartreflex.c
+++ b/drivers/power/avs/smartreflex.c
@@ -1031,7 +1031,7 @@ static int __init sr_init(void)
 
 	return 0;
 }
-late_initcall(sr_init);
+late_initcall_sync(sr_init);
 
 static void __exit sr_exit(void)
 {
-- 
2.17.1

