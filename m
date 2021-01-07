Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8380A2EE901
	for <lists+linux-omap@lfdr.de>; Thu,  7 Jan 2021 23:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbhAGWpf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Jan 2021 17:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbhAGWpc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Jan 2021 17:45:32 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58ED6C0612F8
        for <linux-omap@vger.kernel.org>; Thu,  7 Jan 2021 14:44:52 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id lj6so2576060pjb.0
        for <linux-omap@vger.kernel.org>; Thu, 07 Jan 2021 14:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xy+0Wf/XBKC2krvhyfRiZMGzAb4maQJy3OQAnfkQkMU=;
        b=hsnk/TljudfgBTilsXRtE3DyqLWx19RlNt7pJrmtbueV5GV1Ol6lZqtMn79gZQFcdF
         qpR5VxBsznA9PSdPyzr/wSNR+UlPuM50yZ8aUWD2n2E44rmQ4CWAWM3sstdfpPziiHW+
         zZNQGQGfiUJT5NvXsz4Z34VS2CH4a7sRvV2SZsvlhIi3bGZpe11E6TFpp4BP03jGkoJ1
         aVOBqP8jCjtiVSIYZFTUpSu341pFEjG9/hyuyFQPa9DiJ3XgluQTek4f4583q9I/xewQ
         H1bDHgMpRnCU7RQibL8P/EBqv2lj5auT9LzNGuZuWLZ0DMTNM3ANJZ6Ba4d97aPvuCns
         v8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xy+0Wf/XBKC2krvhyfRiZMGzAb4maQJy3OQAnfkQkMU=;
        b=rlZwyFj4YqcJxl0++Mv1vKm9Wn9IJbOsLkNWQ5K7KD8REAFBz/K4EJz/F0o8cj4yqM
         cIBMWuuImj4AwLGG09VZ4AEvt/Hxtl55XE49KJCKMiFbH6WSVxNkOW2OLDbqUMvuT4di
         JNXVyagLR3Uqed+x8BrykE3fbOJKOeEFequdbS+SRjUAud5dBcSiIXRTUQvMWoZie7Pl
         9vA27zU8HwxPFNK2/iTuEHVMTblEQEWf/ocST+9ejQlPj/SqV+4+8wdBvECigbL5U7S0
         lktM51LqoOmCSe+0ikFfFEgTpEnjQJvFJxnpImlXCd+eDryGC9Z7PICWevXL7v9Vt3af
         7XYg==
X-Gm-Message-State: AOAM533wZ1n94EZYF4xB5GTcJcdgEpdAgHMiJNLbBRsfe2ViI1+/OQo2
        Bzg1A3SuTxIsBkd6TGWdV1JJ6g==
X-Google-Smtp-Source: ABdhPJzAQ9RA9JKB0gtITGbuYddKSMfQtTts02BCc6DMDF0Q74OZgPLC/3M7ibTt9QMmJu8uU0l8Sg==
X-Received: by 2002:a17:90a:8a8b:: with SMTP id x11mr685794pjn.54.1610059491904;
        Thu, 07 Jan 2021 14:44:51 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x5sm5776179pjr.38.2021.01.07.14.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 14:44:50 -0800 (PST)
Date:   Thu, 7 Jan 2021 15:44:48 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>, ohad@wizery.com,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        ssantosh@kernel.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@kernel.org
Subject: Re: [PATCH v2 0/5] Introduce PRU remoteproc consumer API
Message-ID: <20210107224448.GB43045@xps15>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
 <20210106232704.GE9149@xps15>
 <11303a1b-5ab4-def5-77b1-c500894c9c87@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11303a1b-5ab4-def5-77b1-c500894c9c87@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jan 06, 2021 at 06:03:25PM -0600, Suman Anna wrote:
> Hi Mathieu,
> 
> On 1/6/21 5:27 PM, Mathieu Poirier wrote:
> > On Wed, Dec 16, 2020 at 05:52:34PM +0100, Grzegorz Jaszczyk wrote:
> >> Hi All,
> >>
> >> The Programmable Real-Time Unit and Industrial Communication Subsystem
> >> (PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
> >> RISC cores (Programmable Real-Time Units, or PRUs) for program execution.
> >>
> >> There are 3 foundation components for PRUSS subsystem: the PRUSS platform
> >> driver, the PRUSS INTC driver and the PRUSS remoteproc driver. All were
> >> already merged and can be found under:
> >> 1) drivers/soc/ti/pruss.c
> >>    Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> >> 2) drivers/irqchip/irq-pruss-intc.c
> >>    Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> >> 3) drivers/remoteproc/pru_rproc.c
> >>    Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> >>
> >> The programmable nature of the PRUs provide flexibility to implement custom
> >> peripheral interfaces, fast real-time responses, or specialized data handling.
> >> Example of a PRU consumer drivers will be:
> >>   - Software UART over PRUSS
> >>   - PRU-ICSS Ethernet EMAC
> >>
> >> In order to make usage of common PRU resources and allow the consumer drivers to
> >> configure the PRU hardware for specific usage the PRU API is introduced.
> >>
> >> Patch #3 of this series depends on one not merged remteproc related patch [1].
> >>
> >> Please see the individual patches for exact changes in each patch, following is
> >> the only change from v1:
> >>  - Change the 'prus' property name to 'ti,prus' as suggested by Rob Herring,
> >>  which influences patch #1 and patch #2
> >>
> >> [1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20201121030156.22857-3-s-anna@ti.com/
> >>
> >> Best regards,
> >> Grzegorz
> >>
> >> Roger Quadros (1):
> >>   remoteproc: pru: Add pru_rproc_set_ctable() function
> >>
> >> Suman Anna (2):
> >>   dt-bindings: remoteproc: Add PRU consumer bindings
> >>   remoteproc: pru: Deny rproc sysfs ops for PRU client driven boots
> >>
> >> Tero Kristo (2):
> >>   remoteproc: pru: Add APIs to get and put the PRU cores
> >>   remoteproc: pru: Configure firmware based on client setup
> >>
> >>  .../bindings/remoteproc/ti,pru-consumer.yaml  |  64 +++++
> >>  drivers/remoteproc/pru_rproc.c                | 221 +++++++++++++++++-
> >>  include/linux/pruss.h                         |  78 +++++++
> > 
> > This patchset is giving checkpatch.pl errors and as such will not go further
> > with this revision.
> 
> Yeah, I am aware of those. Greg has intentionally skipped the checkpatch
> warnings around ENOTSUPP, based on some similar discussion on a different patch,
> https://lkml.org/lkml/2020/11/10/764.

I only see input from Andy and Lars in the thread you point out, nothing from
Greg.  I have also taken a look at the patch [1] that made checkpatch complain
about ENOTSUPP.  From what I see in that commit log the goal is to prevent new
additions of ENOTSUPP to the kernel.

Please modify and resend, otherwise I'm sure someone will send another patch to
fix it before the end of the cycle.

Thanks,
Mathieu

[1]. 6b9ea5ff5abd checkpatch: warn about uses of ENOTSUPP
> 
> Let me know if you prefer that we change these to EOPNOTSUPP.
> 
> regards
> Suman
> 
> > 
> >>  3 files changed, 360 insertions(+), 3 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> >>  create mode 100644 include/linux/pruss.h
> >>
> >> -- 
> >> 2.29.0
> >>
> 
