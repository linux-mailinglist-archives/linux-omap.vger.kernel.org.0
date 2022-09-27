Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A60A5EC22E
	for <lists+linux-omap@lfdr.de>; Tue, 27 Sep 2022 14:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbiI0MO3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 08:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbiI0MO0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 08:14:26 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DD2B0B3F
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 05:14:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id m4so378750wrr.5
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 05:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JEiHz/34anv+sw3YKePZRjvV+9euJIIIAjKXG/xyX1c=;
        b=t/+7n69a4OmAhKy+ZWE+4OQ2hMUftmYmgtIOEk57+qqwu7JzJRaIUREi2L/JQ1n/9S
         eyky4GOl6B2rnoZizxF4MKwqzMG6xe5aFTDTpPislQe3Gx9iVHcKxAlYJ5HMNJTVphlE
         ZIBhYwxeJWARxeNBjVFt4SE3GomnHqbJ42peP0Iaohmk0b7UPb2VsbfKAbi/Ds17WnJV
         Le0JoDm0L9loO6d83+AB1yIlqETsZVeqc3Fpztiac1aDbQ4kcYpPJm7ybECGTtwvKQ8H
         V9V8+OFSfOqxZ94RB8Oc7e2GuZdekCldDWtFIecz+Ot8SVW86Id31SEXQs9MBBN4y/0A
         A85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JEiHz/34anv+sw3YKePZRjvV+9euJIIIAjKXG/xyX1c=;
        b=AlbdfZF5ix/Oo3ov9IpH5W1ccfWeQ1u6YCta1P7Lz2rYHjeBQhOWmuB3FMNhJF6P44
         HqeiHnLPcCyTaze5W/JmrTlgzBWSriN/P1rPsMB7x9Kqm/3BTtQliu8xNEHG89L33QdZ
         TMGFkZBa0kai3G7aaKSHoEeSUgfVOBzkfR2unu9aaHEtAnmkXbGxyorzul0R1BRqELk1
         0RS8A2/dcY6nqnGgA+Rk9b6eUwbtfxgdjOtyuVAWbl+LOkHvbvW1ti+RW+oylqOJ1rUU
         zinHZOovK4o+DVo1IdMlIEz5XjPQ4f2sKdRQHjoSsz3YjGe2zyFFkMO4JA2oZYsXhIFA
         9teA==
X-Gm-Message-State: ACrzQf2roDJdGzjwbLhfsWh6HATOj1hNouqvhyugQFPepYvqKh/2MJhU
        +fd1yvTE63Fbrm3H8jW0bTOFfduPbbRm3EeI8hrKCA==
X-Google-Smtp-Source: AMsMyM79n3MIxjAoajTxuCPqGzixd4TjlcvHFd3QhhkoLQkaGt20dlcjC/18m/goKhSip4RrtZLqjN+0za+VfNrY78M=
X-Received: by 2002:a5d:6d8e:0:b0:22a:4831:e0e with SMTP id
 l14-20020a5d6d8e000000b0022a48310e0emr15723503wrs.442.1664280864867; Tue, 27
 Sep 2022 05:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220923065005.20062-1-kishon@ti.com>
In-Reply-To: <20220923065005.20062-1-kishon@ti.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 27 Sep 2022 14:13:48 +0200
Message-ID: <CAPDyKFqxAaoC0+PQFdWN_ovgsn-ti2HkWH+2g056EVVwm7gJ-g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Vignesh as maintainer of TI SDHCI OMAP DRIVER
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 23 Sept 2022 at 08:50, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
> Add Vignesh Raghavendra as maintainer of TI SDHCI OMAP DRIVER.
>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>

Kishon, thanks for your contributions during the years! Vignesh,
thanks for stepping in and helping out!

Applied for next, thanks!

Kind regards
Uffe


> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c368f5aa7429..ffad3f1dfe9c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18302,7 +18302,7 @@ S:      Maintained
>  F:     drivers/mmc/host/sdhci-spear.c
>
>  SECURE DIGITAL HOST CONTROLLER INTERFACE (SDHCI) TI OMAP DRIVER
> -M:     Kishon Vijay Abraham I <kishon@ti.com>
> +M:     Vignesh Raghavendra <vigneshr@ti.com>
>  L:     linux-mmc@vger.kernel.org
>  S:     Maintained
>  F:     drivers/mmc/host/sdhci-omap.c
> --
> 2.17.1
>
