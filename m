Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D828D2C6BBD
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 19:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgK0SvP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 13:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728995AbgK0SrI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Nov 2020 13:47:08 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372E2C0613D4;
        Fri, 27 Nov 2020 10:45:57 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id u12so6585715wrt.0;
        Fri, 27 Nov 2020 10:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dSpeTF5dkf6JO4oSmSVL/Gz5HzjVWXT8QGTspkUmOkI=;
        b=G7EdtkLfVBJcJuQcWz2HUWQ1trPaUW05ND72IDep0c/khHO76cq2cZUJaIZf2mVRNh
         qOeB8DcZmpVj2v8zvvXE70NunVIaBf5nUdbWwJDBUVT4pM0Zw4GlMJfQZdJkPQ6if3iB
         GFYyaAaSqXCCmRbVSyh8Vm/bdCDPJB1tXihqK7Y5i+a9dy08P4zMJ9hNVTNFHo0n+4sy
         7jUOI3bfn8Mv4ScPXHv3pD9enWq4rOSbo2Lz8Vn4iJmenxQt+AvD0FG5+z6Tv4BbeEQN
         rMgeO0vWw/CKspUlb9TkZVcz5Yp39VjY4TvKNVqHaDfEKHkrBI9kSOWB2RV/ejAekJvH
         k55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dSpeTF5dkf6JO4oSmSVL/Gz5HzjVWXT8QGTspkUmOkI=;
        b=kVDh1mhcTnHShlmBeLxszrWrBEa4j7NlgAlAAny5zpk7WEwJVPCQWF0nLXv9tof+Dc
         dF80H3z27aKU7NgYv03PzMqv7GaMokfbBcX43sUvRsSu7895mqYe+zO5Zf97GavxRuwq
         0rtkifCOmgCH+QMBbVtur9jHnMqUaEb75SD+pTV1ZDsGOqrZmAN8+FbsIEaiu5yw0HMx
         HOiV7RQ7EWbNkds1LswaEq8nHV0fzInk7YltPVuuK97v4U+g5s8w/6zyqu0vza5pfXno
         Q8YAEs+Y6/t5/37XajqdTe3kMgx1tqZhD+iAcCeCVhWfag9uLlVGf+JF1mbkALyp1DXQ
         +2eg==
X-Gm-Message-State: AOAM533Sn+BBlGxma7OAhDbPByr3HU7bBhK1wZ6XUPO0H4OZ9PNZeeOZ
        98Pqo4vkbeOtf8Tzqtragis=
X-Google-Smtp-Source: ABdhPJyq0mMI3OCxgBoGVIvjn05MIOGizDE9GVA0/EOIksuKZa3NDm/cWIJWHeHw4h/3/1DdCMX+GA==
X-Received: by 2002:adf:f8d2:: with SMTP id f18mr12091230wrq.379.1606502756008;
        Fri, 27 Nov 2020 10:45:56 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id i5sm16384915wrw.45.2020.11.27.10.45.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Nov 2020 10:45:55 -0800 (PST)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
 <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
 <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
 <4948a40d-c887-5617-f5bc-1e0aff824ad7@gmail.com>
 <a86e0ef4-0b90-5aec-9632-e78fa4ca6d58@ti.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <23e27b7a-d2b9-a0c0-7518-bb5105306a97@gmail.com>
Date:   Fri, 27 Nov 2020 20:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a86e0ef4-0b90-5aec-9632-e78fa4ca6d58@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 27.11.20 г. 19:30 ч., Tomi Valkeinen wrote:
> On 27/11/2020 17:37, Ivaylo Dimitrov wrote:
> 
>> With 5.9.11 and the patch on top, n900 boots fine, albeit display remains blank, could be related to
>> brightness, we're still investigating.
> 
> Ok. A DSS regdump for a working version and the latest one would be good too. There's a omapdss
> debugfs dir, with dss, dispc and clk files which are of interest here.
> 

It turned out to be a long standing bug in the panel driver, with the 
bellow fix it works fine:


diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c 
b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index fc6a7e451abe..304267f7849a
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -629,7 +629,7 @@ static int acx565akm_probe(struct spi_device *spi)
         lcd->spi = spi;
         mutex_init(&lcd->mutex);

-       lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
+       lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", 
GPIOD_OUT_HIGH);
         if (IS_ERR(lcd->reset_gpio)) {
                 dev_err(&spi->dev, "failed to get reset GPIO\n");
                 return PTR_ERR(lcd->reset_gpio);

Proper patch will follow.

Thanks,
Ivo
