Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8A52E0214
	for <lists+linux-omap@lfdr.de>; Mon, 21 Dec 2020 22:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgLUVdT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Dec 2020 16:33:19 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:42741 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgLUVdS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Dec 2020 16:33:18 -0500
Received: by mail-oo1-f49.google.com with SMTP id x203so2523668ooa.9;
        Mon, 21 Dec 2020 13:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gWiQD/y1WI/6B6fr8kyAuu2q2JdRHnUgeEHtsHl3YCs=;
        b=JHWt4YRNtXX2+buu/W3XWHGRKN9oafH2Leov+q5Ru+2mWjIRDDGngfEzi28/tiq+aL
         rNdNAPL+9UMnbA+PUeW319A+GtOm0L4PyRq1+d7uhmXGEHiv2gSVtZ1QsCjBSLo4cozK
         IkprQBj/EXlXWE1LZU8D29QPAnxvSIlWXwvSZ4X5Frd4Sxj9+M/QS/BNAubU49q2sMRj
         Q7zTA/3a/86+NkIboBVHVVNacCbej6pLYTRkJACJ+zdPSnzQ9LU2snGjZxK6dZ3FOHSE
         w+WKGJWQOik96pxAt8y6LKwB1cjTA2OCMir6/lIa7mALijkXI5EBmKnzGL8/+8ELwcOP
         D9Eg==
X-Gm-Message-State: AOAM532Yl9Zkl75zDT4D2BsUlN02M/U3RnuGzjFkBOJbSCWYR1sciG8S
        fjBeRb+iJGoKiV1gUO0YFw==
X-Google-Smtp-Source: ABdhPJzbD9fHgs7bCr8ZeZ5A3JPbHIQ3I7jsG5NUKbqdndCmQUWN8vpFNOP3zntRQLVayUS/+AK78w==
X-Received: by 2002:a4a:d126:: with SMTP id n6mr12760916oor.47.1608586358001;
        Mon, 21 Dec 2020 13:32:38 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q18sm3934494ood.35.2020.12.21.13.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 13:32:37 -0800 (PST)
Received: (nullmailer pid 596888 invoked by uid 1000);
        Mon, 21 Dec 2020 21:32:34 -0000
Date:   Mon, 21 Dec 2020 14:32:34 -0700
From:   Rob Herring <robh@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, ssantosh@kernel.org, praneeth@ti.com,
        lee.jones@linaro.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: ti: Update TI PRUSS bindings about
 schemas to include
Message-ID: <20201221213234.GA596829@robh.at.kernel.org>
References: <20201216225027.2681-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216225027.2681-1-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 16 Dec 2020 23:50:27 +0100, Grzegorz Jaszczyk wrote:
> Now after ti,pruss-intc.yaml and ti,pru-rproc.yaml are merged, include
> them in proper property and extend the examples section.
> 
> At the occasion extend the allowed property list about dma-ranges.
> 
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
