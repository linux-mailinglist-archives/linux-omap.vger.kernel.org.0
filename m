Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4684128E337
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730911AbgJNPYk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:24:40 -0400
Received: from mail-ej1-f51.google.com ([209.85.218.51]:35303 "EHLO
        mail-ej1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbgJNPYk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:24:40 -0400
Received: by mail-ej1-f51.google.com with SMTP id p5so2598258ejj.2;
        Wed, 14 Oct 2020 08:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WKtkQewTW29sGezeiY3401LBi0f0aDL6Ojfyn2s8nSY=;
        b=buMdzOs9oSHhTzhi6CgdQociN3teAYAUMJZw8ZbgCsQllLvNP4k16tx/HGjqhv9IZf
         gTSbSL54+RyV3kmkO7wSb6mkc4qcC4HMyaNbtvYOp3Vh7JaIPwKUX9P0j+v/uTedaIja
         n7tSU11Hx6YJOuczhPvpmFImS0lNXl/u8aTdxHAoPxSLo6APg3KQ4ttdfGQo8S0Fgu1f
         phb1c/bnVQOe0MsBBvM3kevZ9Ax7uHlnBylILcvbgAgN0Vn3AOnWXGsyvMRiss5BtQ5R
         6ad44EmwSqDmiLgTYoirkNFibSXu1pxFjKT9cFlVV+Fl7VzqPMaj4XZemh983KG27I/q
         nyWg==
X-Gm-Message-State: AOAM5314bOOoue1XCvbJwloHhnyXV4xP4QglOquGhvOnoidlsbRBL4nB
        uW/i5vpsL0jljwPg6iNRhcd/x/C+D5s=
X-Google-Smtp-Source: ABdhPJzE5XYEVbn6Q5Kzayrkv21WIGmOEMdk2tjCPkMhcq3EL/6zgaBQKbVAHbJ4ODUXmlA5ShI7Qw==
X-Received: by 2002:a17:906:8349:: with SMTP id b9mr6110278ejy.88.1602689078419;
        Wed, 14 Oct 2020 08:24:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id t4sm1954606ejj.6.2020.10.14.08.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:24:37 -0700 (PDT)
Date:   Wed, 14 Oct 2020 17:24:33 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch 08/12] usb: hosts: Remove in_interrupt() from comments
Message-ID: <20201014152433.GA3959@kozik-lap>
References: <20201014145215.518912759@linutronix.de>
 <20201014145727.957664398@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014145727.957664398@linutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14, 2020 at 04:52:23PM +0200, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out for various reasons.
> 
> Various comments use !in_interrupt() to describe calling context for probe()
> and remove() functions. That's wrong because the calling context has to be
> preemptible task context, which is not what !in_interrupt() describes.
> 
> Cleanup the comments. While at it add the missing kernel doc argument
> descriptors and make usb_hcd_msp_remove() static.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> 
> ---
>  drivers/usb/host/ehci-fsl.c     |    9 ++++-----
>  drivers/usb/host/ehci-pmcmsp.c  |   15 +++++++++------
>  drivers/usb/host/ohci-at91.c    |   11 ++++++++---
>  drivers/usb/host/ohci-omap.c    |    7 ++++---
>  drivers/usb/host/ohci-pxa27x.c  |   11 ++++++-----
>  drivers/usb/host/ohci-s3c2410.c |   12 ++++++------

For the s3c2410:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
