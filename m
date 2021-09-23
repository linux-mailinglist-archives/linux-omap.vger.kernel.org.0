Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE6A416812
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 00:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243442AbhIWWc2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 18:32:28 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:33710 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243516AbhIWWcY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 18:32:24 -0400
Received: by mail-oi1-f176.google.com with SMTP id 24so11943230oix.0;
        Thu, 23 Sep 2021 15:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EYw81LhkE+j/tNbqGktOKpSybyNxssM0CQDhbHTTuGI=;
        b=A7+fBjO0ylRFr5+wvw54oK9NInuZyr/Az4pyns1cfvVaoXBoZgs8i1J0YIbZqDRJ8p
         WMQ3RFfMUvfj/Gbo3TDu7Kyz7hCH/t8XNHSfCXJy9rGpN98WHUR2wXropAWfpkRz/6yr
         njGx/ZR3xmddhp+Fj7Mg3Xvgd7hzBrN275m/QWVx2bke0D6ewiW98j+LZzDgMYL18eRA
         CXJ/yC4NdynvGz8f6qzCOuP7Hox1u0bzlFi1zMzwQpYY8pK5eD+HET3ucD+0GN6ItADw
         az4dSHoAQAmLtGEGCPWrG5WKrZSiO9FtfE26nJJpgITM6F2Jqr9ovOEXKq6io5z4cTIC
         tbAg==
X-Gm-Message-State: AOAM533t7cQhz/hMa8OSZeRRhTpW35w/FloqTayAof409G1QGsMDKBGR
        Sn+tbSWC4q6Epqp9I/MLKw==
X-Google-Smtp-Source: ABdhPJw/GzGbCRG9q14Aq42KNHCaxYKZryjuXontx6QuVzsgJbcCdC6o1520LmPrIYIZlvoMAoQcPA==
X-Received: by 2002:aca:241a:: with SMTP id n26mr14607337oic.137.1632436252504;
        Thu, 23 Sep 2021 15:30:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y83sm1634133oia.47.2021.09.23.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 15:30:51 -0700 (PDT)
Received: (nullmailer pid 3642842 invoked by uid 1000);
        Thu, 23 Sep 2021 22:30:51 -0000
Date:   Thu, 23 Sep 2021 17:30:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Faiz Abbas <faiz_abbas@ti.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-omap@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: sdhci-omap: Update binding for legacy
 SoCs
Message-ID: <YU0AG6fFBeogvDR+@robh.at.kernel.org>
References: <20210921111600.24577-1-tony@atomide.com>
 <20210921111600.24577-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921111600.24577-2-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 21 Sep 2021 14:15:56 +0300, Tony Lindgren wrote:
> Let's add compatible values for the legacy SoCs so we can continue
> deprecating omap_hsmmc in favor of sdhci-omap driver.
> 
> For omap5, we want to have a separate compatible from omap4 for the
> additional features available on omap5. AFAIK ti81 can just use the
> omap4 compatible.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-omap.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
