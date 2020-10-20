Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616FE293BF2
	for <lists+linux-omap@lfdr.de>; Tue, 20 Oct 2020 14:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394292AbgJTMlL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Oct 2020 08:41:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42060 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394293AbgJTMlL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Oct 2020 08:41:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id j7so1934507wrt.9;
        Tue, 20 Oct 2020 05:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2k3QT8e6JHXiUSQ8tEDbpY0YHX0INQsZVl1oV9/OScg=;
        b=Bzg5lckxX/nmPfFkZ4ArNk8ag4F+FQmu5SzOZKDCcIFX5jZsq+AhRpeewlHAMzpwVl
         QIAuzPvjMR4uz6XvJzZmFV3/ttvUaTNdvqkNzGCmcRVgg8vVH0FV0e9chPwQlmADRBmL
         6nildOQxCKFuhsKWwQ/vWA29SLxGEm8hYnN8G8BLUNxVB/VvzTGKvFQiWvpkooPve4YZ
         G501w4P5nC1DPRPMq10p41a0g+7Azi/p1H5GlkZNz/LaI+rIg0dYnmorYOFqEdh1EiU/
         WxzOUAidRQb23RE0VLvvzc4RzCuuIWm8AbHUayHP5VxQGHocCvTsjlca8ysomelPwErM
         ddxw==
X-Gm-Message-State: AOAM530myZafS2KLpVZvV/3TrnoZujVvzkbTOj4DPnOcMRNSqqdGTO5t
        r5kPFALOA6s+hVvwRnZOb4Pr9Z0heBJjJQ==
X-Google-Smtp-Source: ABdhPJzSr9748C+VnEDyaRhfYvV3u+C8cd7Ni+pPwwMYFXG230BOGqR+I7cJwC1A7mV06gRTEkC+vw==
X-Received: by 2002:adf:a354:: with SMTP id d20mr3577144wrb.29.1603197667381;
        Tue, 20 Oct 2020 05:41:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id 130sm2705339wmd.18.2020.10.20.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 05:41:05 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:41:03 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 22/29] arm: dts: omap5: Harmonize DWC USB3 DT nodes name
Message-ID: <20201020124103.GP127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-23-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-23-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:52PM +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/arm/boot/dts/omap5-l4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
