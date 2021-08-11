Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FB33E86FA
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 02:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235608AbhHKAGW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Aug 2021 20:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbhHKAGV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Aug 2021 20:06:21 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29DFC061765
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 17:05:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x14so726573edr.12
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 17:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TmBklmtF6PgTKpjQdE419kaAahxa+pjIJXLUxre8OrA=;
        b=dUWOkifK3sn4MMtTFiJNvSMkEQ/2xwkZacFVMlQInmwPWfOdRpRahguGoy2B/EaTI+
         oEBOou9ClBv1T5xQkDOOlP5+ajZrj3ymFkoVUsc3D53S9IKJLQw2OmMksvJcIF79pf9c
         qwv5a9+Gal5UEYZXCOvirJvJmN3HK16P5dibwKDMTlGeGTDjfIxgeWKh1IdkObwt+t6k
         wwJSG1f2Zb/nIOFNeb7PwXlA62gOnV3r7mKfIdip2BhGDLKglas/6TpyT6FBiACn/H5I
         hTSNQY5JZSV0tskD6A+9S6BGbAM6xhug+ERUVS0mWq8doe75CjzQocmjGzgeLMIWPWU9
         vu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TmBklmtF6PgTKpjQdE419kaAahxa+pjIJXLUxre8OrA=;
        b=bRNBNOPQKx3TsmrC145hYCedAXRW1Uun5TebvLWT/pAP/wQBK8QBHGBoggl6x/2znw
         f4VMQbApqFiMSHsURMsXXVnR/TMXX5t0Bj1Bdh9Uoc61P/YlAz46koP1eVkri+cn1U/Q
         MwjH4px2mlubNAvuhOIYI4oVj3AiwgFbZml56oYnLmJrU7X9F4sGioIK+a7/f7kxAM+o
         WeM7jZz+ICfav3ueigwcT0PAnBVVnyaVZx2VNyCjmh54ELGCJ6Zvd+g2s0gotny8vI6Y
         6kWzzYGnEYrJp8Z37LxG4n03jTHFojvzgao5zoF7sLUBDXX9JSJJUquXZWTNVNXtSdAP
         WRsQ==
X-Gm-Message-State: AOAM532xqlxN3Jjtbr50GlE2qqykCq5ATuai+a4ppWP/rbKBBpl62O0r
        1hJM0A6YYjjo5GVLt9wEjwkX9g==
X-Google-Smtp-Source: ABdhPJyaGPw/WJKgjrkYUlq2P0fjLqHi+nuB4GcdGn/4PWX4vEAOefhRFIsBSBOg3Fc6gCoEMmCsNA==
X-Received: by 2002:a50:da0e:: with SMTP id z14mr8095533edj.73.1628640357400;
        Tue, 10 Aug 2021 17:05:57 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id t5sm3976119ejr.37.2021.08.10.17.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 17:05:57 -0700 (PDT)
Date:   Wed, 11 Aug 2021 02:05:55 +0200
From:   Ben Hutchings <ben.hutchings@mind.be>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-crypto@vger.kernel.org, linux-omap@vger.kernel.org,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Francis Le Bourse <francis.lebourse@sfr.fr>
Subject: [PATCH 1/2] crypto: omap - Avoid redundant copy when using truncated
 sg list
Message-ID: <20210811000554.GB22095@cephalopod>
References: <20210811000333.GA22095@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811000333.GA22095@cephalopod>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

omap_crypto_cleanup() currently copies data from sg to orig if either
copy flag is set.  However OMAP_CRYPTO_SG_COPIED means that sg refers
to the same pages as orig, truncated to len bytes.  There is no need
to copy in this case.

Only copy data if the OMAP_CRYPTO_DATA_COPIED flag is set.

Fixes: 74ed87e7e7f7 ("crypto: omap - add base support library for common ...")
Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
This change was previously submitted as part of the patch at
https://patchwork.kernel.org/project/linux-crypto/patch/1522164573-12259-1-git-send-email-francis.lebourse@sfr.fr/ .
I couldn't find the full discussion of that in mailing list archives.

Ben.

 drivers/crypto/omap-crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/omap-crypto.c b/drivers/crypto/omap-crypto.c
index 31bdb1d76d11..a4cc6bf146ec 100644
--- a/drivers/crypto/omap-crypto.c
+++ b/drivers/crypto/omap-crypto.c
@@ -210,7 +210,7 @@ void omap_crypto_cleanup(struct scatterlist *sg, struct scatterlist *orig,
 	buf = sg_virt(sg);
 	pages = get_order(len);
 
-	if (orig && (flags & OMAP_CRYPTO_COPY_MASK))
+	if (orig && (flags & OMAP_CRYPTO_DATA_COPIED))
 		omap_crypto_copy_data(sg, orig, offset, len);
 
 	if (flags & OMAP_CRYPTO_DATA_COPIED)
-- 
2.20.1

