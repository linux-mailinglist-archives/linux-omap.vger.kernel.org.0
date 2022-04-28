Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236E95139B4
	for <lists+linux-omap@lfdr.de>; Thu, 28 Apr 2022 18:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345884AbiD1Q1m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Apr 2022 12:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345709AbiD1Q1l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Apr 2022 12:27:41 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D706C6D1AB
        for <linux-omap@vger.kernel.org>; Thu, 28 Apr 2022 09:24:25 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q23so7485482wra.1
        for <linux-omap@vger.kernel.org>; Thu, 28 Apr 2022 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Kflk9OISBqAQ9MGmpMOjj5cfrdUkwPfhW0JnSd4hFng=;
        b=QzFgtfPtRHZVZHWlKKx+wCmON1HzgoxMtZKa93YtvPSdL1DoMx/D8vI4ngamV6uS15
         Hktqp7FjmyIoN0i63TTEZjTnUV6A3jMt7r9hwVl5//UUjy8ch5KINk2nykx1vvaPbV0s
         dq596L5nX9hoDkv8BnyyMgwGroU2EHHgkwBhijw1T9OYQtpEm1jNJVBDYkZUv3W0N4HB
         w22yM/PdFH0F8RWTyz594D4wZB8lIPZC8730+bQdgjUz+55degVbr4IDHuryv59ZTYoj
         rsMhHi19FUTQJd05nIkH4ZJ/ffjsNeVuq3AMI72yB0oImAmZa74dDiYonriSfg2pMf1X
         W6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Kflk9OISBqAQ9MGmpMOjj5cfrdUkwPfhW0JnSd4hFng=;
        b=oHNj2qYFpU1QWVkO/2B/CHJ90fI+0kZG12iw2nnbciR7KRi04dNGeuLwnQJpfjqHQD
         p3Tlyp3w+mGCBW+xZJl4P8zyx2daCMFPTPLk10A01bMLxw94pGE+dmgr9FaUVs3aRBZI
         6ZoP3t/lXu+m5Db9cfG0oqoXiCt6wZ+31fk4L15echvZVK7HVydEsEqt84a8IS4huqq8
         MhXt3zrqOPGLfatqoyazcbl4qfOW02TkO+XqxxusuZQeVvAdoR5GOq/h69lzb2nuL/5q
         UZ4bb7kyq/5AczMbX8AO2SYhNowEBdz4c+6NMgZSPx6InokOPUbu6zePPqg/57185EX1
         7vuw==
X-Gm-Message-State: AOAM530u3mgioevO+OXc/Nl7gxkDxV6BdmsHpr7QxsQA4H4vydIoXKOo
        GmDF4akhwiryVu4qNNtF/ercsA==
X-Google-Smtp-Source: ABdhPJwdCVhhfINCa1iGzjvCS08hiIcmNour0OKFFXsjmxhup/DGRv4WTsd5gUJt8zXv0HXlv3en5g==
X-Received: by 2002:adf:e646:0:b0:20a:d3b3:f176 with SMTP id b6-20020adfe646000000b0020ad3b3f176mr21766533wrn.695.1651163064336;
        Thu, 28 Apr 2022 09:24:24 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f66-20020a1c3845000000b00393e84ea043sm324857wma.44.2022.04.28.09.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 09:24:23 -0700 (PDT)
Date:   Thu, 28 Apr 2022 17:24:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] mfd: twl6030: Make twl6030_exit_irq() return void
Message-ID: <Ymq/tVTo2JIEDEQa@google.com>
References: <20220113101430.12869-1-u.kleine-koenig@pengutronix.de>
 <20220113101430.12869-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220113101430.12869-2-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 13 Jan 2022, Uwe Kleine-König wrote:

> This function returns 0 unconditionally, so there is no benefit in
> returning a value at all and make the caller do error checking.
> 
> Also the caller (twl_remove()) cannot do anything sensible with an error
> code. Passing it up the call stack isn't a good option because the i2c core
> ignores error codes (apart from emitting an error message).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mfd/twl-core.c    | 4 ++--
>  drivers/mfd/twl-core.h    | 2 +-
>  drivers/mfd/twl6030-irq.c | 3 +--
>  3 files changed, 4 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
