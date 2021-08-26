Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C733F88D2
	for <lists+linux-omap@lfdr.de>; Thu, 26 Aug 2021 15:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242739AbhHZN1I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Aug 2021 09:27:08 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:45647 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242697AbhHZN0y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 Aug 2021 09:26:54 -0400
Received: by mail-oi1-f171.google.com with SMTP id q39so4459904oiw.12;
        Thu, 26 Aug 2021 06:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=qufLi4mKRTkscRC7vpQ3Mm2vfDa/EHLDpUYXZ1BfFnY=;
        b=Asgua0W+6M4TBG0DWlXPZ/LMCWX9Fk8pVD/at1y4/cx9loTXNSRkpljdYN4oYNaICw
         Lq93ZBKJNKoyx2KICwdzbqANhZca63RnF3QbsTYTFBi/If9Whm73PXIpN9IMgF5dmAG2
         9tagoCoapd+ni9dQh7XsrdCuFRKyZ0dbVObJJHXhUDVe8+ddur/TYWuJ5fWTT4FMbxxb
         M+kTHVeIxZjL/4W0mpCIiDXaKrVAdbxjnvby3Hb1+L+vEQonMTjNaastbdku5QmfHmvm
         wTvPYhQEQM03D/tJpu1jm8P3YazPbJJyR1V1Uy5BUUQIU30y6X7IfpAaDsnGXvLta2MP
         +N8Q==
X-Gm-Message-State: AOAM530CY1sTyfFixGN/Asqk0Nc/mV1a2I9DXM2x3b1NL2DIlQJ/glX2
        yWpc8oZizOCpJ66SBPpeSw==
X-Google-Smtp-Source: ABdhPJyFOyPAhNjI9w6NY4VdLDffLd5xdVg58r0phf4E35lbkQXgJCb8wdzMavL7X+ULwtKTLmeeTg==
X-Received: by 2002:a05:6808:1513:: with SMTP id u19mr11302474oiw.109.1629984364800;
        Thu, 26 Aug 2021 06:26:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r15sm575293oth.7.2021.08.26.06.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:26:04 -0700 (PDT)
Received: (nullmailer pid 1033386 invoked by uid 1000);
        Thu, 26 Aug 2021 13:26:01 -0000
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     linux-kernel@vger.kernel.org, tony@atomide.com, nm@ti.com,
        lokeshvutla@ti.com, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, robh+dt@kernel.org
In-Reply-To: <20210826085731.15300-1-rogerq@kernel.org>
References: <20210826085731.15300-1-rogerq@kernel.org>
Subject: Re: [PATCH] dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
Date:   Thu, 26 Aug 2021 08:26:01 -0500
Message-Id: <1629984361.367999.1033385.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 26 Aug 2021 11:57:31 +0300, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 360 ++++++++++++++++++
>  2 files changed, 360 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/ti,gpmc.example.dt.yaml:0:0: /example-0/memory-controller@50000000/nand-controller@0,0: failed to match any schema with compatible: ['ti,omap2-nand']

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mtd/gpmc-nand.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Warning: Documentation/devicetree/bindings/mtd/gpmc-nor.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Warning: Documentation/devicetree/bindings/mtd/gpmc-nor.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Warning: Documentation/devicetree/bindings/mtd/gpmc-onenand.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Warning: Documentation/devicetree/bindings/net/gpmc-eth.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Warning: Documentation/devicetree/bindings/net/gpmc-eth.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Documentation/devicetree/bindings/mtd/gpmc-nand.txt: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Documentation/devicetree/bindings/mtd/gpmc-nor.txt: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Documentation/devicetree/bindings/mtd/gpmc-nor.txt: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Documentation/devicetree/bindings/mtd/gpmc-onenand.txt: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Documentation/devicetree/bindings/net/gpmc-eth.txt: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
Documentation/devicetree/bindings/net/gpmc-eth.txt: Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt

See https://patchwork.ozlabs.org/patch/1521000

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

