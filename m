Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA793501D34
	for <lists+linux-omap@lfdr.de>; Thu, 14 Apr 2022 23:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346825AbiDNVNL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Apr 2022 17:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346838AbiDNVNJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Apr 2022 17:13:09 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF7C62A3A
        for <linux-omap@vger.kernel.org>; Thu, 14 Apr 2022 14:10:42 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r18so7609253ljp.0
        for <linux-omap@vger.kernel.org>; Thu, 14 Apr 2022 14:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+4lpvbKg5yQwrVQ6wBK4s5z3Sbomyjck0oYsYDxCWF8=;
        b=jS6t1r+tMtQYCeKIEK9rVkTMR9dllh4CsVpViFdCqHnaIsbsVtoRv6a0W+cVrbIHY9
         p4ye9x2R+xYelSaadTcyueZTSP0acPbagJ8WMjmLB+uf5oE1lm/O3cHFzBT8/AGbj3rt
         aXD7mSYL+MwRXmwKKBquPWngEWnmV/rH1CvTFnTvO0gOIs44+Ar3CSoXjWB6xk07GCS0
         j0NZZEcasbl9iWs2Q/wxghIrlRIvgXFrgBo4JiB2oRlmDDkwauzAn4igXkEnSux+eaoY
         JFT3oriRA6GB/+YqQcnpp53XTT94LImKh/BPvq2ixt+GjpdBFlnTaj95v+QPk/qhaJb5
         6hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+4lpvbKg5yQwrVQ6wBK4s5z3Sbomyjck0oYsYDxCWF8=;
        b=bYdrbODcIsFO2iW4GpiurF0wgSDT2Tc/LcZEVXZG17zAFl7v8xcTahZoDX1bwyO5yA
         0nHWx0fzXRAspN/pxswQl6xBO9Y4XxMPZqVmUCP8Yl4mR0jcYObyD6nW6d/JKVrLA5Sj
         /4Xv8qxgYr646GoZhkghznana/tiodF6KQV76Tp5OXB6KOOx7POCtjhs6MnVhncy+WVZ
         uvJ9xanv4UAv2NpNzGzutzrcsE5ZrNS7tv7FXtks9kJLnVC9dB8bhJroSfS6s12cnw2k
         qjszo1w/scgD7PrdiEqqBT1uVXV6JcPfxmanCvDov1VIGX6/FBNVSppJ2vRkj51FAjF4
         yUmQ==
X-Gm-Message-State: AOAM532DnE6AkLD0kBE72X2crilqSqR7M8VcHMJkTkaFeMG9bUMJrDE8
        J8wA0ZFxnMLotuxCM+2PK5pBZ19axzGrhA==
X-Google-Smtp-Source: ABdhPJwayg75Kd9g4zvnWfBPOM02BqAawP/bE9Ni0y5VIaArivSHhguCHgWJbuHOkMe11DgTJ3aydQ==
X-Received: by 2002:a2e:91d7:0:b0:24b:6981:15a6 with SMTP id u23-20020a2e91d7000000b0024b698115a6mr2619424ljg.141.1649970640356;
        Thu, 14 Apr 2022 14:10:40 -0700 (PDT)
Received: from dell.intranet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id z26-20020ac2419a000000b004484bf6d1e6sm109738lfh.233.2022.04.14.14.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 14:10:39 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] MAINTAINERS: omap1: Add Janusz as an additional maintainer
Date:   Thu, 14 Apr 2022 23:10:37 +0200
Message-ID: <1681695.QkHrqEjB74@dell>
In-Reply-To: <20220413081656.27848-1-tony@atomide.com>
References: <20220413081656.27848-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wednesday, 13 April 2022 10:16:56 CEST Tony Lindgren wrote:
> Janusz has been active with improving and testing the omap1 SoC support
> and has been recently working on adding support for the common clock
> framework.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> ---
> 
> Janusz, does this sound OK to you? :)

Tony, Aaro, thanks for your confidence in me.

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Janusz

> 
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14389,6 +14389,7 @@ F:	arch/arm/boot/dts/am335x-nano.dts
>  
>  OMAP1 SUPPORT
>  M:	Aaro Koskinen <aaro.koskinen@iki.fi>
> +M:	Janusz Krzysztofik <jmkrzyszt@gmail.com>
>  M:	Tony Lindgren <tony@atomide.com>
>  L:	linux-omap@vger.kernel.org
>  S:	Maintained
> 




