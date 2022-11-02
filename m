Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C72461702B
	for <lists+linux-omap@lfdr.de>; Wed,  2 Nov 2022 23:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiKBWCs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Nov 2022 18:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiKBWCr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Nov 2022 18:02:47 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F3BF5A8
        for <linux-omap@vger.kernel.org>; Wed,  2 Nov 2022 15:02:46 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o7so14315029pjj.1
        for <linux-omap@vger.kernel.org>; Wed, 02 Nov 2022 15:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tDdQ76HTuetM+x0U50OZVmoiEGjK/pNJ2DGCTRImjr8=;
        b=KQiJkZtePhI2flEsUJPvJWcVFKJ+OroKKLIqrw7gi+MX+q2049MD3JdT/HnYDFu9WR
         zLFsSCKGQMStyQIn1lzgksLz8eM0HdHrRUXnS3XiBPbgf+cvVwhSqUXkg1CPQQjS8peH
         VqixHIIJaqwe+pLijCFPO7sKai856yU/ibvqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDdQ76HTuetM+x0U50OZVmoiEGjK/pNJ2DGCTRImjr8=;
        b=5fXDCVWMW9DBTRpC6ncLgGMupn42jGMBGj6CA6lm8mKQv6VFF6KeKV2iJYEfMUYCRK
         eVZHuY2CuX+aZI095iFhJnFuHLkNKfa7Tjw3YrACahnx3yU9uYggEnlf0iJnjqkjRKE9
         bUS5OqlEGEM+JnIgm7kWB8/SvwjsQe7aJAY+3Yw/UR3WdPJH2DcziHhANBHgRps3x3E9
         /AaB4kCnYreNDF0j5WFY6wmRRBSnzN9psw3UyHFb6FXE0EJv3hQ1B/ZkVVR37UcaJGW0
         5G+ONLHiGzd6TKTgiTMGo6+D3U4UYbdNu0KnwejS9ocYzvEirwI1WBr5OD+qPPyUBlEq
         VVtg==
X-Gm-Message-State: ACrzQf2XxAZYgKI16lVi/VJEjFWbyfdDo9lOSX4UXo7Oq3lYElKuQC+6
        M/7Ge6IIQllxIav9ZXr5CYxzMA==
X-Google-Smtp-Source: AMsMyM4WkfzMykXnG15VA0dkbaFs2pJjZSHDWxSbgybvMUsbX2OvhgJaXXTBVFr7hoOw8Zjy6TVn2g==
X-Received: by 2002:a17:90b:1095:b0:213:ee6a:f268 with SMTP id gj21-20020a17090b109500b00213ee6af268mr16266724pjb.213.1667426566071;
        Wed, 02 Nov 2022 15:02:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a20-20020a621a14000000b0056c6e59fb69sm8926019pfa.83.2022.11.02.15.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 15:02:45 -0700 (PDT)
Date:   Wed, 2 Nov 2022 15:02:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     William Breathitt Gray <william.gray@linaro.org>,
        linux-iio@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Patrick Havelange <patrick.havelange@essensium.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Julien Panis <jpanis@baylibre.com>,
        David Lechner <david@lechnology.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/4] counter: Adjust final parameter type in function and
 signal callbacks
Message-ID: <202211021501.88D8147@keescook>
References: <20221102172217.2860740-1-nathan@kernel.org>
 <202211021216.FF49E84C69@keescook>
 <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 02, 2022 at 01:23:51PM -0700, Nathan Chancellor wrote:
> Right, I am not the biggest fan of this change myself and it is entirely
> possible that I am misreading the warnings from the commit message but I
> do not see how
> 
>         comp_node.comp.signal_u32_read = counter->ops->signal_read;
> 
> and
> 
>         comp_node.comp.count_u32_read = counter->ops->function_read;
> 
> in counter_add_watch(),
> 
>         comp.signal_u32_read = counter->ops->signal_read;
> 
> in counter_signal_attrs_create(), and
> 
>         comp.count_u32_read = counter->ops->function_read;
>         comp.count_u32_write = counter->ops->function_write;
> 
> in counter_count_attrs_create() are currently safe under kCFI, since the
> final parameter type of the prototypes in 'struct counter_ops' does not
> match the final parameter type of the prototypes in 'struct
> counter_comp'. I would expect the indirect calls in counter_get_data()
> and counter_comp_u32_show() to fail currently.

Ah! Thank you -- those were the places I couldn't find.

-- 
Kees Cook
