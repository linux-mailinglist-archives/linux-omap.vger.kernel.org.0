Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44AEB35DB0
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 15:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbfFENUR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 09:20:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33535 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727945AbfFENUQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jun 2019 09:20:16 -0400
Received: by mail-lj1-f195.google.com with SMTP id v29so11829296ljv.0
        for <linux-omap@vger.kernel.org>; Wed, 05 Jun 2019 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AdSMTsu+LtgUCnPNRXGwSYsCPQyqbNfQqw5/RcvDJNQ=;
        b=mRYi4qcNVbZ//c6G57A5oDbp2t2NbASCzTsCDdchf6yJyjEu+CCRyMzKu+9CKFoid3
         ZwHgGIiAW5HvrqKBJ1X5jiXV8j+0CWCui9NP5egRT36VcapZyU/vhp6SCCBuya6WqE09
         EJI5NV/HOBQBQfIBMKnZYUXlDbPa5bHZf929T1qOP8lEPB6+5X4JX3FTK/mOgRyEjxPo
         NR9mpIYi6oFT+jPz7XZ9EZc54Uv5lBo2CILwvY4E+3997zzLyyuwJiHIM/f3AzUS5BuF
         Ott0Mezc+lVW/EK674CogiBpGozPsRXV/dA4sdWr0gp2tJ/mtnknDAgMwxIU0+VWMBe/
         l5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AdSMTsu+LtgUCnPNRXGwSYsCPQyqbNfQqw5/RcvDJNQ=;
        b=ekPwkuWfnYUhP7b6Le5WDIdBglhDzN9kRoLg2F52oz0FBJgDZe6mGaRtcx0D0z8Ax1
         1gKJmObIF5UlE5gbXMPfsJ+eLDmwUybBzFJXJGXcDGJzVcagJ5tfB4gvSHUICS0ktiDp
         qnv/mqOO7j1PFQmR/RiUFmJ41VXTvRAxFWuc/G/SGEtpKUGrS4cjrgL/1TUDsgdWMhHC
         cBxsS143hDSjAhLYhR13DjwJBpQWZPhy7YrDIQp2GUhewiVEmo/9p/Pd9Iup1to9CD7B
         C8Tcpr7KZInOhJ/rPQin6XBIixuWhsxAAunLs7U4Bl1BRpt/joQo76tCILfGfj1xCsw5
         E2nw==
X-Gm-Message-State: APjAAAWXS6Zb5MFVf5/tkWV3Aj7bzAGXxAVhWepVCwyJQF3nMOCm/irx
        glz8V31OjDq8ishI00Kr436/cA==
X-Google-Smtp-Source: APXvYqxvv58TgjJcuU4yrUeNFAHBwd42aANAPZB41bOxwg874J6YPY976CnnpFzfO0Rvt1BD4pVGQw==
X-Received: by 2002:a2e:9c03:: with SMTP id s3mr6004919lji.209.1559740814483;
        Wed, 05 Jun 2019 06:20:14 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id t3sm1893259lfk.59.2019.06.05.06.20.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 06:20:13 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v3 net-next 1/7] net: page_pool: add helper function to retrieve dma addresses
Date:   Wed,  5 Jun 2019 16:20:03 +0300
Message-Id: <20190605132009.10734-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605132009.10734-1-ivan.khoronzhuk@linaro.org>
References: <20190605132009.10734-1-ivan.khoronzhuk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>

On a previous patch dma addr was stored in 'struct page'.
Use that to retrieve DMA addresses used by network drivers

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 include/net/page_pool.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index 694d055e01ef..b885d86cb7a1 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -132,6 +132,11 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
 	__page_pool_put_page(pool, page, true);
 }
 
+static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
+{
+	return page->dma_addr;
+}
+
 static inline bool is_page_pool_compiled_in(void)
 {
 #ifdef CONFIG_PAGE_POOL
-- 
2.17.1

