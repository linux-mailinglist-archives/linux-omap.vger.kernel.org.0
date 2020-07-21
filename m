Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31FA228501
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jul 2020 18:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgGUQK7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jul 2020 12:10:59 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43777 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgGUQK7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jul 2020 12:10:59 -0400
Received: by mail-io1-f66.google.com with SMTP id k23so21979109iom.10;
        Tue, 21 Jul 2020 09:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ngN1dMUC5VJm2HydOcbj0IgJ128cHEC3MnMuoqkayZc=;
        b=gb2Gaf0JcjqTBxTTaXC0OqIEjlta51TlajJxBCCicy2KJJvHypjbK/U8mqUm+Lu285
         /GlZxDouJx4G5EmauUROHrxBN8qYP2twVvXrLS/rITkArSwLZVqNWPr2wVnNtbLp1S7E
         3sdKEclnvWTuZC+DVOyTDdUQRLvTfPBAcclvTJ6oBHLIwCRb9dDkjwZB17NCWoDSrv65
         AqmOORQhiUYiXmMrXsinBezU13FzY+C75OHqJDuVtNHQpQyS/EGPpL+68oRE7miVoYE4
         /VM5BGiEnV4ycfAk0TTe1ouzepLzaurz6ddwiGqnPdKqZ7F/h7oSlerLnb8AvVxDfpjL
         FPSA==
X-Gm-Message-State: AOAM531rVgGLCnVWfOqmLsvuT1+PqlzkPtkGJbu+VIrIBkTAHmur7UrD
        0mAtwrF5zqjGxZhLU6zYng==
X-Google-Smtp-Source: ABdhPJzxyQ/gVV/yZGUV9h9yhscNnMTy2KhOl/TC488NOSifdRHB34C5x/aPgftVf02G70cnTJyGeg==
X-Received: by 2002:a05:6638:14c1:: with SMTP id l1mr31432368jak.108.1595347858190;
        Tue, 21 Jul 2020 09:10:58 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c7sm10916679ilo.85.2020.07.21.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 09:10:56 -0700 (PDT)
Received: (nullmailer pid 389838 invoked by uid 1000);
        Tue, 21 Jul 2020 16:10:54 -0000
Date:   Tue, 21 Jul 2020 10:10:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     devicetree@vger.kernel.org, lgirdwood@gmail.com, tony@atomide.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH for v5.9] regulator: Replace HTTP links with HTTPS ones
Message-ID: <20200721161054.GA389740@bogus>
References: <20200719200623.61524-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719200623.61524-1-grandmaster@al2klimov.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 19 Jul 2020 22:06:23 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely
>  or at least not (just) HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  Documentation/devicetree/bindings/regulator/lp872x.txt | 4 ++--
>  drivers/regulator/hi6421-regulator.c                   | 2 +-
>  drivers/regulator/hi6421v530-regulator.c               | 2 +-
>  drivers/regulator/lp873x-regulator.c                   | 2 +-
>  drivers/regulator/lp87565-regulator.c                  | 2 +-
>  drivers/regulator/pbias-regulator.c                    | 2 +-
>  drivers/regulator/tps65023-regulator.c                 | 2 +-
>  drivers/regulator/tps6507x-regulator.c                 | 2 +-
>  drivers/regulator/tps65086-regulator.c                 | 2 +-
>  drivers/regulator/tps65217-regulator.c                 | 2 +-
>  drivers/regulator/tps65218-regulator.c                 | 2 +-
>  drivers/regulator/tps65912-regulator.c                 | 2 +-
>  12 files changed, 13 insertions(+), 13 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
