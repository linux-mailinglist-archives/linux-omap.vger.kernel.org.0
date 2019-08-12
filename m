Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A2B89883
	for <lists+linux-omap@lfdr.de>; Mon, 12 Aug 2019 10:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfHLIOx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Aug 2019 04:14:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35869 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfHLIOw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Aug 2019 04:14:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so10027574wrt.3
        for <linux-omap@vger.kernel.org>; Mon, 12 Aug 2019 01:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qEF5FXIF7WGBf6aJazFjpcACOgco/DNFUKkyRA8p7dM=;
        b=Uy79aJTkTjamb+Vu1pzYBjsU9r5Qzghk+FQaDMW1XYZ3n6lIdPX7k1To3q3htFHTR6
         4sB5/KqTjpydFvhjfW0DdzS/uwZPMr88jd/uf4G9NpkHCRATL4WxpUxX79t7z+mAdeFA
         W5wB66YET1eytyP9Xn0qJrN3s9SALUhdQuYm62giJKC2LYgCoaDYPdRrCi3VRPeiWudh
         oqv1mnnGFlrUpBj5n0uSjZkdN+6DzpRVirXbzwqra50yrl4nzbQIreDNP/kh3zQ6BLFU
         OlD16xo5CnIiIoJaGv8ASnJ9wQFBcwIGX3ZWX9kV92Rxs1Pc2XcUf8E4YA/VjkLhI5WL
         rbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qEF5FXIF7WGBf6aJazFjpcACOgco/DNFUKkyRA8p7dM=;
        b=lgVJdpxKZqL0EPoLO4J4UAykFTmlFrkwzw7xDbsJAdetsrSPxRn7zoCtJodP+fZLJF
         ARag42LaYlrbPo4TEcPqkIFRjO2GLUuflc7+RkRfgWRQDzZVfd6VYBgbAZmagoKJdjDO
         J/OfUedgNhcyYi3D8dH9Qezxr1Ny5RQOmmRC/sm3aEyNKlR/Qdl5ecdbDtZLas2pXjiu
         VN3HfOJ9mkM0bJCCjEHVyD+5oWx38xcllnnfWVPcsThjRwmwWi1z6vyRFzsTD/E2sJHC
         9GMcqnbt2Yp+JToIwt9+BwomWMQDdVbUZDf+RgNSU4yR8kAukx9wi128V+6DPx/tpg9W
         XUFQ==
X-Gm-Message-State: APjAAAXAujvK5mPJUZ8QJguSJ/PDWT70ZqGacbqCk9eNqHXM3W0vLM3w
        ajL9DezSaKxtmbNMPRAoJ72+5Q==
X-Google-Smtp-Source: APXvYqwPJFnjS2XTDyp7EXOHWGcmXMZXQjXOwzyeo8HVPNvbhSJk2Dflgi3oKdZg/bNBPvjtmcGX0Q==
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr34014823wru.149.1565597690638;
        Mon, 12 Aug 2019 01:14:50 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id r4sm69876247wrq.82.2019.08.12.01.14.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 01:14:49 -0700 (PDT)
Date:   Mon, 12 Aug 2019 09:14:48 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] mfd: omap-usb-host: Mark expected switch fall-throughs
Message-ID: <20190812081448.GJ4594@dell>
References: <20190728235858.GA23755@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190728235858.GA23755@embeddedor>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 28 Jul 2019, Gustavo A. R. Silva wrote:

> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings:
> 
> drivers/mfd/omap-usb-host.c: In function 'usbhs_runtime_resume':
> drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     if (!IS_ERR(omap->hsic480m_clk[i])) {
>        ^
> drivers/mfd/omap-usb-host.c:313:3: note: here
>    case OMAP_EHCI_PORT_MODE_TLL:
>    ^~~~
> drivers/mfd/omap-usb-host.c: In function 'usbhs_runtime_suspend':
> drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     if (!IS_ERR(omap->hsic480m_clk[i]))
>        ^
> drivers/mfd/omap-usb-host.c:349:3: note: here
>    case OMAP_EHCI_PORT_MODE_TLL:
>    ^~~~
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mfd/omap-usb-host.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
