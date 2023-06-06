Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD09724ED5
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jun 2023 23:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237506AbjFFVeh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Jun 2023 17:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbjFFVeg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Jun 2023 17:34:36 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1D01702;
        Tue,  6 Jun 2023 14:34:35 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5440e98616cso117352a12.0;
        Tue, 06 Jun 2023 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686087275; x=1688679275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qLv8sUGLb5iZH0uN4+DZWSnCApGPJEQejVn3MnbQ7hk=;
        b=iW/nsyvYh3ccaqabJONHB6BWR0cbwnLkVMvcRqH9rvPKQHG8Mh8dloPFhH5wh7Jehd
         NakpcHmTqyZ7Y2UqySpXSDvUABnJaTc+UuJDk1wP4KCH9hhduD+gDwtdwNRpiVTfVTzD
         ybLA8IVosW3kMbY6TlafTNo5xg9ixiTD/uAADcXUTOewKY8+zRjQiLDcv8oYaxToiv2l
         Kf/w8nPClZQ8zlmvl2u1wI1Bfpwh+bKAv0Jhsg7aBjXNkxsp2tC2we5VtVxqa2DC2fWW
         tq5Ij0l4DZu6IKhM3RJCiGkYPV1hvzsw2jFM5XYmTdFg0fmt73wN5RDaoFBRLL6N7io1
         4ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686087275; x=1688679275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLv8sUGLb5iZH0uN4+DZWSnCApGPJEQejVn3MnbQ7hk=;
        b=T2/NCDPEDnW9p4A53uxzQ220tHW4leLE/D1jTG1tdRwZeLujzZnfn35n1Rz8HgYxbt
         LKX6hBNhixL0yS6VXhvWhwFKKU/F995+3Khepw2RI4ndiyyQn97y0+1nE4h7xtVJMIq7
         deUldqxcCk/8SHWB64Q5IIe2pwf+4pm8//WTXhjmg0qZsuTSmJkm1e7IQAlkT76raUB8
         OwoJvo08BYQK2N1+UDIigYwMFaR5t5eD7tQhrxRr1rRpJn8rot/ORvNtK1EtwPCA4y6w
         Bp7c1MPjPSy/krnfYY8xBqXKbT0TF2A7C8Hktai2OMSJ1HmbhClQJ11YulSO+wHfxolf
         liQQ==
X-Gm-Message-State: AC+VfDxG0DzjkNAZq2iMJizwjoLqVu5w3K1fQArEMBVQZya7XfD39aP1
        L7Rhr2m3VkGaqI5sMXXTyu0=
X-Google-Smtp-Source: ACHHUZ6I0zL8Pmz3w7AW/cYbyzC05TWpo5nv4nliLSyFLiNrGdYzwcxTY/ycjj/C78tlbO4OqC6tDg==
X-Received: by 2002:a17:902:da8f:b0:1ae:35b8:d5ae with SMTP id j15-20020a170902da8f00b001ae35b8d5aemr4458987plx.19.1686087274559;
        Tue, 06 Jun 2023 14:34:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001ae268978cfsm8961177ple.259.2023.06.06.14.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 14:34:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 6 Jun 2023 14:34:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, soc@kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-omap@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: ads7846 - Fix usage of match data
Message-ID: <573dba2b-b4c2-4055-ac21-7ab1d141e5ea@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 06, 2023 at 09:13:04PM +0200, Linus Walleij wrote:
> device_get_match_data() returns the match data directly, fix
> this up and fix the probe crash.
> 
> Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>
