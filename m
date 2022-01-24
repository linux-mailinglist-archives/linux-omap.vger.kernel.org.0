Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE9949827F
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jan 2022 15:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239048AbiAXOfx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jan 2022 09:35:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20406 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238687AbiAXOfw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Jan 2022 09:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643034952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=BeGDvrkkjvA1xh6gxUs0jIKGaesitIVDxuSpQPVYy6o=;
        b=A+1OYaomQ9BRVEn7qyDwSJULgwZyihC/EHlr0H0qCFUbp8AGFUglyH4ZF9pRgSNCU/Imhy
        ZpxsBEvtqJAjsUTInfVfuhWfaM+tGPcEACkry+BgOSxyAdG94WbAjaiAcZf3BaM0gHWoFz
        XOOgBt9Yzop/UIyqnxlCsEoWeJLWha0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-k6a6SPl_PB2DsTbt4zX0rg-1; Mon, 24 Jan 2022 09:35:50 -0500
X-MC-Unique: k6a6SPl_PB2DsTbt4zX0rg-1
Received: by mail-ed1-f72.google.com with SMTP id bc24-20020a056402205800b00407cf07b2e0so2710250edb.8
        for <linux-omap@vger.kernel.org>; Mon, 24 Jan 2022 06:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BeGDvrkkjvA1xh6gxUs0jIKGaesitIVDxuSpQPVYy6o=;
        b=WW67fCycy1Tj57gKbjDVxlV+C8iqG+BkMUcXQsqIBWyrZvr/0RN17T7LEJkIzcL4rW
         gf2KR2bZrk+VW84eREVMVeTQX4OQJtdLk8nsuYQwu/eMLcGg2g15fHIsW8t0uifZJpvs
         i7ylxN/OjQYWJhdKx2tw5Ca7ScN5ZJh9pqmMbFH3QTtJlQDYmrea4bvc130LGPinVqWr
         9Rnd6mrczfBUMe5vXGKEhD9HxFW0Ef+YWPjPLhEzfA13TWxl/BumZg8nFjjE023fU2WX
         EWoe4HMziXguGlvqWtW9xc4QoOmcOq46fyQsFDTeNzPFvVBz2KqzxEPp5YCuMwfqKpYc
         gwAw==
X-Gm-Message-State: AOAM533r1i/lF1uiNUwIMLhfg1v9x5T8F0nNvONnfLRgF4ZCCHPOcfE4
        tkZO25u8p3nFCZ3apbomsIqIUU9Xj8QC0yO61wt03aKA8hcKc6kZrOgAhvjmuVCLDj0Tw2b77zk
        wbN8CemHSmcKQVc9NGP5pLw==
X-Received: by 2002:a17:906:6691:: with SMTP id z17mr12670607ejo.763.1643034949434;
        Mon, 24 Jan 2022 06:35:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTSN51Yp9SFRdp+9vVc5pIboTbtwWIVGk8Stug4CViUxXq8GFJQSFVd47ivrVfsXg8ZbQYig==
X-Received: by 2002:a17:906:6691:: with SMTP id z17mr12670584ejo.763.1643034949010;
        Mon, 24 Jan 2022 06:35:49 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id h16sm4961702ejj.56.2022.01.24.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 06:35:48 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id DCF9E1805FB; Mon, 24 Jan 2022 15:35:46 +0100 (CET)
From:   =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Murali Karicheri <m-karicheri2@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc:     =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net] net: cpsw: Properly initialise struct page_pool_params
Date:   Mon, 24 Jan 2022 15:35:29 +0100
Message-Id: <20220124143531.361005-1-toke@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The cpsw driver didn't properly initialise the struct page_pool_params
before calling page_pool_create(), which leads to crashes after the struct
has been expanded with new parameters.

The second Fixes tag below is where the buggy code was introduced, but
because the code was moved around this patch will only apply on top of the
commit in the first Fixes tag.

Fixes: c5013ac1dd0e ("net: ethernet: ti: cpsw: move set of common functions in cpsw_priv")
Fixes: 9ed4050c0d75 ("net: ethernet: ti: cpsw: add XDP support")
Reported-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 drivers/net/ethernet/ti/cpsw_priv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
index ba220593e6db..8f6817f346ba 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -1146,7 +1146,7 @@ int cpsw_fill_rx_channels(struct cpsw_priv *priv)
 static struct page_pool *cpsw_create_page_pool(struct cpsw_common *cpsw,
 					       int size)
 {
-	struct page_pool_params pp_params;
+	struct page_pool_params pp_params = {};
 	struct page_pool *pool;
 
 	pp_params.order = 0;
-- 
2.34.1

