Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D96B2076B6
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jun 2020 17:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404158AbgFXPHR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jun 2020 11:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404132AbgFXPHQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Jun 2020 11:07:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCA8C061573
        for <linux-omap@vger.kernel.org>; Wed, 24 Jun 2020 08:07:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so2872973wmo.1
        for <linux-omap@vger.kernel.org>; Wed, 24 Jun 2020 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gtJAcvpHkuLRDrUsq1eY3z1bY+z7q8TiiXjibqyd6Ck=;
        b=ZHnjSn2WorVvPlhnsW05PjkW49hRNPgq84FENEFtuoQWoLFoS5Koxe/dFywbKRMHXL
         3TdXrKvSsAttDlfRMZtJGsuGsj/a+hJcx94EmcpOadjkOkkb+KaWqiOYgNy6L6Yx11WO
         +baxZJlc03ZWuHtQboIEUm9C0m3an2F/wAOR3zMqIO+0e0yZcoFn/dKH/AZytJKBvXIf
         kasqyP3fjB5JUNwQho/QWyRHJ3YJOyhWE3+Oe40vlAuTWYeoqbw7Ezbto0uUymTcO6fp
         rAU9JBU5tdSYDQHnIyQdY1pyBRF0zOeb8P/DzpPmVAGVbd1L9Mlm8deCmJcpHyEmu7Vk
         irqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gtJAcvpHkuLRDrUsq1eY3z1bY+z7q8TiiXjibqyd6Ck=;
        b=qU/eeedyQOkPKq2uNzPSsY/J4HYzg8xv4+IPFg9X3OoSOWtbFsUbLm5RoJijfpTqoa
         gDhNprSSbFzRRRq3ezrw/o5T54MRI3o2LYxsHp8mL1doNDWKKxiRIubodl/xvqxuY55W
         nwve58JE7yX4zagQdlaUpLIyz2IQmHmFHzpU+0a5bfZ6AiAdUv5dObxOse3tGK0h8RMX
         mtvIMz3opC36cXfWdIRqUnd1CX8YmRwoldzBZ3fxMeiGZS6aAgHx+uYl0Q1+P9nb2Rb4
         rJqfSuHLWpKHf4Sn6VyY/HPExaforaRQ1vZwq36pC05xk99ONBNeUm4y1OBzftLkNJE9
         CZlQ==
X-Gm-Message-State: AOAM533IothjRqnrhxjfGiTbz3GMTELc4EhyM0xQQrks9mUDQNht4CUV
        adwOehHKxzsAnqLrwj6fP4GcmQ==
X-Google-Smtp-Source: ABdhPJxagKb1wXFKsg3BjteSAxqyibenBVKBU8QYTY4DNUpO9PPoz2ukw2LgHjBi8SkOZzRYlyySUA==
X-Received: by 2002:a1c:e303:: with SMTP id a3mr12187899wmh.26.1593011234076;
        Wed, 24 Jun 2020 08:07:14 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id h14sm11543361wrt.36.2020.06.24.08.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:07:13 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Kai Svahn <kai.svahn@nokia.com>, Syed Khasim <x0khasim@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 02/10] mfd: twl4030-irq: Fix cast to restricted __le32 warning
Date:   Wed, 24 Jun 2020 16:06:56 +0100
Message-Id: <20200624150704.2729736-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624150704.2729736-1-lee.jones@linaro.org>
References: <20200624150704.2729736-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Silences Sparse warning(s):

 drivers/mfd/twl4030-irq.c:573:40: warning: cast to restricted __le32
 drivers/mfd/twl4030-irq.c:573:40: warning: cast to restricted __le32
 drivers/mfd/twl4030-irq.c:573:40: warning: cast to restricted __le32
 drivers/mfd/twl4030-irq.c:573:40: warning: cast to restricted __le32
 drivers/mfd/twl4030-irq.c:573:40: warning: cast to restricted __le32
 drivers/mfd/twl4030-irq.c:573:40: warning: cast to restricted __le32

Cc: <stable@vger.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Kai Svahn <kai.svahn@nokia.com>
Cc: Syed Khasim <x0khasim@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/twl4030-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index d05bc74daba32..ab417438d1faa 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -561,7 +561,7 @@ static inline int sih_read_isr(const struct sih *sih)
 	int status;
 	union {
 		u8 bytes[4];
-		u32 word;
+		__le32 word;
 	} isr;
 
 	/* FIXME need retry-on-error ... */
-- 
2.25.1

