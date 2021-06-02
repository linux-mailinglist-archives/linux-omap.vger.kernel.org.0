Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2FED3993C2
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 21:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhFBTrF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 15:47:05 -0400
Received: from mail-oo1-f52.google.com ([209.85.161.52]:42592 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhFBTrE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Jun 2021 15:47:04 -0400
Received: by mail-oo1-f52.google.com with SMTP id v13-20020a4ac00d0000b029020b43b918eeso833130oop.9;
        Wed, 02 Jun 2021 12:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KXhvW2MuYBFxKDCb7L8NYpnjcodQhGqzQhLsB3uqzvc=;
        b=nEOibw8giRFxKJMaoU9uh9ZiMUVYsKP2Em//DrAgOk/YpN20HIfN5M2dHnUH1LVYpX
         BQIIfFw74GMvqmEg35+bQ+Imtn2UewE6795+cgaXOhnBvnPImq3APx72WRvEf/gLebEz
         hk6VOlzM621o0n92iwOLhOPf4Y7H5edgtoNFfxIUmLZieu7ZmyzaLQbQg8zXpYb3jn4q
         wWuayDN6M8DDIdCasICB7Ubep3fPBxvbyNz2oOryedmEJ7q+nxJZwAJbhcLBf4LBTrE6
         TVH31b+ZRgW+hq6nRMAKBZ+Q3BNrlpT+47vfY9dest6lRS1wn6ssLSYx6YZs8NTcov2y
         8aLA==
X-Gm-Message-State: AOAM532Qhxkh2j2m2DjyzdjCI0Hh3yHKFR0mf3wicOWHOY/EZv1y2gXP
        iFiuDdFOfC/CdfTck8jcVg==
X-Google-Smtp-Source: ABdhPJxvXI61LKj+3eYWuEZSdx6fsYRZ6BOLxSMVdHlanDLigdEbGt4aH2CuDIuFty6ShutIyPlzgA==
X-Received: by 2002:a4a:8241:: with SMTP id t1mr25453785oog.17.1622663121095;
        Wed, 02 Jun 2021 12:45:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m28sm174905otr.81.2021.06.02.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:45:20 -0700 (PDT)
Received: (nullmailer pid 3863012 invoked by uid 1000);
        Wed, 02 Jun 2021 19:45:19 -0000
Date:   Wed, 2 Jun 2021 14:45:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-arm-kernel@lists.infradead.org,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mailbox: Convert omap-mailbox.txt
 binding to YAML
Message-ID: <20210602194519.GA3862952@robh.at.kernel.org>
References: <20210520234348.4479-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520234348.4479-1-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 20 May 2021 18:43:48 -0500, Suman Anna wrote:
> Convert the current OMAP Mailbox binding from text format to YAML
> format/DT schema, and delete the legacy text binding file.
> 
> The new YAML binding conversion is an updated version compared to
> the original. The descriptions for certain properties have been
> improved to provide more clarity. Constraints are added to the
> properties 'ti,mbox-num-users', 'ti,mbox-num-fifos' and 'interrupts'.
> The 'ti,hwmods' is a legacy property and is retained only to reflect
> the existing usage on some older OMAP2 and OMAP3 platforms.
> 
> All the existing examples have also been updated to reflect the
> latest dts nodes (ti,hwmods removed from OMAP4 and AM33xx examples,
> and interrupts value updated for AM65x SoCs).
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: Address Rob's comments
>  - Replace definitions with $defs
>  - Dropping the trailing | character after all description keywords
>  - Marked ti,hwmods as deprecated
>  - Updated #mbox-cells description
> v1:
> http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210518172022.10562-1-s-anna@ti.com/
> 
> Note that this would continue to generate the checkpatch warning
> "DT binding docs and includes should be a separate patch" for the
> deleted text file. The fixes for dtbs_check warnings on mailbox nodes
> with this yaml file are posted as well, please see v1 patch for links.
> 
> regards
> Suman
> 
>  .../bindings/mailbox/omap-mailbox.txt         | 184 -----------
>  .../bindings/mailbox/ti,omap-mailbox.yaml     | 308 ++++++++++++++++++
>  2 files changed, 308 insertions(+), 184 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> 

Applied, thanks!
