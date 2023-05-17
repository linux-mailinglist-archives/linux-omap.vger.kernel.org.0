Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4C5707586
	for <lists+linux-omap@lfdr.de>; Thu, 18 May 2023 00:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjEQWh4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 18:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjEQWhz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 18:37:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDB82112
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 15:37:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso1695603e87.0
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 15:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684363072; x=1686955072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yzs2TWEhkJ9hD82ude0TiBapSAzMf5RyDNWe22ncnpM=;
        b=XR6oCmJxrjou0We2U8n8NhXHsEouCVxLgRjleZXPN3bg7nmZQxVTZnZpSA6sUkwv6/
         8DszJ467RunZQAFGogUx5yqAKAkuRaYMpug3pEQzhYwerlTwSiCw/cXMKBC9+eQSAvkb
         FNmKM6UaceVedWGfKRl+DmCN2jAYbRXiAUNyiXg4rIiny8hGwM6OOUZfQNKMejM+jjYm
         xds50TTD/AMnEZ8wVEF3JotQbpWfOlKkF4mLkZ3XFTIE1/mCOWqoBXhokpfYKorrBU6c
         TX3Ra9E8j2fGIbXSX15P+H1qivBsmJec2YYbD8hwYDly0oK3P63jdGNBoEhTGLnYGl1d
         83dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684363072; x=1686955072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yzs2TWEhkJ9hD82ude0TiBapSAzMf5RyDNWe22ncnpM=;
        b=FluNh4Ra7ULacHvITqPGB9Wxs1U2jEHwzNHGyQsHu07TGhocAGRDuvaCDnpVR7nGAd
         oOfaOv91WvsGhHfMAM3whPnOWs/VD3fA32cCvU/wRpoCsIAOI1hdlgj6DtKeUBOYKo/k
         nV/8co79r/jEiez7kPmvXki6WLtjSzIirrdY4zc+mfhzvoXYbM33VC0hfLDiHK6rfyk6
         3/fQmY/ArSCQ1mRFE6gbO32Ou6SrrF9GadFkJqRuFd9XJOISfOF8lRN7epk+bh+anL6i
         J4i9q0NAiKxEUZWv0/UmEF3ks367E6KDruCJqxZU4Nyb9XwOstMXuaZ0p7Rs5QIN1/qD
         wkCQ==
X-Gm-Message-State: AC+VfDwqagvNhECBfYTV7gqZzrKRLenXCsdKzcJOxO6Gv5ij8WIZthn0
        dJe0jldGKggAmwYGnzyFnBE=
X-Google-Smtp-Source: ACHHUZ4kJqRRmS5GVahbAwDgFMHQvEdVq6fET9r2KGbD5eM8yO9R8TLJ9yE3i+cb09ImkXwGw1r8lA==
X-Received: by 2002:ac2:5233:0:b0:4f3:895f:f3f5 with SMTP id i19-20020ac25233000000b004f3895ff3f5mr683298lfl.61.1684363072117;
        Wed, 17 May 2023 15:37:52 -0700 (PDT)
Received: from dell.localnet (77-255-201-154.adsl.inetia.pl. [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id d3-20020ac244c3000000b004eff32d6a21sm29884lfm.121.2023.05.17.15.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 15:37:51 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: omap1: Drop header on AMS Delta
Date:   Thu, 18 May 2023 00:37:49 +0200
Message-ID: <2224457.iZASKD2KPV@dell>
In-Reply-To: <20230430094028.561451-1-linus.walleij@linaro.org>
References: <20230430094028.561451-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Dnia niedziela, 30 kwietnia 2023 11:40:28 CEST Linus Walleij pisze:
> The AMS Delta board uses GPIO descriptors exclusively and
> does not have any dependencies on the legacy <linux/gpio.h>
> header, so just drop it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Thanks,
Janusz

> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index 9108c871d129..ac47ab9fe096 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -11,7 +11,6 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/gpio/consumer.h>
> -#include <linux/gpio.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
> 




