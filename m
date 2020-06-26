Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F52720ACA0
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 08:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgFZG6L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 02:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbgFZG5u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Jun 2020 02:57:50 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9480C08C5DD
        for <linux-omap@vger.kernel.org>; Thu, 25 Jun 2020 23:57:49 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s10so8325443wrw.12
        for <linux-omap@vger.kernel.org>; Thu, 25 Jun 2020 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vqpawo5MJsJOmOd5oGBoADQ9AShkAYfWIevIqG7XtBk=;
        b=SKp3jqiWYrIXN0jB0OY408JIuyw4za4+UhL8h4rqgsIDHOoRrIpyJa6mqRtdVOps/0
         mgEnzvPXKOyVwiok9xc3e/aGae/TCe+lyKlYblCgxaVLB7fMbQtnu11Fo+LZk4h2UfVY
         8P1sCwqocGnNgb/S8jhEd6RpJSjY68unkDdCp+pHLc9YZnYIj1UgvuxvRk19OyaAut+a
         LmXMXl6hD2/rB7lZdVRXsKPxUxXp+btTwbd/amNtSAhDR5xvBKGtFOiZlDYFOrCx0d27
         8kN6CjSFPWag25rf6VgKqLU1xAHYvr3vl9ay5I0DYXrHesL43//ThifVueOcz0HuZEjY
         gVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vqpawo5MJsJOmOd5oGBoADQ9AShkAYfWIevIqG7XtBk=;
        b=aB2IFh/sXlylcakHWSz3hLDa18CP34Nqsf9GEKMn3Dp3jyrE83ID9qYAJAuZT1z0C4
         OQ/Y6sePxLfhc0ol5I+n6Hf44ArU2hw6valb6IvFZ8xkQB+3aomWdrFYA7jJlXwM7//b
         ULAAzyK86ysZnSYAbGlMKs8QM7NoxPAWEut1Gz41ZW1I94a1SmiJXZKz9vTH6fpYgQWF
         edHgxS0TJwJeJFzqZWvXqrtle3Lw50BUyLpr0EJHUh+HCtl40vNdVoflY2OHQbA2cpRE
         s67jLZxRnlC8LxP+/qjlRxI1w7Ko/QTDwX6b6gCsMrdDkXxbdk5lu/TJMzJCONkzmCIJ
         U3Mg==
X-Gm-Message-State: AOAM5320UvsQaB8094Dr1SBuwUQDNcy1+G1rGqkq3mHHkkJawDEpeX+L
        RXFlsM+MckU8wBpDOCoPDkt/vQ==
X-Google-Smtp-Source: ABdhPJzUZcx9JMvk0I42jptf4iOIhyswi9h4IvKidFSgFgUMg8zyNP/ZGhoR0T7CSf8Q1Xinyvy5Tw==
X-Received: by 2002:adf:9307:: with SMTP id 7mr2062805wro.414.1593154668628;
        Thu, 25 Jun 2020 23:57:48 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x18sm15355269wmi.35.2020.06.25.23.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 23:57:48 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     broonie@kernel.org, lgirdwood@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, Russ Dill <Russ.Dill@ti.com>,
        Keerthy <j-keerthy@ti.com>, AnilKumar Ch <anilkumar@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 6/9] regulator: tps65217-regulator: Use the returned value of tps65217_reg_read()
Date:   Fri, 26 Jun 2020 07:57:35 +0100
Message-Id: <20200626065738.93412-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626065738.93412-1-lee.jones@linaro.org>
References: <20200626065738.93412-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Until now the aforementioned return value has been ignored.
Previous and current calls to tps65217_reg_read() return
instantly when the value is not 0, so let's do that.

Fixes the following W=1 warning:

 drivers/regulator/tps65217-regulator.c: In function ‘tps65217_regulator_probe’:
 drivers/regulator/tps65217-regulator.c:227:9: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
 227 | int i, ret;
 | ^~~

Cc: Russ Dill <Russ.Dill@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: AnilKumar Ch <anilkumar@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/regulator/tps65217-regulator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/regulator/tps65217-regulator.c b/drivers/regulator/tps65217-regulator.c
index f2d3a4a9f3e77..3f5ea029e2e3f 100644
--- a/drivers/regulator/tps65217-regulator.c
+++ b/drivers/regulator/tps65217-regulator.c
@@ -254,6 +254,9 @@ static int tps65217_regulator_probe(struct platform_device *pdev)
 
 		/* Store default strobe info */
 		ret = tps65217_reg_read(tps, regulators[i].bypass_reg, &val);
+		if (ret)
+			return ret;
+
 		tps->strobes[i] = val & regulators[i].bypass_mask;
 	}
 
-- 
2.25.1

