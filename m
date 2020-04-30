Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A05B1BFB91
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 16:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgD3OAp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 10:00:45 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35035 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729397AbgD3OAn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Apr 2020 10:00:43 -0400
Received: by mail-oi1-f193.google.com with SMTP id o7so5292733oif.2;
        Thu, 30 Apr 2020 07:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4SqKDcgFBHx1L7Er/7o6lUHlh3wWzthDwvJZwo5hrJU=;
        b=QyHss8qcgQyLccmUxMGK7EApLeAiW3/3iykKdJiIOU3pytBtLQreG1zD8jJ/osRaD1
         OWi7ggHOWxUnCKRUStcWiCp3YU2h4RLn+K/afjcbEAwT0BoPDqfXOI/GqIfeC542vLS4
         hFNDlBn2oe/4WqL9tEk8xWMn1qMxKYECNJMjIHPmKsj9l7JnLiHJ/8DEdZOPxYHctfjh
         NW1jlrZzQJAmt5XHzD6WXnICdzRdU+XU8uCdXJju0eQgZNJGbNxRJiZjLozars3rVELi
         Hr1qn+7431iZ5bRbzjdaZVrFoE9uROl4/S2hzHbzjllvm4lfb7veQyczd+Shv9MmnrY9
         XTgQ==
X-Gm-Message-State: AGi0PuaPA9FSTj3JLI/HqpvsxzbRoFDsDSrtYwsxW3pw74BYgtOH6h+F
        UV+4l2aVqGYNdyrkKtBJlg==
X-Google-Smtp-Source: APiQypK+NEro6nmq5Ju0kr11u0dYdZk562OwLmfEc6Rdsg37blDy9Pox4kBxZ7K1FWgojRgFDGj0HA==
X-Received: by 2002:aca:d684:: with SMTP id n126mr1810974oig.173.1588255242401;
        Thu, 30 Apr 2020 07:00:42 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h137sm2698oib.33.2020.04.30.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:00:41 -0700 (PDT)
Received: (nullmailer pid 20979 invoked by uid 1000);
        Thu, 30 Apr 2020 14:00:40 -0000
Date:   Thu, 30 Apr 2020 09:00:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/14] clocksource/drivers/timer-ti-dm: Add clockevent
 and clocksource support
Message-ID: <20200430140040.GA8363@bogus>
References: <20200417165519.4979-1-tony@atomide.com>
 <20200417165519.4979-3-tony@atomide.com>
 <62be90e2-7dbe-410d-4171-c0ad0cddc7a3@linaro.org>
 <20200427143144.GQ37466@atomide.com>
 <29f39839-b3ed-cac3-1dea-c137286320b1@linaro.org>
 <20200427152329.GR37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427152329.GR37466@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Apr 27, 2020 at 08:23:29AM -0700, Tony Lindgren wrote:
> * Daniel Lezcano <daniel.lezcano@linaro.org> [200427 15:03]:
> > On 27/04/2020 16:31, Tony Lindgren wrote:
> > > Hi,
> > > 
> > > * Daniel Lezcano <daniel.lezcano@linaro.org> [200427 09:19]:
> > >> On 17/04/2020 18:55, Tony Lindgren wrote:
> > >>> --- a/Documentation/devicetree/bindings/timer/ti,timer.txt
> > >>> +++ b/Documentation/devicetree/bindings/timer/ti,timer.txt
> > >>> @@ -14,6 +14,8 @@ Required properties:
> > >>>  			ti,omap5430-timer (applicable to OMAP543x devices)
> > >>>  			ti,am335x-timer	(applicable to AM335x devices)
> > >>>  			ti,am335x-timer-1ms (applicable to AM335x devices)
> > >>> +			ti,dmtimer-clockevent (when used as for clockevent)
> > >>> +			ti,dmtimer-clocksource (when used as for clocksource)
> > >>
> > >> Please, submit a separate patch for this.
> > >>
> > >> Before you resend as is, this will be nacked as clocksource / clockevent
> > >> is not a hardware description but a Linux thing.
> > >>
> > >> Finding a way to characterize that from the DT is an endless discussion
> > >> since years, so I suggest to use a single property for the timer eg
> > >> <ti,dmtimer> and initialize the clocksource and the clockevent in the
> > >> driver.
> > > 
> > > Hmm good point. We still need to specify which timer is a clocksource
> > > and which one a clockevent somehow.
> > > 
> > > Maybe we could have a generic properties like the clock framework such as:
> > > 
> > > assigned-system-clocksource
> > > assigned-system-clockevent
> > 
> > I think that will be the same problem :/
> 
> Seems like other SoCs have the same issue too with multiple timers
> to configure.
> 
> > Is it possible to check the interrupt for the clockevent ? A timer node
> > with the interrrupt is the clockevent, without it is a clocksource.
> 
> OK let's try that. So the configuration would become then:
> 
> compatible = "ti,dmtimer;	/* reserved for system timers */
> /delete-property/interrupts;	/* ok so it's a clocksource */
> /delete-property/interrupts-extended;

That's not really what was meant.

Let's say you have N timers. Either every timer is exactly the same and 
the OS can just assign them however it wants or there is some difference 
in the h/w making certain timer better for certain functions. Describe 
that difference. It could be clock rate, number of counter bits, always 
on, secure mode access only, has or doesn't have output compare or input 
capture, etc.

Rob
