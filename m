Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9835B0F1
	for <lists+linux-omap@lfdr.de>; Sun, 30 Jun 2019 19:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfF3RYo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Jun 2019 13:24:44 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35702 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfF3RYZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Jun 2019 13:24:25 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so10675638ljh.2
        for <linux-omap@vger.kernel.org>; Sun, 30 Jun 2019 10:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GFCzf2qYFkFg+4VKLMFV4Jixzxe0BQO8ulzJAgHRDlU=;
        b=lMX0Cm6LTzBuz+GHYDw0DNMsSrZKxRSBoVT4X7KPkCYaRNDNuqp58zcRnME8wwOcjL
         RTt9eCCiXyF3G1LNlJaXYWNpZrTmMep2KnZ+C6G/9mUT71kvIaW9TmW1evExUi3ndh0u
         ymN77nvvdUXy8MprSwEjZAwSsPAZpbuXv/Gzu7pZsFWin0Fd21ujRNcha+iY7eZeRn9e
         9I3fRo5LQk9SI4Ob3706WeVB/gFYYUM8h3086qitcZrpEvB+DNhzEdYBnQh9fH+CDCi5
         SgjSWD2j4sX0knHWGtdB5YSXRsyiDo9XAy/8Srqb2XlwX4MWfTkqzDCbRXcI/ACyZifP
         Cutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GFCzf2qYFkFg+4VKLMFV4Jixzxe0BQO8ulzJAgHRDlU=;
        b=jp4/YGJYoGRH3wtoucS0yXi4kR645Uxcir7SdQfSxlFcgKs4Oph1L4v07f12hFc3dE
         l/DMlWs+QSxJYPb9eS7goOjtLz7M7CQuxtUEXw7ht/xrxylgWKfj3DSFHIena9Sra8A9
         JGoqEk25UHSbvWqG7DgQMwkCKTE7fsksRRjQh4UXJtv+7p3FBYJqvMl6Ql1waXVlrqcA
         T0Vxb0MIpo8RibziqPct0/z4MZwICEU90/t5lN+5jNuHL5Hm73yu/Hm3fxku5wDAN2vU
         jdaYHPlbjHczv+LCBaObHRg7mTmZeZCOGe+ijCG+ITI2v0JM5xFvJJcAG8xpEbJttyP+
         mzVQ==
X-Gm-Message-State: APjAAAVGia730Da/yT6TfodejIEJWjxlm5Kcxh1T19kwpBkNetGqOCQT
        r3SnHFvXKwFu7gEsSRk1nwalRg==
X-Google-Smtp-Source: APXvYqwAXi5uK3x1DFuhXQqmX1L9KHW5byM66gGMbQ8wr8qpQgljkcF3+f5HnY6iVrxdeUMLUEmmMw==
X-Received: by 2002:a2e:8849:: with SMTP id z9mr11396486ljj.203.1561915463532;
        Sun, 30 Jun 2019 10:24:23 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id c1sm2273795lfh.13.2019.06.30.10.24.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 10:24:23 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v5 net-next 5/6] net: ethernet: ti: cpsw_ethtool: allow res split while down
Date:   Sun, 30 Jun 2019 20:23:47 +0300
Message-Id: <20190630172348.5692-6-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190630172348.5692-1-ivan.khoronzhuk@linaro.org>
References: <20190630172348.5692-1-ivan.khoronzhuk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

That's possible to set channel num while interfaces are down. When
interface gets up it should resplit budget. This resplit can happen
after phy is up but only if speed is changed, so should be set before
this, for this allow it to happen while changing number of channels,
when interfaces are down.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw_ethtool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index 6ab0cec8560a..99935c1d265d 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -620,8 +620,7 @@ int cpsw_set_channels_common(struct net_device *ndev,
 		}
 	}
 
-	if (cpsw->usage_count)
-		cpsw_split_res(cpsw);
+	cpsw_split_res(cpsw);
 
 	ret = cpsw_resume_data_pass(ndev);
 	if (!ret)
-- 
2.17.1

