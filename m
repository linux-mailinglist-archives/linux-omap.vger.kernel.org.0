Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF68D38AEF2
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 14:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242924AbhETMsl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 08:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242970AbhETMrS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 May 2021 08:47:18 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0DCC0610E7
        for <linux-omap@vger.kernel.org>; Thu, 20 May 2021 05:08:26 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id b7so8440969wmh.5
        for <linux-omap@vger.kernel.org>; Thu, 20 May 2021 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ceYbzDN/e9RcnXRV3nykWn40w2zE7pTz6qHZ6hUxXI=;
        b=zjx97kDxEgmoXJ4clDkwGzvabGjDbyqskvTgizEPSd4GRfcK2QdZiRxEK9MqXoJ8y1
         2EK/st0ONfv7KVh9J59hubZwmEI+TZQ9coxYJZ3MccctgeXvBe6E9i3AkRGSDw++WnHm
         1kkRIcAw2d+lmqz8wwuG+I4uZpwS/kiFO4KBHjBiqIoQPzVr2LemE4QgfkQVyGV6yfe4
         svuHfqZOQJVpjFSMF3g2OxJL8+hVW7qgXSkCSjUUUqFAMnJInNOxufYJvBqvLwGJd5F6
         WeSPZUjVZl4AknRg07N/IxLv/+gYY759hSoItENJrtptjAKDtjbVIcRl2Z8n8WLbUsop
         3cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ceYbzDN/e9RcnXRV3nykWn40w2zE7pTz6qHZ6hUxXI=;
        b=DesONjEb/LBymnNKBDCTu7yDW0Ra3iLpxfFEpZzOvSPd5OJIAUVOuroUMLuTE/Kki4
         IApN031wjh24IwW7qsPxOOeLyoYFwr19PHjcrzGGP135A55HEVvpPhXWXejxgRoUkniK
         8ZQ/2xB05o5BfYWj5U9AIG0nESDYGA9LlGaJqjA9wM0eZRDqrHy0xMSeqQz3Dcd2XCtX
         ZNAJsW7I5chHKfbqnjgq9r/wTmqnBkWMfx4uJaNuf2uJ+MuoQaiJvdpuiPGXcvjP8uDP
         cJsvT1404mprVLHQHML0cN7lZ+chCWITZnHvTu/75yX7rrYcPRzSIDjiCtjv9ZxK7W4e
         tyrg==
X-Gm-Message-State: AOAM533TMITZRRE7ULaqw527auM/kjvaRJrLt7NjPqCdworrrZcw4Z0U
        TyebvDdXfyop5h8mqdgVlKZ+WA==
X-Google-Smtp-Source: ABdhPJzPXOlSVU0lAPnseCnKlobVrWpK+Zg7UtIePwBqgiPQI9NG2VM533DENo7oeo/2LRuBrnlYfw==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr3303972wmd.161.1621512505025;
        Thu, 20 May 2021 05:08:25 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id r7sm2237170wmq.18.2021.05.20.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:08:24 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Kai Svahn <kai.svahn@nokia.com>, syed khasim <x0khasim@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 2/7] mfd: twl-core: Fix incorrect function name twl_regcache_bypass()
Date:   Thu, 20 May 2021 13:08:15 +0100
Message-Id: <20210520120820.3465562-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120820.3465562-1-lee.jones@linaro.org>
References: <20210520120820.3465562-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/mfd/twl-core.c:496: warning: expecting prototype for twl_regcache_bypass(). Prototype was for twl_set_regcache_bypass() instead

Cc: Tony Lindgren <tony@atomide.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Kai Svahn <kai.svahn@nokia.com>
Cc: syed khasim <x0khasim@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/twl-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index 20cf8cfe4f3b5..289b556dede28 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -485,7 +485,7 @@ int twl_i2c_read(u8 mod_no, u8 *value, u8 reg, unsigned num_bytes)
 EXPORT_SYMBOL(twl_i2c_read);
 
 /**
- * twl_regcache_bypass - Configure the regcache bypass for the regmap associated
+ * twl_set_regcache_bypass - Configure the regcache bypass for the regmap associated
  *			 with the module
  * @mod_no: module number
  * @enable: Regcache bypass state
-- 
2.31.1

