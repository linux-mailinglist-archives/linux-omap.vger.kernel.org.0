Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC3216F9F7
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 09:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgBZIuj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 03:50:39 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51121 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgBZIuj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 03:50:39 -0500
Received: by mail-wm1-f67.google.com with SMTP id a5so2018434wmb.0
        for <linux-omap@vger.kernel.org>; Wed, 26 Feb 2020 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MKIikjrWAh3ZaV9e3QCweJwY98iejyVof89XU+edArg=;
        b=LJ2xH127sLByQfhY8qMhzSJKbksxahprKmbpdqbGXuyF2vLbOLko8jIkVSDtmk1YdO
         ziJzMdASMxG92+V0rrM7ujqymd+ESwXcm9tL1/h4PkQn8MalTwPEYjkQUXC3XsAIospc
         R7ectLOaxHMnGvvIZClfsA5wFhDFZWhCf7FAino9V7frY8G6Gldxay72X8pBNaHqNujv
         yVtvhNDy+lWlC7btU1HOXWxelk4p4nVwkctO9zELLr9HUektZFhSNt24FtzCNhKvfIPN
         QmyFUJrvFrYw0FMScekIzWgRTpO+JTM+/panRDL/JfMVdHdOphJjV6+Y2g6PdaNqvYXn
         D1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MKIikjrWAh3ZaV9e3QCweJwY98iejyVof89XU+edArg=;
        b=lB8k7v2fxonoYftCJG62cg+Ja61RjMtYt3pORc2UstWk6A6LSzpwMA9o8EhkScOqxh
         O/ec5cXGDQnA8EWMsGvkXZfkpHXy61iOq4TWkn0ukJc2FeOgBpNRFjF+gItyeXSy2zNZ
         QIKpR6h3Qc+1xsk/yANYYusEZv+k4HI0Wg8b5p2JsE2a2dw0Ep9a+DFl85M0u3iX4nwO
         ey5V2EbhG6fHhUTHtQD6mc0yMZWfIvyEK5KNqzPGAnd8Mi3LikoErsmZvb26K4q0bjT7
         QVnw9u9kpsuWSZ8UVKCsdIa4/+93tYtGQGZDoEhhkKATzJMpV7ePTdjRMGB2bEMTsRry
         XpoA==
X-Gm-Message-State: APjAAAXrIHIZ2xnPVwqTeH8yP5k+/QbxvuZDynKExS1ibp6y0rZaVFIB
        M6wwJKSC5c6svuhkqEJN2i1xRA==
X-Google-Smtp-Source: APXvYqwCMu9qr2wKXq3e691TQhkDU5ouUWhrZXDRHQ0q4u5BCo8qYjvw+H3G8dgzdD919pA3Cuv0ow==
X-Received: by 2002:a1c:e388:: with SMTP id a130mr4137687wmh.176.1582707037240;
        Wed, 26 Feb 2020 00:50:37 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id b11sm2428996wrx.89.2020.02.26.00.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 00:50:36 -0800 (PST)
Date:   Wed, 26 Feb 2020 08:51:08 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     tony@atomide.com, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] mfd: omap: remove useless cast for driver.name
Message-ID: <20200226085108.GC3494@dell>
References: <1582056541-16973-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1582056541-16973-1-git-send-email-clabbe@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 18 Feb 2020, Corentin Labbe wrote:

> device_driver name is const char pointer, so it not useful to cast
> xx_driver_name (which is already const char).
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/mfd/omap-usb-host.c | 2 +-
>  drivers/mfd/omap-usb-tll.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
