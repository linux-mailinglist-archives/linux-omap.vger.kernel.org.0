Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A412240EEF0
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 03:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242376AbhIQByN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Sep 2021 21:54:13 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:37390 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbhIQByM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Sep 2021 21:54:12 -0400
Received: by mail-il1-f169.google.com with SMTP id i13so8633909ilm.4;
        Thu, 16 Sep 2021 18:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q4KnpOzY42vEtYkIMK54mzHMAcXP97zORxIlI/GXoig=;
        b=c94ufg/1vnTZWxLQRHOczsl2CzRVntT0PR6RcmyY8G8waTwoVaAxZgohss0WZLZ6Hc
         xTwrnUka1ajCs1Vg6U++IGSSBaLarZE+Q4WTUJWIIAgz1tMJTKBXVjE6HaY63bKrMCiF
         Bt8euqye7/TZSh5wswysXk8jJj6w0B+MsdE4W1jpy20yT6G5XSa67eobX86X4VThyQPf
         2rpwT0D7rfuNhvJ/k52trnAUAIT5JiAC/KYwQ/krXjmhJSi1w7h8fab7Gyf264qEqfdI
         fRJNniy1DkpX6Bq57yQDWvAIksnJWDT+c2kVKZZNmrzqEa7Ub+kOSHf13t5WOQ7reWoz
         IZyA==
X-Gm-Message-State: AOAM533fsSMZ/pPTcfI3ABnRUWnb+x03wQyaTH3jU5SXdJ+X9XXfE1hO
        aRSi3hoaA8GHfYCKb0HtV4R+9M2P3w==
X-Google-Smtp-Source: ABdhPJzfj0/r9qZ4uVyrAf1j2qwI9RX6IlADIpwKGmsqv00X42lchpVkYRCfoLYGkD32/G0fiDrabw==
X-Received: by 2002:a05:6e02:d05:: with SMTP id g5mr6320404ilj.34.1631843571132;
        Thu, 16 Sep 2021 18:52:51 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net. [96.84.70.89])
        by smtp.gmail.com with ESMTPSA id b16sm2628875ila.1.2021.09.16.18.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 18:52:50 -0700 (PDT)
Received: (nullmailer pid 1600391 invoked by uid 1000);
        Fri, 17 Sep 2021 01:52:49 -0000
Date:   Thu, 16 Sep 2021 20:52:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 05/23] dt-bindings: mmc: update mmc-card.yaml reference
Message-ID: <YUP08Zw/Bgi+zoBK@robh.at.kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
 <820bb7a1d7e0e51cbea72c9bee6bce806427d1f3.1631785820.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <820bb7a1d7e0e51cbea72c9bee6bce806427d1f3.1631785820.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 16 Sep 2021 11:55:04 +0200, Mauro Carvalho Chehab wrote:
> Changeset 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
> renamed: Documentation/devicetree/bindings/mmc/mmc-card.txt
> to: Documentation/devicetree/bindings/mmc/mmc-card.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/mmc/host/omap_hsmmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
