Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D1739C197
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 22:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhFDUus (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 16:50:48 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:39816 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFDUus (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 16:50:48 -0400
Received: by mail-oo1-f46.google.com with SMTP id 67-20020a4a01460000b0290245b81f6261so2540164oor.6;
        Fri, 04 Jun 2021 13:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=inQ8sGC2NnMUBhvlMb91EK9RNezu3zjD1rcyMjgrMfs=;
        b=WkHZFlqZ2X56npyI3hFSOH7GkVzrXzgXV5fj4R9gckkSveZVp9hZjhRVOzgKR5JIro
         bs177zfiOcXzRIbdDaYJWKecTkIEQ0xtkArrlUACWwdznJu/58Jki2BwPlEW7+B624qx
         WhUWgxhFBD3LJz8qmBDrdIWZx/HIERXJv+i0jIbZmKfT8M28hMLyPPny9wWZhmFVQyx0
         Q9Bz2hVOJoYGHOUIOn/nrvood/d027J/h2SGjJ+R6EH+FyeVjcgo+/YbOAFX+AKtYeVl
         aOsb9srvZS0GRz8mR3Z8qEcu9kxJgcHOubwM+dfUGMSygueBPcYaHWLaPetMeLwkQ/F3
         8+mQ==
X-Gm-Message-State: AOAM5317b8cpL0xEskWqR8Z60h6Ag6JmXA5c+4pLR5i2O7Efq9Lcf+uu
        qli3+Tyagx4+3bNkeGNdiw==
X-Google-Smtp-Source: ABdhPJwmNx3aEeXnxqvNge056ldw9HcSTNO856AbtLXPdb1q59H2fkElHBNbNWz/GlnUtgJWJpmqRQ==
X-Received: by 2002:a4a:ac04:: with SMTP id p4mr5094271oon.70.1622839741112;
        Fri, 04 Jun 2021 13:49:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i9sm667872oog.17.2021.06.04.13.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:49:00 -0700 (PDT)
Received: (nullmailer pid 3890117 invoked by uid 1000);
        Fri, 04 Jun 2021 20:48:59 -0000
Date:   Fri, 4 Jun 2021 15:48:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Dario Binacchi <dariobin@libero.it>
Subject: Re: [PATCH] dt-bindings: serial: Move omap-serial.txt to YAML schema
Message-ID: <20210604204859.GA3885095@robh.at.kernel.org>
References: <20210527165636.939-1-vigneshr@ti.com>
 <3760d1e6-2121-323b-d962-60e8291d0bb7@ti.com>
 <YLCWS/+TwSs8HhRG@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLCWS/+TwSs8HhRG@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 28, 2021 at 10:05:47AM +0300, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [210527 17:49]:
> > 
> > 
> > On 27/05/2021 19:56, Vignesh Raghavendra wrote:
> > > Convert serial-omap.txt to YAML schema for better checks and documentation.
> > > 
> > > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > > ---
> > >   .../bindings/serial/omap_serial.txt           |  40 ------
> > >   .../bindings/serial/ti,omap4-uart.yaml        | 116 ++++++++++++++++++
> > >   2 files changed, 116 insertions(+), 40 deletions(-)
> > >   delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
> > >   create mode 100644 Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml
> > 
> > Why omap4? Seems ti,omap-uart.yaml is more suitable.
> 
> Additionally omap-serial should be deprecated in favor of 8250_omap and
> omap-serial not used at all in general.

That's the driver, I assume the binding works with either?
