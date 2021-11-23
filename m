Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0282C45A255
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 13:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236864AbhKWMUc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 07:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236349AbhKWMUb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Nov 2021 07:20:31 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC59AC06173E
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 04:17:23 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id o14so16912013plg.5
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 04:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mkEq4BmUEoVljcEckgSBMpnauvpC1UPUMHZm4B1fp+I=;
        b=VcGYHHbDRnrUAfaRRo4xGBGFhB4Jot3nXPuT9mY1IOGqyooi3Wcys0ovFy7Bzu4Qp9
         cYOH+EvjG00zSGBgIH/8Z/kS9vhIXf7KXvoL2KoDZJ8WjF0si+ZFXU+djPWMJSNjkqi+
         OxiIV13I6hfCfNPRT39/KrbxiRS/hykVkcTrDrfxRZ8yYd8THK6qRTT8fizqep+XJazk
         Qv5K9NG6G+FDo1XgIa56/uyYRUCOvOJksbeNYMtnguwFwlezGqQwMpvwLFEhfivF0Cnn
         LvVv5JBaBHp8TmHLb1C3BkgmIYptvOgtwZrC1cZSIBdvXzrNDW0+jLB/TcIbhkdVMeR7
         rEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mkEq4BmUEoVljcEckgSBMpnauvpC1UPUMHZm4B1fp+I=;
        b=0NJYkXypF+BxOJdgceMupe3GLB+A12CPT2snMLhVwO9XNu0rZI6lTp9ycbggKN/Fhz
         R7I7i/B/CmGg1fQfStRZfOlwupSz9UI5wb0mAGHTy3cvnyaA4fxqfZOxJ9IUk3cEFdwd
         pgiiYPSrWkTtze1A9IgXAhgE1K9gIg+cRsSixEWg7H3gZT3sHqm9PQ3nikHlNcfB6sJA
         l0Lre1DJCvxD+4gFY5bNxxgrGMCmnV/bp17tySG+cNH/eW0/Py+evZJOevFxq8bifEmL
         ifNxMiymKzL6w4BnK04FdkvE1+26amyQzzFADkQO/t8G71wFBs42GF29AvFBMSdm6m8i
         Nf3Q==
X-Gm-Message-State: AOAM530IQOTksdbJLa9FTCRn5zKS/QpYRGxhFfj+JR++o7PIInOzy6nj
        Jgdp+JSbGIw9vU3ARdLGPZuvmS0j928fsGg/rwuZTZ4XYkvXxQ==
X-Google-Smtp-Source: ABdhPJyIfpk0+b2S4AFQbfbs8J2OvaMrtsZs+urGdBeIzgn6P66p2hhrcO2Z6+mIMMcpBsNQdZSqHDlNIky/ZACRHgg=
X-Received: by 2002:a17:90b:390a:: with SMTP id ob10mr2371927pjb.216.1637669843320;
 Tue, 23 Nov 2021 04:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20210921071807.30978-1-narmstrong@baylibre.com>
 <20210921071807.30978-2-narmstrong@baylibre.com> <YV1UdSVOrZ3B9pq/@atomide.com>
In-Reply-To: <YV1UdSVOrZ3B9pq/@atomide.com>
From:   Yongqin Liu <yongqin.liu@linaro.org>
Date:   Tue, 23 Nov 2021 20:17:10 +0800
Message-ID: <CAMSo37UN78k=WE0CwRyNNV3P9kau+JzVZ7mHOMMvh5Bn=+=jAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: dra7: add entry for bb2d module
To:     Tony Lindgren <tony@atomide.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gowtham Tammana <g-tammana@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi, Neil, Tony

# sorry for the confusion if you have received the mail which I sent
before, which is not in plain text mode.

We have one out of tree change to enable the SGX544 gpu for the
beagleboard-X15 Android build,
    https://android-review.linaro.org/c/kernel/common/+/20521/11/arch/arm/boot/dts/dra7.dtsi

and that seems to conflict with this BB2D enabling change,
Could you please help give some suggestions on how we should update our patch
to make it work with BB2D, without the revert of this change?

On Wed, 6 Oct 2021 at 15:47, Tony Lindgren <tony@atomide.com> wrote:
>
> * Neil Armstrong <narmstrong@baylibre.com> [210921 10:18]:
> > From: Gowtham Tammana <g-tammana@ti.com>
> >
> > BB2D is a Vivante GC 2D Accelerator.
> > This adds the node to the dts file within a target module node.
> > Crossbar index number is used for interrupt mapping.
>
> Thanks applying into omap-for-v5.16/dt.
>
> Tony

-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
