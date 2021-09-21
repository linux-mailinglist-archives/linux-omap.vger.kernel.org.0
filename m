Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A664413B84
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 22:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbhIUUjl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 16:39:41 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:47086 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234921AbhIUUjk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 16:39:40 -0400
Received: by mail-ot1-f44.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso209321otr.13;
        Tue, 21 Sep 2021 13:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WZ2O/1DywFIdd2AdPGpsXwiZ+HYHMmvVFZU/1PSKMi4=;
        b=sxLVpv1aNZmXu9tOyQ6G4lA7C083qhSkab4xPs6Iss8WWaqL55LPqKnYVMyXS+TkOd
         IKdeZJf9knONHVEWBrHtdoZyBP7L3UP/LJm4T30TGxP19H2aIort1wAxisKSozXa4OU3
         sXUvQEWNbweGjqmspirE8E5coyTIlxo+vJhTdj+WLACjFJDN6ScKvpBlpx+98v8ZQ/Fz
         f6msFDQs6QlD5ZMwV79tXBPyaRoqY7iuQy29eN8ATWNUpXkOqjTUK86qJrQVfHWPkpIh
         SyW4F8ltGY8WySm9uVjVL52jRhh8auWazabxY4/usrn0BBNB4pJD0y7wXhQ13p+WRmx5
         7Edg==
X-Gm-Message-State: AOAM533Dl8qpOyHLn9ie0vx7PsZANdt3LQHVMvM78ggIImDZxzhgSF9Q
        JdslMT8ukf2yAKy8OKE9L0mQk2gQkw==
X-Google-Smtp-Source: ABdhPJwCSDs0+dPErWxNouh6rqPfVDvlA8KX1Y3rmLE4RmgmB4wrFYDxroLlTywf2JNDQPhDEUeQhw==
X-Received: by 2002:a05:6830:2704:: with SMTP id j4mr28280165otu.299.1632256690870;
        Tue, 21 Sep 2021 13:38:10 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id b25sm12769otf.67.2021.09.21.13.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:38:10 -0700 (PDT)
Received: (nullmailer pid 3287781 invoked by uid 1000);
        Tue, 21 Sep 2021 20:38:08 -0000
Date:   Tue, 21 Sep 2021 15:38:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        krzysztof.kozlowski@canonical.com, tony@atomide.com,
        lokeshvutla@ti.com, nm@ti.com, linux-omap@vger.kernel.org,
        grygorii.strashko@ti.com, miquel.raynal@bootlin.com,
        nsekhar@ti.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v4 2/8] dt-bindings: mtd: Remove gpmc-nor.txt
Message-ID: <YUpCsBdVcoLv2BH4@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-3-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-3-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 14 Sep 2021 15:26:59 +0300, Roger Quadros wrote:
> There is no GPMC NOR compatible or device driver. GPMC is just
> a bus interface over which standard (CFI/JEDC) NOR Flash chips
> can be attached.
> 
> For NOR chip bindings, please refer to
> Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/gpmc-nor.txt      | 98 -------------------
>  1 file changed, 98 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
