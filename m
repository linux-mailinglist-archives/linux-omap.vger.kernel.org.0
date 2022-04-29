Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6577751410F
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 05:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbiD2DR1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Apr 2022 23:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbiD2DR0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Apr 2022 23:17:26 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B935B3EB
        for <linux-omap@vger.kernel.org>; Thu, 28 Apr 2022 20:14:09 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id iq2-20020a17090afb4200b001d93cf33ae9so9379656pjb.5
        for <linux-omap@vger.kernel.org>; Thu, 28 Apr 2022 20:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nFM9yMNpdWIJW0IvtR+goiDwvDGtMAWhFOKZxeZSHwA=;
        b=c32rCfH7b5z75QmEiLKZFmDVAg/fS6yJx2iim/NfkyF1zlafJ5o4BqNB6ZKNnTXAEW
         6av+9/C1s3XBCkCUBXl9hAWiweI5l3ikErroLfdT+ZGqwMmxw6Ao5WNWxpWPdzCWrffq
         4fsFlnRsNPIeFHAGoG7Xc1EnrnqqgY0ov1YrfIWK+5ulDEKmUnL5Xqnn7xZcwOts3Whs
         ccO8n0K0z3ObS1jAcsokb91VWiakSP9xnmLv10JzjmhUIf94OA/uT/KVnJQPOrn0TJys
         2G1OwIw852xujd5Z+ZQA0dSD+cwBXXGgkXSpenIvm70HQ5qXS9MGkDupA//KaahU9iyC
         Yz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nFM9yMNpdWIJW0IvtR+goiDwvDGtMAWhFOKZxeZSHwA=;
        b=4dH0A/jJA92Kyn1dnuF+aKHuZojHJlJcpqm3aY1o0EsxgC3Eqi1wWPL8ly+t4rY2kQ
         2nH83V6c0gt7BZFuYPR8VClQW26H/n8Vj2CYpr1MGec/Uf+AstHH/Bch61B0me7BE2RZ
         4oW7eu6uSkpgfba2WJQCCQpiLaXRHn7fofBsPmVcw4/CF2OpZo0EV0MQX+Ka6kBQ/wuM
         BFkw8Darxoiz55ORpFFdBLrRhYkvjgg5yVs3aWfZKyDi8/Msb34rzjWXx/2HgzcK8LW7
         SzVA27bnsfWNfw5JPNVp/rRjJbMHsi7WlIi7wYbbB9UL8jtE1b301tvLYf1HagJo9oh1
         GG1Q==
X-Gm-Message-State: AOAM530C0XxgG2/CW7Y9W2uVBnlwpkAItFzDN/mskaTdnZFCposocZpw
        JURmBKQqpwJ9wXqV7FnMNPtbnQ==
X-Google-Smtp-Source: ABdhPJycVC0NmakoTo/scrNSHBhvw8+o8mldKZkBbeWXWQxLYxsYNWDSCi8TMrMD+bkVMyB9hvFYGA==
X-Received: by 2002:a17:903:2043:b0:15b:f6ff:79ed with SMTP id q3-20020a170903204300b0015bf6ff79edmr35021392pla.15.1651202048496;
        Thu, 28 Apr 2022 20:14:08 -0700 (PDT)
Received: from localhost ([122.162.207.161])
        by smtp.gmail.com with ESMTPSA id q93-20020a17090a4fe600b001d7e76f0470sm6526290pjh.0.2022.04.28.20.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 20:14:07 -0700 (PDT)
Date:   Fri, 29 Apr 2022 08:44:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tony@atomide.com, jmkrzyszt@gmail.com, aaro.koskinen@iki.fi,
        vireshk@kernel.org, shiraz.linux.kernel@gmail.com, nsekhar@ti.com,
        brgl@bgdev.pl, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/6] ARM: spear: remove include/mach/ subdirectory
Message-ID: <20220429031403.tjeudnzc6jwztkbj@vireshk-i7>
References: <20220428133210.990808-1-arnd@kernel.org>
 <20220428133210.990808-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428133210.990808-4-arnd@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28-04-22, 15:31, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Two of the remaining four headers are never used, the other
> two are only used inside of the platform code. Move them
> next to the files that include them and remove the
> Makefile trick that adds the include path.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-spear/Makefile                  |  2 -
>  arch/arm/mach-spear/include/mach/irqs.h       | 35 ----------------
>  arch/arm/mach-spear/include/mach/uncompress.h | 42 -------------------
>  .../mach-spear/{include/mach => }/misc_regs.h |  4 +-
>  arch/arm/mach-spear/pl080.c                   |  4 +-
>  arch/arm/mach-spear/platsmp.c                 |  2 +-
>  arch/arm/mach-spear/restart.c                 |  2 +-
>  .../arm/mach-spear/{include/mach => }/spear.h |  0
>  arch/arm/mach-spear/spear1310.c               |  2 +-
>  arch/arm/mach-spear/spear13xx.c               |  2 +-
>  arch/arm/mach-spear/spear300.c                |  2 +-
>  arch/arm/mach-spear/spear310.c                |  2 +-
>  arch/arm/mach-spear/spear320.c                |  2 +-
>  arch/arm/mach-spear/spear3xx.c                |  4 +-
>  arch/arm/mach-spear/spear6xx.c                |  4 +-
>  15 files changed, 14 insertions(+), 95 deletions(-)
>  delete mode 100644 arch/arm/mach-spear/include/mach/irqs.h
>  delete mode 100644 arch/arm/mach-spear/include/mach/uncompress.h
>  rename arch/arm/mach-spear/{include/mach => }/misc_regs.h (87%)
>  rename arch/arm/mach-spear/{include/mach => }/spear.h (100%)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
