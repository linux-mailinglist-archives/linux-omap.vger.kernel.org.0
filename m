Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2C03FED6B
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 14:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344076AbhIBMFE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 08:05:04 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:46000 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344053AbhIBMFD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Sep 2021 08:05:03 -0400
Received: by mail-ot1-f50.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso2112048otv.12;
        Thu, 02 Sep 2021 05:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=4lQGZdi5tntA6BsPwhp64eLbrT+gtAQmgNJFN6OA1qc=;
        b=jLjVa5lHEqSFPKqvfddyIUFFcS373ilLUwdNb/1Z70O/JuenEpzyjTLxXXv5pYj8Bs
         IwFOIFoUx/zCHfb2azFzc/yH9tcUEhRAMDcq4+vek0SZJczKw+nRWL2+mj6N0ICyVNBw
         ggtWD8otoLMzY0kyWBV30J2OD07yg+yvwCk/v18e+VlYeRDbqXlaeUyVVMugriFUluN3
         WZk5G4s+aQyEKjNnBk0Fj6JxsDtAb/pyXyrPJz7aOMC4q+wQg4zR5g2kwPqNt28x/gE3
         Q5hkVYU86kml4wZnBFel1FCJwQ4XT3iwmaGfItozdx+UgG86506NhLEpa8BPAdvhKKnG
         c5+g==
X-Gm-Message-State: AOAM532JG30PStiE8HYi17l6CoaWeipQrVWTr5CVbnY18ibyLVu2ZKEp
        c6fI4NEm2SoSiiC+FdEkcjns9V8JnQ==
X-Google-Smtp-Source: ABdhPJxDO5/iYXs1QRVb8yiWOSLcaulTYDEz99hFFV2MOsIg7wgK3bSY+VRAQ8IvzoJN4vdOP41y5g==
X-Received: by 2002:a9d:3a6:: with SMTP id f35mr2216699otf.144.1630584244536;
        Thu, 02 Sep 2021 05:04:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 97sm302317otv.26.2021.09.02.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 05:04:04 -0700 (PDT)
Received: (nullmailer pid 685605 invoked by uid 1000);
        Thu, 02 Sep 2021 12:03:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     devicetree@vger.kernel.org, nm@ti.com,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        lokeshvutla@ti.com, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        tony@atomide.com, linux-kernel@vger.kernel.org
In-Reply-To: <20210902095609.16583-3-rogerq@kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org> <20210902095609.16583-3-rogerq@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
Date:   Thu, 02 Sep 2021 07:03:59 -0500
Message-Id: <1630584239.117607.685604.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 02 Sep 2021 12:56:05 +0300, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
>  6 files changed, 370 insertions(+), 163 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/ti,gpmc.example.dt.yaml:0:0: /example-0/memory-controller@50000000/nand@0,0: failed to match any schema with compatible: ['ti,omap2-nand']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1523568

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

