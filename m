Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7338629A691
	for <lists+linux-omap@lfdr.de>; Tue, 27 Oct 2020 09:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894778AbgJ0I1B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Oct 2020 04:27:01 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43261 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403961AbgJ0I1B (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Oct 2020 04:27:01 -0400
Received: by mail-lf1-f65.google.com with SMTP id l28so1164470lfp.10;
        Tue, 27 Oct 2020 01:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XIPWi+l0jdtwe7a/vFhBWIkkHZTxV2Bo329Aduuqz0Y=;
        b=N1RgbNLj1IGPtDBFi2WyRr67FzoIphdsntAJ05OtLwq5ClTtAT1fmLAqYVBNOarETG
         zxVqZBxr+SbMU1zuj1WZZaseHIK/KHqXsSYVLvMBQD97WW8uemL8cubOJaL8G9dnZXFo
         0O1FKm97AFbKJbmKv9q35d+kaYN1GFm8Fbkzo7Z2zK1vSsxRMe67m2rM4EEkyTDtzHV1
         xWTaMERSuFYTdCwOH0S7Lm6rYTe+JTS0rXdBNCl8aCu54qG9kXNGN0JbmxmRCGjtFloz
         5iUHqLxw2u5L2ntyZv3ZM8sDuqDFQPJk9Xv2SBR11FWJLM64yFzb2iHGBtxgoJDMGOZI
         UYSA==
X-Gm-Message-State: AOAM532QXhkwSyXYtREQ3eymXAClzCvCihPNEjkroLPp+t2kUxO2IyX9
        d4B4vfSzS72+WoC2qJ/SjSg=
X-Google-Smtp-Source: ABdhPJxZdvyff6NTZCNh5cgP4gqVTZlusJs7rkzYrG60oCea8SrZ4rbaJhyafEM+9WgvZzCHgo7GvQ==
X-Received: by 2002:a19:c690:: with SMTP id w138mr416756lff.409.1603787218626;
        Tue, 27 Oct 2020 01:26:58 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id n19sm95060lfe.142.2020.10.27.01.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 01:26:57 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kXKJk-0001LL-9S; Tue, 27 Oct 2020 09:26:57 +0100
Date:   Tue, 27 Oct 2020 09:26:56 +0100
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
Subject: Re: [PATCH v3 04/13 ] USB: serial: digi_acceleport: Remove
 in_interrupt() usage
Message-ID: <20201027082656.GD4085@localhost>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.019266389@linutronix.de>
 <20201025171613.GT26280@localhost>
 <20201026140313.dpg3hkhkje2os4hw@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201026140313.dpg3hkhkje2os4hw@linutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 26, 2020 at 03:03:13PM +0100, Sebastian Andrzej Siewior wrote:
> From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out and Linus clearly
> requested that code which changes behaviour depending on context should
> either be separated or the context be conveyed in an argument passed by the
> caller, which usually knows the context.
> 
> The debug printk() in digi_write() prints in_interrupt() as context
> information. This information is imprecisely as it does not distinguish
> between hard-IRQ or disabled botton half and it does consider disabled
> interrupts or preemption. It is not really helpful.

I fixed up a couple of typos and added the missing negation above so
that it reads:

  The debug printk() in digi_write() prints in_interrupt() as context
  information. This information is imprecise as it does not distinguish
  between hard-IRQ or disabled bottom half and it does not consider
  disabled interrupts or preemption. It is not really helpful.
	
> Remove the in_interrupt() printout.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
> v2…v3:
>   - Don't make dev_dbg() conditional on `tty'
>   - Remove the part "tty happens always in process context" from the
>     commit message. Johan pointed out that for PPP it may happen in
>     bottom half.

Now applied for -next, thanks.

Johan
