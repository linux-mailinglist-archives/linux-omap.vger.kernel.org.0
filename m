Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE882621F2
	for <lists+linux-omap@lfdr.de>; Tue,  8 Sep 2020 23:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgIHVav (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 17:30:51 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36202 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728164AbgIHVau (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Sep 2020 17:30:50 -0400
Received: by mail-io1-f66.google.com with SMTP id d190so974820iof.3;
        Tue, 08 Sep 2020 14:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tZ2tqeTxfdvHhXI4fYGCLG+ZG+/0E7uL33/3l5leCNU=;
        b=i7zspWjDwFOU9ZdSsftLdoVhxt0DuIrjaUYJ5Y07vB2qcjgWLXxiZLn/d/sutKrulB
         ePXx/BodmKDhvIO6fTJ0Ixoui7jDJikPfMZvm6vQeVzeqDnU5aSWGEuMr42AoJfSbLGT
         ILq6FADYl17bMOWwGIShcpK75et9OXUlqwzEwJdLAoYet3/sbBWmApY7/upIB07r+3rg
         H8xsTRmTFfLKncKs3qm95uYvpfuaoaVYDsliY2SOvm4dQe1szO8u5EOz4UMlTIMBJUsr
         y5jEwTJHwAZ5I6IqBiA8D2PXWIX945s5Y0h2sExvs0EeyphfB2ENKSi64yKUFIxQ7t9T
         wbkg==
X-Gm-Message-State: AOAM530gUoMC76IY6qK+p/dYo+GDZkVHFeZFVLjMExY/WhwLRLsNByZB
        gJCVgxvNunKiFc4nwYJD/EAsP5AfBk3P
X-Google-Smtp-Source: ABdhPJwbYpkWxvkS0JzZDhjXoVmIf3BcFupaddawmTGlHFebiItQ6YyIOv77w6zWGeepGibLLVoAwA==
X-Received: by 2002:a6b:700f:: with SMTP id l15mr780998ioc.168.1599600649372;
        Tue, 08 Sep 2020 14:30:49 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id k14sm280985ioa.7.2020.09.08.14.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 14:30:48 -0700 (PDT)
Received: (nullmailer pid 959278 invoked by uid 1000);
        Tue, 08 Sep 2020 21:30:47 -0000
Date:   Tue, 8 Sep 2020 15:30:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
        ssantosh@kernel.org, devicetree@vger.kernel.org, praneeth@ti.com,
        santosh.shilimkar@oracle.com, s-anna@ti.com, robh+dt@kernel.org,
        tony@atomide.com, linux-omap@vger.kernel.org, lee.jones@linaro.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: soc: ti: Add TI PRUSS bindings
Message-ID: <20200908213047.GA959249@bogus>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1598020964-29877-2-git-send-email-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598020964-29877-2-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 21 Aug 2020 16:42:38 +0200, Grzegorz Jaszczyk wrote:
> This patch adds the bindings for the Programmable Real-Time Unit
> and Industrial Communication Subsystem (PRU-ICSS) present on various
> TI SoCs. The IP is present on multiple TI SoC architecture families
> including the OMAP architecture SoCs such as AM33xx, AM437x and
> AM57xx; and on a Keystone 2 architecture based 66AK2G SoC. It is
> also present on the Davinci based OMAPL138 SoCs and K3 architecture
> based AM65x and J721E SoCs as well.
> 
> The IP has a number of sub-modules some of which are represented as
> their own devices. This binding covers only the top-level sub-system
> devices, and some sub-modules like MDIO, MII_RT (Ethernet MII_RT module
> with MII ports) and IEP (Industrial Ethernet Peripheral). The remaining
> sub-modules bindings shall be defined in the respective driver
> subsystem bindings folders. Couple of full examples have also been
> added demonstrating the devices on AM335x and AM437x SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
> v1-v2 (requested by Rob):
> - Add unit address pattern for all sub-nodes.
> - Add "additionalProperties: false" to all sub-nodes and entire
>   description. This allow to catch and fix some issues like missing
>   "#address-cells" property description.
> - Drop ranges description.
> - Fix compatible name in example binding for AM43xx.
> - Drop the *.yaml references from description as they are not merged yet
>   and therefore they can't be converted to $ref.
> - Drop reviewed-by tag due to introduced changes.
> ---
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml       | 320 +++++++++++++++++++++
>  1 file changed, 320 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
