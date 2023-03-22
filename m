Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4606C4B35
	for <lists+linux-omap@lfdr.de>; Wed, 22 Mar 2023 13:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjCVM7A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Mar 2023 08:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjCVM67 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Mar 2023 08:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99374574C1
        for <linux-omap@vger.kernel.org>; Wed, 22 Mar 2023 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679489890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=TIlkqLegAeBC+m6CULqCYBtfGXGiuVBtfnZhQsPJi1c=;
        b=ZKzsUA8jMRHwX/NMBN+26e4vRJ/VwRKod+T7P7wGpJOzz1gnxi+LW/DLYyLfRyRlyJ9AaM
        T69tdm9FNSaHNTZzQkqMo0B9ZXV/+ql0ODjPnmUwDE44s8hp6XqLbmKxoMthVY7xBnB3gA
        AVWcUg+7l9JmRZysTPBhse7YksxUL0s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-Nu327XCiOs-RNHwqshAf7Q-1; Wed, 22 Mar 2023 08:58:09 -0400
X-MC-Unique: Nu327XCiOs-RNHwqshAf7Q-1
Received: by mail-qv1-f70.google.com with SMTP id dl18-20020ad44e12000000b005a4d5420bc6so9217709qvb.11
        for <linux-omap@vger.kernel.org>; Wed, 22 Mar 2023 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679489888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIlkqLegAeBC+m6CULqCYBtfGXGiuVBtfnZhQsPJi1c=;
        b=Chx06xEiAEGElqoUBAQqrjvZrcQqggvDZjYQb/+B5ZgsyoD1Ft4xabysRVEn0WI6dc
         kiuUlYayUj/3eTLpNB8Cz9zTgBpq3uYX6jgE/lYErAaflylHocw9k0cPFIpgvpQAQBi8
         G723dcVcCQB07FeyqzTzUGKKzFc1Mrb9iKIfE6s8A4AS2IxPaSV7aNPwmsQtO5Xe2FrS
         WL2RlsQSLycfpvK36uNOHmACzqIoCm0/lo1BqhtsDnqfVbTVaZpujJFlQckfUesKNLci
         0Hb4xIgKXzQefFr2/uvn4AquKjXZuFgE8TePZDI7pOo32CnEPHIYncT+kV2WXqFHQT0m
         sLfg==
X-Gm-Message-State: AO0yUKV5U2hJCUpPRmgig161kvf5fpzZN9X2kkcOXdXeiu01RnigITyn
        sCjRhv4BB87pomwJbk6hQIKdTWnQlOg2aYmEho0KTQd0/Oy4RQlJeWv6UxwtGF7Li05o80i74Q2
        2LBq/pBu8SKz57VkZgYuhiw==
X-Received: by 2002:ac8:4e8f:0:b0:3e0:61d0:f7f7 with SMTP id 15-20020ac84e8f000000b003e061d0f7f7mr3644642qtp.14.1679489888595;
        Wed, 22 Mar 2023 05:58:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+ZXo2BL1krc+p+oXQftVChy1UR6ByYgMLDN+KiLPI5b2ZE0C/8zB2LdH0plZsW39kzr5AVQQ==
X-Received: by 2002:ac8:4e8f:0:b0:3e0:61d0:f7f7 with SMTP id 15-20020ac84e8f000000b003e061d0f7f7mr3644621qtp.14.1679489888366;
        Wed, 22 Mar 2023 05:58:08 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j9-20020ac874c9000000b003dffd3d3df5sm6394388qtr.2.2023.03.22.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:58:08 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     tony@atomide.com, lee@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] mfd: omap-usb-tll: remove unused usbtll_readb function
Date:   Wed, 22 Mar 2023 08:58:03 -0400
Message-Id: <20230322125803.2570968-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

clang with W=1 reports
drivers/mfd/omap-usb-tll.c:128:18: error: unused function
  'usbtll_readb' [-Werror,-Wunused-function]
static inline u8 usbtll_readb(void __iomem *base, u32 reg)
                 ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mfd/omap-usb-tll.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 8ca4067da6cd..69cbc2097911 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -125,11 +125,6 @@ static inline void usbtll_writeb(void __iomem *base, u32 reg, u8 val)
 	writeb_relaxed(val, base + reg);
 }
 
-static inline u8 usbtll_readb(void __iomem *base, u32 reg)
-{
-	return readb_relaxed(base + reg);
-}
-
 /*-------------------------------------------------------------------------*/
 
 static bool is_ohci_port(enum usbhs_omap_port_mode pmode)
-- 
2.27.0

