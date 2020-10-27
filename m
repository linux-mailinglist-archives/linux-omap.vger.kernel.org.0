Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FF229A65A
	for <lists+linux-omap@lfdr.de>; Tue, 27 Oct 2020 09:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894526AbgJ0IQy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Oct 2020 04:16:54 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35001 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894519AbgJ0IQy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Oct 2020 04:16:54 -0400
Received: by mail-lj1-f195.google.com with SMTP id x16so749409ljh.2;
        Tue, 27 Oct 2020 01:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4X/i6x/+78+fLH0lPper9S35q82PCcSbtWfUqlievPc=;
        b=dFevk5ljJev2bT1xhviKxC52SYR6aPDG0fLcP1QG38OkfTom6xGNIM//0RZ/foJRP4
         Ao4uapp0tLfheeZ7KT3I3J10TOuUGQMBiXCGnqilB4vtOf8WX4VVMAl0gr+Hxg/15OOz
         uz+HV2q/VNfHEgMLJ1fHZ0G26MoCZ/z0QXzcv9HXFrja/NZTHsFXVV3Bb+TjRKpyVAcs
         +G4kYFP0EOGv3frtkya2LMj4U5YTRkJlSbK9TFIWtiEi7TXpcAGZFrWO2/4K66IUWwMx
         HKKDf996qnl0iXgKrWL/N6GJ3X/YhTCHqL6Z//W3nD/cGpvWl/RahqO3zGiy/FNIdcVl
         LpLA==
X-Gm-Message-State: AOAM531Rwf6a5ewZ5O/OLKRL2LUls8o3KiSvUKE9fLrVY32wEJhyp/3n
        qeEYvcVSTj7W2f3hLeBSzH8=
X-Google-Smtp-Source: ABdhPJyiRzqsfEO4O7r5IIRQvb3+7LSAdAe3jrDZoAuW1ZpukGOup5MjnYT7Lif1P6AYdNpMCqJQUQ==
X-Received: by 2002:a2e:8103:: with SMTP id d3mr545991ljg.384.1603786610328;
        Tue, 27 Oct 2020 01:16:50 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v16sm92687lfq.68.2020.10.27.01.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 01:16:49 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kXK9v-0001H7-Vf; Tue, 27 Oct 2020 09:16:48 +0100
Date:   Tue, 27 Oct 2020 09:16:47 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch V2 02/13] USB: serial: keyspan_pda: Replace
 in_interrupt() usage
Message-ID: <20201027081647.GC4085@localhost>
References: <20201019100629.419020859@linutronix.de>
 <20201019101109.753597069@linutronix.de>
 <20201025165647.GR26280@localhost>
 <20201026124753.btmdh3iwbwnff5dg@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026124753.btmdh3iwbwnff5dg@linutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 26, 2020 at 01:47:53PM +0100, Sebastian Andrzej Siewior wrote:
> On 2020-10-25 17:56:47 [+0100], Johan Hovold wrote:
> > There's a ton of issues with this driver, but this is arguably making
> > things worse. A line discipline may call write() from just about any
> > context so we cannot rely on tty being non-NULL here (e.g. PPP).
> 
> I wasn't aware of that. I've been looking at the callers each time a
> `tty' was passed it looked like a preemptible context (due to mutex /
> GFP_KERNEL) and so on.

Yeah, the default line discipline only calls in preemptible context
(these days), but others do not (e.g. see ppp_async_push()).

Johan
