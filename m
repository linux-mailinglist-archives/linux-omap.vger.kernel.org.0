Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7E616DBE
	for <lists+linux-omap@lfdr.de>; Wed,  2 Nov 2022 20:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbiKBTVa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Nov 2022 15:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbiKBTVZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Nov 2022 15:21:25 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF8B64F4
        for <linux-omap@vger.kernel.org>; Wed,  2 Nov 2022 12:21:25 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id e129so17068636pgc.9
        for <linux-omap@vger.kernel.org>; Wed, 02 Nov 2022 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8Kb3FDF2ltCser6k2Boeu2/HvGG8fHolSWZaqKpuWo=;
        b=fCn72FEK7JqsX/hjTC/1QNdSlH+bbHzR/GBepixStWXFturm+bTiBoBMndtGCZnb5M
         XsraYqE4sBX2oDxyjcP35OrO6FQDiukWe1SSPop+KaAnoJgDPAy/i9zrWuLR4Ta6mVxW
         84EA7ip0h1VgQ0i6pTx8biZigeWK/OyGC6HfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8Kb3FDF2ltCser6k2Boeu2/HvGG8fHolSWZaqKpuWo=;
        b=1UAzPK5XZ3+s/5GHQWYzNCibvSXPG0niLualanwMtpkFBT2y48GzL0TYPjON5kUIbD
         aDgacjjAtTzxbkIpzuo6pa3kn+D5zi42TeH8K75qc71cO8FjGkzaOeDazfi+jCCjhUFW
         6JYCkLK0e7LKTooA66QtB2miTvlNA2vC/THfiDaPdHPNu49xmGXNQQaubnqcVP+0svAV
         01Wwf7fajXNYkTlmBX//1UiEBBXsoURRun9kJ1Hq/JpIDHGCLE1bnCIOi5MopxCh3ztK
         XyrnYGwpm5UfkIQ/h/gzEubZip4EP4+4SF32/b5diXAX07ygatw/sysp2kYJo7DK4/j0
         /qmA==
X-Gm-Message-State: ACrzQf23lA+404LWTJYSq3qQejMUZlmjMMHNYVoMjcMd0Bz+i8ET9Cf2
        sEtXNjPkr+Tp9b6kt8oxkauZRA==
X-Google-Smtp-Source: AMsMyM7YtHQImySKSXB+BJJLch8eWsN4QnSQHsUF3i5EKgm8DFqzAM89xVOPYsJc4pOM1Kic66vX+A==
X-Received: by 2002:a63:d845:0:b0:44b:d074:97d with SMTP id k5-20020a63d845000000b0044bd074097dmr23393938pgj.32.1667416884681;
        Wed, 02 Nov 2022 12:21:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k28-20020aa7999c000000b0056bfebfa6e4sm8733255pfh.190.2022.11.02.12.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:21:24 -0700 (PDT)
Date:   Wed, 2 Nov 2022 12:21:23 -0700
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
Message-ID: <202211021216.FF49E84C69@keescook>
References: <20221102172217.2860740-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102172217.2860740-1-nathan@kernel.org>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 02, 2022 at 10:22:14AM -0700, Nathan Chancellor wrote:
> The ->signal_u32_read(), ->count_u32_read(), and ->count_u32_write()
> callbacks in 'struct counter_comp' expect the final parameter to have a
> type of 'u32' or 'u32 *' but the ops functions that are being assigned
> to those callbacks have an enumerated type as the final parameter. While
> these are compatible from an ABI perspective, they will fail the
> aforementioned CFI checks.
> 
> Adjust the type of the final parameter in the ->signal_read(),
> ->function_read(), and ->function_write() callbacks in 'struct
> counter_ops' and their implementations to match the prototypes in
> 'struct counter_comp' to clear up these warnings and CFI failures.

I don't understand these changes. Where do 'struct counter_comp'
and 'struct counter_ops' get confused? I can only find matching
ops/assignments/calls, so I must be missing something. This looks like
a loss of CFI granularity instead of having wrappers added if there is
an enum/u32 conversion needed somewhere.

-- 
Kees Cook
