Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 035E47D2D7
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 03:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfHAB2p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Jul 2019 21:28:45 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:32994 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfHAB2o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Jul 2019 21:28:44 -0400
Received: by mail-qt1-f196.google.com with SMTP id r6so64323433qtt.0
        for <linux-omap@vger.kernel.org>; Wed, 31 Jul 2019 18:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qGo9qDCeaaqBY+z1UMQomFczEThP4R7BduRAWmKC4bM=;
        b=hw09/I9yQGOHTyaQEp6v8w0w5TmFWERph3YoZ5c3QI4K+AmqYRZcirmzXy+HBzp4tj
         mTc09kC73PFOg0R38QeEzvIcpMGjePbLXuylasloauv3D9yLm8DlMKsjpRLZYrn7UruD
         4WlGvp4k/iKIcMsSeHVZv4E4hDWA0zZlHBRf+KZzjKTexZAbvHWYTppuK6MauTeuBgXF
         5qjVE8P7x5Vty1vYZuZlOBN1FuUGr+XJm9TufqEYgfZh79MiOMQIkBPpXEm+VIEJ69Wc
         TivYMzUyExARt1YS01J0nDCL4OsWkAZFYNi5hQCBLyIhphCgq7ysjxTl3yQO2OrWQWZ2
         0S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qGo9qDCeaaqBY+z1UMQomFczEThP4R7BduRAWmKC4bM=;
        b=P9q3dea7fxLbnmYAaClhqSA+yk1vaoDg7Sp+KYtEMM6CSfk0CRD5yWrENYW3clHNLs
         /P6vjvJOYGToRx21LF464QY888YrrwGo0ckkoJuVTdVd5OPHpk/i+y9lyfgcUJKQB5wF
         GsIPTvFhpvVESUgLAYVuo28GguMI4uuX28cUuw2glYXGgbM6YA6MQ718EL3z5IiKikn3
         yBBnSXmgw6os1PJNk8UlbdZC5mJQJgjyF9nRdBHjcuGfuskW/MvWToQ9ge++zvUGakYK
         I+e+COLX1VXhyzojrZB7KUyRBih1DRoBi53gd77ERykgDqzJIKHHHB3C4Og6eWsjevi0
         SvYg==
X-Gm-Message-State: APjAAAWFKKxauTmd9JmBwUhLZQof4ZNuUa9kZpQXlSj9vrKnq8OCeqiD
        qgKxdopnYKaYRWiguyEb9klpUpCbkt0U/w==
X-Google-Smtp-Source: APXvYqzGibgp1xP2tSoOYKvKja6xLl4kqsNWvAtHofnicRZmrjPQrsUzhxJDGJFQwgbaJWb3NHo1Zw==
X-Received: by 2002:ac8:2772:: with SMTP id h47mr89130914qth.236.1564622923631;
        Wed, 31 Jul 2019 18:28:43 -0700 (PDT)
Received: from lepton.domain.name ([191.243.232.18])
        by smtp.gmail.com with ESMTPSA id x205sm32130536qka.56.2019.07.31.18.28.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 18:28:42 -0700 (PDT)
From:   =?UTF-8?q?Andr=C3=A9=20Roth?= <neolynx@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Roth?= <neolynx@gmail.com>
Subject: [PATCH 3/3] OMAP3: Enable SmartReflex on om36xx
Date:   Thu,  1 Aug 2019 03:28:23 +0200
Message-Id: <20190801012823.28730-4-neolynx@gmail.com>
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

call omap_sr_enable for mpu_iva voltage domain.

Signed-off-by: André Roth <neolynx@gmail.com>
---
 arch/arm/mach-omap2/pm.c        | 1 +
 drivers/power/avs/smartreflex.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
index ec86f35ae040..073c565193b8 100644
--- a/arch/arm/mach-omap2/pm.c
+++ b/arch/arm/mach-omap2/pm.c
@@ -251,6 +251,7 @@ int __init omap2_common_pm_late_init(void)
 	omap4_init_voltages();
 
 	/* Smartreflex device init */
+	omap_enable_smartreflex_on_init();
 	omap_devinit_smartreflex();
 
 	error = omap_pm_soc_init();
diff --git a/drivers/power/avs/smartreflex.c b/drivers/power/avs/smartreflex.c
index 71ca5e4825b5..13a45e9a37a3 100644
--- a/drivers/power/avs/smartreflex.c
+++ b/drivers/power/avs/smartreflex.c
@@ -937,6 +937,9 @@ static int omap_sr_probe(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 
+	if (strncmp(sr_info->name, "smartreflex_mpu_iva", sizeof("smartreflex_mpu_iva") - 1) == 0)
+		omap_sr_enable(sr_info->voltdm);
+
 	return ret;
 
 err_debugfs:
-- 
2.17.1

