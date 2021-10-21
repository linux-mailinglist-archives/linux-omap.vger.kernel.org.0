Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E884361B2
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 14:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhJUMdg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 08:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhJUMdg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Oct 2021 08:33:36 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF5FC06161C
        for <linux-omap@vger.kernel.org>; Thu, 21 Oct 2021 05:31:20 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v17so795423wrv.9
        for <linux-omap@vger.kernel.org>; Thu, 21 Oct 2021 05:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Fs2PJjDKgsMQJ8qtJV2zrVSrhWwPpCTU3gFTDLBP/II=;
        b=bm3moEPHlarZdxsYOTEU4kh7uk7CMz/Cw60+vQxFQfCN3GYecjoEjSw0PQ3lWhM1N7
         sWV8hZKbYyt6gy/RwV44nFoL2vkSy/NxptTi7KZK+ldsvbq7Trk/C95J3dZR1nQ7a2vW
         22bkVFz+UYv45SOQPEeyhHGaHG+kGdk36Z5aP5VXjj0n0IjrJV3flEY0nSV5puL0Uc8A
         4Xcx8A0LMr9KgH/e1qWrb5c3uO0/UEU6Zyyyh6IxZIAscKSEHbgPF6mJqg9vnyetwTSS
         ruWawcyvH7FllekHqDExvdb0Ckbsb3yffjqtqImw3HeXXdHjMGLx+hMu7APIjaQ7uEmD
         yVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Fs2PJjDKgsMQJ8qtJV2zrVSrhWwPpCTU3gFTDLBP/II=;
        b=1im2CYfsoNw4j27c1U9otWzVHip5IZq7q8nKV5a7TMis+02FyuFgCaiaX9tP/CADY7
         OKiFNqa2IPpaUdIKtek0rEVs9eSG7X5TpySx6M733VVLI52LRftAUjJky+wGJpdW3re5
         SPEkRAUVxwz24da9lNv9cSU3duXuXVnMBX6cho8O7TFs+DGDakvqoapw6DvlKqbsdXfl
         ApVPHWmMFQhYzJWe6Zayc4s9QTz69dsJAnCiaq3raxG1OOGBuWWK8ZUPBTCWypXLAPbf
         s1nj1ueLAW/gThuJ3jcmf/FbZxi31dAiyOrwCsos1eZQmyZ7JHzQKdMkO+apt4oYbSB2
         Wr4A==
X-Gm-Message-State: AOAM533pSUa/G6q1E2lUVHFjDpkv8Haary1wJYVDJaGAp6pe++4pbQLQ
        Y2n0Mp+s52amW7CwN8mvLdXYvA==
X-Google-Smtp-Source: ABdhPJy3EUH0CXDxpVreN2cZrI15Tgj8igByykRiu1fKZfVkJVCZXJ0CBZSgwJtbA2nRABNCj/jcqA==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr6977467wri.60.1634819478750;
        Thu, 21 Oct 2021 05:31:18 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id x21sm7741866wmc.14.2021.10.21.05.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 05:31:18 -0700 (PDT)
Date:   Thu, 21 Oct 2021 13:31:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Ryan Barnett <ryan.barnett@collins.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD, IIO, Input
 (Touchscreen) and Clk due for the v5.16 merge window
Message-ID: <YXFdlMLeWEuJwhdD@google.com>
References: <20211015081506.933180-1-miquel.raynal@bootlin.com>
 <YXFW5R8zK/g9Rqei@google.com>
 <20211021141357.2f08898c@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021141357.2f08898c@xps13>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 21 Oct 2021, Miquel Raynal wrote:

> Hi Lee,
> 
> lee.jones@linaro.org wrote on Thu, 21 Oct 2021 13:02:45 +0100:
> 
> > Enjoy!
> > 
> > The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> > 
> >   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-iio-touchscreen-clk-v5.16
> > 
> > for you to fetch changes up to e7c8a5fe82ff8ee100c65598187674eef4748bf2:
> > 
> >   iio: adc: ti_am335x_adc: Add the am437x compatible (2021-10-21 10:02:48 +0100)
> > 
> > ----------------------------------------------------------------
> > Immutable branch between MFD, IIO, Input (Touchscreen) and Clk due for the v5.16 merge window
> 
> Thanks! Just to be sure, you will send a merge request to Linus
> including this branch, right? Or do you expect someone else to do it?

I will do it *as well as* anyone else who wishes to.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
