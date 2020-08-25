Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE786251F90
	for <lists+linux-omap@lfdr.de>; Tue, 25 Aug 2020 21:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgHYTJ3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Aug 2020 15:09:29 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45727 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHYTJ2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Aug 2020 15:09:28 -0400
Received: by mail-io1-f68.google.com with SMTP id u126so13605887iod.12;
        Tue, 25 Aug 2020 12:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eEnscZ144fB/Icib0BxejX+dHld9Sfy5N1mdgz0fLTI=;
        b=L7yeUWLDE+/X4BIjbkx7Wk9thw+UYUayUj87dyl/CFzlbw30h55BkoTZR6F617iSBZ
         BaloxHgc4ljE0oGYd7sFHFAlI7znob+apR05PqB7khwxPszYLJGFGTWmPqvTFYbju5bN
         SJxSxITcCwDsyotcHg/GGZnU79rYJlOS+uQmXsvIv0UYX1sUtg1ettw3n4uDqjbg5tFB
         GL+c4FhQdwYc9LEh86KLg9joYuR0zQ8XwdVhH/Ke+LFLaaDqFZw+SKEYFs1i1XUmf4kM
         MfVHz/cC6+/MHEjovL0pz9yim6EwAFR3j3rALVIJwSUsTOXcgA2+xrb5OkwkqsEgGeB4
         41fA==
X-Gm-Message-State: AOAM531RNOdQQUYZPAE9T06qpC8W8DyRP/31vsCGq3x9RgGroJJ5sPH9
        +EsldKX8nnLzKDx9DSjEYQ==
X-Google-Smtp-Source: ABdhPJyG8THBO7xd0t/WMwBcD/ftApc9n5G5bBZV+A53FZSw7DcNoHRLyBUu6gbhqznyE9MRd5K6EA==
X-Received: by 2002:a05:6602:2106:: with SMTP id x6mr9859814iox.84.1598382567254;
        Tue, 25 Aug 2020 12:09:27 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id o62sm9717855ilb.38.2020.08.25.12.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 12:09:26 -0700 (PDT)
Received: (nullmailer pid 1144568 invoked by uid 1000);
        Tue, 25 Aug 2020 19:09:21 -0000
Date:   Tue, 25 Aug 2020 13:09:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, maz@kernel.org, devicetree@vger.kernel.org,
        jason@lakedaemon.net, robh+dt@kernel.org, s-anna@ti.com,
        linux-omap@vger.kernel.org, david@lechnology.com,
        linux-arm-kernel@lists.infradead.org,
        Roger Quadros <rogerq@ti.com>, praneeth@ti.com,
        "Andrew F . Davis" <afd@ti.com>, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: irqchip: Add PRU-ICSS interrupt
 controller bindings
Message-ID: <20200825190921.GA1144515@bogus>
References: <1597671613-20879-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1597671613-20879-2-git-send-email-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597671613-20879-2-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 17 Aug 2020 15:40:09 +0200, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The Programmable Real-Time Unit and Industrial Communication Subsystem
> (PRU-ICSS or simply PRUSS) contains an interrupt controller (INTC) that
> can handle various system input events and post interrupts back to the
> device-level initiators. The INTC can support up to 64 input events on
> most SoCs with individual control configuration and h/w prioritization.
> These events are mapped onto 10 output interrupt lines through two levels
> of many-to-one mapping support. Different interrupt lines are routed to
> the individual PRU cores or to the host CPU or to other PRUSS instances.
> 
> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
> commonly called ICSSG. The ICSSG interrupt controller on K3 SoCs provide
> a higher number of host interrupts (20 vs 10) and can handle an increased
> number of input events (160 vs 64) from various SoC interrupt sources.
> 
> Add the bindings document for these interrupt controllers on all the
> applicable SoCs. It covers the OMAP architecture SoCs - AM33xx, AM437x
> and AM57xx; the Keystone 2 architecture based 66AK2G SoC; the Davinci
> architecture based OMAPL138 SoCs, and the K3 architecture based AM65x
> and J721E SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
> v4->v5:
> - Fix typo in commit description.
> - Update interrupt-cells description regarding each cells meaning.
> v3->v4:
> - Drop allOf references to interrupt-controller.yaml and
>   interrupts.yaml.
> - Drop items descriptions and use only maxItems: 1 as suggested by Rob.
> - Convert irqs-reserved property from uint8-array to bitmask.
> - Minor descriptions updates.
> - Change interrupt-cells to 3 in order to provide 2-level mapping
>   description for interrupts routed to the main CPU (as Marc requested).
> - Merge the irqs-reserved and irqs-shared to one property since they
>   can be handled by one logic.
> - Drop reviewed-by due to introduced changes.
> - Add another example illustrating irqs-reserved property usage.
> v2->v3:
> - Convert dt-binding to YAML
> v1->v2:
> - https://patchwork.kernel.org/patch/11069767/
> 
> update irq-pruss-intc binding
> ---
>  .../interrupt-controller/ti,pruss-intc.yaml        | 158 +++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
