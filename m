Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321A82EC6DD
	for <lists+linux-omap@lfdr.de>; Thu,  7 Jan 2021 00:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbhAFX1s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jan 2021 18:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727676AbhAFX1r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Jan 2021 18:27:47 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCC3C06179B
        for <linux-omap@vger.kernel.org>; Wed,  6 Jan 2021 15:27:07 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id j1so2349819pld.3
        for <linux-omap@vger.kernel.org>; Wed, 06 Jan 2021 15:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RX6WvXc9AdwHUQos8gbpGpnxsoO0I2OI1Qb4Cxsnhfs=;
        b=C1JjlS48c7PMuu0up5KPTWHWKkwWM3CxSUzlsARcAX2zwRrUOl3NXWPug0XayiG3TN
         HkTywr/VNukyH/ept/yAe8PdTcCgbHjF1pQhWvwufWFGi9oIiTVb6MgbKMqwDI0pQwzJ
         F0qO/yFgvPeFiksqYo9VtqY43WoIFaotDxLvpSMDF666JAHsoZJbWXen2kK81xya1RQe
         7mLTw9rW4afFqCXYIPsB1gk8hmOyZ+eJQCeI6qxzHh2LDhSALeZbh8a8jI2pPKXvGNdY
         3XHMoOmN4x43gNucpmR0cBDt0fAZnNuZhSPplsZUvSzbi+AzBJPfydCybTkSbZKzJaQR
         3Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RX6WvXc9AdwHUQos8gbpGpnxsoO0I2OI1Qb4Cxsnhfs=;
        b=aH8LkbV3VyqXyQOiXhpbYBBuiixKvTRgqcM71R59HoIbUXfLx5rDqQbpgPLgJ2BKAu
         xqtsyIiYYpL4dKfKYGl97g2tWDjaVBN5EshJa6SSelXxN3wteMLcK7sMyYpQsSFtUg1w
         /1i3b58ukw6WJMoaTaVTy64h+mNGXIwgGQTAbDMIqf5mErMLKOVvvENDukANQOupbfKI
         vECkmDDH5Kr0kbkGoQzl2v3bSPBd7/Yg/DbsPr06rdxOwl7QYrzbrwUboRqKvGEHPH+a
         oEuu/+gMImrbrjeWIrdb4ArlbSVSZxuGKQY1Nnhq9a52SpZBqnWJ1tBCjwLizKspjw1N
         sEww==
X-Gm-Message-State: AOAM532SVSwRlAbSOPW65svtRKMtV9tbh4ZZxJtKwyHGynqGo49NyKSm
        iN7NRMbZQV/sOmXeUQXO5fc8ew==
X-Google-Smtp-Source: ABdhPJw1ywKCDyITNA3oNlsUFCtMTlY9Q9nKPwJYsOoi8XO0B46laGMkGJXfHAd11wYXgIiGTpVq9Q==
X-Received: by 2002:a17:90a:ec0e:: with SMTP id l14mr6563400pjy.123.1609975627034;
        Wed, 06 Jan 2021 15:27:07 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id i67sm3790692pfc.153.2021.01.06.15.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 15:27:06 -0800 (PST)
Date:   Wed, 6 Jan 2021 16:27:04 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        s-anna@ti.com, ssantosh@kernel.org,
        linux-remoteproc@vger.kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com, t-kristo@ti.com
Subject: Re: [PATCH v2 0/5] Introduce PRU remoteproc consumer API
Message-ID: <20210106232704.GE9149@xps15>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Dec 16, 2020 at 05:52:34PM +0100, Grzegorz Jaszczyk wrote:
> Hi All,
> 
> The Programmable Real-Time Unit and Industrial Communication Subsystem
> (PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
> RISC cores (Programmable Real-Time Units, or PRUs) for program execution.
> 
> There are 3 foundation components for PRUSS subsystem: the PRUSS platform
> driver, the PRUSS INTC driver and the PRUSS remoteproc driver. All were
> already merged and can be found under:
> 1) drivers/soc/ti/pruss.c
>    Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> 2) drivers/irqchip/irq-pruss-intc.c
>    Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> 3) drivers/remoteproc/pru_rproc.c
>    Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> 
> The programmable nature of the PRUs provide flexibility to implement custom
> peripheral interfaces, fast real-time responses, or specialized data handling.
> Example of a PRU consumer drivers will be:
>   - Software UART over PRUSS
>   - PRU-ICSS Ethernet EMAC
> 
> In order to make usage of common PRU resources and allow the consumer drivers to
> configure the PRU hardware for specific usage the PRU API is introduced.
> 
> Patch #3 of this series depends on one not merged remteproc related patch [1].
> 
> Please see the individual patches for exact changes in each patch, following is
> the only change from v1:
>  - Change the 'prus' property name to 'ti,prus' as suggested by Rob Herring,
>  which influences patch #1 and patch #2
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20201121030156.22857-3-s-anna@ti.com/
> 
> Best regards,
> Grzegorz
> 
> Roger Quadros (1):
>   remoteproc: pru: Add pru_rproc_set_ctable() function
> 
> Suman Anna (2):
>   dt-bindings: remoteproc: Add PRU consumer bindings
>   remoteproc: pru: Deny rproc sysfs ops for PRU client driven boots
> 
> Tero Kristo (2):
>   remoteproc: pru: Add APIs to get and put the PRU cores
>   remoteproc: pru: Configure firmware based on client setup
> 
>  .../bindings/remoteproc/ti,pru-consumer.yaml  |  64 +++++
>  drivers/remoteproc/pru_rproc.c                | 221 +++++++++++++++++-
>  include/linux/pruss.h                         |  78 +++++++

This patchset is giving checkpatch.pl errors and as such will not go further
with this revision.

>  3 files changed, 360 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
>  create mode 100644 include/linux/pruss.h
> 
> -- 
> 2.29.0
> 
