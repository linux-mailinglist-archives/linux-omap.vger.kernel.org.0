Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3E94EE93B
	for <lists+linux-omap@lfdr.de>; Fri,  1 Apr 2022 09:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343928AbiDAHsC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Apr 2022 03:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236779AbiDAHsA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Apr 2022 03:48:00 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B45D1877C3
        for <linux-omap@vger.kernel.org>; Fri,  1 Apr 2022 00:46:11 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w4so2907179wrg.12
        for <linux-omap@vger.kernel.org>; Fri, 01 Apr 2022 00:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LCK4dl8vS+URWlqWXwwTuaXKgNuAXF8HAeyZxE1LFL8=;
        b=BpbnJzDgr4hcsVzm1oW1UkpOJL1mxsvWBqxwP9Pkn+dLZROp8D3MfzEya/xvto6CWr
         5Hpy51yFe7FUyHZMj+ten4o6iHyYLGOYzGiFVa8ijakXUpvVAtHFLKterEGzz3KKQxlz
         ETKbdvSE/Hmbzm22TEyc/WygvjyFzFpHmwzsVIN4Dp/uQh1Q2uw9t6rGy1POR0K7WLPh
         tdLAt39eVc8KbF4Zm1vgyjPDgcyoVfk4wDMpQaiuzMPcSq4CvpRQr/y9jblbSlvajQzw
         wQoKcnKDtm3F84FSiVXrvhUmevYn2ZnpxpLRmKJS3rANa0ROOBR36YhB11AHzuGMrMep
         xe1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LCK4dl8vS+URWlqWXwwTuaXKgNuAXF8HAeyZxE1LFL8=;
        b=q9c+AvTKLHC2txcsoafmAtY3imibmtq/p0XXd9iSyMYggc6Roq/spvdjVjGvPD12u/
         mY1wz5uDIND124g1S2OFFgIKsfOW7kUR+rZgUkNYkU64v5T2Sv/BwCJnCXyoHH5JB7vf
         otzZiCIRnSDIu3va7eAxKvpigu+k1Z7C3xBnuPTrtjdWEJWJ+nAdrNJrhTMznHjLbqTg
         xuNeJPeXuPkjGO1XnPtir1Y3NTOOLumTVwdPgE/22ZAokdAkhXXRgEBX+CZxfFj+a1ZB
         px4z5EMbbikcGXgAhjV3RMjGGifjhcOLDdvhYDqEe0jZ3ApyWxH1Irs0jB+aFxBD+TB+
         ZPTw==
X-Gm-Message-State: AOAM532jWde8YbijCDEEpyCI3pylGDl1IluzS9DabKrXap/plwWO3XD9
        eKjyzE5wr3Fa+uI3/e4EmDYKaQ==
X-Google-Smtp-Source: ABdhPJx6WEFbSKf1cYZCJRp8RN1ZQmUurhpYge2WRdcRyKlEUox2QLvhk0FjNYGG4Dxt998JIXmRyQ==
X-Received: by 2002:a5d:4e08:0:b0:205:89b6:1d4d with SMTP id p8-20020a5d4e08000000b0020589b61d4dmr6821818wrt.124.1648799169763;
        Fri, 01 Apr 2022 00:46:09 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c35c400b0038cbd8c41e9sm9192704wmq.12.2022.04.01.00.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 00:46:08 -0700 (PDT)
Date:   Fri, 1 Apr 2022 08:46:06 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 0/2] mfd: twlx030: i2c remove callback cleanup
Message-ID: <Ykatvp3RuNA8IXZ7@google.com>
References: <20220113101430.12869-1-u.kleine-koenig@pengutronix.de>
 <20220331131722.wt5uik3izzr7kewq@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331131722.wt5uik3izzr7kewq@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 31 Mar 2022, Uwe Kleine-König wrote:

> On Thu, Jan 13, 2022 at 11:14:28AM +0100, Uwe Kleine-König wrote:
> > Hello,
> > 
> > the remove paths of the twl4030 chip can fail and then returns an error
> > code in twl_remove() early. This isn't a good thing, because the device
> > will still go away with some resources not freed.
> > For the twl6030 this cannot happen, and the first patch is just a small
> > cleanup. For the twl4030 the situation is improved a bit: When the
> > failure happens, the dummy slave devices are removed now.
> > 
> > Note that twl4030_exit_irq() is incomplete. The irq isn't freed and
> > maybe some more cleanup is missing which might boom if an irq triggers
> > after the device is removed. Not sure that twl6030_exit_irq() is better
> > in this regard.
> > 
> > I noticed this issue because I work on making i2c_driver::remove return
> > void as returning a value != 0 there is almost always an error attached
> > to wrong expectations.
> 
> It's one merge window ago now that I sent these two patches and didn't
> get any feedback. Did this series fell through the cracks?

Yes they did.

Feel free to submit [RESEND]s any time after 2 weeks with no reply.

They are now on my TODO list.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
