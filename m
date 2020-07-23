Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F3222B395
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 18:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgGWQen (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 12:34:43 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37984 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgGWQen (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 12:34:43 -0400
Received: by mail-io1-f66.google.com with SMTP id l1so6872464ioh.5;
        Thu, 23 Jul 2020 09:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=stpb1fSJwGt8vShAdT7DxsGVBCe34IXza9CEfFYmfoY=;
        b=PnhCBfLFMIHOrWdakSTbRmVuiaVeL813Yo37edYQDRkvK2HX969Bke0To7DwABAwVU
         kANHjGS3Ljxxq2DHute8EJQUPefgiVRmScDFdDgZas/882HekLxjrqkEeGQJAKtv7S4P
         IO5D/k/eMcoQwFJkAqWdUTg/N6l4uGZXhS/s1CAoqskVSXJ5mfVeTCyUqpcrvbciUyM/
         /muvPrF/iTnxXDSi8ocpm/8rqILUjoL2CaCtZapxldYHElzZFUn2JuffQAw5urKPxcRp
         wjdzBXRlOtw02UA5QrwIlFUbvRTtcKk35b9WoxDxDO13fs36GOdJGo5OR5Dzs0vHFBHJ
         MI8A==
X-Gm-Message-State: AOAM530iFkVPAz6xO7JettH/dIW8pZ89FmQ51Qbu1LpBL9tWrLslyzek
        6i1ABDUxg8DvmpusfY4J0A==
X-Google-Smtp-Source: ABdhPJylynKK+P2vHGCl3vu0jg/pAYFuvr7Pp1TO6idqHUxs9Ss5Reg+TCVFos/IOyis72LiIiSyjw==
X-Received: by 2002:a05:6602:2c4d:: with SMTP id x13mr5775659iov.117.1595522082470;
        Thu, 23 Jul 2020 09:34:42 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u9sm1724668iom.14.2020.07.23.09.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 09:34:41 -0700 (PDT)
Received: (nullmailer pid 497723 invoked by uid 1000);
        Thu, 23 Jul 2020 16:34:39 -0000
Date:   Thu, 23 Jul 2020 10:34:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, tony@atomide.com
Subject: Re: [PATCH] mfd: Replace HTTP links with HTTPS ones
Message-ID: <20200723163439.GA497543@bogus>
References: <20200722184711.GI3533@dell>
 <20200722192454.69591-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722192454.69591-1-grandmaster@al2klimov.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 22 Jul 2020 21:24:54 +0200, Alexander A. Klimov wrote:
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
>  Documentation/devicetree/bindings/mfd/twl-family.txt | 2 +-
>  drivers/mfd/hi6421-pmic-core.c                       | 2 +-
>  drivers/mfd/lp873x.c                                 | 2 +-
>  drivers/mfd/lp87565.c                                | 2 +-
>  drivers/mfd/omap-usb-host.c                          | 2 +-
>  drivers/mfd/omap-usb-tll.c                           | 2 +-
>  drivers/mfd/smsc-ece1099.c                           | 2 +-
>  drivers/mfd/ti_am335x_tscadc.c                       | 2 +-
>  drivers/mfd/tps65086.c                               | 2 +-
>  drivers/mfd/tps65217.c                               | 2 +-
>  drivers/mfd/tps65218.c                               | 2 +-
>  drivers/mfd/tps65912-core.c                          | 2 +-
>  drivers/mfd/tps65912-i2c.c                           | 2 +-
>  drivers/mfd/tps65912-spi.c                           | 2 +-
>  include/linux/mfd/hi6421-pmic.h                      | 2 +-
>  include/linux/mfd/lp873x.h                           | 2 +-
>  include/linux/mfd/lp87565.h                          | 2 +-
>  include/linux/mfd/ti_am335x_tscadc.h                 | 2 +-
>  include/linux/mfd/tps65086.h                         | 2 +-
>  include/linux/mfd/tps65217.h                         | 2 +-
>  include/linux/mfd/tps65218.h                         | 2 +-
>  include/linux/mfd/tps65912.h                         | 2 +-
>  22 files changed, 22 insertions(+), 22 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
