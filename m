Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBE3340BC2
	for <lists+linux-omap@lfdr.de>; Thu, 18 Mar 2021 18:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbhCRR0D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Mar 2021 13:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbhCRRZb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Mar 2021 13:25:31 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981A3C06174A;
        Thu, 18 Mar 2021 10:25:30 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso5894729wmi.3;
        Thu, 18 Mar 2021 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yePH7Dz7vnTvSGJ2LwIoy0u/VCi64JSI/odbm0wR6PU=;
        b=CjzOw2RfqeH91rOohFhuSwVaGsb86pe+DcX0oIp5tQUzHqbS/iIi50SpbvahNTfC2E
         wmtxsqWMoVi7Z1S1YXDDqz2Ss/Icx4r2lKgD63KMjEZdDCFph0u1LYo0bLJJ/KwIuDVI
         2zt+tGwtGaVuC1qR48RlR/PtfsaAsDw9I4W+qXOT8NsjspGcdUPeFxv8tgS9zVMnPFMC
         8dIMzOcIHamvAmFN4xwCJO0ZEaZ1y5c2AR+OScIZeQpOMb/xA8g/g5N4i6Au9JWQ0bTu
         c6VypFB6f6PejSg5BXvB/wZiCJCORl0B/002BsfHDNV+1sp9nb29LsWqqQpqi8ffFaNU
         8ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yePH7Dz7vnTvSGJ2LwIoy0u/VCi64JSI/odbm0wR6PU=;
        b=YbwHCNV0vuXofBWR+x4apCtkFI7vlC2URSM7ljxre30JgIahOvXQV4PbL8K5gON9bA
         lMGgkPeN0hSvCSY9a9vB6WRIuBAR6BufRQrW6CRfyWRBUfvICLAZm/N9/q+89hsA3vNB
         ezPCCFgDo1w7UYi7QdZJmMTWeJyhWI6WQqrjqTdDaqIWX63dqFNlp7ZsjZlYGfF+6BVC
         Bk9zzOn8TOqoyLcBzYxVQuAs39hSihJC0ZeH90iwvwu1UGGUYp0TAFBx3AYgEz7ySUzU
         hxcARE72jYxIhns3dY2oJ4rm3pup/NutLXtH4yux5akhZUNNX/8m6+xCbwLAlEMzwTPd
         KZZA==
X-Gm-Message-State: AOAM530Rws6CQ9QW2X/LVEwDhEcCZa6KxrBWPYIEOmO8LnKMZLrJbF7S
        /4J6XvnlwkldgEZPw8GvJM4=
X-Google-Smtp-Source: ABdhPJx8ug+g6DJxm8IQG6h5q/JFKwekL8hYuY/6r1MUNg5gy6XbF5ze/U53e9or1E/Lmx7ugrI1cQ==
X-Received: by 2002:a05:600c:4ba2:: with SMTP id e34mr203945wmp.121.1616088329314;
        Thu, 18 Mar 2021 10:25:29 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d02:9b00:d45f:dc09:8cff:b64d])
        by smtp.gmail.com with ESMTPSA id n1sm4511240wro.36.2021.03.18.10.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 10:25:28 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: remove obsolete OMAP HWMOD DATA FOR OMAP4-BASED DEVICES
Date:   Thu, 18 Mar 2021 18:25:20 +0100
Message-Id: <20210318172520.6634-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 2584d7e7f87a ("ARM: OMAP2+: Drop legacy platform data for omap4
hwmod") drops the file ./arch/arm/mach-omap2/omap_hwmod_44xx_data.c, but
misses to drop the now obsolete OMAP HWMOD DATA FOR OMAP4-BASED DEVICES
section in MAINTAINERS, which refers to only that file.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  arch/arm/mach-omap2/omap_hwmod_44xx_data.c

Remove the obsolete OMAP HWMOD DATA FOR OMAP4-BASED DEVICES section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19707dc45e0a..bf219411d4eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13080,12 +13080,6 @@ L:	linux-omap@vger.kernel.org
 S:	Maintained
 F:	arch/arm/mach-omap2/omap_hwmod*data*
 
-OMAP HWMOD DATA FOR OMAP4-BASED DEVICES
-M:	Benoît Cousson <bcousson@baylibre.com>
-L:	linux-omap@vger.kernel.org
-S:	Maintained
-F:	arch/arm/mach-omap2/omap_hwmod_44xx_data.c
-
 OMAP HWMOD SUPPORT
 M:	Benoît Cousson <bcousson@baylibre.com>
 M:	Paul Walmsley <paul@pwsan.com>
-- 
2.17.1

