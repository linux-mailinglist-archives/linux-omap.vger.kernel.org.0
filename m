Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754F380BB7
	for <lists+linux-omap@lfdr.de>; Sun,  4 Aug 2019 18:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfHDQdl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 4 Aug 2019 12:33:41 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33333 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDQdl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Aug 2019 12:33:41 -0400
Received: by mail-pf1-f195.google.com with SMTP id g2so38375203pfq.0;
        Sun, 04 Aug 2019 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBmoH+gM970xlSbiTXIHKJDYeSa4KiDTJot95o30ow8=;
        b=R/ctcO/OWCZ07yL9Gh/aOB0/jgK0/Kx2ofb2OR4WYVwe+3A1qgYmsWlavE7us1kltG
         X+5EAGUrUWhaeaKQSQCLfX/voWv+NDcrcyKdvPsBimw9VGhVuD2XONZ8e+Vw6U1EhPys
         QeVXn0tg/K/Sf3vKzp7IoU0k0fqnzbSVPgoz6khmAlnoqL/OxM/Ynl6KuL7QJCy8eZFk
         Z4l+vf/q0IiFe37TqLgv6RQDSFlVDU34qU25hYWJ9XLqL79q6Z32MeNlQudPJjIPPJpM
         8jjiIcCBDhGS4BODDL+QCF2OXseuKCwnVYVcGn2nD98KqU7AAhWBxq8QmE/r/Vxz2sbV
         grcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBmoH+gM970xlSbiTXIHKJDYeSa4KiDTJot95o30ow8=;
        b=ZNijuKWwDMaJV/eni26Guei3ivyTVvRvbihbbnFPOJDWn33gs4AxQVM3NrKunPF6OT
         1y/frc8O0+KUxEyLN8okO+dRveBRC/pJSqe/+7M/ILQhSPJAiWLfNw9TYQl1Yn9g4nwy
         fQRMzGGWTWb5ja086BVIEhIwfyF2mNQNfh0IDEI9YEXF894UELHRWt4XLwEWZLvL1ced
         9Tn+3/tCQl4A9d5ejf8r0Ga2UnPO1JyPrYigIjCr6HiJ9Ew8tr+AuEvvt+HXD/tfaM2q
         NP3mXnUjR//3gQ8n5C+85czdr/6wH8ju5ltqbckBEOTsBjzb4m/OLyvDPKjdWKzsCCD0
         D0bg==
X-Gm-Message-State: APjAAAU7a0N0NQ/OK/6M1Y3YO5nAjPXOwyIr+OEU9sceEZFjE4bzy5Mz
        uxeryh9S0z2up+ibp3q+goA=
X-Google-Smtp-Source: APXvYqx/2ykpTtxuJAAy+UyPpHP9QAub0yFjD3M7gDzMewXK8hMg7tELkkyTaLhZhWmhpFIzxfTMgQ==
X-Received: by 2002:aa7:90d8:: with SMTP id k24mr68774819pfk.115.1564936420769;
        Sun, 04 Aug 2019 09:33:40 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id b126sm118897837pfa.126.2019.08.04.09.33.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:33:40 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, t-kristo@ti.com,
        linux-omap@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] clk: ti: dm814x: Add of_node_put() to prevent memory leak
Date:   Sun,  4 Aug 2019 22:03:28 +0530
Message-Id: <20190804163328.6693-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In function dm814x_adpll_early_init, variable np takes the value
returned by of_find_node_by_name, which gets a node but does not put it.
If np is not put before return, it may cause a memory leak. Hence put np
before return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/clk/ti/clk-814x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/clk-814x.c b/drivers/clk/ti/clk-814x.c
index e8cee6f3b4a0..087cfa75ac24 100644
--- a/drivers/clk/ti/clk-814x.c
+++ b/drivers/clk/ti/clk-814x.c
@@ -66,6 +66,7 @@ static int __init dm814x_adpll_early_init(void)
 	}
 
 	of_platform_populate(np, NULL, NULL, NULL);
+	of_node_put(np);
 
 	return 0;
 }
-- 
2.19.1

